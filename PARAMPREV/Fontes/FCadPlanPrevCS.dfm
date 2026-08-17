inherited frmCadPlanPrevCS: TfrmCadPlanPrevCS
  Left = 18
  Top = 14
  HelpContext = 160111
  Caption = 'Cadastro de Plano Previdenciário'
  ClientHeight = 690
  ClientWidth = 1350
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 1350
    Height = 604
    inherited tbcDetalhe: TTabControlDetalhe [0]
      Top = 45
      Width = 1348
      Height = 558
      Tabs.Strings = (
        'Informações do Plano'
        'Contribuições do Plano'
        'Benefícios do Plano'
        'Tratamento de Isenção de IR - Ação Judicial')
      detdbGrids.Strings = (
        ''
        'dbgrdDet'
        'dbgrdBenef'
        'dbgrdIsentoAcJud')
      inherited pgctrlDetalhe: TPageControl
        Width = 1250
        Height = 499
        ActivePage = tbsBenef
        OnChange = pgctrlDetalheChange
        object tbsPlano: TTabSheet [0]
          Caption = 'Informações do Plano'
          object pgctrlPlanos: TPageControl
            Left = 0
            Top = 0
            Width = 1242
            Height = 471
            ActivePage = tbsPlanoInfPrincipais
            Align = alClient
            MultiLine = True
            TabOrder = 0
            object tbsPlanoInfPrincipais: TTabSheet
              Caption = 'Informações Principais'
              object grbCodigoSPC: TGroupBox
                Left = 264
                Top = 104
                Width = 156
                Height = 51
                TabOrder = 1
                object Label103: TLabel
                  Left = 5
                  Top = 9
                  Width = 148
                  Height = 13
                  Caption = ' Código do Plano na SPC '
                end
                object dbeCodigoSPC: TwwDBEdit
                  Left = 5
                  Top = 23
                  Width = 144
                  Height = 21
                  DataField = 'CODIGOSPC'
                  DataSource = ds
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
              end
              object GroupBox5: TGroupBox
                Left = 1
                Top = -5
                Width = 258
                Height = 194
                TabOrder = 0
                object Label121: TLabel
                  Left = 24
                  Top = 171
                  Width = 133
                  Height = 13
                  Caption = 'apenas no recebimento'
                end
                object dbchkContabMantido: TDBCheckBox
                  Left = 5
                  Top = 159
                  Width = 224
                  Height = 14
                  Hint = 
                    'Indica se o sistema deve gerar as contribuições de ativo mesmo q' +
                    'ue estas não sejam enviadas para a patrocinadora'
                  Caption = 'Contabilizar cobranças de mantidos'
                  DataField = 'FLGCONTABMANTIDO'
                  DataSource = ds
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 7
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                  OnClick = dbchkCalculaLimiteClick
                end
                object dbchkAutoNumInsc: TDBCheckBox
                  Left = 4
                  Top = 9
                  Width = 251
                  Height = 17
                  Caption = 'Número de Inscrição Automático'
                  DataField = 'FLGAUTONUMINSC'
                  DataSource = ds
                  TabOrder = 0
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                  OnClick = dbchkAutoNumInscClick
                end
                object dbchkRecalcContrib: TDBCheckBox
                  Left = 4
                  Top = 31
                  Width = 251
                  Height = 17
                  Caption = 'Recalcular Contribuições Mensalmente'
                  DataField = 'FLGRECALCCONTRIB'
                  DataSource = ds
                  TabOrder = 1
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                  Visible = False
                end
                object dbchkCalculaLimite: TDBCheckBox
                  Left = 4
                  Top = 52
                  Width = 251
                  Height = 17
                  Hint = 
                    'Indica se a Patrocinadora pagará contribuição até um limite da f' +
                    'olha de pagamento'
                  Caption = 'Aplicar Limite sobre Total da Folha'
                  DataField = 'FLGCALCULALIMITE'
                  DataSource = ds
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 2
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                  OnClick = dbchkCalculaLimiteClick
                end
                object dbchkUsaEvolFuncPlano: TDBCheckBox
                  Left = 4
                  Top = 74
                  Width = 251
                  Height = 17
                  Caption = 'Utiliza Evolução Funcional'
                  DataField = 'FLGUSAEVOLFUNC'
                  DataSource = ds
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 3
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                  Visible = False
                  OnClick = dbchkCalculaLimiteClick
                end
                object dbchkFlgReajInssNReq: TDBCheckBox
                  Left = 4
                  Top = 95
                  Width = 251
                  Height = 17
                  Caption = 'Reajustar INSS de Benef.não Requerido'
                  DataField = 'FLGREAJINSSNREQ'
                  DataSource = ds
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 4
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                  Visible = False
                  OnClick = dbchkCalculaLimiteClick
                end
                object DBCheckBox8: TDBCheckBox
                  Left = 4
                  Top = 117
                  Width = 251
                  Height = 17
                  Hint = 
                    'Indica se o sistema deve gerar as contribuições de ativo mesmo q' +
                    'ue estas não sejam enviadas para a patrocinadora'
                  Caption = 'Gerar Contribuições Não Enviadas'
                  DataField = 'FLGGERACTNAOENV'
                  DataSource = ds
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 5
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                  OnClick = dbchkCalculaLimiteClick
                end
                object DBCheckBox10: TDBCheckBox
                  Left = 4
                  Top = 138
                  Width = 251
                  Height = 17
                  Hint = 
                    'Indica se o sistema deve gerar as contribuições de ativo mesmo q' +
                    'ue estas não sejam enviadas para a patrocinadora'
                  Caption = 'Não Gravar Contribuições Zeradas'
                  DataField = 'FLGNGRAVACONTZERO'
                  DataSource = ds
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 6
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                  OnClick = dbchkCalculaLimiteClick
                end
              end
              object pnlLimitePatro: TPanel
                Left = 264
                Top = 54
                Width = 157
                Height = 50
                TabOrder = 4
                object Label1: TLabel
                  Left = 9
                  Top = 4
                  Width = 146
                  Height = 13
                  Caption = 'Limite para Patrocinadora'
                end
                object Label6: TLabel
                  Left = 133
                  Top = 27
                  Width = 10
                  Height = 13
                  Caption = '%'
                end
                object wwDBEdit1: TwwDBEdit
                  Left = 9
                  Top = 19
                  Width = 121
                  Height = 21
                  DataField = 'PATROLIMITE'
                  DataSource = ds
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
              end
              object pnlInscricao: TPanel
                Left = 264
                Top = 0
                Width = 157
                Height = 51
                TabOrder = 5
                object Label17: TLabel
                  Left = 9
                  Top = 4
                  Width = 82
                  Height = 13
                  Caption = 'Número Inicial'
                end
                object dbedNumInicial: TwwDBEdit
                  Left = 9
                  Top = 19
                  Width = 121
                  Height = 21
                  DataField = 'NUMINSCINICIAL'
                  DataSource = ds
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
              end
              object GroupBox14: TGroupBox
                Left = 426
                Top = 0
                Width = 245
                Height = 51
                TabOrder = 2
                object Label53: TLabel
                  Left = 7
                  Top = 9
                  Width = 181
                  Height = 13
                  Caption = 'Teto do Salário de Participação'
                end
                object dblkpcmbMoeda: TwwDBLookupCombo
                  Left = 7
                  Top = 21
                  Width = 232
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'MOEDESC'#9'20'#9'Descrição')
                  DataField = 'IDTETOSALPART'
                  DataSource = ds
                  LookupTable = qryMoeda
                  LookupField = 'MOECODIGO'
                  Options = [loTitles]
                  ParentFont = False
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                end
              end
              object DBRadioGroup3: TDBRadioGroup
                Left = 426
                Top = 54
                Width = 245
                Height = 50
                Caption = ' INSS Considerado para Reajuste '
                DataField = 'FLGTIPOGRAVAINSS'
                DataSource = ds
                Items.Strings = (
                  'Valor Informado'
                  'Valor Calculado')
                TabOrder = 3
                Values.Strings = (
                  '0'
                  '1')
              end
              object GroupBox23: TGroupBox
                Left = 426
                Top = 104
                Width = 245
                Height = 51
                TabOrder = 6
                object Label107: TLabel
                  Left = 7
                  Top = 9
                  Width = 226
                  Height = 13
                  Caption = 'Mês de Pagamento de Abono Benefício'
                end
                object dblkpcmbMesAbono: TwwDBLookupCombo
                  Left = 7
                  Top = 24
                  Width = 232
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'MES'#9'2'#9'MES'#9'F')
                  DataField = 'MESPGABONO'
                  DataSource = ds
                  LookupTable = qryMeses
                  LookupField = 'MES'
                  Options = [loTitles]
                  ParentFont = False
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = False
                end
              end
              object DBRadioGroup4: TDBRadioGroup
                Left = 2
                Top = 192
                Width = 258
                Height = 61
                Caption = ' Contribuição Não Alimentada '
                DataField = 'FLGNDEVCNAFOLHA'
                DataSource = ds
                Items.Strings = (
                  'Devolver na folha de benefício.'
                  'Não devolver na folha de benefício.')
                TabOrder = 7
                Values.Strings = (
                  '0'
                  '1')
              end
              object GroupBox29: TGroupBox
                Left = 264
                Top = 155
                Width = 409
                Height = 51
                TabOrder = 8
                object Label120: TLabel
                  Left = 7
                  Top = 9
                  Width = 300
                  Height = 13
                  Caption = 'Regra para cálculo da simulação  do enquadramento'
                end
                object wwDBLookupCombo25: TwwDBLookupCombo
                  Left = 7
                  Top = 24
                  Width = 394
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOMEREGRA'#9'60'#9'Regra de Negócio')
                  DataField = 'IDREGRASIMULAENQ'
                  DataSource = ds
                  LookupTable = qryRegra
                  LookupField = 'IDREGRA'
                  Options = [loTitles]
                  ParentFont = False
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                end
              end
              object GroupBox30: TGroupBox
                Left = 264
                Top = 207
                Width = 137
                Height = 45
                Caption = ' Data da Criação '
                TabOrder = 9
                object dbdeDataEfetivacao: TCMDateTimePicker
                  Left = 7
                  Top = 18
                  Width = 121
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATACRIACAO'
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
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ShowButton = True
                  TabOrder = 0
                end
              end
              object GroupBox37: TGroupBox
                Left = 405
                Top = 207
                Width = 268
                Height = 45
                Caption = 'Limite de alteração Percentual Contribuição'
                TabOrder = 10
                object dbedLimitePerc: TwwDBEdit
                  Left = 8
                  Top = 18
                  Width = 251
                  Height = 21
                  DataField = 'LIMITEMUDANCAPERC'
                  DataSource = ds
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
              end
            end
            object tbsPlanoRegra: TTabSheet
              Caption = 'Regras de Elegibilidade'
              object grpRegras: TGroupBox
                Left = 4
                Top = 5
                Width = 680
                Height = 167
                TabOrder = 0
                object Label2: TLabel
                  Left = 8
                  Top = 15
                  Width = 268
                  Height = 13
                  Caption = 'Regra de Elegibilidade para Inscrição no Plano'
                end
                object Label3: TLabel
                  Left = 8
                  Top = 52
                  Width = 240
                  Height = 13
                  Caption = 'Regra para Cancelamento por Desistência'
                end
                object Label48: TLabel
                  Left = 8
                  Top = 90
                  Width = 310
                  Height = 13
                  Caption = 'Regra de Cancelamento por Descumprimento de Prazo'
                end
                object Label4: TLabel
                  Left = 331
                  Top = 52
                  Width = 241
                  Height = 13
                  Caption = 'Regra de Cancelamento por Inadimplência'
                end
                object Label39: TLabel
                  Left = 331
                  Top = 90
                  Width = 279
                  Height = 13
                  Caption = 'Regra para Permissão de Transferência no Plano'
                end
                object Label65: TLabel
                  Left = 331
                  Top = 15
                  Width = 283
                  Height = 13
                  Caption = 'Regra de Elegibilidade para Reinscrição no Plano'
                end
                object Label36: TLabel
                  Left = 331
                  Top = 127
                  Width = 235
                  Height = 13
                  Caption = 'Regra de Elegibilidade a Benefício (SPC)'
                end
                object dblkpcmbRegAdmissao: TwwDBLookupCombo
                  Left = 8
                  Top = 29
                  Width = 286
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOMEREGRA'#9'60'#9'Regra de Negócio')
                  DataField = 'IDREGRAADMISSAO'
                  DataSource = ds
                  LookupTable = qryRegra
                  LookupField = 'IDREGRA'
                  Options = [loTitles]
                  ParentFont = False
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                end
                object dblkpcmbRegDesistencia: TwwDBLookupCombo
                  Left = 8
                  Top = 67
                  Width = 286
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOMEREGRA'#9'60'#9'Regra de Negócio')
                  DataField = 'IDREGRADESISTENC'
                  DataSource = ds
                  LookupTable = qryRegra
                  LookupField = 'IDREGRA'
                  Options = [loTitles]
                  ParentFont = False
                  TabOrder = 2
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                end
                object dblkpcmbRegCancDescPrazo: TwwDBLookupCombo
                  Left = 8
                  Top = 104
                  Width = 286
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOMEREGRA'#9'60'#9'Regra de Negócio')
                  DataField = 'IDREGRACANCDESC'
                  DataSource = ds
                  LookupTable = qryRegra
                  LookupField = 'IDREGRA'
                  Options = [loTitles]
                  ParentFont = False
                  TabOrder = 4
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                end
                object dblkpcmbRegCancelamento: TwwDBLookupCombo
                  Left = 331
                  Top = 67
                  Width = 286
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOMEREGRA'#9'60'#9'Regra de Negócio')
                  DataField = 'IDREGRACANCELAME'
                  DataSource = ds
                  LookupTable = qryRegra
                  LookupField = 'IDREGRA'
                  Options = [loTitles]
                  ParentFont = False
                  TabOrder = 3
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                end
                object dblkpcmbRegraTransfPlano: TwwDBLookupCombo
                  Left = 331
                  Top = 104
                  Width = 286
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOMEREGRA'#9'60'#9'Regra de Negócio')
                  DataField = 'IDREGRATRANSFPLA'
                  DataSource = ds
                  LookupTable = qryRegra
                  LookupField = 'IDREGRA'
                  Options = [loTitles]
                  ParentFont = False
                  TabOrder = 5
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                end
                object dblkpcmbRegElegReins: TwwDBLookupCombo
                  Left = 331
                  Top = 29
                  Width = 286
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOMEREGRA'#9'60'#9'Regra de Negócio')
                  DataField = 'IDREGRAELEGREINS'
                  DataSource = ds
                  LookupTable = qryRegra
                  LookupField = 'IDREGRA'
                  Options = [loTitles]
                  ParentFont = False
                  TabOrder = 1
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                end
                object dblkpcmbElegBenef: TwwDBLookupCombo
                  Left = 331
                  Top = 141
                  Width = 286
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOMEREGRA'#9'60'#9'Regra de Negócio')
                  DataField = 'IDRGELEGBENEF'
                  DataSource = ds
                  LookupTable = qryRegra
                  LookupField = 'IDREGRA'
                  Options = [loTitles]
                  ParentFont = False
                  TabOrder = 6
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                end
              end
            end
            object TabSheet4: TTabSheet
              Caption = 'Parcelamento/Compra de Carência'
              ImageIndex = 2
              object GroupBox25: TGroupBox
                Left = 3
                Top = 3
                Width = 361
                Height = 208
                Caption = 'Parcelamento'
                TabOrder = 0
                object Label15: TLabel
                  Left = 8
                  Top = 15
                  Width = 199
                  Height = 13
                  Caption = 'Regra e cálculo do valor da dívida'
                end
                object Label21: TLabel
                  Left = 8
                  Top = 53
                  Width = 300
                  Height = 13
                  Caption = 'Regra de cálculo do salário base para financiamento'
                end
                object Label22: TLabel
                  Left = 8
                  Top = 90
                  Width = 265
                  Height = 13
                  Caption = 'Regra de cálculo das opções de parcelamento'
                end
                object Label23: TLabel
                  Left = 8
                  Top = 128
                  Width = 344
                  Height = 13
                  Caption = 'Regra de cálculo de valor a mortizar por número de parcelas'
                end
                object Label24: TLabel
                  Left = 8
                  Top = 165
                  Width = 232
                  Height = 13
                  Caption = 'Regra de cálculo do saldo devedor atual'
                end
                object wwDBLookupCombo1: TwwDBLookupCombo
                  Left = 8
                  Top = 29
                  Width = 286
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOMEREGRA'#9'60'#9'Regra de Negócio')
                  DataField = 'IDREGRAVLRDIVIDA'
                  DataSource = ds
                  LookupTable = qryRegra
                  LookupField = 'IDREGRA'
                  Options = [loTitles]
                  ParentFont = False
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                end
                object wwDBLookupCombo15: TwwDBLookupCombo
                  Left = 8
                  Top = 68
                  Width = 286
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOMEREGRA'#9'60'#9'Regra de Negócio')
                  DataField = 'IDREGRASALPARCELA'
                  DataSource = ds
                  LookupTable = qryRegra
                  LookupField = 'IDREGRA'
                  Options = [loTitles]
                  ParentFont = False
                  TabOrder = 1
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                end
                object wwDBLookupCombo16: TwwDBLookupCombo
                  Left = 8
                  Top = 104
                  Width = 286
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOMEREGRA'#9'60'#9'Regra de Negócio')
                  DataField = 'IDREGRAOPPARCELAS'
                  DataSource = ds
                  LookupTable = qryRegra
                  LookupField = 'IDREGRA'
                  Options = [loTitles]
                  ParentFont = False
                  TabOrder = 2
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                end
                object wwDBLookupCombo17: TwwDBLookupCombo
                  Left = 8
                  Top = 142
                  Width = 286
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOMEREGRA'#9'60'#9'Regra de Negócio')
                  DataField = 'IDREGRAAMORTIZA'
                  DataSource = ds
                  LookupTable = qryRegra
                  LookupField = 'IDREGRA'
                  Options = [loTitles]
                  ParentFont = False
                  TabOrder = 3
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                end
                object wwDBLookupCombo18: TwwDBLookupCombo
                  Left = 8
                  Top = 179
                  Width = 286
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOMEREGRA'#9'60'#9'Regra de Negócio')
                  DataField = 'IDREGRASDODEVEDOR'
                  DataSource = ds
                  LookupTable = qryRegra
                  LookupField = 'IDREGRA'
                  Options = [loTitles]
                  ParentFont = False
                  TabOrder = 4
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                end
              end
              object GroupBox26: TGroupBox
                Left = 366
                Top = 3
                Width = 307
                Height = 208
                Caption = 'Compra de Carência'
                TabOrder = 1
                object Label87: TLabel
                  Left = 8
                  Top = 15
                  Width = 272
                  Height = 13
                  Caption = 'Regra de cálculo de tempo de carência faltante'
                end
                object Label88: TLabel
                  Left = 8
                  Top = 53
                  Width = 267
                  Height = 13
                  Caption = 'Regra de cálculo do total da parte participante'
                end
                object Label89: TLabel
                  Left = 8
                  Top = 90
                  Width = 278
                  Height = 13
                  Caption = 'Regra de cálculo do total da parte patrocinadora'
                end
                object Label90: TLabel
                  Left = 8
                  Top = 128
                  Width = 220
                  Height = 13
                  Caption = 'Regra de cálculo do total da carência '
                end
                object wwDBLookupCombo20: TwwDBLookupCombo
                  Left = 8
                  Top = 29
                  Width = 286
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOMEREGRA'#9'60'#9'Regra de Negócio')
                  DataField = 'IDREGRACARENCIA'
                  DataSource = ds
                  LookupTable = qryRegra
                  LookupField = 'IDREGRA'
                  Options = [loTitles]
                  ParentFont = False
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                end
                object wwDBLookupCombo21: TwwDBLookupCombo
                  Left = 8
                  Top = 68
                  Width = 286
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOMEREGRA'#9'60'#9'Regra de Negócio')
                  DataField = 'IDRGCARENCIAPART'
                  DataSource = ds
                  LookupTable = qryRegra
                  LookupField = 'IDREGRA'
                  Options = [loTitles]
                  ParentFont = False
                  TabOrder = 1
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                end
                object wwDBLookupCombo22: TwwDBLookupCombo
                  Left = 8
                  Top = 104
                  Width = 286
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOMEREGRA'#9'60'#9'Regra de Negócio')
                  DataField = 'IDRGCARENCIAPATRO'
                  DataSource = ds
                  LookupTable = qryRegra
                  LookupField = 'IDREGRA'
                  Options = [loTitles]
                  ParentFont = False
                  TabOrder = 2
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                end
                object wwDBLookupCombo23: TwwDBLookupCombo
                  Left = 8
                  Top = 142
                  Width = 286
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOMEREGRA'#9'60'#9'Regra de Negócio')
                  DataField = 'IDRGTOTCARENCIA'
                  DataSource = ds
                  LookupTable = qryRegra
                  LookupField = 'IDREGRA'
                  Options = [loTitles]
                  ParentFont = False
                  TabOrder = 3
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                end
              end
            end
            object tbsPlanoReserva: TTabSheet
              Caption = 'Tratamento de Reservas'
              ImageIndex = 4
              object dbrdgrpflgreservaultcot: TDBRadioGroup
                Left = 4
                Top = 5
                Width = 417
                Height = 83
                Caption = ' Data a Buscar Cota para Alimentação de Reservas '
                DataField = 'FLGRESERVAULTCOT'
                DataSource = ds
                Items.Strings = (
                  'Competência - Data do Calendário no Mês de Referência'
                  'Caixa - Data da Baixa no CAR'
                  'Caixa - Data do Recebimento no AdmPREV')
                TabOrder = 0
                Values.Strings = (
                  '0'
                  '1'
                  '2')
              end
              object GroupBox10: TGroupBox
                Left = 4
                Top = 178
                Width = 417
                Height = 60
                TabOrder = 1
                object Label95: TLabel
                  Left = 8
                  Top = 8
                  Width = 215
                  Height = 26
                  Caption = 'Tipo de busca do Indice/Cota para a alimentação de reserva'
                  WordWrap = True
                end
                object DbComboReserva: TwwDBComboBox
                  Left = 9
                  Top = 34
                  Width = 226
                  Height = 21
                  ShowButton = True
                  Style = csDropDown
                  MapList = True
                  AllowClearKey = True
                  DataField = 'FLGTIPOBUSCACOTA'
                  DataSource = ds
                  DropDownCount = 8
                  ItemHeight = 0
                  Items.Strings = (
                    'Buscar último indice/cota cadastrado'#9'0'
                    'Buscar na data e avisar se não encontrar '#9'1'
                    'Buscar na data e interromper se não encontrar'#9'2')
                  Sorted = False
                  TabOrder = 0
                  UnboundDataType = wwDefault
                end
              end
              object DBRadioGroup2: TDBRadioGroup
                Left = 4
                Top = 92
                Width = 417
                Height = 83
                Caption = ' Data a Utilizar como Data de Alimentação '
                DataField = 'FLGDTALIMRESERVA'
                DataSource = ds
                Items.Strings = (
                  'Data Indicada na Tela'
                  'Data do Recebimento da Contribuição no AdmPREV')
                TabOrder = 2
                Values.Strings = (
                  '0'
                  '1')
              end
            end
          end
        end
        inherited tbsDet: TTabSheet
          Caption = 'Contribuições do Plano'
          inherited dbgrdDet: TwwDBGrid
            Width = 1242
            Height = 471
            Selected.Strings = (
              'IDCONTRIBUICAO'#9'6'#9'Cód'
              'NOME'#9'50'#9'Contribuição'
              'ORDEMCALCULO'#9'10'#9'Ordem~Cálc.'
              'FLGACEITAOPCAO'#9'7'#9'Aceita~Opção'
              'NUMOPCOES'#9'10'#9'Opções'
              'FLGDESCFOLHA'#9'7'#9'Desc.~Folha'
              'FLGCOBRADECTERC'#9'10'#9'Cobra ~sobre 13o.'
              'FLGINTERNO'#9'4'#9'Sit.'
              'IDCONTRIBPAI'#9'5'#9'Cont. ~Ass.1'
              'IDCONTRIBPAI2'#9'5'#9'Cont. ~Ass.2'
              'IDCONTRIBPAI3'#9'5'#9'Cont. ~Ass.3'
              'VLRACEITADIVERG'#9'10'#9'Valor a Aceitar ~como Diverg.'
              'FLGNAOEXIGEREC'#9'10'#9'Não Exige ~Recebimento'#9'F'
              'IDREGRACALCULO'#9'10'#9'Regra de ~Cálculo'
              'IDRUBRICA'#9'10'#9'Rubrica ')
            FixedCols = 1
            Font.Style = []
            ParentFont = False
            TitleLines = 2
          end
          inherited pnlControlesDet: TPanel
            Width = 1242
            Height = 471
            object pgctrlContPrev: TPageControl
              Left = 0
              Top = 0
              Width = 1242
              Height = 471
              ActivePage = tbsTrataDiverg
              Align = alClient
              TabOrder = 0
              object tbsContPrev1: TTabSheet
                Caption = 'Informações Principais'
                object Label5: TLabel
                  Left = 2
                  Top = -2
                  Width = 222
                  Height = 23
                  AutoSize = False
                  Caption = 'Contribuição'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindow
                  Font.Height = -19
                  Font.Name = 'Bookman Old Style'
                  Font.Style = []
                  ParentFont = False
                end
                object GroupBox1: TGroupBox
                  Left = 392
                  Top = 120
                  Width = 283
                  Height = 122
                  TabOrder = 4
                  object Label38: TLabel
                    Left = 9
                    Top = 8
                    Width = 101
                    Height = 13
                    Caption = 'Ordem de Cálculo'
                  end
                  object Label41: TLabel
                    Left = 9
                    Top = 46
                    Width = 144
                    Height = 13
                    Caption = 'Situação Correspondente'
                  end
                  object Label68: TLabel
                    Left = 9
                    Top = 83
                    Width = 59
                    Height = 13
                    Caption = 'Finalidade'
                  end
                  object dbedOrdemCalculo: TDBEdit
                    Left = 9
                    Top = 22
                    Width = 130
                    Height = 21
                    DataField = 'ORDEMCALCULO'
                    DataSource = dsDet
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                  end
                  object dbcmbSitCorrespond: TwwDBComboBox
                    Left = 9
                    Top = 59
                    Width = 266
                    Height = 21
                    ShowButton = True
                    Style = csDropDown
                    MapList = True
                    AllowClearKey = True
                    AutoDropDown = True
                    DataField = 'FLGINTERNO'
                    DataSource = dsDet
                    DropDownCount = 8
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ItemHeight = 0
                    Items.Strings = (
                      'Ativo'#9'AT'
                      'Assistido'#9'AS'
                      'Mantido'#9'MA'
                      'Mantido Parcial'#9'MP'
                      'Mantido de Saldo de Conta'#9'MS')
                    ParentFont = False
                    Sorted = False
                    TabOrder = 1
                    UnboundDataType = wwDefault
                  end
                  object cmbFinalidade: TComboBox
                    Left = 9
                    Top = 96
                    Width = 266
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ItemHeight = 13
                    ParentFont = False
                    TabOrder = 2
                    Text = 'Normal'
                    Items.Strings = (
                      'Custeio'
                      'Contingência'
                      'Compra de Carência de Tempo'
                      'Parcelamento de Contribuição')
                  end
                end
                object grpContribPai: TGroupBox
                  Left = 392
                  Top = 0
                  Width = 281
                  Height = 123
                  Caption = 'Contribuições Correspondentes'
                  TabOrder = 3
                  object Label26: TLabel
                    Left = 7
                    Top = 14
                    Width = 185
                    Height = 13
                    Caption = '1a. contribuição correspondente'
                  end
                  object Label9: TLabel
                    Left = 7
                    Top = 49
                    Width = 185
                    Height = 13
                    Caption = '2a. contribuição correspondente'
                  end
                  object Label37: TLabel
                    Left = 7
                    Top = 83
                    Width = 185
                    Height = 13
                    Caption = '3a. contribuição correspondente'
                  end
                  object dblkpcmbContribPai: TwwDBLookupCombo
                    Left = 7
                    Top = 28
                    Width = 266
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'NOME'#9'60'#9'Contribuição')
                    DataField = 'IDCONTRIBPAI'
                    DataSource = dsDet
                    LookupTable = qryContribCorresp
                    LookupField = 'IDCONTRIBUICAO'
                    Options = [loTitles]
                    ParentFont = False
                    TabOrder = 0
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                  end
                  object dblkpcmbContribPai2: TwwDBLookupCombo
                    Left = 7
                    Top = 62
                    Width = 266
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'NOME'#9'60'#9'Contribuição')
                    DataField = 'IDCONTRIBPAI2'
                    DataSource = dsDet
                    LookupTable = qryContribCorresp
                    LookupField = 'IDCONTRIBUICAO'
                    Options = [loTitles]
                    ParentFont = False
                    TabOrder = 1
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                  end
                  object dblkpcmbContribPai3: TwwDBLookupCombo
                    Left = 7
                    Top = 97
                    Width = 266
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'NOME'#9'60'#9'Contribuição')
                    DataField = 'IDCONTRIBPAI3'
                    DataSource = dsDet
                    LookupTable = qryContribCorresp
                    LookupField = 'IDCONTRIBUICAO'
                    Options = [loTitles]
                    ParentFont = False
                    TabOrder = 2
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                  end
                end
                object qrpOpcoes: TGroupBox
                  Left = 2
                  Top = 111
                  Width = 387
                  Height = 52
                  Color = clBtnFace
                  ParentColor = False
                  TabOrder = 2
                  object sbtnOpcoes: TSpeedButton
                    Left = 136
                    Top = 28
                    Width = 23
                    Height = 20
                    Hint = 'Especificar características das opções'
                    Glyph.Data = {
                      42010000424D4201000000000000760000002800000011000000110000000100
                      040000000000CC00000000000000000000001000000010000000000000000000
                      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                      DDDDD0000000DDDDDDDDDDDDDDDDD0000000D00000DDDDD00000D0000000D0FF
                      F0DDDDD0FFF0D0000000D0FFF0DDDDD0FFF0D0000000D00000DD0DD00000D000
                      0000DDD0DDD0F0DDD0DDD0000000DDD0DD0FFF0DD0DDD0000000DDD000FFFFF0
                      00DDD0000000DDDDDD0FFF0DDDDDD0000000DDDDDDD0F0DDDDDDD0000000DDDD
                      DDDD0DDDDDDDD0000000DDDDDD00000DDDDDD0000000DDDDDD0FFF0DDDDDD000
                      0000DDDDDD0FFF0DDDDDD0000000DDDDDD00000DDDDDD0000000DDDDDDDDDDDD
                      DDDDD0000000}
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = sbtnOpcoesClick
                  end
                  object dbchkAceitarOpcoes: TDBCheckBox
                    Left = 6
                    Top = 32
                    Width = 114
                    Height = 14
                    Hint = 'Indica se a contribuição aceitará "opções"'
                    Caption = 'Aceitar Opções'
                    DataField = 'FLGACEITAOPCAO'
                    DataSource = dsDet
                    TabOrder = 1
                    ValueChecked = '1'
                    ValueUnchecked = '0'
                    OnClick = dbchkAceitarOpcoesClick
                  end
                  object dbchkCobraDecTerc: TDBCheckBox
                    Left = 213
                    Top = 29
                    Width = 170
                    Height = 17
                    Hint = 'Indica se a contribuição deve ser descontada do 13o. Salário'
                    Caption = 'Descontar do 13º Salário'
                    DataField = 'FLGCOBRADECTERC'
                    DataSource = dsDet
                    TabOrder = 3
                    ValueChecked = '1'
                    ValueUnchecked = '0'
                    OnClick = dbchkCobraDecTercClick
                  end
                  object dbchkNaoExigeRec: TDBCheckBox
                    Left = 6
                    Top = 12
                    Width = 157
                    Height = 17
                    Hint = 'Indica se pode ser considerada "paga" no momento do "envio"'
                    Caption = 'Não Exige Recebimento'
                    DataField = 'FLGNAOEXIGEREC'
                    DataSource = dsDet
                    TabOrder = 0
                    ValueChecked = '1'
                    ValueUnchecked = '0'
                  end
                  object dbchkFlgDescFolha: TDBCheckBox
                    Left = 213
                    Top = 13
                    Width = 169
                    Height = 13
                    Hint = 'Indica se a contribuição será descontada em folha ou em banco'
                    Caption = 'Descontar em Folha'
                    DataField = 'FLGDESCFOLHA'
                    DataSource = dsDet
                    TabOrder = 2
                    ValueChecked = '1'
                    ValueUnchecked = '0'
                  end
                end
                object dblkpcmbContribuicao: TwwDBLookupCombo
                  Left = 2
                  Top = 19
                  Width = 386
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'60'#9'Contribuição')
                  DataField = 'IDCONTRIBUICAO'
                  DataSource = dsDet
                  LookupTable = qryContribuicao
                  LookupField = 'IDCONTRIBUICAO'
                  Options = [loTitles]
                  ParentFont = False
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = False
                  OnCloseUp = dblkpcmbContribuicaoCloseUp
                end
                object dbrgrpPagador: TDBRadioGroup
                  Left = 2
                  Top = 41
                  Width = 212
                  Height = 72
                  Caption = 'Pagador '
                  DataField = 'FLGPAGADOR'
                  DataSource = dsDet
                  Items.Strings = (
                    'Participante'
                    'Patrocinadora por Participante'
                    'Patrocinadora (exclusiva)'
                    'Responsável (Núcleo Familiar)')
                  TabOrder = 1
                  TabStop = True
                  Values.Strings = (
                    'C'
                    'P'
                    'E'
                    'R')
                  OnClick = dbrgrpPagadorClick
                end
                object pnlDiverg: TPanel
                  Left = 219
                  Top = 46
                  Width = 169
                  Height = 50
                  Caption = 'pnlDiverg'
                  TabOrder = 5
                  object Label7: TLabel
                    Left = 4
                    Top = 3
                    Width = 160
                    Height = 13
                    Caption = 'Aceitar diferenças inferiores'
                  end
                  object Label20: TLabel
                    Left = 4
                    Top = 24
                    Width = 12
                    Height = 13
                    Caption = ' a'
                  end
                  object wwDBEdit2: TwwDBEdit
                    Left = 24
                    Top = 20
                    Width = 121
                    Height = 21
                    DataField = 'VLRACEITADIVERG'
                    DataSource = dsDet
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                    UnboundDataType = wwDefault
                    WantReturns = False
                    WordWrap = False
                  end
                end
                object GroupBox9: TGroupBox
                  Left = 3
                  Top = 165
                  Width = 387
                  Height = 79
                  Caption = ' Informações para Última Cobrança '
                  TabOrder = 6
                  object dbrgrpUltimaCobranca: TDBRadioGroup
                    Left = 8
                    Top = 15
                    Width = 179
                    Height = 57
                    Caption = 'Contribuição Normal'
                    DataField = 'FLGDESCFOLHAULT'
                    DataSource = dsDet
                    Items.Strings = (
                      'Não Cobrar'
                      'Cobrar em Folha'
                      'Cobrar em Banco')
                    TabOrder = 0
                    Values.Strings = (
                      '2'
                      '1'
                      '0')
                  end
                  object dbgrpCobraUlt13: TDBRadioGroup
                    Left = 203
                    Top = 15
                    Width = 179
                    Height = 57
                    Caption = 'Contribuição sobre 13º'
                    DataField = 'FLGCOBRA13DTFIM'
                    DataSource = dsDet
                    Items.Strings = (
                      'Não Cobrar'
                      'Cobrar ')
                    TabOrder = 1
                    Values.Strings = (
                      '0'
                      '1')
                  end
                end
                object grpDataInicioPadrao: TGroupBox
                  Left = 13
                  Top = 251
                  Width = 153
                  Height = 45
                  Caption = 'Data Início Padrão'
                  TabOrder = 7
                  object dbdeDataInicioPadrao: TCMDateTimePicker
                    Left = 7
                    Top = 18
                    Width = 121
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DATAINICIOPADRAO'
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
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    ShowButton = True
                    TabOrder = 0
                  end
                end
                object grpDataFimPadrao: TGroupBox
                  Left = 180
                  Top = 251
                  Width = 153
                  Height = 45
                  Caption = 'Data Fim Padrão'
                  TabOrder = 8
                  object dbdeDataFimPadrao: TCMDateTimePicker
                    Left = 7
                    Top = 18
                    Width = 121
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DATAFIMPADRAO'
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
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    ShowButton = True
                    TabOrder = 0
                  end
                end
              end
              object tbsContPrev2: TTabSheet
                Caption = 'Regras ...'
                object GroupBox8: TGroupBox
                  Left = 6
                  Top = 2
                  Width = 306
                  Height = 197
                  TabOrder = 0
                  object Label33: TLabel
                    Left = 7
                    Top = 22
                    Width = 197
                    Height = 13
                    Caption = 'Regra de Cálculo da 1a. Cobrança'
                  end
                  object Label8: TLabel
                    Left = 7
                    Top = 61
                    Width = 99
                    Height = 13
                    Caption = 'Regra de Cálculo'
                  end
                  object Label34: TLabel
                    Left = 7
                    Top = 103
                    Width = 214
                    Height = 13
                    Caption = 'Regra de Cálculo da Última Cobrança'
                  end
                  object Label31: TLabel
                    Left = 7
                    Top = 149
                    Width = 173
                    Height = 13
                    Caption = 'Valor de Referência do Rateio'
                  end
                  object dblkpcmbRegraPrimPagto: TwwDBLookupCombo
                    Left = 7
                    Top = 38
                    Width = 266
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'NOMEREGRA'#9'60'#9'Regra de Negócio')
                    DataField = 'IDREGRAPRIMPAGTO'
                    DataSource = dsDet
                    LookupTable = qryRegra
                    LookupField = 'IDREGRA'
                    Options = [loTitles]
                    ParentFont = False
                    TabOrder = 0
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                  end
                  object dblkpcmbCalculo: TwwDBLookupCombo
                    Left = 7
                    Top = 77
                    Width = 266
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'NOMEREGRA'#9'60'#9'Regra de Negócio')
                    DataField = 'IDREGRACALCULO'
                    DataSource = dsDet
                    LookupTable = qryRegra
                    LookupField = 'IDREGRA'
                    Options = [loTitles]
                    ParentFont = False
                    TabOrder = 1
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                  end
                  object wwDBLookupCombo2: TwwDBLookupCombo
                    Left = 7
                    Top = 119
                    Width = 266
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'NOMEREGRA'#9'60'#9'Regra de Negócio')
                    DataField = 'IDREGRAULTPAGTO'
                    DataSource = dsDet
                    LookupTable = qryRegra
                    LookupField = 'IDREGRA'
                    Options = [loTitles]
                    ParentFont = False
                    TabOrder = 2
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                  end
                  object wwDBLookupCombo19: TwwDBLookupCombo
                    Left = 7
                    Top = 165
                    Width = 266
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'NOMEREGRA'#9'60'#9'Regra de Negócio')
                    DataField = 'IDREGRAVLRRESERVA'
                    DataSource = dsDet
                    LookupTable = qryRegra
                    LookupField = 'IDREGRA'
                    Options = [loTitles]
                    ParentFont = False
                    TabOrder = 3
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                  end
                end
                object GroupBox7: TGroupBox
                  Left = 326
                  Top = 1
                  Width = 307
                  Height = 155
                  Caption = ' Desconto sobre Décimo Terceiro Salário '
                  TabOrder = 1
                  object Label54: TLabel
                    Left = 14
                    Top = 67
                    Width = 233
                    Height = 13
                    Caption = 'Regra de Cálculo da Cobrança sobre 13º'
                  end
                  object Label55: TLabel
                    Left = 14
                    Top = 25
                    Width = 255
                    Height = 13
                    Caption = 'Regra de Cálculo da 1a. Cobrança sobre 13º'
                  end
                  object Label56: TLabel
                    Left = 14
                    Top = 108
                    Width = 272
                    Height = 13
                    Caption = 'Regra de Cálculo da Última Cobrança sobre 13º'
                  end
                  object dblkpcmbCalcCob13: TwwDBLookupCombo
                    Left = 14
                    Top = 80
                    Width = 243
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'NOMEREGRA'#9'60'#9'Regra de Negócio')
                    DataField = 'IDREGRACALCULO13'
                    DataSource = dsDet
                    LookupTable = qryRegra
                    LookupField = 'IDREGRA'
                    Options = [loTitles]
                    ParentFont = False
                    TabOrder = 1
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                  end
                  object dblkpcmbUltCalcCob13: TwwDBLookupCombo
                    Left = 14
                    Top = 122
                    Width = 243
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'NOMEREGRA'#9'60'#9'Regra de Negócio')
                    DataField = 'IDREGRAULTPGTO13'
                    DataSource = dsDet
                    LookupTable = qryRegra
                    LookupField = 'IDREGRA'
                    Options = [loTitles]
                    ParentFont = False
                    TabOrder = 2
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                  end
                  object dblkpcmbPrimCalcCob13: TwwDBLookupCombo
                    Left = 14
                    Top = 38
                    Width = 243
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'NOMEREGRA'#9'60'#9'Regra de Negócio')
                    DataField = 'IDREGRAPRIMPGTO13'
                    DataSource = dsDet
                    LookupTable = qryRegra
                    LookupField = 'IDREGRA'
                    Options = [loTitles]
                    ParentFont = False
                    TabOrder = 0
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                  end
                end
              end
              object tbsContribExcecao: TTabSheet
                Caption = 'Tratamento de Exceção'
                ImageIndex = 5
                object Label104: TLabel
                  Left = 7
                  Top = 22
                  Width = 334
                  Height = 13
                  Caption = 'Tipo de Alterador para Acréscimo de Valor na Contribuição'
                end
                object dblkpcmbContribAltAcrescimo: TwwDBLookupCombo
                  Left = 7
                  Top = 38
                  Width = 266
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'35'#9'Alterador'#9'F'
                    'CODALTERADOR'#9'10'#9'Código'#9'F'
                    'TIPO'#9'16'#9'Tipo'#9'F')
                  DataField = 'CODALTACRESCIMO'
                  DataSource = dsDet
                  LookupTable = qryAlterador
                  LookupField = 'CODALTERADOR'
                  Options = [loTitles]
                  ParentFont = False
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                end
              end
              object tbsContPrev3: TTabSheet
                Caption = 'Rubricas'
                OnShow = tbsContPrev3Show
                object pgcRubricas: TPageControl
                  Left = 0
                  Top = 0
                  Width = 1234
                  Height = 443
                  ActivePage = tbsRubContribFerias
                  Align = alClient
                  TabOrder = 0
                  object tbsRubNormais: TTabSheet
                    Caption = 'Normais'
                    object Panel9: TPanel
                      Left = 0
                      Top = 0
                      Width = 1226
                      Height = 415
                      Align = alClient
                      BevelOuter = bvLowered
                      TabOrder = 0
                      object Label42: TLabel
                        Left = 5
                        Top = 13
                        Width = 88
                        Height = 13
                        Caption = 'Rubrica Normal'
                      end
                      object Label43: TLabel
                        Left = 5
                        Top = 52
                        Width = 103
                        Height = 13
                        Caption = 'Rubrica de Atraso'
                      end
                      object Label44: TLabel
                        Left = 5
                        Top = 91
                        Width = 128
                        Height = 13
                        Caption = 'Rubrica de Devolução'
                      end
                      object Label45: TLabel
                        Left = 338
                        Top = 13
                        Width = 224
                        Height = 13
                        Caption = 'Rubrica Normal sobre 13º/Abono Anual'
                      end
                      object Label46: TLabel
                        Left = 338
                        Top = 52
                        Width = 239
                        Height = 13
                        Caption = 'Rubrica de Atraso sobre 13º/Abono Anual'
                      end
                      object Label47: TLabel
                        Left = 338
                        Top = 91
                        Width = 264
                        Height = 13
                        Caption = 'Rubrica de Devolução sobre 13º/Abono Anual'
                      end
                      object Label71: TLabel
                        Left = 5
                        Top = 128
                        Width = 297
                        Height = 13
                        Caption = 'Rubrica de Desconto de Adiantamento de Benefício'
                      end
                      object Label72: TLabel
                        Left = 5
                        Top = 167
                        Width = 304
                        Height = 13
                        Caption = 'Rubrica de Devolução de Adiantamento de Benefício'
                      end
                      object Label73: TLabel
                        Left = 338
                        Top = 128
                        Width = 319
                        Height = 13
                        Caption = 'Rubrica de Desconto sobre Adiant. de 13º/Abono Anual'
                      end
                      object Label74: TLabel
                        Left = 338
                        Top = 167
                        Width = 326
                        Height = 13
                        Caption = 'Rubrica de Devolução sobre Adiant. de 13º/Abono Anual'
                      end
                      object dblkpcmbContRubNormal: TwwDBLookupCombo
                        Left = 5
                        Top = 28
                        Width = 327
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'130'#9'Rubrica')
                        DataField = 'IDRUBRICA'
                        DataSource = dsDet
                        LookupTable = QryDescontoNormal
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 0
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object dbcmbContRubAtraso: TwwDBLookupCombo
                        Left = 5
                        Top = 66
                        Width = 327
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'130'#9'Rubrica')
                        DataField = 'IDRUBRICAATRASO'
                        DataSource = dsDet
                        LookupTable = QryDescontoAtraso
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 1
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object dblkpcmbContRubDevol: TwwDBLookupCombo
                        Left = 5
                        Top = 105
                        Width = 327
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'130'#9'Rubrica')
                        DataField = 'IDRUBRICADEVOLUC'
                        DataSource = dsDet
                        LookupTable = QryProventoDevolucao
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 2
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object dblkpcmb13Normal: TwwDBLookupCombo
                        Left = 338
                        Top = 28
                        Width = 328
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'130'#9'Rubrica')
                        DataField = 'IDRUBDECTERC'
                        DataSource = dsDet
                        LookupTable = QryDescontoNormal
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 3
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object dblkpcmb13Atraso: TwwDBLookupCombo
                        Left = 338
                        Top = 66
                        Width = 328
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'130'#9'Rubrica')
                        DataField = 'IDRUBDECTERCATRA'
                        DataSource = dsDet
                        LookupTable = QryDescontoAtraso
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 4
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object dblkpcmb13Devol: TwwDBLookupCombo
                        Left = 338
                        Top = 105
                        Width = 328
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'130'#9'Rubrica')
                        DataField = 'IDRUBDECTERCDEVOL'
                        DataSource = dsDet
                        LookupTable = QryProventoDevolucao
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 5
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object dblkpcmbDevAdBen: TwwDBLookupCombo
                        Left = 5
                        Top = 181
                        Width = 327
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'130'#9'Rubrica')
                        DataField = 'IDRUBDEVOLADIANT'
                        DataSource = dsDet
                        LookupTable = QryProventoDevolucao
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 6
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object dblkpcmbDescAdBen: TwwDBLookupCombo
                        Left = 5
                        Top = 142
                        Width = 327
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'130'#9'Rubrica')
                        DataField = 'IDRUBADIANT'
                        DataSource = dsDet
                        LookupTable = QryDescontoNormal
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 7
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object dblkpcmbDescAdBen13: TwwDBLookupCombo
                        Left = 338
                        Top = 142
                        Width = 328
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'130'#9'Rubrica')
                        DataField = 'IDRUBADIANT13'
                        DataSource = dsDet
                        LookupTable = QryDescontoNormal
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 8
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object dblkpcmbDevAdBen13: TwwDBLookupCombo
                        Left = 338
                        Top = 181
                        Width = 328
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'130'#9'Rubrica')
                        DataField = 'IDRUBDEVADIANT13'
                        DataSource = dsDet
                        LookupTable = QryProventoDevolucao
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 9
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                    end
                  end
                  object tbsAcaoJudicial: TTabSheet
                    Caption = 'Ação Judicial'
                    ImageIndex = 1
                    object Panel2: TPanel
                      Left = 0
                      Top = 0
                      Width = 1226
                      Height = 415
                      Align = alClient
                      BevelOuter = bvLowered
                      TabOrder = 0
                      object Label32: TLabel
                        Left = 5
                        Top = 13
                        Width = 88
                        Height = 13
                        Caption = 'Rubrica Normal'
                      end
                      object Label50: TLabel
                        Left = 5
                        Top = 52
                        Width = 103
                        Height = 13
                        Caption = 'Rubrica de Atraso'
                      end
                      object Label51: TLabel
                        Left = 5
                        Top = 91
                        Width = 128
                        Height = 13
                        Caption = 'Rubrica de Devolução'
                      end
                      object Label61: TLabel
                        Left = 338
                        Top = 13
                        Width = 224
                        Height = 13
                        Caption = 'Rubrica Normal sobre 13º/Abono Anual'
                      end
                      object Label75: TLabel
                        Left = 338
                        Top = 52
                        Width = 239
                        Height = 13
                        Caption = 'Rubrica de Atraso sobre 13º/Abono Anual'
                      end
                      object Label76: TLabel
                        Left = 338
                        Top = 91
                        Width = 264
                        Height = 13
                        Caption = 'Rubrica de Devolução sobre 13º/Abono Anual'
                      end
                      object Label77: TLabel
                        Left = 5
                        Top = 128
                        Width = 297
                        Height = 13
                        Caption = 'Rubrica de Desconto de Adiantamento de Benefício'
                      end
                      object Label78: TLabel
                        Left = 5
                        Top = 167
                        Width = 304
                        Height = 13
                        Caption = 'Rubrica de Devolução de Adiantamento de Benefício'
                      end
                      object Label79: TLabel
                        Left = 338
                        Top = 128
                        Width = 319
                        Height = 13
                        Caption = 'Rubrica de Desconto sobre Adiant. de 13º/Abono Anual'
                      end
                      object Label80: TLabel
                        Left = 338
                        Top = 167
                        Width = 326
                        Height = 13
                        Caption = 'Rubrica de Devolução sobre Adiant. de 13º/Abono Anual'
                      end
                      object dblkpcmbContRubNomalJud: TwwDBLookupCombo
                        Left = 5
                        Top = 28
                        Width = 327
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'130'#9'Rubrica')
                        DataField = 'IDRUBACJUD'
                        DataSource = dsDet
                        LookupTable = QryDescontoNormal
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 0
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object dbcmbContRubAtrasoJud: TwwDBLookupCombo
                        Left = 5
                        Top = 66
                        Width = 327
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'130'#9'Rubrica')
                        DataField = 'IDRUBATRACJUD'
                        DataSource = dsDet
                        LookupTable = QryDescontoAtraso
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 1
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object dblkpcmbContRubDevolJud: TwwDBLookupCombo
                        Left = 5
                        Top = 105
                        Width = 327
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'130'#9'Rubrica')
                        DataField = 'IDRUBDEVACJUD'
                        DataSource = dsDet
                        LookupTable = QryProventoDevolucao
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 2
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object dblkpcmb13NormalJud: TwwDBLookupCombo
                        Left = 338
                        Top = 28
                        Width = 328
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'130'#9'Rubrica')
                        DataField = 'IDRUB13ACJUD'
                        DataSource = dsDet
                        LookupTable = QryDescontoNormal
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 3
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object dblkpcmb13AtrasoJud: TwwDBLookupCombo
                        Left = 338
                        Top = 66
                        Width = 328
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'130'#9'Rubrica')
                        DataField = 'IDRUB13ATRACJUD'
                        DataSource = dsDet
                        LookupTable = QryDescontoAtraso
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 4
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object dblkpcmb13DevolJud: TwwDBLookupCombo
                        Left = 338
                        Top = 105
                        Width = 328
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'130'#9'Rubrica')
                        DataField = 'IDRUB13DEVACJUD'
                        DataSource = dsDet
                        LookupTable = QryProventoDevolucao
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 5
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object dblkpcmbDevAdBenJud: TwwDBLookupCombo
                        Left = 5
                        Top = 181
                        Width = 327
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'130'#9'Rubrica')
                        DataField = 'IDRUBDEVADTACJUD'
                        DataSource = dsDet
                        LookupTable = QryProventoDevolucao
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 6
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object dblkpcmbDescAdBenJud: TwwDBLookupCombo
                        Left = 5
                        Top = 142
                        Width = 327
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'130'#9'Rubrica')
                        DataField = 'IDRUBDEVACJUD'
                        DataSource = dsDet
                        LookupTable = QryDescontoNormal
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 7
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object dblkpcmbDescAdBen13Jud: TwwDBLookupCombo
                        Left = 338
                        Top = 142
                        Width = 328
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'130'#9'Rubrica')
                        DataField = 'IDRUB13DESCACJUD'
                        DataSource = dsDet
                        LookupTable = QryDescontoNormal
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 8
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object dblkpcmbDevAdBen13Jud: TwwDBLookupCombo
                        Left = 338
                        Top = 181
                        Width = 328
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'130'#9'Rubrica')
                        DataField = 'IDRUB13DVADTACJUD'
                        DataSource = dsDet
                        LookupTable = QryProventoDevolucao
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 9
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                    end
                  end
                  object tbsRubContribFerias: TTabSheet
                    Caption = 'Contribuição sobre Férias'
                    ImageIndex = 2
                    object Label92: TLabel
                      Left = 5
                      Top = 13
                      Width = 88
                      Height = 13
                      Caption = 'Rubrica Normal'
                    end
                    object Label93: TLabel
                      Left = 5
                      Top = 52
                      Width = 103
                      Height = 13
                      Caption = 'Rubrica de Atraso'
                    end
                    object Label94: TLabel
                      Left = 5
                      Top = 91
                      Width = 128
                      Height = 13
                      Caption = 'Rubrica de Devolução'
                    end
                    object wwDBLookupCombo9: TwwDBLookupCombo
                      Left = 5
                      Top = 28
                      Width = 327
                      Height = 21
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'DESCRICAO'#9'130'#9'Rubrica')
                      DataField = 'IDRUBFERIASNORM'
                      DataSource = dsDet
                      LookupTable = QryDescontoNormal
                      LookupField = 'IDPROVENTO'
                      Options = [loTitles]
                      ParentFont = False
                      TabOrder = 0
                      AutoDropDown = True
                      ShowButton = True
                      AllowClearKey = True
                    end
                    object wwDBLookupCombo11: TwwDBLookupCombo
                      Left = 5
                      Top = 66
                      Width = 327
                      Height = 21
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'DESCRICAO'#9'130'#9'Rubrica')
                      DataField = 'IDRUBFERIASATRASO'
                      DataSource = dsDet
                      LookupTable = QryDescontoAtraso
                      LookupField = 'IDPROVENTO'
                      Options = [loTitles]
                      ParentFont = False
                      TabOrder = 1
                      AutoDropDown = True
                      ShowButton = True
                      AllowClearKey = True
                    end
                    object wwDBLookupCombo12: TwwDBLookupCombo
                      Left = 5
                      Top = 105
                      Width = 327
                      Height = 21
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'DESCRICAO'#9'130'#9'Rubrica')
                      DataField = 'IDRUBFERIASDEVOL'
                      DataSource = dsDet
                      LookupTable = QryProventoDevolucao
                      LookupField = 'IDPROVENTO'
                      Options = [loTitles]
                      ParentFont = False
                      TabOrder = 2
                      AutoDropDown = True
                      ShowButton = True
                      AllowClearKey = True
                    end
                  end
                end
              end
              object TabSheet5: TTabSheet
                Caption = 'Parcelamento'
                ImageIndex = 3
                object dbchkParcelamento: TDBCheckBox
                  Left = 22
                  Top = 12
                  Width = 243
                  Height = 17
                  Hint = 'Indica se a contribuição é de parcelamento'
                  Caption = 'Contribuição de parcelamento'
                  DataField = 'FLGPARCELAMENTO'
                  DataSource = dsDet
                  TabOrder = 0
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                end
              end
              object tbCpCarencia: TTabSheet
                Caption = 'Compra de Carência'
                ImageIndex = 4
                object DBCheckBox3: TDBCheckBox
                  Left = 22
                  Top = 12
                  Width = 243
                  Height = 17
                  Hint = 'Indica se a contribuição é de parcelamento'
                  Caption = 'Contribuição de parcelamento'
                  DataField = 'FLGCARENCIA'
                  DataSource = dsDet
                  TabOrder = 0
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                end
              end
              object tbsTrataDiverg: TTabSheet
                Caption = 'Tratamento de Divergência'
                ImageIndex = 6
                object lblAltBaixaDoc: TLabel
                  Left = 19
                  Top = 13
                  Width = 202
                  Height = 13
                  Caption = 'Alterador para Baixa de Documento'
                end
                object lblAltBaixaDocPGA: TLabel
                  Left = 390
                  Top = 13
                  Width = 239
                  Height = 13
                  Caption = 'Alterador para Baixa de Documento - PGA'
                end
                object dblkpcmbAltBxDoc: TwwDBLookupCombo
                  Left = 19
                  Top = 28
                  Width = 327
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'130'#9'Rubrica')
                  DataField = 'CODALTBAIXANPAGO'
                  DataSource = dsDet
                  LookupTable = qryAltBaixa
                  LookupField = 'CODALTERADOR'
                  Options = [loTitles]
                  ParentFont = False
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  OnChange = dblkpcmbAltBxDocChange
                end
                object dblkpcmbAltBxDocPGA: TwwDBLookupCombo
                  Left = 390
                  Top = 28
                  Width = 328
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'130'#9'Rubrica')
                  DataField = 'CODALTBAIXANPAGOPGA'
                  DataSource = dsDet
                  LookupTable = qryAltBaixa
                  LookupField = 'CODALTERADOR'
                  Options = [loTitles]
                  ParentFont = False
                  TabOrder = 1
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  OnChange = dblkpcmbAltBxDocPGAChange
                end
              end
            end
          end
        end
        object tbsBenef: TTabSheet
          Caption = 'Benefícios do Plano'
          object dbgrdBenef: TwwDBGrid
            Left = 0
            Top = 0
            Width = 1242
            Height = 471
            Selected.Strings = (
              'IDBENEFICIO'#9'10'#9'Cód'
              'NOME'#9'50'#9'Nome'
              'FLGREFERENCIA'#9'10'#9'Benef. ~Ref.'
              'FLGACEITAOPCAO'#9'10'#9'Aceita~Opção'
              'FLGPOSSUIABONO'#9'10'#9'Possui~Abono'
              'FLGABONOFINALBEN'#9'10'#9'Abono no ~Final')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 1
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsBenef
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object pnlControlesBenef: TPanel
            Left = 0
            Top = 0
            Width = 1242
            Height = 471
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object pgctrlBenef: TPageControl
              Left = 0
              Top = 0
              Width = 1242
              Height = 471
              ActivePage = tbsBenefPlano1
              Align = alClient
              TabOrder = 0
              object tbsBenefPlano1: TTabSheet
                Caption = 'Informações Principais'
                object Panel6: TPanel
                  Left = 0
                  Top = 0
                  Width = 1234
                  Height = 443
                  Align = alClient
                  BevelOuter = bvLowered
                  TabOrder = 0
                  object Label10: TLabel
                    Left = 5
                    Top = 2
                    Width = 222
                    Height = 23
                    AutoSize = False
                    Caption = 'Benefício'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindow
                    Font.Height = -19
                    Font.Name = 'Bookman Old Style'
                    Font.Style = []
                    ParentFont = False
                  end
                  object GroupBox2: TGroupBox
                    Left = 5
                    Top = 45
                    Width = 287
                    Height = 55
                    Caption = ' Reajuste do Benefício ( caso seja em Cotas ) '
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 1
                    object Label16: TLabel
                      Left = 5
                      Top = 14
                      Width = 36
                      Height = 13
                      Caption = 'Índice'
                    end
                    object dblkpcmbReajBenef: TwwDBLookupCombo
                      Left = 5
                      Top = 28
                      Width = 272
                      Height = 21
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'MOESIGLA'#9'10'#9'Sigla'
                        'MOEDESC'#9'20'#9'Índice')
                      DataField = 'INDICEREAJBENEF'
                      DataSource = dsBenef
                      LookupTable = qryMoeda
                      LookupField = 'MOECODIGO'
                      Options = [loTitles]
                      ParentFont = False
                      TabOrder = 0
                      AutoDropDown = True
                      ShowButton = True
                      AllowClearKey = True
                    end
                  end
                  object GroupBox6: TGroupBox
                    Left = 293
                    Top = 45
                    Width = 396
                    Height = 212
                    TabOrder = 4
                    object sbtnOpcoesBenef: TSpeedButton
                      Left = 342
                      Top = 78
                      Width = 25
                      Height = 25
                      Hint = 'Especificar características das opções'
                      Glyph.Data = {
                        42010000424D4201000000000000760000002800000011000000110000000100
                        040000000000CC00000000000000000000001000000010000000000000000000
                        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                        DDDDD0000000DDDDDDDDDDDDDDDDD0000000D00000DDDDD00000D0000000D0FF
                        F0DDDDD0FFF0D0000000D0FFF0DDDDD0FFF0D0000000D00000DD0DD00000D000
                        0000DDD0DDD0F0DDD0DDD0000000DDD0DD0FFF0DD0DDD0000000DDD000FFFFF0
                        00DDD0000000DDDDDD0FFF0DDDDDD0000000DDDDDDD0F0DDDDDDD0000000DDDD
                        DDDD0DDDDDDDD0000000DDDDDD00000DDDDDD0000000DDDDDD0FFF0DDDDDD000
                        0000DDDDDD0FFF0DDDDDD0000000DDDDDD00000DDDDDD0000000DDDDDDDDDDDD
                        DDDDD0000000}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = sbtnOpcoesBenefClick
                    end
                    object sbtnOpcoesTextoBenef: TSpeedButton
                      Left = 342
                      Top = 105
                      Width = 25
                      Height = 25
                      Hint = 'Especificar características das opções'
                      Glyph.Data = {
                        42010000424D4201000000000000760000002800000011000000110000000100
                        040000000000CC00000000000000000000001000000010000000000000000000
                        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                        DDDDD0000000DDDDDDDDDDDDDDDDD0000000D00000DDDDD00000D0000000D0FF
                        F0DDDDD0FFF0D0000000D0FFF0DDDDD0FFF0D0000000D00000DD0DD00000D000
                        0000DDD0DDD0F0DDD0DDD0000000DDD0DD0FFF0DD0DDD0000000DDD000FFFFF0
                        00DDD0000000DDDDDD0FFF0DDDDDD0000000DDDDDDD0F0DDDDDDD0000000DDDD
                        DDDD0DDDDDDDD0000000DDDDDD00000DDDDDD0000000DDDDDD0FFF0DDDDDD000
                        0000DDDDDD0FFF0DDDDDD0000000DDDDDD00000DDDDDD0000000DDDDDDDDDDDD
                        DDDDD0000000}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = sbtnOpcoesTextoBenefClick
                    end
                    object dbchkAceitarOpBenef: TDBCheckBox
                      Left = 160
                      Top = 84
                      Width = 133
                      Height = 14
                      Hint = 'Indica se o benefício aceita "opções"'
                      Caption = 'Aceitar Opções'
                      DataField = 'FLGACEITAOPCAO'
                      DataSource = dsBenef
                      TabOrder = 11
                      ValueChecked = '1'
                      ValueUnchecked = '0'
                      OnClick = dbchkAceitarOpBenefClick
                    end
                    object dbchkRecalcBenef: TDBCheckBox
                      Left = 4
                      Top = 28
                      Width = 144
                      Height = 14
                      Hint = 
                        'Indica se o benefício será guardado em cotas e convertido pela F' +
                        'olha a cada pagamento'
                      Caption = 'Benefício em Cotas'
                      DataField = 'FLGCALCTODOMES'
                      DataSource = dsBenef
                      ParentShowHint = False
                      ShowHint = True
                      TabOrder = 1
                      ValueChecked = '1'
                      ValueUnchecked = '0'
                    end
                    object dbchkPossuiAbono: TDBCheckBox
                      Left = 4
                      Top = 9
                      Width = 144
                      Height = 14
                      Hint = 'Indica se o benefício é pago como 13o. (abono)'
                      Caption = 'Possui Abono Anual'
                      DataField = 'FLGPOSSUIABONO'
                      DataSource = dsBenef
                      ParentShowHint = False
                      ShowHint = True
                      TabOrder = 0
                      ValueChecked = '1'
                      ValueUnchecked = '0'
                      OnClick = dbchkPossuiAbonoClick
                    end
                    object dbchkQuitPrev: TDBCheckBox
                      Left = 160
                      Top = 9
                      Width = 197
                      Height = 14
                      Hint = 
                        'Indica se as dívidas previdenciárias podem ser cobradas na folha' +
                        ' de benefício'
                      Caption = 'Quitação div. prev. automatica'
                      DataField = 'FLGQUITAPREVIDEN'
                      DataSource = dsBenef
                      TabOrder = 7
                      ValueChecked = '1'
                      ValueUnchecked = '0'
                    end
                    object dbchkQuitAssist: TDBCheckBox
                      Left = 160
                      Top = 47
                      Width = 210
                      Height = 14
                      Hint = 
                        'Indica se as dívidas assistenciais podem ser cobradas na folha d' +
                        'e benefício'
                      Caption = 'Quitação div. assist. automática'
                      DataField = 'FLGQUITAASSISTEN'
                      DataSource = dsBenef
                      TabOrder = 9
                      ValueChecked = '1'
                      ValueUnchecked = '0'
                    end
                    object dbchkQuitEmp: TDBCheckBox
                      Left = 160
                      Top = 28
                      Width = 216
                      Height = 14
                      Hint = 
                        'Indica se as dívidas de empréstimo podem ser cobradas na folha d' +
                        'e benefício'
                      Caption = 'Quitação div. emprést. automática'
                      DataField = 'FLGQUITAEMPRESTI'
                      DataSource = dsBenef
                      TabOrder = 8
                      ValueChecked = '1'
                      ValueUnchecked = '0'
                    end
                    object dbchkredividir: TDBCheckBox
                      Left = 4
                      Top = 47
                      Width = 144
                      Height = 14
                      Hint = 
                        'Indica se o benefício será redivido no caso do no. de beneficiár' +
                        'ios ser alterado'
                      Caption = 'Redividir na data final'
                      DataField = 'FLGRECALCULAFIM'
                      DataSource = dsBenef
                      ParentShowHint = False
                      ShowHint = True
                      TabOrder = 2
                      ValueChecked = '1'
                      ValueUnchecked = '0'
                    end
                    object dbchkBenefReferencia: TDBCheckBox
                      Left = 4
                      Top = 66
                      Width = 144
                      Height = 14
                      Hint = 'Indica se é um benefício do INSS'
                      Caption = 'Beneficio do INSS'
                      DataField = 'FLGREFERENCIA'
                      DataSource = dsBenef
                      TabOrder = 3
                      ValueChecked = '1'
                      ValueUnchecked = '0'
                      OnClick = dbchkBenefReferenciaClick
                    end
                    object dbchkFlgObrigaNProc: TDBCheckBox
                      Left = 4
                      Top = 84
                      Width = 144
                      Height = 14
                      Hint = 'Indica se o número do INSS é obrigatório'
                      Caption = 'Obriga Processo INSS'
                      DataField = 'FLGOBRIGANPROC'
                      DataSource = dsBenef
                      TabOrder = 4
                      ValueChecked = '1'
                      ValueUnchecked = '0'
                    end
                    object dbchkPagaInteg: TDBCheckBox
                      Left = 4
                      Top = 152
                      Width = 246
                      Height = 14
                      Hint = 
                        'Indica se o benefício deve ser pago integral no mês da data fina' +
                        'l prevista'
                      Caption = 'Pagar Integral na Data Final Prevista'
                      DataField = 'FLGPAGAINTEG'
                      DataSource = dsBenef
                      TabOrder = 5
                      ValueChecked = '1'
                      ValueUnchecked = '0'
                    end
                    object DbChBxPagaInss: TDBCheckBox
                      Left = 160
                      Top = 65
                      Width = 159
                      Height = 14
                      Hint = 'Indica se a fundação paga o benefício, sendo do INSS'
                      Caption = 'Beneficio Pago (INSS)'
                      DataField = 'FLGPAGAINSS'
                      DataSource = dsBenef
                      TabOrder = 10
                      ValueChecked = '1'
                      ValueUnchecked = '0'
                      OnClick = DbChBxPagaInssClick
                    end
                    object DBCheckBox2: TDBCheckBox
                      Left = 4
                      Top = 133
                      Width = 150
                      Height = 14
                      Caption = 'Aceita ZERO no valor'
                      DataField = 'FLGACEITAZERO'
                      DataSource = dsBenef
                      TabOrder = 6
                      ValueChecked = '1'
                      ValueUnchecked = '0'
                    end
                    object dbckMoveResAposConc: TDBCheckBox
                      Left = 160
                      Top = 133
                      Width = 217
                      Height = 14
                      Hint = 
                        'Indica se a reserva será movimentada após a concessão do benefíc' +
                        'io.'
                      Caption = 'Move Reserva Após Concessão'
                      DataField = 'FLGMOVRESAPOSCONC'
                      DataSource = dsBenef
                      TabOrder = 13
                      ValueChecked = '1'
                      ValueUnchecked = '0'
                      OnClick = dbchkAceitarOpBenefClick
                    end
                    object DBCheckBox9: TDBCheckBox
                      Left = 4
                      Top = 170
                      Width = 293
                      Height = 14
                      Hint = 
                        'Indica se o benefício deve ser pago integral no mês da data fina' +
                        'l prevista'
                      Caption = 'Desindexar Reserva até a data do evento'
                      DataField = 'FLGDESINDRES'
                      DataSource = dsBenef
                      TabOrder = 14
                      ValueChecked = '1'
                      ValueUnchecked = '0'
                    end
                    object DBCheckBox11: TDBCheckBox
                      Left = 5
                      Top = 190
                      Width = 380
                      Height = 17
                      Caption = 'Benefício Isento de IR (marcação automatica no requerimento)'
                      DataField = 'FLGISENTOIRRF'
                      DataSource = dsBenef
                      ParentShowHint = False
                      ShowHint = False
                      TabOrder = 15
                      ValueChecked = '1'
                      ValueUnchecked = '0'
                    end
                    object dbchkAceitarOpTextoBenef: TDBCheckBox
                      Left = 160
                      Top = 108
                      Width = 133
                      Height = 14
                      Hint = 'Indica se o benefício aceita "opções"'
                      Caption = 'Opções Texto'
                      DataField = 'FLGOPCAOTEXTO'
                      DataSource = dsBenef
                      TabOrder = 12
                      ValueChecked = '1'
                      ValueUnchecked = '0'
                      OnClick = dbchkAceitarOpTextoBenefClick
                    end
                  end
                  object dblkpcmbBeneficio: TwwDBLookupCombo
                    Left = 6
                    Top = 22
                    Width = 283
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'NOME'#9'60'#9'Benefício')
                    DataField = 'IDBENEFICIO'
                    DataSource = dsBenef
                    LookupTable = qryBeneficio
                    LookupField = 'IDBENEFICIO'
                    Options = [loTitles]
                    ParentFont = False
                    TabOrder = 0
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    OnCloseUp = dblkpcmbBeneficioCloseUp
                  end
                  object grpBenefReferencia: TGroupBox
                    Left = 390
                    Top = -4
                    Width = 286
                    Height = 53
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 2
                    object Label52: TLabel
                      Left = 9
                      Top = 9
                      Width = 140
                      Height = 13
                      Caption = 'Benefício de Referência'
                    end
                    object dblkpcmbBenefRef: TwwDBLookupCombo
                      Left = 9
                      Top = 27
                      Width = 262
                      Height = 21
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'NOME'#9'60'#9'Benefício de Referência')
                      DataField = 'IDBENEFREF'
                      DataSource = dsBenef
                      LookupTable = qryBenefReferen
                      LookupField = 'IDBENEFICIO'
                      Options = [loTitles]
                      ParentFont = False
                      TabOrder = 0
                      AutoDropDown = True
                      ShowButton = True
                      AllowClearKey = True
                      OnCloseUp = dblkpcmbBenefRefCloseUp
                      OnExit = dblkpcmbBenefRefExit
                    end
                  end
                  object dbrgrpModalidade: TDBRadioGroup
                    Left = 5
                    Top = 102
                    Width = 287
                    Height = 49
                    Caption = ' Modalidade '
                    DataField = 'TPMODALIDADE'
                    DataSource = dsBenef
                    Items.Strings = (
                      'Benefício Definido'
                      'Contribuição Definida')
                    TabOrder = 3
                    TabStop = True
                    Values.Strings = (
                      'BD'
                      'CD')
                  end
                  object dbgrpBenefInf: TDBRadioGroup
                    Left = 5
                    Top = 153
                    Width = 287
                    Height = 104
                    Caption = ' Considerar como  Nº de Beneficiários '
                    DataField = 'FLGBENEFINF'
                    DataSource = dsBenef
                    Items.Strings = (
                      'o número informado no requerimento'
                      'o número total de beneficiários')
                    TabOrder = 5
                    Values.Strings = (
                      '1'
                      '0')
                  end
                  object DBRadioGroup1: TDBRadioGroup
                    Left = 5
                    Top = 256
                    Width = 684
                    Height = 44
                    Caption = ' Tipo de Data para Atualização da Reserva '
                    Columns = 2
                    DataField = 'FLGDATAINDICERES'
                    DataSource = dsBenef
                    Items.Strings = (
                      'Início do benefício'
                      'Efetivo pagto do benefício'
                      'Requerimento do benefício'
                      'Regra de Cálculo')
                    TabOrder = 6
                    Values.Strings = (
                      '0'
                      '1'
                      '2'
                      '3')
                  end
                  object gbDeficit: TGroupBox
                    Left = 5
                    Top = 303
                    Width = 684
                    Height = 57
                    Caption = ' Déficit '
                    TabOrder = 7
                    object dbchkFlgBSFAB: TDBCheckBox
                      Left = 16
                      Top = 19
                      Width = 481
                      Height = 14
                      Caption = 
                        'Apresentar os campos Benefício Saldado e FAB no requerimento de ' +
                        'benefícios'
                      DataField = 'FLGAPRESENTABSFAB'
                      DataSource = dsBenef
                      TabOrder = 0
                      ValueChecked = '1'
                      ValueUnchecked = '0'
                      OnClick = dbchkFlgBSFABClick
                    end
                    object dbchkFlgBCDeficit: TDBCheckBox
                      Left = 16
                      Top = 37
                      Width = 473
                      Height = 14
                      Caption = 
                        'Apresentar o campo Base de Cálculo do Déficit no requerimento de' +
                        ' benefícios'
                      DataField = 'FLGAPRESENTADEFICIT'
                      DataSource = dsBenef
                      TabOrder = 1
                      ValueChecked = '1'
                      ValueUnchecked = '0'
                      OnClick = dbchkFlgBCDeficitClick
                    end
                  end
                end
              end
              object tbsBenefPlano2: TTabSheet
                Caption = 'Regras ...'
                object Panel7: TPanel
                  Left = 0
                  Top = 0
                  Width = 1234
                  Height = 443
                  Align = alClient
                  BevelOuter = bvLowered
                  TabOrder = 0
                  object PageControl1: TPageControl
                    Left = 1
                    Top = 1
                    Width = 1232
                    Height = 441
                    ActivePage = TabSheet2
                    Align = alClient
                    TabOrder = 0
                    object TabSheet1: TTabSheet
                      Caption = ' ... de Elegibilidade e Verificações'
                      object Label11: TLabel
                        Left = 4
                        Top = 0
                        Width = 231
                        Height = 13
                        Caption = 'Regra de Concessão para o Participante'
                      end
                      object lblRgConcBeneficiario: TLabel
                        Left = 4
                        Top = 39
                        Width = 230
                        Height = 13
                        Caption = 'Regra de Concessão para o Beneficiário'
                      end
                      object Label30: TLabel
                        Left = 4
                        Top = 77
                        Width = 243
                        Height = 13
                        Caption = 'Regra de Verificação de Benefício Mínimo'
                      end
                      object Label98: TLabel
                        Left = 4
                        Top = 117
                        Width = 276
                        Height = 13
                        Caption = 'Regra para Indicar Entidade Contábil/Financeira'
                      end
                      object dblkpcmbConcessao: TwwDBLookupCombo
                        Left = 4
                        Top = 13
                        Width = 303
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'NOMEREGRA'#9'60'#9'Regra de Negócio')
                        DataField = 'IDREGRAELEGIBILI'
                        DataSource = dsBenef
                        LookupTable = qryRegra
                        LookupField = 'IDREGRA'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 0
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object dblkpcmbRegBeneficiario: TwwDBLookupCombo
                        Left = 4
                        Top = 52
                        Width = 303
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'NOMEREGRA'#9'60'#9'Regra de Negócio')
                        DataField = 'IDREGRABENEFICIA'
                        DataSource = dsBenef
                        LookupTable = qryRegra
                        LookupField = 'IDREGRA'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 1
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object wwDBLookupCombo4: TwwDBLookupCombo
                        Left = 4
                        Top = 91
                        Width = 303
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'NOMEREGRA'#9'60'#9'Regra de Negócio')
                        DataField = 'IDREGRABENEFMIN'
                        DataSource = dsBenef
                        LookupTable = qryRegra
                        LookupField = 'IDREGRA'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 2
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object dblcRegraEntidadeContabil: TwwDBLookupCombo
                        Left = 4
                        Top = 131
                        Width = 303
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'NOMEREGRA'#9'60'#9'Regra de Negócio')
                        DataField = 'IDRGPLANPREVCONT'
                        DataSource = dsBenef
                        LookupTable = qryRegra
                        LookupField = 'IDREGRA'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 3
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                    end
                    object TabSheet2: TTabSheet
                      Caption = ' ... de Cálculo '
                      ImageIndex = 1
                      object Label12: TLabel
                        Left = 1
                        Top = 37
                        Width = 221
                        Height = 13
                        Caption = 'Regra de Cálculo do Valor do 1º Pagto'
                      end
                      object lblRgBenefCalculo: TLabel
                        Left = 1
                        Top = 1
                        Width = 202
                        Height = 13
                        Caption = 'Regra de Cálculo do Valor a Pagar '
                      end
                      object Label14: TLabel
                        Left = 1
                        Top = 110
                        Width = 229
                        Height = 13
                        Caption = 'Regra de Cálculo do Valor do Últ. Pagto'
                      end
                      object lblRgBenefValorTotal: TLabel
                        Left = 1
                        Top = 74
                        Width = 260
                        Height = 13
                        Caption = 'Regra de Cálculo do Valor Total do Benefício'
                      end
                      object Label13: TLabel
                        Left = 1
                        Top = 147
                        Width = 244
                        Height = 13
                        Caption = 'Regra de Cálculo de Reserva p/ Benefício'
                      end
                      object Label35: TLabel
                        Left = 325
                        Top = 1
                        Width = 256
                        Height = 13
                        Caption = 'Regra de Cálculo de Simulação de Benefício'
                      end
                      object lblRegraCalcINSS: TLabel
                        Left = 325
                        Top = 37
                        Width = 201
                        Height = 13
                        Caption = 'Regra de Cálculo do Valor do INSS'
                      end
                      object Label18: TLabel
                        Left = 325
                        Top = 74
                        Width = 304
                        Height = 13
                        Caption = 'Regra de Cálculo do Salário Real de Benefício (SRB)'
                      end
                      object Label96: TLabel
                        Left = 324
                        Top = 110
                        Width = 312
                        Height = 13
                        Caption = 'Regra de Cálculo de Data da Elegibilidade (Simulação)'
                      end
                      object Label97: TLabel
                        Left = 324
                        Top = 147
                        Width = 270
                        Height = 13
                        Caption = 'Regra de Cálculo de Valor Previsto (Simulação)'
                      end
                      object Label115: TLabel
                        Left = 1
                        Top = 183
                        Width = 250
                        Height = 13
                        Caption = 'Regra de Cálculo para Quitação Automática'
                      end
                      object Label143: TLabel
                        Left = 1
                        Top = 233
                        Width = 137
                        Height = 13
                        Caption = 'Regra de Cálculo do BS'
                      end
                      object Label144: TLabel
                        Left = 1
                        Top = 270
                        Width = 144
                        Height = 13
                        Caption = 'Regra de Cálculo do FAB'
                      end
                      object Label145: TLabel
                        Left = 1
                        Top = 306
                        Width = 208
                        Height = 13
                        Caption = 'Regra de Cálculo da Base do Déficit'
                      end
                      object dblkpcmbCalcPrimPagto: TwwDBLookupCombo
                        Left = 1
                        Top = 50
                        Width = 303
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'NOMEREGRA'#9'60'#9'Regra de Negócio')
                        DataField = 'IDREGRAPRIMPAGTO'
                        DataSource = dsBenef
                        LookupTable = qryRegra
                        LookupField = 'IDREGRA'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 1
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object dblkpcmbCalcBenef: TwwDBLookupCombo
                        Left = 1
                        Top = 14
                        Width = 303
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'NOMEREGRA'#9'60'#9'Regra de Negócio')
                        DataField = 'IDREGRACALCULO'
                        DataSource = dsBenef
                        LookupTable = qryRegra
                        LookupField = 'IDREGRA'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 0
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object dblkpcmbRegUltPagtoBenef: TwwDBLookupCombo
                        Left = 1
                        Top = 123
                        Width = 303
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'NOMEREGRA'#9'60'#9'Regra de Negócio')
                        DataField = 'IDREGRAULTPAGTO'
                        DataSource = dsBenef
                        LookupTable = qryRegra
                        LookupField = 'IDREGRA'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 3
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object dblkpcmbRgValorTotal: TwwDBLookupCombo
                        Left = 1
                        Top = 87
                        Width = 303
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'NOMEREGRA'#9'60'#9'Regra de Negócio')
                        DataField = 'IDRGVALORTOTAL'
                        DataSource = dsBenef
                        LookupTable = qryRegra
                        LookupField = 'IDREGRA'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 2
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object dblkpcmbRegraPagtoBenef: TwwDBLookupCombo
                        Left = 1
                        Top = 160
                        Width = 303
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'NOMEREGRA'#9'60'#9'Regra de Negócio')
                        DataField = 'IDREGRAPAGAMENTO'
                        DataSource = dsBenef
                        LookupTable = qryRegra
                        LookupField = 'IDREGRA'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 4
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object wwDBLookupCombo5: TwwDBLookupCombo
                        Left = 325
                        Top = 14
                        Width = 303
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'NOMEREGRA'#9'60'#9'Regra de Negócio')
                        DataField = 'IDREGRASIMULA'
                        DataSource = dsBenef
                        LookupTable = qryRegra
                        LookupField = 'IDREGRA'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 6
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object dblkpcmbRegraCalcINSS: TwwDBLookupCombo
                        Left = 325
                        Top = 50
                        Width = 303
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'NOMEREGRA'#9'60'#9'Regra de Negócio')
                        DataField = 'IDREGRACALCINSS'
                        DataSource = dsBenef
                        LookupTable = qryRegra
                        LookupField = 'IDREGRA'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 7
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object wwDBLookupCombo3: TwwDBLookupCombo
                        Left = 325
                        Top = 87
                        Width = 303
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'NOMEREGRA'#9'60'#9'Regra de Negócio')
                        DataField = 'IDREGRASRB'
                        DataSource = dsBenef
                        LookupTable = qryRegra
                        LookupField = 'IDREGRA'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 8
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object wwDBLookupCombo13: TwwDBLookupCombo
                        Left = 324
                        Top = 123
                        Width = 303
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'NOMEREGRA'#9'60'#9'Regra de Negócio')
                        DataField = 'IDRGDATAELEG'
                        DataSource = dsBenef
                        LookupTable = qryRegra
                        LookupField = 'IDREGRA'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 9
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object wwDBLookupCombo14: TwwDBLookupCombo
                        Left = 324
                        Top = 160
                        Width = 303
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'NOMEREGRA'#9'60'#9'Regra de Negócio')
                        DataField = 'IDRGVALORPREV'
                        DataSource = dsBenef
                        LookupTable = qryRegra
                        LookupField = 'IDREGRA'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 10
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object wwDBLookupCombo24: TwwDBLookupCombo
                        Left = 1
                        Top = 196
                        Width = 303
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'NOMEREGRA'#9'60'#9'Regra de Negócio')
                        DataField = 'IDREGRAQUITANT'
                        DataSource = dsBenef
                        LookupTable = qryRegra
                        LookupField = 'IDREGRA'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 5
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object dblcRegraBS: TwwDBLookupCombo
                        Left = 1
                        Top = 246
                        Width = 303
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'NOMEREGRA'#9'60'#9'Regra de Negócio')
                        DataField = 'IDREGRACALCBS'
                        DataSource = dsBenef
                        LookupTable = qryRegra
                        LookupField = 'IDREGRA'
                        Options = [loTitles]
                        Enabled = False
                        ParentFont = False
                        TabOrder = 11
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object dblcRegraFAB: TwwDBLookupCombo
                        Left = 1
                        Top = 283
                        Width = 303
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'NOMEREGRA'#9'60'#9'Regra de Negócio')
                        DataField = 'IDREGRACALCFAB'
                        DataSource = dsBenef
                        LookupTable = qryRegra
                        LookupField = 'IDREGRA'
                        Options = [loTitles]
                        Enabled = False
                        ParentFont = False
                        TabOrder = 12
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object dblcRegraCBD: TwwDBLookupCombo
                        Left = 1
                        Top = 319
                        Width = 303
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'NOMEREGRA'#9'60'#9'Regra de Negócio')
                        DataField = 'IDREGRACALCBASEDEFICIT'
                        DataSource = dsBenef
                        LookupTable = qryRegra
                        LookupField = 'IDREGRA'
                        Options = [loTitles]
                        Enabled = False
                        ParentFont = False
                        TabOrder = 13
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                    end
                    object TabSheet3: TTabSheet
                      Caption = ' ... de Data'
                      ImageIndex = 2
                      object Label28: TLabel
                        Left = 7
                        Top = 8
                        Width = 203
                        Height = 13
                        Caption = 'Regra de Cálculo da Data de Início'
                      end
                      object Label29: TLabel
                        Left = 7
                        Top = 50
                        Width = 179
                        Height = 13
                        Caption = 'Regra de Cálculo da Data Final'
                      end
                      object Label91: TLabel
                        Left = 7
                        Top = 91
                        Width = 304
                        Height = 13
                        Caption = 'Regra de Cálculo da Data da atualização de Reserva'
                      end
                      object dblkpcmbRegraInicio: TwwDBLookupCombo
                        Left = 7
                        Top = 21
                        Width = 303
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'NOMEREGRA'#9'60'#9'Regra de Negócio')
                        DataField = 'IDREGRAINICIO'
                        DataSource = dsBenef
                        LookupTable = qryRegra
                        LookupField = 'IDREGRA'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 0
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object dblkpcmbRegraFim: TwwDBLookupCombo
                        Left = 7
                        Top = 63
                        Width = 303
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'NOMEREGRA'#9'60'#9'Regra de Negócio')
                        DataField = 'IDREGRAFIM'
                        DataSource = dsBenef
                        LookupTable = qryRegra
                        LookupField = 'IDREGRA'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 1
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object wwDBLookupCombo8: TwwDBLookupCombo
                        Left = 7
                        Top = 104
                        Width = 303
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'NOMEREGRA'#9'60'#9'Regra de Negócio')
                        DataField = 'IDREGRADTINDRES'
                        DataSource = dsBenef
                        LookupTable = qryRegra
                        LookupField = 'IDREGRA'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 2
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                    end
                  end
                end
              end
              object tbsBenefPlano3: TTabSheet
                Caption = 'Abono Anual'
                object Panel8: TPanel
                  Left = 0
                  Top = 0
                  Width = 1234
                  Height = 443
                  Align = alClient
                  BevelOuter = bvLowered
                  TabOrder = 0
                  object dbrgpAbonoFinalBenef: TDBRadioGroup
                    Left = 5
                    Top = 3
                    Width = 331
                    Height = 46
                    DataField = 'FLGABONOFINALBEN'
                    DataSource = dsBenef
                    Items.Strings = (
                      'Pagar abono anual no final do benefício'
                      'Pagar abono anual no final do ano')
                    TabOrder = 0
                    TabStop = True
                    Values.Strings = (
                      '1'
                      '0')
                  end
                  object GroupBox3: TGroupBox
                    Left = 339
                    Top = 3
                    Width = 332
                    Height = 46
                    TabOrder = 1
                    TabStop = True
                    object Label27: TLabel
                      Left = 13
                      Top = 6
                      Width = 244
                      Height = 13
                      Caption = 'Regra de Cálculo do Valor do Abono Anual'
                    end
                    object dblkpcmbCalcAbono: TwwDBLookupCombo
                      Left = 13
                      Top = 19
                      Width = 303
                      Height = 21
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'NOMEREGRA'#9'60'#9'Regra de Negócio')
                      DataField = 'IDREGRACALCABONO'
                      DataSource = dsBenef
                      LookupTable = qryRegra
                      LookupField = 'IDREGRA'
                      Options = [loTitles]
                      ParentFont = False
                      TabOrder = 0
                      AutoDropDown = True
                      ShowButton = True
                      AllowClearKey = True
                    end
                  end
                  object GroupBox4: TGroupBox
                    Left = 5
                    Top = 51
                    Width = 331
                    Height = 131
                    Caption = ' Rubricas de Abono Anual de Benefício Permanente '
                    TabOrder = 2
                    TabStop = True
                    object Label40: TLabel
                      Left = 6
                      Top = 17
                      Width = 130
                      Height = 13
                      Caption = 'Rubrica de Pagamento'
                    end
                    object Label62: TLabel
                      Left = 6
                      Top = 88
                      Width = 128
                      Height = 13
                      Caption = 'Rubrica de Devolução'
                    end
                    object BtPesquisaRubrica: TSpeedButton
                      Left = 306
                      Top = 32
                      Width = 19
                      Height = 19
                      Glyph.Data = {
                        36010000424D3601000000000000760000002800000011000000100000000100
                        040000000000C0000000C40E0000C40E00001000000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                        777770000000777777700F077777700000007777700FFF077777700000007770
                        0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                        000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                        FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                        E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                        000077707E7E0777777770000000777700007777777770000000}
                      OnClick = BtPesquisaRubricaClick
                    end
                    object SpeedButton9: TSpeedButton
                      Left = 306
                      Top = 104
                      Width = 19
                      Height = 19
                      Glyph.Data = {
                        36010000424D3601000000000000760000002800000011000000100000000100
                        040000000000C0000000C40E0000C40E00001000000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                        777770000000777777700F077777700000007777700FFF077777700000007770
                        0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                        000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                        FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                        E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                        000077707E7E0777777770000000777700007777777770000000}
                      OnClick = SpeedButton9Click
                    end
                    object Label49: TLabel
                      Left = 5
                      Top = 53
                      Width = 103
                      Height = 13
                      Caption = 'Rubrica de Atraso'
                    end
                    object SpeedButton10: TSpeedButton
                      Left = 306
                      Top = 68
                      Width = 19
                      Height = 19
                      Glyph.Data = {
                        36010000424D3601000000000000760000002800000011000000100000000100
                        040000000000C0000000C40E0000C40E00001000000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                        777770000000777777700F077777700000007777700FFF077777700000007770
                        0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                        000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                        FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                        E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                        000077707E7E0777777770000000777700007777777770000000}
                      OnClick = SpeedButton10Click
                    end
                    object dblkpcmbRubAbono: TwwDBLookupCombo
                      Left = 6
                      Top = 31
                      Width = 299
                      Height = 21
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'DESCRICAO'#9'60'#9'Descrição'#9'F'
                        'CODPROVDESC'#9'15'#9'Código'#9'F'
                        'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                      DataField = 'IDRUBABONO'
                      DataSource = dsBenef
                      LookupTable = qryProventos
                      LookupField = 'IDPROVENTO'
                      Options = [loTitles]
                      ParentFont = False
                      TabOrder = 0
                      AutoDropDown = True
                      ShowButton = True
                      AllowClearKey = True
                    end
                    object wwDBLookupCombo6: TwwDBLookupCombo
                      Left = 6
                      Top = 102
                      Width = 299
                      Height = 21
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'DESCRICAO'#9'60'#9'Descrição'#9'F'
                        'CODPROVDESC'#9'15'#9'Código'#9'F'
                        'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                      DataField = 'IDRUBDEVOLABONO'
                      DataSource = dsBenef
                      LookupTable = qryDescontos
                      LookupField = 'IDPROVENTO'
                      Options = [loTitles]
                      ParentFont = False
                      TabOrder = 1
                      AutoDropDown = True
                      ShowButton = True
                      AllowClearKey = True
                    end
                    object dblkpcmbRubAtraso: TwwDBLookupCombo
                      Left = 5
                      Top = 67
                      Width = 299
                      Height = 21
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'DESCRICAO'#9'60'#9'Descrição'#9'F'
                        'CODPROVDESC'#9'15'#9'Código'#9'F'
                        'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                      DataField = 'IDRUBATRASOABONO'
                      DataSource = dsBenef
                      LookupTable = qryProventos
                      LookupField = 'IDPROVENTO'
                      Options = [loTitles]
                      ParentFont = False
                      TabOrder = 2
                      AutoDropDown = True
                      ShowButton = True
                      AllowClearKey = True
                    end
                  end
                  object GroupBox18: TGroupBox
                    Left = 5
                    Top = 183
                    Width = 667
                    Height = 62
                    Caption = ' Rubricas de Abono Anual de Adiant. de Benefício '
                    TabOrder = 3
                    TabStop = True
                    object Label63: TLabel
                      Left = 5
                      Top = 18
                      Width = 229
                      Height = 13
                      Caption = 'Rubrica de Pagamento de Adiantamento'
                    end
                    object Label70: TLabel
                      Left = 338
                      Top = 18
                      Width = 227
                      Height = 13
                      Caption = 'Rubrica de Devolução de Adiantamento'
                    end
                    object SpeedButton2: TSpeedButton
                      Left = 310
                      Top = 32
                      Width = 19
                      Height = 19
                      Glyph.Data = {
                        36010000424D3601000000000000760000002800000011000000100000000100
                        040000000000C0000000C40E0000C40E00001000000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                        777770000000777777700F077777700000007777700FFF077777700000007770
                        0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                        000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                        FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                        E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                        000077707E7E0777777770000000777700007777777770000000}
                      OnClick = SpeedButton2Click
                    end
                    object SpeedButton11: TSpeedButton
                      Left = 642
                      Top = 32
                      Width = 19
                      Height = 19
                      Glyph.Data = {
                        36010000424D3601000000000000760000002800000011000000100000000100
                        040000000000C0000000C40E0000C40E00001000000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                        777770000000777777700F077777700000007777700FFF077777700000007770
                        0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                        000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                        FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                        E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                        000077707E7E0777777770000000777700007777777770000000}
                      OnClick = SpeedButton11Click
                    end
                    object wwDBLookupCombo7: TwwDBLookupCombo
                      Left = 5
                      Top = 32
                      Width = 303
                      Height = 21
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'DESCRICAO'#9'60'#9'Descrição'#9'F'
                        'CODPROVDESC'#9'15'#9'Código'#9'F'
                        'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                      DataField = 'IDRUBADIANT13'
                      DataSource = dsBenef
                      LookupTable = qryProventos
                      LookupField = 'IDPROVENTO'
                      Options = [loTitles]
                      ParentFont = False
                      TabOrder = 0
                      AutoDropDown = True
                      ShowButton = True
                      AllowClearKey = True
                    end
                    object wwDBLookupCombo10: TwwDBLookupCombo
                      Left = 338
                      Top = 32
                      Width = 303
                      Height = 21
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'DESCRICAO'#9'60'#9'Descrição'#9'F'
                        'CODPROVDESC'#9'15'#9'Código'#9'F'
                        'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                      DataField = 'IDRUBDEVADIANT13'
                      DataSource = dsBenef
                      LookupTable = qryDescontos
                      LookupField = 'IDPROVENTO'
                      Options = [loTitles]
                      ParentFont = False
                      TabOrder = 1
                      AutoDropDown = True
                      ShowButton = True
                      AllowClearKey = True
                    end
                  end
                  object GroupBox16: TGroupBox
                    Left = 339
                    Top = 51
                    Width = 332
                    Height = 131
                    Caption = ' Rubricas de Antecipação de Abono Anual '
                    TabOrder = 4
                    TabStop = True
                    object Label105: TLabel
                      Left = 5
                      Top = 53
                      Width = 103
                      Height = 13
                      Caption = 'Rubrica de Atraso'
                    end
                    object Label106: TLabel
                      Left = 5
                      Top = 88
                      Width = 132
                      Height = 13
                      Caption = 'Rubrica de Devolução '
                    end
                    object SpeedButton18: TSpeedButton
                      Left = 306
                      Top = 68
                      Width = 19
                      Height = 19
                      Glyph.Data = {
                        36010000424D3601000000000000760000002800000011000000100000000100
                        040000000000C0000000C40E0000C40E00001000000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                        777770000000777777700F077777700000007777700FFF077777700000007770
                        0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                        000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                        FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                        E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                        000077707E7E0777777770000000777700007777777770000000}
                      OnClick = SpeedButton18Click
                    end
                    object SpeedButton19: TSpeedButton
                      Left = 306
                      Top = 103
                      Width = 19
                      Height = 19
                      Glyph.Data = {
                        36010000424D3601000000000000760000002800000011000000100000000100
                        040000000000C0000000C40E0000C40E00001000000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                        777770000000777777700F077777700000007777700FFF077777700000007770
                        0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                        000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                        FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                        E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                        000077707E7E0777777770000000777700007777777770000000}
                      OnClick = SpeedButton19Click
                    end
                    object Label25: TLabel
                      Left = 6
                      Top = 15
                      Width = 130
                      Height = 13
                      Caption = 'Rubrica de Pagamento'
                    end
                    object SpeedButton1: TSpeedButton
                      Left = 306
                      Top = 32
                      Width = 19
                      Height = 19
                      Glyph.Data = {
                        36010000424D3601000000000000760000002800000011000000100000000100
                        040000000000C0000000C40E0000C40E00001000000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                        777770000000777777700F077777700000007777700FFF077777700000007770
                        0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                        000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                        FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                        E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                        000077707E7E0777777770000000777700007777777770000000}
                      OnClick = SpeedButton1Click
                    end
                    object dblkpcmbRubAtrasoAntecAbono: TwwDBLookupCombo
                      Left = 5
                      Top = 67
                      Width = 303
                      Height = 21
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'DESCRICAO'#9'60'#9'Descrição'#9'F'
                        'CODPROVDESC'#9'15'#9'Código'#9'F'
                        'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                      DataField = 'IDRUBACERTOABONO'
                      DataSource = dsBenef
                      LookupTable = qryProventos
                      LookupField = 'IDPROVENTO'
                      Options = [loTitles]
                      ParentFont = False
                      TabOrder = 0
                      AutoDropDown = True
                      ShowButton = True
                      AllowClearKey = True
                    end
                    object dblkpcmbRubDevolAntecAbono: TwwDBLookupCombo
                      Left = 5
                      Top = 102
                      Width = 303
                      Height = 21
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'DESCRICAO'#9'60'#9'Descrição'#9'F'
                        'CODPROVDESC'#9'15'#9'Código'#9'F'
                        'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                      DataField = 'IDRUBDEVANTABONO'
                      DataSource = dsBenef
                      LookupTable = qryDescontos
                      LookupField = 'IDPROVENTO'
                      Options = [loTitles]
                      ParentFont = False
                      TabOrder = 1
                      AutoDropDown = True
                      ShowButton = True
                      AllowClearKey = True
                    end
                    object dblkpcmbRubAntecAbono: TwwDBLookupCombo
                      Left = 6
                      Top = 31
                      Width = 299
                      Height = 21
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'DESCRICAO'#9'60'#9'Descrição'#9'F'
                        'CODPROVDESC'#9'15'#9'Código'#9'F'
                        'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                      DataField = 'IDRUBANTECABONO'
                      DataSource = dsBenef
                      LookupTable = qryProventos
                      LookupField = 'IDPROVENTO'
                      Options = [loTitles]
                      ParentFont = False
                      TabOrder = 2
                      AutoDropDown = True
                      ShowButton = True
                      AllowClearKey = True
                    end
                  end
                end
              end
              object tbsBenefExcecao: TTabSheet
                Caption = 'Tratamento de Exceção'
                object Panel10: TPanel
                  Left = 0
                  Top = 0
                  Width = 1234
                  Height = 443
                  Align = alClient
                  BevelOuter = bvLowered
                  TabOrder = 0
                  object GroupBox17: TGroupBox
                    Left = 10
                    Top = 108
                    Width = 657
                    Height = 128
                    Caption = ' Outros Parâmetros'
                    TabOrder = 0
                    object Label102: TLabel
                      Left = 10
                      Top = 16
                      Width = 331
                      Height = 26
                      Caption = 
                        'Número de Dias a considerar entre DIB deste benefício e Data Fin' +
                        'al do benefício anterior'
                      WordWrap = True
                    end
                    object DBCheckBox1: TDBCheckBox
                      Left = 9
                      Top = 45
                      Width = 363
                      Height = 14
                      Caption = ' Aceita acertos de pagamentos/cobranças do participante'
                      DataField = 'FLGACEITAACERTO'
                      DataSource = dsBenef
                      TabOrder = 0
                      ValueChecked = '1'
                      ValueUnchecked = '0'
                    end
                    object GroupBox22: TGroupBox
                      Left = 7
                      Top = 81
                      Width = 623
                      Height = 36
                      Caption = 'Permite entrar com valor mesmo com regra associada'
                      TabOrder = 1
                      object DBCheckBox4: TDBCheckBox
                        Left = 31
                        Top = 18
                        Width = 114
                        Height = 14
                        Caption = 'Valor do SRB'
                        DataField = 'FLGACTVLRSRB'
                        DataSource = dsBenef
                        TabOrder = 0
                        ValueChecked = '1'
                        ValueUnchecked = '0'
                      end
                      object DBCheckBox5: TDBCheckBox
                        Left = 243
                        Top = 18
                        Width = 103
                        Height = 14
                        Caption = 'Valor Atual'
                        DataField = 'FLGACTVLRATUAL'
                        DataSource = dsBenef
                        TabOrder = 1
                        ValueChecked = '1'
                        ValueUnchecked = '0'
                      end
                      object DBCheckBox6: TDBCheckBox
                        Left = 423
                        Top = 18
                        Width = 167
                        Height = 14
                        Caption = 'Valor Total do Benefício'
                        DataField = 'FLGACTVLRTOTBEN'
                        DataSource = dsBenef
                        TabOrder = 2
                        ValueChecked = '1'
                        ValueUnchecked = '0'
                      end
                    end
                    object DBCheckBox7: TDBCheckBox
                      Left = 9
                      Top = 63
                      Width = 613
                      Height = 14
                      Hint = 
                        'Se este campo estiver DESMARCADO o sistema buscará o valor integ' +
                        'ral da tabela atual de benefícios a pagar'
                      Caption = 
                        ' Nas rotinas de Renovação/Reabertura buscar VALOR INTEGRAL no Hi' +
                        'stórico de Benefícios'
                      DataField = 'FLGTPBUSCAVALOR'
                      DataSource = dsBenef
                      TabOrder = 2
                      ValueChecked = '1'
                      ValueUnchecked = '0'
                    end
                    object dbedNumDiasBenefAnt: TwwDBEdit
                      Left = 371
                      Top = 19
                      Width = 121
                      Height = 21
                      DataField = 'NUMDIASBENEFANT'
                      DataSource = dsBenef
                      TabOrder = 3
                      UnboundDataType = wwDefault
                      UnboundAlignment = taRightJustify
                      WantReturns = False
                      WordWrap = False
                      OnEnter = dbedValorLimiteEnter
                    end
                  end
                  object GroupBox15: TGroupBox
                    Left = 10
                    Top = 9
                    Width = 657
                    Height = 94
                    Caption = ' Parâmetros para Controle de Limite de Alteração de Valor '
                    TabOrder = 1
                    object Label19: TLabel
                      Left = 13
                      Top = 19
                      Width = 240
                      Height = 13
                      Caption = 'Valor Limite para Pagamento do Benefício'
                    end
                    object Label99: TLabel
                      Left = 13
                      Top = 43
                      Width = 312
                      Height = 13
                      Caption = 'Percentual Limite para Mudança do Valor do Benefício'
                    end
                    object Label100: TLabel
                      Left = 13
                      Top = 67
                      Width = 342
                      Height = 13
                      Caption = 'Usuário Autorizador para Alteração de Valor acima do Limite'
                    end
                    object Label101: TLabel
                      Left = 498
                      Top = 54
                      Width = 10
                      Height = 13
                      Caption = '%'
                    end
                    object dbedValorLimite: TwwDBEdit
                      Left = 371
                      Top = 19
                      Width = 121
                      Height = 21
                      DataField = 'LIMITEALT'
                      DataSource = dsBenef
                      TabOrder = 0
                      UnboundDataType = wwDefault
                      UnboundAlignment = taRightJustify
                      WantReturns = False
                      WordWrap = False
                      OnEnter = dbedValorLimiteEnter
                    end
                    object dbedPercLimite: TwwDBEdit
                      Left = 371
                      Top = 43
                      Width = 121
                      Height = 21
                      DataField = 'PERCENTUALALT'
                      DataSource = dsBenef
                      TabOrder = 1
                      UnboundDataType = wwDefault
                      UnboundAlignment = taRightJustify
                      WantReturns = False
                      WordWrap = False
                      OnEnter = dbedPercLimiteEnter
                    end
                    object dblkpcmbUsuarioLimite: TwwDBLookupCombo
                      Left = 371
                      Top = 67
                      Width = 256
                      Height = 21
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'NOMEUSUARIO'#9'20'#9'Usuário'#9'F')
                      DataField = 'USUARIOALT'
                      DataSource = dsBenef
                      LookupTable = qryUsuarioSistema
                      LookupField = 'IDUSUARIO'
                      Options = [loTitles]
                      TabOrder = 2
                      AutoDropDown = True
                      ShowButton = True
                      AllowClearKey = True
                      OnEnter = dblkpcmbUsuarioLimiteEnter
                    end
                  end
                end
              end
              object tbsRubBenef: TTabSheet
                Caption = 'Rubricas'
                OnShow = tbsRubBenefShow
                object pgcRubBenef: TPageControl
                  Left = 0
                  Top = 0
                  Width = 1234
                  Height = 443
                  ActivePage = tbsBenRubNorm
                  Align = alClient
                  TabOrder = 0
                  object tbsBenRubNorm: TTabSheet
                    Caption = 'Normal'
                    object Panel1: TPanel
                      Left = 0
                      Top = 0
                      Width = 1226
                      Height = 415
                      Align = alClient
                      BevelOuter = bvLowered
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 0
                      object GroupBox19: TGroupBox
                        Left = 3
                        Top = 160
                        Width = 660
                        Height = 56
                        Caption = ' Rubricas para Benefício pago em Adiantamento '
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                        TabOrder = 2
                        TabStop = True
                        object Label64: TLabel
                          Left = 6
                          Top = 16
                          Width = 240
                          Height = 13
                          Caption = 'Rubrica para Pagamento de Adiantamento'
                        end
                        object Label69: TLabel
                          Left = 335
                          Top = 16
                          Width = 238
                          Height = 13
                          Caption = 'Rubrica para Devolução de Adiantamento'
                        end
                        object SpeedButton5: TSpeedButton
                          Left = 307
                          Top = 31
                          Width = 19
                          Height = 19
                          Glyph.Data = {
                            36010000424D3601000000000000760000002800000011000000100000000100
                            040000000000C0000000C40E0000C40E00001000000000000000000000000000
                            80000080000000808000800000008000800080800000C0C0C000808080000000
                            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                            777770000000777777700F077777700000007777700FFF077777700000007770
                            0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                            000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                            FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                            E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                            000077707E7E0777777770000000777700007777777770000000}
                          OnClick = SpeedButton5Click
                        end
                        object SpeedButton8: TSpeedButton
                          Left = 636
                          Top = 31
                          Width = 19
                          Height = 19
                          Glyph.Data = {
                            36010000424D3601000000000000760000002800000011000000100000000100
                            040000000000C0000000C40E0000C40E00001000000000000000000000000000
                            80000080000000808000800000008000800080800000C0C0C000808080000000
                            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                            777770000000777777700F077777700000007777700FFF077777700000007770
                            0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                            000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                            FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                            E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                            000077707E7E0777777770000000777700007777777770000000}
                          OnClick = SpeedButton8Click
                        end
                        object dblkpcmbRubricaBenefPagAd: TwwDBLookupCombo
                          Left = 6
                          Top = 30
                          Width = 299
                          Height = 21
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'MS Sans Serif'
                          Font.Style = []
                          DropDownAlignment = taLeftJustify
                          Selected.Strings = (
                            'DESCRICAO'#9'60'#9'Descrição'#9'F'
                            'CODPROVDESC'#9'15'#9'Código'#9'F'
                            'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                          DataField = 'IDRUBADIANT'
                          DataSource = dsBenef
                          LookupTable = QryProventoNormal
                          LookupField = 'IDPROVENTO'
                          Options = [loTitles]
                          ParentFont = False
                          TabOrder = 0
                          AutoDropDown = True
                          ShowButton = True
                          AllowClearKey = True
                        end
                        object dblkpcmbRubricaBenefDevAd: TwwDBLookupCombo
                          Left = 335
                          Top = 30
                          Width = 299
                          Height = 21
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'MS Sans Serif'
                          Font.Style = []
                          DropDownAlignment = taLeftJustify
                          Selected.Strings = (
                            'DESCRICAO'#9'60'#9'Descrição'#9'F'
                            'CODPROVDESC'#9'15'#9'Código'#9'F'
                            'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                          DataField = 'IDRUBDEVOLADIANT'
                          DataSource = dsBenef
                          LookupTable = QryDescontoDevolucao
                          LookupField = 'IDPROVENTO'
                          Options = [loTitles]
                          ParentFont = False
                          TabOrder = 1
                          AutoDropDown = True
                          ShowButton = True
                          AllowClearKey = True
                        end
                      end
                      object GroupBox20: TGroupBox
                        Left = 3
                        Top = 4
                        Width = 328
                        Height = 156
                        Caption = ' Rubricas para Benefício Integral ( não adiantado )'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                        TabOrder = 0
                        object Label57: TLabel
                          Left = 4
                          Top = 12
                          Width = 184
                          Height = 13
                          Caption = 'Rubrica para Pagamento Normal'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label58: TLabel
                          Left = 4
                          Top = 83
                          Width = 215
                          Height = 13
                          Caption = 'Rubrica para Cobrança de Devolução'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label59: TLabel
                          Left = 4
                          Top = 48
                          Width = 195
                          Height = 13
                          Caption = 'Rubrica para Pagamento Atrasado'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object SpeedButton3: TSpeedButton
                          Left = 304
                          Top = 27
                          Width = 19
                          Height = 19
                          Glyph.Data = {
                            36010000424D3601000000000000760000002800000011000000100000000100
                            040000000000C0000000C40E0000C40E00001000000000000000000000000000
                            80000080000000808000800000008000800080800000C0C0C000808080000000
                            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                            777770000000777777700F077777700000007777700FFF077777700000007770
                            0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                            000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                            FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                            E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                            000077707E7E0777777770000000777700007777777770000000}
                          OnClick = SpeedButton3Click
                        end
                        object SpeedButton6: TSpeedButton
                          Left = 304
                          Top = 63
                          Width = 19
                          Height = 19
                          Glyph.Data = {
                            36010000424D3601000000000000760000002800000011000000100000000100
                            040000000000C0000000C40E0000C40E00001000000000000000000000000000
                            80000080000000808000800000008000800080800000C0C0C000808080000000
                            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                            777770000000777777700F077777700000007777700FFF077777700000007770
                            0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                            000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                            FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                            E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                            000077707E7E0777777770000000777700007777777770000000}
                          OnClick = SpeedButton6Click
                        end
                        object SpeedButton7: TSpeedButton
                          Left = 304
                          Top = 98
                          Width = 19
                          Height = 19
                          Glyph.Data = {
                            36010000424D3601000000000000760000002800000011000000100000000100
                            040000000000C0000000C40E0000C40E00001000000000000000000000000000
                            80000080000000808000800000008000800080800000C0C0C000808080000000
                            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                            777770000000777777700F077777700000007777700FFF077777700000007770
                            0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                            000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                            FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                            E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                            000077707E7E0777777770000000777700007777777770000000}
                          OnClick = SpeedButton7Click
                        end
                        object Label116: TLabel
                          Left = 4
                          Top = 117
                          Width = 196
                          Height = 13
                          Caption = 'Rubrica para Quitação Automática'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object SpeedButton27: TSpeedButton
                          Left = 304
                          Top = 132
                          Width = 19
                          Height = 19
                          Glyph.Data = {
                            36010000424D3601000000000000760000002800000011000000100000000100
                            040000000000C0000000C40E0000C40E00001000000000000000000000000000
                            80000080000000808000800000008000800080800000C0C0C000808080000000
                            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                            777770000000777777700F077777700000007777700FFF077777700000007770
                            0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                            000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                            FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                            E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                            000077707E7E0777777770000000777700007777777770000000}
                          OnClick = SpeedButton27Click
                        end
                        object dblkpcmbRubricaBenefNormal: TwwDBLookupCombo
                          Left = 4
                          Top = 26
                          Width = 298
                          Height = 21
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = []
                          DropDownAlignment = taLeftJustify
                          Selected.Strings = (
                            'DESCRICAO'#9'60'#9'Descrição'#9'F'
                            'CODPROVDESC'#9'15'#9'Código'#9'F'
                            'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                          DataField = 'IDRUBRICA'
                          DataSource = dsBenef
                          LookupTable = QryProventoNormal
                          LookupField = 'IDPROVENTO'
                          Options = [loTitles]
                          ParentFont = False
                          TabOrder = 0
                          AutoDropDown = True
                          ShowButton = True
                          AllowClearKey = True
                        end
                        object dblkpcmbRubricaBenefDevol: TwwDBLookupCombo
                          Left = 4
                          Top = 97
                          Width = 298
                          Height = 21
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = []
                          DropDownAlignment = taLeftJustify
                          Selected.Strings = (
                            'DESCRICAO'#9'60'#9'Descrição'#9'F'
                            'CODPROVDESC'#9'15'#9'Código'#9'F'
                            'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                          DataField = 'IDRUBDEVOLUCAO'
                          DataSource = dsBenef
                          LookupTable = QryDescontoDevolucao
                          LookupField = 'IDPROVENTO'
                          Options = [loTitles]
                          ParentFont = False
                          TabOrder = 2
                          AutoDropDown = True
                          ShowButton = True
                          AllowClearKey = True
                        end
                        object dblkpcmbRubricaBenefAtraso: TwwDBLookupCombo
                          Left = 4
                          Top = 62
                          Width = 298
                          Height = 21
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = []
                          DropDownAlignment = taLeftJustify
                          Selected.Strings = (
                            'DESCRICAO'#9'60'#9'Descrição'#9'F'
                            'CODPROVDESC'#9'15'#9'Código'#9'F'
                            'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                          DataField = 'IDRUBRICAATRASO'
                          DataSource = dsBenef
                          LookupTable = QryProventoAtraso
                          LookupField = 'IDPROVENTO'
                          Options = [loTitles]
                          ParentFont = False
                          TabOrder = 1
                          AutoDropDown = True
                          ShowButton = True
                          AllowClearKey = True
                        end
                        object dblkpcmbRubricaQuitaAuto: TwwDBLookupCombo
                          Left = 4
                          Top = 131
                          Width = 298
                          Height = 21
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = []
                          DropDownAlignment = taLeftJustify
                          Selected.Strings = (
                            'DESCRICAO'#9'60'#9'Descrição'#9'F'
                            'CODPROVDESC'#9'15'#9'Código'#9'F'
                            'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                          DataField = 'IDRUBRICAQUITANT'
                          DataSource = dsBenef
                          LookupTable = QryProventoNormal
                          LookupField = 'IDPROVENTO'
                          Options = [loTitles]
                          ParentFont = False
                          TabOrder = 3
                          AutoDropDown = True
                          ShowButton = True
                          AllowClearKey = True
                        end
                      end
                      object GroupBox24: TGroupBox
                        Left = 335
                        Top = 4
                        Width = 328
                        Height = 156
                        Caption = ' Rubricas para Revisão '
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                        TabOrder = 1
                        object Label109: TLabel
                          Left = 4
                          Top = 83
                          Width = 215
                          Height = 13
                          Caption = 'Rubrica para Cobrança de Devolução'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label110: TLabel
                          Left = 4
                          Top = 48
                          Width = 195
                          Height = 13
                          Caption = 'Rubrica para Pagamento Atrasado'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label111: TLabel
                          Left = 4
                          Top = 12
                          Width = 141
                          Height = 13
                          Caption = 'Rubrica para Pagamento'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object SpeedButton21: TSpeedButton
                          Left = 304
                          Top = 27
                          Width = 19
                          Height = 19
                          Glyph.Data = {
                            36010000424D3601000000000000760000002800000011000000100000000100
                            040000000000C0000000C40E0000C40E00001000000000000000000000000000
                            80000080000000808000800000008000800080800000C0C0C000808080000000
                            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                            777770000000777777700F077777700000007777700FFF077777700000007770
                            0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                            000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                            FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                            E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                            000077707E7E0777777770000000777700007777777770000000}
                          OnClick = SpeedButton21Click
                        end
                        object SpeedButton22: TSpeedButton
                          Left = 304
                          Top = 63
                          Width = 19
                          Height = 19
                          Glyph.Data = {
                            36010000424D3601000000000000760000002800000011000000100000000100
                            040000000000C0000000C40E0000C40E00001000000000000000000000000000
                            80000080000000808000800000008000800080800000C0C0C000808080000000
                            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                            777770000000777777700F077777700000007777700FFF077777700000007770
                            0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                            000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                            FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                            E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                            000077707E7E0777777770000000777700007777777770000000}
                          OnClick = SpeedButton22Click
                        end
                        object SpeedButton23: TSpeedButton
                          Left = 304
                          Top = 98
                          Width = 19
                          Height = 19
                          Glyph.Data = {
                            36010000424D3601000000000000760000002800000011000000100000000100
                            040000000000C0000000C40E0000C40E00001000000000000000000000000000
                            80000080000000808000800000008000800080800000C0C0C000808080000000
                            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                            777770000000777777700F077777700000007777700FFF077777700000007770
                            0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                            000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                            FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                            E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                            000077707E7E0777777770000000777700007777777770000000}
                          OnClick = SpeedButton23Click
                        end
                        object dblkpcmbRubricaDevRevisao: TwwDBLookupCombo
                          Left = 4
                          Top = 97
                          Width = 298
                          Height = 21
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = []
                          DropDownAlignment = taLeftJustify
                          Selected.Strings = (
                            'DESCRICAO'#9'60'#9'Descrição'#9'F'
                            'CODPROVDESC'#9'15'#9'Código'#9'F'
                            'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                          DataField = 'IDRUBDEVREVISAO'
                          DataSource = dsBenef
                          LookupTable = QryDescontoDevolucao
                          LookupField = 'IDPROVENTO'
                          Options = [loTitles]
                          ParentFont = False
                          TabOrder = 2
                          AutoDropDown = True
                          ShowButton = True
                          AllowClearKey = True
                        end
                        object dblkpcmbRubricaAtrasoRevisao: TwwDBLookupCombo
                          Left = 4
                          Top = 62
                          Width = 298
                          Height = 21
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = []
                          DropDownAlignment = taLeftJustify
                          Selected.Strings = (
                            'DESCRICAO'#9'60'#9'Descrição'#9'F'
                            'CODPROVDESC'#9'15'#9'Código'#9'F'
                            'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                          DataField = 'IDRUBATRREVISAO'
                          DataSource = dsBenef
                          LookupTable = QryProventoAtraso
                          LookupField = 'IDPROVENTO'
                          Options = [loTitles]
                          ParentFont = False
                          TabOrder = 1
                          AutoDropDown = True
                          ShowButton = True
                          AllowClearKey = True
                        end
                        object dblkpcmbRubricaRevisao: TwwDBLookupCombo
                          Left = 4
                          Top = 26
                          Width = 298
                          Height = 21
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = []
                          DropDownAlignment = taLeftJustify
                          Selected.Strings = (
                            'DESCRICAO'#9'60'#9'Descrição'#9'F'
                            'CODPROVDESC'#9'15'#9'Código'#9'F'
                            'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                          DataField = 'IDRUBRICAREVISAO'
                          DataSource = dsBenef
                          LookupTable = QryProventoNormal
                          LookupField = 'IDPROVENTO'
                          Options = [loTitles]
                          ParentFont = False
                          TabOrder = 0
                          AutoDropDown = True
                          ShowButton = True
                          AllowClearKey = True
                        end
                      end
                      object gbRubAcerto: TGroupBox
                        Left = 3
                        Top = 240
                        Width = 328
                        Height = 60
                        Caption = ' Rubrica para Acerto'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                        TabOrder = 3
                        object btnRubAcerto: TSpeedButton
                          Left = 304
                          Top = 25
                          Width = 19
                          Height = 19
                          Glyph.Data = {
                            36010000424D3601000000000000760000002800000011000000100000000100
                            040000000000C0000000C40E0000C40E00001000000000000000000000000000
                            80000080000000808000800000008000800080800000C0C0C000808080000000
                            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                            777770000000777777700F077777700000007777700FFF077777700000007770
                            0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                            000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                            FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                            E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                            000077707E7E0777777770000000777700007777777770000000}
                          OnClick = btnRubAcertoClick
                        end
                        object dblkpcmbRubricaAcerto: TwwDBLookupCombo
                          Left = 4
                          Top = 23
                          Width = 298
                          Height = 21
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = []
                          DropDownAlignment = taLeftJustify
                          Selected.Strings = (
                            'DESCRICAO'#9'60'#9'Descrição'#9'F'
                            'CODPROVDESC'#9'15'#9'Código'#9'F'
                            'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                          DataField = 'IDRUBRICAACERTO'
                          DataSource = dsBenef
                          LookupTable = QryProventoAcerto
                          LookupField = 'IDPROVENTO'
                          Options = [loTitles]
                          ParentFont = False
                          TabOrder = 0
                          AutoDropDown = True
                          ShowButton = True
                          AllowClearKey = True
                        end
                      end
                    end
                  end
                  object tbsBenRubJud: TTabSheet
                    Caption = 'Ação Judicial'
                    ImageIndex = 1
                    object Panel3: TPanel
                      Left = 0
                      Top = 0
                      Width = 1226
                      Height = 415
                      Align = alClient
                      BevelOuter = bvLowered
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 0
                      object ScrollBox2: TScrollBox
                        Left = 1
                        Top = 1
                        Width = 1224
                        Height = 413
                        Align = alClient
                        TabOrder = 0
                        object GroupBox13: TGroupBox
                          Left = 4
                          Top = 5
                          Width = 316
                          Height = 138
                          Caption = ' Rubricas para Benefício Integral ( não adiantado )'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                          TabOrder = 0
                          object Label83: TLabel
                            Left = 8
                            Top = 20
                            Width = 184
                            Height = 13
                            Caption = 'Rubrica para Pagamento Normal'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -9
                            Font.Name = 'MS Sans Serif'
                            Font.Style = [fsBold]
                            ParentFont = False
                          end
                          object Label84: TLabel
                            Left = 8
                            Top = 95
                            Width = 215
                            Height = 13
                            Caption = 'Rubrica para Cobrança de Devolução'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -9
                            Font.Name = 'MS Sans Serif'
                            Font.Style = [fsBold]
                            ParentFont = False
                          end
                          object Label85: TLabel
                            Left = 8
                            Top = 56
                            Width = 195
                            Height = 13
                            Caption = 'Rubrica para Pagamento Atrasado'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -9
                            Font.Name = 'MS Sans Serif'
                            Font.Style = [fsBold]
                            ParentFont = False
                          end
                          object SpeedButton14: TSpeedButton
                            Left = 282
                            Top = 35
                            Width = 19
                            Height = 19
                            Glyph.Data = {
                              36010000424D3601000000000000760000002800000011000000100000000100
                              040000000000C0000000C40E0000C40E00001000000000000000000000000000
                              80000080000000808000800000008000800080800000C0C0C000808080000000
                              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                              777770000000777777700F077777700000007777700FFF077777700000007770
                              0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                              000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                              FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                              E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                              000077707E7E0777777770000000777700007777777770000000}
                            OnClick = SpeedButton14Click
                          end
                          object SpeedButton16: TSpeedButton
                            Left = 282
                            Top = 71
                            Width = 19
                            Height = 19
                            Glyph.Data = {
                              36010000424D3601000000000000760000002800000011000000100000000100
                              040000000000C0000000C40E0000C40E00001000000000000000000000000000
                              80000080000000808000800000008000800080800000C0C0C000808080000000
                              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                              777770000000777777700F077777700000007777700FFF077777700000007770
                              0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                              000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                              FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                              E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                              000077707E7E0777777770000000777700007777777770000000}
                            OnClick = SpeedButton16Click
                          end
                          object SpeedButton17: TSpeedButton
                            Left = 282
                            Top = 112
                            Width = 19
                            Height = 17
                            Glyph.Data = {
                              36010000424D3601000000000000760000002800000011000000100000000100
                              040000000000C0000000C40E0000C40E00001000000000000000000000000000
                              80000080000000808000800000008000800080800000C0C0C000808080000000
                              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                              777770000000777777700F077777700000007777700FFF077777700000007770
                              0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                              000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                              FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                              E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                              000077707E7E0777777770000000777700007777777770000000}
                            OnClick = SpeedButton17Click
                          end
                          object dblkpcmbRubricaBenefNormalJud: TwwDBLookupCombo
                            Left = 8
                            Top = 34
                            Width = 272
                            Height = 21
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -9
                            Font.Name = 'MS Sans Serif'
                            Font.Style = []
                            DropDownAlignment = taLeftJustify
                            Selected.Strings = (
                              'DESCRICAO'#9'60'#9'Descrição'#9'F'
                              'CODPROVDESC'#9'15'#9'Código'#9'F'
                              'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                            DataField = 'IDRUBACJUD'
                            DataSource = dsBenef
                            LookupTable = QryProventoNormal
                            LookupField = 'IDPROVENTO'
                            Options = [loTitles]
                            ParentFont = False
                            TabOrder = 0
                            AutoDropDown = True
                            ShowButton = True
                            AllowClearKey = True
                          end
                          object dblkpcmbRubricaBenefDevolJud: TwwDBLookupCombo
                            Left = 8
                            Top = 109
                            Width = 272
                            Height = 21
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -9
                            Font.Name = 'MS Sans Serif'
                            Font.Style = []
                            DropDownAlignment = taLeftJustify
                            Selected.Strings = (
                              'DESCRICAO'#9'60'#9'Descrição'#9'F'
                              'CODPROVDESC'#9'15'#9'Código'#9'F'
                              'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                            DataField = 'IDRUBDEVACJUD'
                            DataSource = dsBenef
                            LookupTable = QryDescontoDevolucao
                            LookupField = 'IDPROVENTO'
                            Options = [loTitles]
                            ParentFont = False
                            TabOrder = 1
                            AutoDropDown = True
                            ShowButton = True
                            AllowClearKey = True
                          end
                          object dblkpcmbRubricaBenefAtrasoJud: TwwDBLookupCombo
                            Left = 8
                            Top = 70
                            Width = 272
                            Height = 21
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -9
                            Font.Name = 'MS Sans Serif'
                            Font.Style = []
                            DropDownAlignment = taLeftJustify
                            Selected.Strings = (
                              'DESCRICAO'#9'60'#9'Descrição'#9'F'
                              'CODPROVDESC'#9'15'#9'Código'#9'F'
                              'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                            DataField = 'IDRUBATRACJUD'
                            DataSource = dsBenef
                            LookupTable = QryProventoAtraso
                            LookupField = 'IDPROVENTO'
                            Options = [loTitles]
                            ParentFont = False
                            TabOrder = 2
                            AutoDropDown = True
                            ShowButton = True
                            AllowClearKey = True
                          end
                        end
                        object GroupBox11: TGroupBox
                          Left = 4
                          Top = 154
                          Width = 316
                          Height = 138
                          Caption = ' Rubricas para Benefício pago em Adiantamento '
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                          TabOrder = 1
                          TabStop = True
                          object Label81: TLabel
                            Left = 6
                            Top = 18
                            Width = 240
                            Height = 13
                            Caption = 'Rubrica para Pagamento de Adiantamento'
                          end
                          object Label82: TLabel
                            Left = 6
                            Top = 56
                            Width = 238
                            Height = 13
                            Caption = 'Rubrica para Devolução de Adiantamento'
                          end
                          object SpeedButton12: TSpeedButton
                            Left = 281
                            Top = 33
                            Width = 19
                            Height = 19
                            Glyph.Data = {
                              36010000424D3601000000000000760000002800000011000000100000000100
                              040000000000C0000000C40E0000C40E00001000000000000000000000000000
                              80000080000000808000800000008000800080800000C0C0C000808080000000
                              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                              777770000000777777700F077777700000007777700FFF077777700000007770
                              0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                              000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                              FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                              E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                              000077707E7E0777777770000000777700007777777770000000}
                            OnClick = SpeedButton12Click
                          end
                          object SpeedButton13: TSpeedButton
                            Left = 281
                            Top = 71
                            Width = 19
                            Height = 19
                            Glyph.Data = {
                              36010000424D3601000000000000760000002800000011000000100000000100
                              040000000000C0000000C40E0000C40E00001000000000000000000000000000
                              80000080000000808000800000008000800080800000C0C0C000808080000000
                              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                              777770000000777777700F077777700000007777700FFF077777700000007770
                              0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                              000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                              FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                              E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                              000077707E7E0777777770000000777700007777777770000000}
                            OnClick = SpeedButton13Click
                          end
                          object dblkpcmbRubricaBenefPagAdJud: TwwDBLookupCombo
                            Left = 6
                            Top = 32
                            Width = 274
                            Height = 21
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -11
                            Font.Name = 'MS Sans Serif'
                            Font.Style = []
                            DropDownAlignment = taLeftJustify
                            Selected.Strings = (
                              'DESCRICAO'#9'60'#9'Descrição'#9'F'
                              'CODPROVDESC'#9'15'#9'Código'#9'F'
                              'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                            DataField = 'IDRUBADTACJUD'
                            DataSource = dsBenef
                            LookupTable = QryProventoNormal
                            LookupField = 'IDPROVENTO'
                            Options = [loTitles]
                            ParentFont = False
                            TabOrder = 0
                            AutoDropDown = True
                            ShowButton = True
                            AllowClearKey = True
                          end
                          object dblkpcmbRubricaBenefDevAdJud: TwwDBLookupCombo
                            Left = 6
                            Top = 70
                            Width = 274
                            Height = 21
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -11
                            Font.Name = 'MS Sans Serif'
                            Font.Style = []
                            DropDownAlignment = taLeftJustify
                            Selected.Strings = (
                              'DESCRICAO'#9'60'#9'Descrição'#9'F'
                              'CODPROVDESC'#9'15'#9'Código'#9'F'
                              'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                            DataField = 'IDRUBDADACJUD'
                            DataSource = dsBenef
                            LookupTable = QryDescontoDevolucao
                            LookupField = 'IDPROVENTO'
                            Options = [loTitles]
                            ParentFont = False
                            TabOrder = 1
                            AutoDropDown = True
                            ShowButton = True
                            AllowClearKey = True
                          end
                        end
                        object GroupBox27: TGroupBox
                          Left = 326
                          Top = 154
                          Width = 316
                          Height = 138
                          Caption = ' Rubricas para Revisão'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                          TabOrder = 2
                          object Label108: TLabel
                            Left = 8
                            Top = 96
                            Width = 215
                            Height = 13
                            Caption = 'Rubrica para Cobrança de Devolução'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -9
                            Font.Name = 'MS Sans Serif'
                            Font.Style = [fsBold]
                            ParentFont = False
                          end
                          object Label112: TLabel
                            Left = 8
                            Top = 57
                            Width = 195
                            Height = 13
                            Caption = 'Rubrica para Pagamento Atrasado'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -9
                            Font.Name = 'MS Sans Serif'
                            Font.Style = [fsBold]
                            ParentFont = False
                          end
                          object Label113: TLabel
                            Left = 8
                            Top = 20
                            Width = 141
                            Height = 13
                            Caption = 'Rubrica para Pagamento'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -9
                            Font.Name = 'MS Sans Serif'
                            Font.Style = [fsBold]
                            ParentFont = False
                          end
                          object SpeedButton20: TSpeedButton
                            Left = 286
                            Top = 35
                            Width = 19
                            Height = 19
                            Glyph.Data = {
                              36010000424D3601000000000000760000002800000011000000100000000100
                              040000000000C0000000C40E0000C40E00001000000000000000000000000000
                              80000080000000808000800000008000800080800000C0C0C000808080000000
                              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                              777770000000777777700F077777700000007777700FFF077777700000007770
                              0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                              000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                              FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                              E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                              000077707E7E0777777770000000777700007777777770000000}
                            OnClick = SpeedButton20Click
                          end
                          object SpeedButton24: TSpeedButton
                            Left = 286
                            Top = 72
                            Width = 19
                            Height = 19
                            Glyph.Data = {
                              36010000424D3601000000000000760000002800000011000000100000000100
                              040000000000C0000000C40E0000C40E00001000000000000000000000000000
                              80000080000000808000800000008000800080800000C0C0C000808080000000
                              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                              777770000000777777700F077777700000007777700FFF077777700000007770
                              0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                              000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                              FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                              E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                              000077707E7E0777777770000000777700007777777770000000}
                            OnClick = SpeedButton24Click
                          end
                          object SpeedButton25: TSpeedButton
                            Left = 286
                            Top = 111
                            Width = 19
                            Height = 19
                            Glyph.Data = {
                              36010000424D3601000000000000760000002800000011000000100000000100
                              040000000000C0000000C40E0000C40E00001000000000000000000000000000
                              80000080000000808000800000008000800080800000C0C0C000808080000000
                              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                              777770000000777777700F077777700000007777700FFF077777700000007770
                              0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                              000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                              FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                              E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                              000077707E7E0777777770000000777700007777777770000000}
                            OnClick = SpeedButton25Click
                          end
                          object dblkpcmbRubDevRevisaoAcJud: TwwDBLookupCombo
                            Left = 8
                            Top = 110
                            Width = 275
                            Height = 21
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -9
                            Font.Name = 'MS Sans Serif'
                            Font.Style = []
                            DropDownAlignment = taLeftJustify
                            Selected.Strings = (
                              'DESCRICAO'#9'60'#9'Descrição'#9'F'
                              'CODPROVDESC'#9'15'#9'Código'#9'F'
                              'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                            DataField = 'IDRUBDEVREVACJUD'
                            DataSource = dsBenef
                            LookupTable = QryDescontoDevolucao
                            LookupField = 'IDPROVENTO'
                            Options = [loTitles]
                            ParentFont = False
                            TabOrder = 0
                            AutoDropDown = True
                            ShowButton = True
                            AllowClearKey = True
                          end
                          object dblkpcmbRubAtrasoRevisaoAcJud: TwwDBLookupCombo
                            Left = 8
                            Top = 71
                            Width = 275
                            Height = 21
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -9
                            Font.Name = 'MS Sans Serif'
                            Font.Style = []
                            DropDownAlignment = taLeftJustify
                            Selected.Strings = (
                              'DESCRICAO'#9'60'#9'Descrição'#9'F'
                              'CODPROVDESC'#9'15'#9'Código'#9'F'
                              'IDPROVENTO'#9'10'#9'IDPROVENTO'#9'F')
                            DataField = 'IDRUBATRREVACJUD'
                            DataSource = dsBenef
                            LookupTable = QryProventoAtraso
                            LookupField = 'IDPROVENTO'
                            Options = [loTitles]
                            ParentFont = False
                            TabOrder = 1
                            AutoDropDown = True
                            ShowButton = True
                            AllowClearKey = True
                          end
                          object dblkpcmbRubRevisaoAcJud: TwwDBLookupCombo
                            Left = 8
                            Top = 34
                            Width = 275
                            Height = 21
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -9
                            Font.Name = 'MS Sans Serif'
                            Font.Style = []
                            DropDownAlignment = taLeftJustify
                            Selected.Strings = (
                              'DESCRICAO'#9'60'#9'Descrição'#9'F'
                              'CODPROVDESC'#9'15'#9'Código'#9'F'
                              'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                            DataField = 'IDRUBREVACJUD'
                            DataSource = dsBenef
                            LookupTable = QryProventoNormal
                            LookupField = 'IDPROVENTO'
                            Options = [loTitles]
                            ParentFont = False
                            TabOrder = 2
                            AutoDropDown = True
                            ShowButton = True
                            AllowClearKey = True
                          end
                        end
                        object GroupBox28: TGroupBox
                          Left = 326
                          Top = 5
                          Width = 316
                          Height = 138
                          Caption = ' Rubricas para Abono Anual'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                          TabOrder = 3
                          object Label60: TLabel
                            Left = 8
                            Top = 96
                            Width = 215
                            Height = 13
                            Caption = 'Rubrica para Cobrança de Devolução'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -9
                            Font.Name = 'MS Sans Serif'
                            Font.Style = [fsBold]
                            ParentFont = False
                          end
                          object Label86: TLabel
                            Left = 8
                            Top = 57
                            Width = 195
                            Height = 13
                            Caption = 'Rubrica para Pagamento Atrasado'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -9
                            Font.Name = 'MS Sans Serif'
                            Font.Style = [fsBold]
                            ParentFont = False
                          end
                          object Label114: TLabel
                            Left = 8
                            Top = 20
                            Width = 141
                            Height = 13
                            Caption = 'Rubrica para Pagamento'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -9
                            Font.Name = 'MS Sans Serif'
                            Font.Style = [fsBold]
                            ParentFont = False
                          end
                          object SpeedButton4: TSpeedButton
                            Left = 286
                            Top = 35
                            Width = 19
                            Height = 19
                            Glyph.Data = {
                              36010000424D3601000000000000760000002800000011000000100000000100
                              040000000000C0000000C40E0000C40E00001000000000000000000000000000
                              80000080000000808000800000008000800080800000C0C0C000808080000000
                              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                              777770000000777777700F077777700000007777700FFF077777700000007770
                              0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                              000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                              FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                              E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                              000077707E7E0777777770000000777700007777777770000000}
                            OnClick = SpeedButton4Click
                          end
                          object SpeedButton15: TSpeedButton
                            Left = 286
                            Top = 72
                            Width = 19
                            Height = 19
                            Glyph.Data = {
                              36010000424D3601000000000000760000002800000011000000100000000100
                              040000000000C0000000C40E0000C40E00001000000000000000000000000000
                              80000080000000808000800000008000800080800000C0C0C000808080000000
                              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                              777770000000777777700F077777700000007777700FFF077777700000007770
                              0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                              000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                              FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                              E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                              000077707E7E0777777770000000777700007777777770000000}
                            OnClick = SpeedButton15Click
                          end
                          object SpeedButton26: TSpeedButton
                            Left = 286
                            Top = 111
                            Width = 19
                            Height = 19
                            Glyph.Data = {
                              36010000424D3601000000000000760000002800000011000000100000000100
                              040000000000C0000000C40E0000C40E00001000000000000000000000000000
                              80000080000000808000800000008000800080800000C0C0C000808080000000
                              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                              777770000000777777700F077777700000007777700FFF077777700000007770
                              0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                              000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                              FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                              E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                              000077707E7E0777777770000000777700007777777770000000}
                            OnClick = SpeedButton26Click
                          end
                          object dblkpcmbRubDevAbonoAcJud: TwwDBLookupCombo
                            Left = 8
                            Top = 110
                            Width = 275
                            Height = 21
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -9
                            Font.Name = 'MS Sans Serif'
                            Font.Style = []
                            DropDownAlignment = taLeftJustify
                            Selected.Strings = (
                              'DESCRICAO'#9'60'#9'Descrição'#9'F'
                              'CODPROVDESC'#9'15'#9'Código'#9'F'
                              'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                            DataField = 'IDRUBDEV13ACJUD'
                            DataSource = dsBenef
                            LookupTable = QryDescontoDevolucao
                            LookupField = 'IDPROVENTO'
                            Options = [loTitles]
                            ParentFont = False
                            TabOrder = 0
                            AutoDropDown = True
                            ShowButton = True
                            AllowClearKey = True
                          end
                          object dblkpcmbRubAtrasoAbonoAcJud: TwwDBLookupCombo
                            Left = 8
                            Top = 71
                            Width = 275
                            Height = 21
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -9
                            Font.Name = 'MS Sans Serif'
                            Font.Style = []
                            DropDownAlignment = taLeftJustify
                            Selected.Strings = (
                              'DESCRICAO'#9'60'#9'Descrição'#9'F'
                              'CODPROVDESC'#9'15'#9'Código'#9'F'
                              'IDPROVENTO'#9'10'#9'IDPROVENTO'#9'F')
                            DataField = 'IDRUBATR13ACJUD'
                            DataSource = dsBenef
                            LookupTable = QryProventoAtraso
                            LookupField = 'IDPROVENTO'
                            Options = [loTitles]
                            ParentFont = False
                            TabOrder = 1
                            AutoDropDown = True
                            ShowButton = True
                            AllowClearKey = True
                          end
                          object dblkpcmbRubAbonoAcJud: TwwDBLookupCombo
                            Left = 8
                            Top = 34
                            Width = 275
                            Height = 21
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -9
                            Font.Name = 'MS Sans Serif'
                            Font.Style = []
                            DropDownAlignment = taLeftJustify
                            Selected.Strings = (
                              'DESCRICAO'#9'60'#9'Descrição'#9'F'
                              'CODPROVDESC'#9'15'#9'Código'#9'F'
                              'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                            DataField = 'IDRUB13ACJUD'
                            DataSource = dsBenef
                            LookupTable = QryProventoNormal
                            LookupField = 'IDPROVENTO'
                            Options = [loTitles]
                            ParentFont = False
                            TabOrder = 2
                            AutoDropDown = True
                            ShowButton = True
                            AllowClearKey = True
                          end
                        end
                        object GroupBox21: TGroupBox
                          Left = 326
                          Top = 296
                          Width = 316
                          Height = 138
                          Caption = ' Rubricas para Adicional '
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                          TabOrder = 4
                          object Label117: TLabel
                            Left = 8
                            Top = 96
                            Width = 215
                            Height = 13
                            Caption = 'Rubrica para Cobrança de Devolução'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -9
                            Font.Name = 'MS Sans Serif'
                            Font.Style = [fsBold]
                            ParentFont = False
                          end
                          object Label118: TLabel
                            Left = 8
                            Top = 57
                            Width = 195
                            Height = 13
                            Caption = 'Rubrica para Pagamento Atrasado'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -9
                            Font.Name = 'MS Sans Serif'
                            Font.Style = [fsBold]
                            ParentFont = False
                          end
                          object Label119: TLabel
                            Left = 8
                            Top = 20
                            Width = 184
                            Height = 13
                            Caption = 'Rubrica para Pagamento Normal'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -9
                            Font.Name = 'MS Sans Serif'
                            Font.Style = [fsBold]
                            ParentFont = False
                          end
                          object SpeedButton28: TSpeedButton
                            Left = 286
                            Top = 35
                            Width = 19
                            Height = 19
                            Glyph.Data = {
                              36010000424D3601000000000000760000002800000011000000100000000100
                              040000000000C0000000C40E0000C40E00001000000000000000000000000000
                              80000080000000808000800000008000800080800000C0C0C000808080000000
                              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                              777770000000777777700F077777700000007777700FFF077777700000007770
                              0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                              000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                              FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                              E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                              000077707E7E0777777770000000777700007777777770000000}
                            OnClick = SpeedButton28Click
                          end
                          object SpeedButton29: TSpeedButton
                            Left = 286
                            Top = 72
                            Width = 19
                            Height = 19
                            Glyph.Data = {
                              36010000424D3601000000000000760000002800000011000000100000000100
                              040000000000C0000000C40E0000C40E00001000000000000000000000000000
                              80000080000000808000800000008000800080800000C0C0C000808080000000
                              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                              777770000000777777700F077777700000007777700FFF077777700000007770
                              0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                              000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                              FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                              E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                              000077707E7E0777777770000000777700007777777770000000}
                            OnClick = SpeedButton29Click
                          end
                          object SpeedButton30: TSpeedButton
                            Left = 286
                            Top = 111
                            Width = 19
                            Height = 19
                            Glyph.Data = {
                              36010000424D3601000000000000760000002800000011000000100000000100
                              040000000000C0000000C40E0000C40E00001000000000000000000000000000
                              80000080000000808000800000008000800080800000C0C0C000808080000000
                              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                              777770000000777777700F077777700000007777700FFF077777700000007770
                              0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                              000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                              FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                              E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                              000077707E7E0777777770000000777700007777777770000000}
                            OnClick = SpeedButton30Click
                          end
                          object dblkpcmbRubJudAdicBenefDevol: TwwDBLookupCombo
                            Left = 8
                            Top = 110
                            Width = 275
                            Height = 21
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -9
                            Font.Name = 'MS Sans Serif'
                            Font.Style = []
                            DropDownAlignment = taLeftJustify
                            Selected.Strings = (
                              'DESCRICAO'#9'60'#9'Descrição'#9'F'
                              'CODPROVDESC'#9'15'#9'Código'#9'F'
                              'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                            DataField = 'IDRUBDEVADICJUD'
                            DataSource = dsBenef
                            LookupTable = QryDescontoDevolucao
                            LookupField = 'IDPROVENTO'
                            Options = [loTitles]
                            ParentFont = False
                            TabOrder = 0
                            AutoDropDown = True
                            ShowButton = True
                            AllowClearKey = True
                          end
                          object dblkpcmbRubJudAdicBenefAtraso: TwwDBLookupCombo
                            Left = 8
                            Top = 71
                            Width = 275
                            Height = 21
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -9
                            Font.Name = 'MS Sans Serif'
                            Font.Style = []
                            DropDownAlignment = taLeftJustify
                            Selected.Strings = (
                              'DESCRICAO'#9'60'#9'Descrição'#9'F'
                              'CODPROVDESC'#9'15'#9'Código'#9'F'
                              'IDPROVENTO'#9'10'#9'IDPROVENTO'#9'F')
                            DataField = 'IDRUBATRADICJUD'
                            DataSource = dsBenef
                            LookupTable = QryProventoAtraso
                            LookupField = 'IDPROVENTO'
                            Options = [loTitles]
                            ParentFont = False
                            TabOrder = 1
                            AutoDropDown = True
                            ShowButton = True
                            AllowClearKey = True
                          end
                          object dblkpcmbRubJudAdicBenefNormal: TwwDBLookupCombo
                            Left = 8
                            Top = 34
                            Width = 275
                            Height = 21
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -9
                            Font.Name = 'MS Sans Serif'
                            Font.Style = []
                            DropDownAlignment = taLeftJustify
                            Selected.Strings = (
                              'DESCRICAO'#9'60'#9'Descrição'#9'F'
                              'CODPROVDESC'#9'15'#9'Código'#9'F'
                              'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                            DataField = 'IDRUBNORADICJUD'
                            DataSource = dsBenef
                            LookupTable = QryProventoNormal
                            LookupField = 'IDPROVENTO'
                            Options = [loTitles]
                            ParentFont = False
                            TabOrder = 2
                            AutoDropDown = True
                            ShowButton = True
                            AllowClearKey = True
                          end
                        end
                      end
                    end
                  end
                  object tabRRA: TTabSheet
                    Caption = 'RRA'
                    ImageIndex = 2
                    object grbRRAPagNormal: TGroupBox
                      Left = 4
                      Top = 5
                      Width = 316
                      Height = 100
                      Caption = ' Rubricas para Pagamento Normal'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 0
                      object Label123: TLabel
                        Left = 8
                        Top = 56
                        Width = 215
                        Height = 13
                        Caption = 'Rubrica para Cobrança de Devolução'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label124: TLabel
                        Left = 8
                        Top = 17
                        Width = 195
                        Height = 13
                        Caption = 'Rubrica para Pagamento Atrasado'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object btnNPagtoAtrasado: TSpeedButton
                        Left = 282
                        Top = 32
                        Width = 19
                        Height = 19
                        Glyph.Data = {
                          36010000424D3601000000000000760000002800000011000000100000000100
                          040000000000C0000000C40E0000C40E00001000000000000000000000000000
                          80000080000000808000800000008000800080800000C0C0C000808080000000
                          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                          777770000000777777700F077777700000007777700FFF077777700000007770
                          0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                          000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                          FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                          E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                          000077707E7E0777777770000000777700007777777770000000}
                        OnClick = btnNPagtoAtrasadoClick
                      end
                      object btnNPagtoDevol: TSpeedButton
                        Left = 282
                        Top = 73
                        Width = 19
                        Height = 17
                        Glyph.Data = {
                          36010000424D3601000000000000760000002800000011000000100000000100
                          040000000000C0000000C40E0000C40E00001000000000000000000000000000
                          80000080000000808000800000008000800080800000C0C0C000808080000000
                          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                          777770000000777777700F077777700000007777700FFF077777700000007770
                          0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                          000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                          FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                          E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                          000077707E7E0777777770000000777700007777777770000000}
                        OnClick = btnNPagtoDevolClick
                      end
                      object cboNPagtoDevol: TwwDBLookupCombo
                        Left = 8
                        Top = 70
                        Width = 272
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'60'#9'Descrição'#9'F'
                          'CODPROVDESC'#9'15'#9'Código'#9'F'
                          'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                        DataField = 'IDRUBRICADEVOLUCAORRA'
                        DataSource = dsBenef
                        LookupTable = qryLkpProvDescD
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 0
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object cboNPagtoAtrasado: TwwDBLookupCombo
                        Left = 8
                        Top = 31
                        Width = 272
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'60'#9'Descrição'#9'F'
                          'CODPROVDESC'#9'15'#9'Código'#9'F'
                          'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                        DataField = 'IDRUBRICAATRASORRA'
                        DataSource = dsBenef
                        LookupTable = qryLkpProvDescA
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 1
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                    end
                    object grbRRARev: TGroupBox
                      Left = 4
                      Top = 113
                      Width = 316
                      Height = 104
                      Caption = ' Rubricas para Revisão'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 1
                      object Label126: TLabel
                        Left = 8
                        Top = 55
                        Width = 215
                        Height = 13
                        Caption = 'Rubrica para Cobrança de Devolução'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label127: TLabel
                        Left = 8
                        Top = 16
                        Width = 195
                        Height = 13
                        Caption = 'Rubrica para Pagamento Atrasado'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object btnRPagtoAtrasado: TSpeedButton
                        Left = 282
                        Top = 31
                        Width = 19
                        Height = 19
                        Glyph.Data = {
                          36010000424D3601000000000000760000002800000011000000100000000100
                          040000000000C0000000C40E0000C40E00001000000000000000000000000000
                          80000080000000808000800000008000800080800000C0C0C000808080000000
                          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                          777770000000777777700F077777700000007777700FFF077777700000007770
                          0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                          000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                          FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                          E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                          000077707E7E0777777770000000777700007777777770000000}
                        OnClick = btnRPagtoAtrasadoClick
                      end
                      object btnRPagtoDevol: TSpeedButton
                        Left = 282
                        Top = 72
                        Width = 19
                        Height = 17
                        Glyph.Data = {
                          36010000424D3601000000000000760000002800000011000000100000000100
                          040000000000C0000000C40E0000C40E00001000000000000000000000000000
                          80000080000000808000800000008000800080800000C0C0C000808080000000
                          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                          777770000000777777700F077777700000007777700FFF077777700000007770
                          0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                          000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                          FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                          E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                          000077707E7E0777777770000000777700007777777770000000}
                        OnClick = btnRPagtoDevolClick
                      end
                      object cboRPagtoDevol: TwwDBLookupCombo
                        Left = 8
                        Top = 69
                        Width = 272
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'60'#9'Descrição'#9'F'
                          'CODPROVDESC'#9'15'#9'Código'#9'F'
                          'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                        DataField = 'IDRUBRICAREVDEVOLUCAORRA'
                        DataSource = dsBenef
                        LookupTable = qryLkpProvDescD
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 0
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object cboRPagtoAtrasado: TwwDBLookupCombo
                        Left = 8
                        Top = 30
                        Width = 272
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'60'#9'Descrição'#9'F'
                          'CODPROVDESC'#9'15'#9'Código'#9'F'
                          'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                        DataField = 'IDRUBRICAREVATRASORRA'
                        DataSource = dsBenef
                        LookupTable = qryLkpProvDescA
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 1
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                    end
                    object grbRubCorrecao: TGroupBox
                      Left = 332
                      Top = 5
                      Width = 316
                      Height = 100
                      Caption = ' Rubricas para Correção'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 2
                      object lblRubCDevol: TLabel
                        Left = 8
                        Top = 55
                        Width = 215
                        Height = 13
                        Caption = 'Rubrica para Cobrança de Devolução'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object lblRubCPagAtra: TLabel
                        Left = 8
                        Top = 16
                        Width = 195
                        Height = 13
                        Caption = 'Rubrica para Pagamento Atrasado'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object sbtnRubCorA: TSpeedButton
                        Left = 282
                        Top = 31
                        Width = 19
                        Height = 19
                        Glyph.Data = {
                          36010000424D3601000000000000760000002800000011000000100000000100
                          040000000000C0000000C40E0000C40E00001000000000000000000000000000
                          80000080000000808000800000008000800080800000C0C0C000808080000000
                          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                          777770000000777777700F077777700000007777700FFF077777700000007770
                          0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                          000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                          FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                          E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                          000077707E7E0777777770000000777700007777777770000000}
                        OnClick = sbtnRubCorAClick
                      end
                      object sbtnRubCorD: TSpeedButton
                        Left = 282
                        Top = 72
                        Width = 19
                        Height = 17
                        Glyph.Data = {
                          36010000424D3601000000000000760000002800000011000000100000000100
                          040000000000C0000000C40E0000C40E00001000000000000000000000000000
                          80000080000000808000800000008000800080800000C0C0C000808080000000
                          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                          777770000000777777700F077777700000007777700FFF077777700000007770
                          0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                          000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                          FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                          E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                          000077707E7E0777777770000000777700007777777770000000}
                        OnClick = sbtnRubCorDClick
                      end
                      object cboCPagtoDevol: TwwDBLookupCombo
                        Left = 8
                        Top = 69
                        Width = 272
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'60'#9'Descrição'#9'F'
                          'CODPROVDESC'#9'15'#9'Código'#9'F'
                          'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                        DataField = 'IDRUBRICACORDEVOLUCAORRA'
                        DataSource = dsBenef
                        LookupTable = qryLkpProvDescD
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 1
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object cboCPagtoAtrasado: TwwDBLookupCombo
                        Left = 8
                        Top = 30
                        Width = 272
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'60'#9'Descrição'#9'F'
                          'CODPROVDESC'#9'15'#9'Código'#9'F'
                          'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                        DataField = 'IDRUBRICACORATRASORRA'
                        DataSource = dsBenef
                        LookupTable = qryLkpProvDescA
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 0
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                    end
                  end
                  object TabSheet6: TTabSheet
                    Caption = 'Bitributação'
                    ImageIndex = 3
                    object GroupBox31: TGroupBox
                      Left = 4
                      Top = 5
                      Width = 316
                      Height = 138
                      Caption = 'Rubrica para Pagamento Normal'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 0
                      object Label128: TLabel
                        Left = 8
                        Top = 20
                        Width = 184
                        Height = 13
                        Caption = 'Rubrica para Pagamento Normal'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label129: TLabel
                        Left = 8
                        Top = 95
                        Width = 215
                        Height = 13
                        Caption = 'Rubrica para Cobrança de Devolução'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label130: TLabel
                        Left = 8
                        Top = 56
                        Width = 195
                        Height = 13
                        Caption = 'Rubrica para Pagamento Atrasado'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object SpeedButton31: TSpeedButton
                        Left = 282
                        Top = 35
                        Width = 19
                        Height = 19
                        Glyph.Data = {
                          36010000424D3601000000000000760000002800000011000000100000000100
                          040000000000C0000000C40E0000C40E00001000000000000000000000000000
                          80000080000000808000800000008000800080800000C0C0C000808080000000
                          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                          777770000000777777700F077777700000007777700FFF077777700000007770
                          0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                          000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                          FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                          E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                          000077707E7E0777777770000000777700007777777770000000}
                        OnClick = SpeedButton31Click
                      end
                      object SpeedButton32: TSpeedButton
                        Left = 282
                        Top = 71
                        Width = 19
                        Height = 19
                        Glyph.Data = {
                          36010000424D3601000000000000760000002800000011000000100000000100
                          040000000000C0000000C40E0000C40E00001000000000000000000000000000
                          80000080000000808000800000008000800080800000C0C0C000808080000000
                          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                          777770000000777777700F077777700000007777700FFF077777700000007770
                          0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                          000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                          FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                          E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                          000077707E7E0777777770000000777700007777777770000000}
                        OnClick = SpeedButton32Click
                      end
                      object SpeedButton33: TSpeedButton
                        Left = 282
                        Top = 112
                        Width = 19
                        Height = 17
                        Glyph.Data = {
                          36010000424D3601000000000000760000002800000011000000100000000100
                          040000000000C0000000C40E0000C40E00001000000000000000000000000000
                          80000080000000808000800000008000800080800000C0C0C000808080000000
                          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                          777770000000777777700F077777700000007777700FFF077777700000007770
                          0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                          000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                          FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                          E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                          000077707E7E0777777770000000777700007777777770000000}
                        OnClick = SpeedButton33Click
                      end
                      object cboNPagto_B: TwwDBLookupCombo
                        Left = 8
                        Top = 34
                        Width = 272
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'60'#9'Descrição'#9'F'
                          'CODPROVDESC'#9'15'#9'Código'#9'F'
                          'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                        DataField = 'IDRUBBIT'
                        DataSource = dsBenef
                        LookupTable = qryLkpProvDescN_B
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 0
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object cboNPagtoDevol_B: TwwDBLookupCombo
                        Left = 8
                        Top = 109
                        Width = 272
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'60'#9'Descrição'#9'F'
                          'CODPROVDESC'#9'15'#9'Código'#9'F'
                          'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                        DataField = 'IDRUBDEVABIT'
                        DataSource = dsBenef
                        LookupTable = qryLkpProvDescD_B
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 1
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object cboNPagtoAtrasado_B: TwwDBLookupCombo
                        Left = 16
                        Top = 70
                        Width = 272
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'60'#9'Descrição'#9'F'
                          'CODPROVDESC'#9'15'#9'Código'#9'F'
                          'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                        DataField = 'IDRUBATRABIT'
                        DataSource = dsBenef
                        LookupTable = qryLkpProvDescA_B
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 2
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                    end
                    object GroupBox32: TGroupBox
                      Left = 326
                      Top = 5
                      Width = 316
                      Height = 138
                      Caption = ' Rubricas para Abono Anual'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 1
                      object Label131: TLabel
                        Left = 8
                        Top = 96
                        Width = 215
                        Height = 13
                        Caption = 'Rubrica para Cobrança de Devolução'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label132: TLabel
                        Left = 8
                        Top = 57
                        Width = 195
                        Height = 13
                        Caption = 'Rubrica para Pagamento Atrasado'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label133: TLabel
                        Left = 8
                        Top = 20
                        Width = 141
                        Height = 13
                        Caption = 'Rubrica para Pagamento'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object SpeedButton34: TSpeedButton
                        Left = 286
                        Top = 35
                        Width = 19
                        Height = 19
                        Glyph.Data = {
                          36010000424D3601000000000000760000002800000011000000100000000100
                          040000000000C0000000C40E0000C40E00001000000000000000000000000000
                          80000080000000808000800000008000800080800000C0C0C000808080000000
                          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                          777770000000777777700F077777700000007777700FFF077777700000007770
                          0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                          000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                          FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                          E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                          000077707E7E0777777770000000777700007777777770000000}
                        OnClick = SpeedButton34Click
                      end
                      object SpeedButton35: TSpeedButton
                        Left = 286
                        Top = 72
                        Width = 19
                        Height = 19
                        Glyph.Data = {
                          36010000424D3601000000000000760000002800000011000000100000000100
                          040000000000C0000000C40E0000C40E00001000000000000000000000000000
                          80000080000000808000800000008000800080800000C0C0C000808080000000
                          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                          777770000000777777700F077777700000007777700FFF077777700000007770
                          0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                          000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                          FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                          E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                          000077707E7E0777777770000000777700007777777770000000}
                        OnClick = SpeedButton35Click
                      end
                      object SpeedButton36: TSpeedButton
                        Left = 286
                        Top = 111
                        Width = 19
                        Height = 19
                        Glyph.Data = {
                          36010000424D3601000000000000760000002800000011000000100000000100
                          040000000000C0000000C40E0000C40E00001000000000000000000000000000
                          80000080000000808000800000008000800080800000C0C0C000808080000000
                          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                          777770000000777777700F077777700000007777700FFF077777700000007770
                          0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                          000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                          FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                          E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                          000077707E7E0777777770000000777700007777777770000000}
                        OnClick = SpeedButton36Click
                      end
                      object cboAPagtoDevol_B: TwwDBLookupCombo
                        Left = 8
                        Top = 110
                        Width = 275
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'60'#9'Descrição'#9'F'
                          'CODPROVDESC'#9'15'#9'Código'#9'F'
                          'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                        DataField = 'IDRUBDEV13BIT'
                        DataSource = dsBenef
                        LookupTable = qryLkpProvDescD_B
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 0
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object cboAPagtoAtrasado_B: TwwDBLookupCombo
                        Left = 8
                        Top = 71
                        Width = 275
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'60'#9'Descrição'#9'F'
                          'CODPROVDESC'#9'15'#9'Código'#9'F'
                          'IDPROVENTO'#9'10'#9'IDPROVENTO'#9'F')
                        DataField = 'IDRUBATR13BIT'
                        DataSource = dsBenef
                        LookupTable = qryLkpProvDescA_B
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 1
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object cboAPagto_B: TwwDBLookupCombo
                        Left = 10
                        Top = 34
                        Width = 275
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'60'#9'Descrição'#9'F'
                          'CODPROVDESC'#9'15'#9'Código'#9'F'
                          'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                        DataField = 'IDRUB13BIT'
                        DataSource = dsBenef
                        LookupTable = qryLkpProvDescN_B
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 2
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                    end
                    object GroupBox33: TGroupBox
                      Left = 4
                      Top = 154
                      Width = 316
                      Height = 138
                      Caption = ' Rubricas para Revisão'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 2
                      object Label134: TLabel
                        Left = 8
                        Top = 96
                        Width = 215
                        Height = 13
                        Caption = 'Rubrica para Cobrança de Devolução'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label135: TLabel
                        Left = 8
                        Top = 57
                        Width = 195
                        Height = 13
                        Caption = 'Rubrica para Pagamento Atrasado'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label136: TLabel
                        Left = 8
                        Top = 20
                        Width = 141
                        Height = 13
                        Caption = 'Rubrica para Pagamento'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object SpeedButton37: TSpeedButton
                        Left = 286
                        Top = 35
                        Width = 19
                        Height = 19
                        Glyph.Data = {
                          36010000424D3601000000000000760000002800000011000000100000000100
                          040000000000C0000000C40E0000C40E00001000000000000000000000000000
                          80000080000000808000800000008000800080800000C0C0C000808080000000
                          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                          777770000000777777700F077777700000007777700FFF077777700000007770
                          0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                          000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                          FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                          E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                          000077707E7E0777777770000000777700007777777770000000}
                        OnClick = SpeedButton37Click
                      end
                      object SpeedButton38: TSpeedButton
                        Left = 286
                        Top = 72
                        Width = 19
                        Height = 19
                        Glyph.Data = {
                          36010000424D3601000000000000760000002800000011000000100000000100
                          040000000000C0000000C40E0000C40E00001000000000000000000000000000
                          80000080000000808000800000008000800080800000C0C0C000808080000000
                          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                          777770000000777777700F077777700000007777700FFF077777700000007770
                          0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                          000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                          FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                          E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                          000077707E7E0777777770000000777700007777777770000000}
                        OnClick = SpeedButton38Click
                      end
                      object SpeedButton39: TSpeedButton
                        Left = 286
                        Top = 111
                        Width = 19
                        Height = 19
                        Glyph.Data = {
                          36010000424D3601000000000000760000002800000011000000100000000100
                          040000000000C0000000C40E0000C40E00001000000000000000000000000000
                          80000080000000808000800000008000800080800000C0C0C000808080000000
                          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                          777770000000777777700F077777700000007777700FFF077777700000007770
                          0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                          000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                          FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                          E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                          000077707E7E0777777770000000777700007777777770000000}
                        OnClick = SpeedButton39Click
                      end
                      object cboRPagtoDevol_B: TwwDBLookupCombo
                        Left = 8
                        Top = 110
                        Width = 275
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'60'#9'Descrição'#9'F'
                          'CODPROVDESC'#9'15'#9'Código'#9'F'
                          'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                        DataField = 'IDRUBDEVREVBIT'
                        DataSource = dsBenef
                        LookupTable = qryLkpProvDescD_B
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 0
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object cboRPagtoAtrasado_B: TwwDBLookupCombo
                        Left = 8
                        Top = 71
                        Width = 275
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'60'#9'Descrição'#9'F'
                          'CODPROVDESC'#9'15'#9'Código'#9'F'
                          'IDPROVENTO'#9'10'#9'IDPROVENTO'#9'F')
                        DataField = 'IDRUBATRREVBIT'
                        DataSource = dsBenef
                        LookupTable = qryLkpProvDescA_B
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 1
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object cboRPagto_B: TwwDBLookupCombo
                        Left = 8
                        Top = 34
                        Width = 275
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'60'#9'Descrição'#9'F'
                          'CODPROVDESC'#9'15'#9'Código'#9'F'
                          'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                        DataField = 'IDRUBREVABIT'
                        DataSource = dsBenef
                        LookupTable = qryLkpProvDescN_B
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 2
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                    end
                  end
                  object TabSheet7: TTabSheet
                    Caption = 'Dívidas de Benefícios'
                    ImageIndex = 4
                    object GroupBox34: TGroupBox
                      Left = 326
                      Top = 5
                      Width = 316
                      Height = 138
                      Caption = ' Rubricas para Abono Anual'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 0
                      object Label137: TLabel
                        Left = 8
                        Top = 96
                        Width = 37
                        Height = 13
                        Caption = 'Atraso'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label138: TLabel
                        Left = 8
                        Top = 57
                        Width = 62
                        Height = 13
                        Caption = 'Devolução'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label139: TLabel
                        Left = 8
                        Top = 20
                        Width = 98
                        Height = 13
                        Caption = 'Cobrança Normal'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object SpeedButton40: TSpeedButton
                        Left = 286
                        Top = 35
                        Width = 19
                        Height = 19
                        Glyph.Data = {
                          36010000424D3601000000000000760000002800000011000000100000000100
                          040000000000C0000000C40E0000C40E00001000000000000000000000000000
                          80000080000000808000800000008000800080800000C0C0C000808080000000
                          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                          777770000000777777700F077777700000007777700FFF077777700000007770
                          0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                          000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                          FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                          E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                          000077707E7E0777777770000000777700007777777770000000}
                        OnClick = SpeedButton40Click
                      end
                      object SpeedButton41: TSpeedButton
                        Left = 286
                        Top = 72
                        Width = 19
                        Height = 19
                        Glyph.Data = {
                          36010000424D3601000000000000760000002800000011000000100000000100
                          040000000000C0000000C40E0000C40E00001000000000000000000000000000
                          80000080000000808000800000008000800080800000C0C0C000808080000000
                          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                          777770000000777777700F077777700000007777700FFF077777700000007770
                          0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                          000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                          FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                          E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                          000077707E7E0777777770000000777700007777777770000000}
                        OnClick = SpeedButton41Click
                      end
                      object SpeedButton42: TSpeedButton
                        Left = 286
                        Top = 111
                        Width = 19
                        Height = 19
                        Glyph.Data = {
                          36010000424D3601000000000000760000002800000011000000100000000100
                          040000000000C0000000C40E0000C40E00001000000000000000000000000000
                          80000080000000808000800000008000800080800000C0C0C000808080000000
                          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                          777770000000777777700F077777700000007777700FFF077777700000007770
                          0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                          000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                          FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                          E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                          000077707E7E0777777770000000777700007777777770000000}
                        OnClick = SpeedButton42Click
                      end
                      object cboACobraAtras_D: TwwDBLookupCombo
                        Left = 8
                        Top = 110
                        Width = 275
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'60'#9'Descrição'#9'F'
                          'CODPROVDESC'#9'15'#9'Código'#9'F'
                          'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                        DataField = 'IDRUBRICADIVIDABENEF13ATRASO'
                        DataSource = dsBenef
                        LookupTable = qryLkpProvCobraA_D
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 0
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object cboACobraDevo_D: TwwDBLookupCombo
                        Left = 8
                        Top = 71
                        Width = 275
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'60'#9'Descrição'#9'F'
                          'CODPROVDESC'#9'15'#9'Código'#9'F'
                          'IDPROVENTO'#9'10'#9'IDPROVENTO'#9'F')
                        DataField = 'IDRUBRICADIVIDABENEF13DEVOL'
                        DataSource = dsBenef
                        LookupTable = qryLkpProvCobraD_D
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 1
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object cboACobra_D: TwwDBLookupCombo
                        Left = 8
                        Top = 34
                        Width = 275
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'60'#9'Descrição'#9'F'
                          'CODPROVDESC'#9'15'#9'Código'#9'F'
                          'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                        DataField = 'IDRUBRICADIVIDABENEF13'
                        DataSource = dsBenef
                        LookupTable = qryLkpProvCobraN_D
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 2
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                    end
                    object GroupBox35: TGroupBox
                      Left = 6
                      Top = 5
                      Width = 316
                      Height = 138
                      Caption = 'Rubricas'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 1
                      object Label140: TLabel
                        Left = 8
                        Top = 96
                        Width = 37
                        Height = 13
                        Caption = 'Atraso'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label141: TLabel
                        Left = 8
                        Top = 57
                        Width = 62
                        Height = 13
                        Caption = 'Devolução'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label142: TLabel
                        Left = 8
                        Top = 20
                        Width = 98
                        Height = 13
                        Caption = 'Cobrança Normal'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object SpeedButton43: TSpeedButton
                        Left = 286
                        Top = 35
                        Width = 19
                        Height = 19
                        Glyph.Data = {
                          36010000424D3601000000000000760000002800000011000000100000000100
                          040000000000C0000000C40E0000C40E00001000000000000000000000000000
                          80000080000000808000800000008000800080800000C0C0C000808080000000
                          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                          777770000000777777700F077777700000007777700FFF077777700000007770
                          0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                          000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                          FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                          E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                          000077707E7E0777777770000000777700007777777770000000}
                        OnClick = SpeedButton43Click
                      end
                      object SpeedButton44: TSpeedButton
                        Left = 286
                        Top = 72
                        Width = 19
                        Height = 19
                        Glyph.Data = {
                          36010000424D3601000000000000760000002800000011000000100000000100
                          040000000000C0000000C40E0000C40E00001000000000000000000000000000
                          80000080000000808000800000008000800080800000C0C0C000808080000000
                          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                          777770000000777777700F077777700000007777700FFF077777700000007770
                          0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                          000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                          FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                          E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                          000077707E7E0777777770000000777700007777777770000000}
                        OnClick = SpeedButton44Click
                      end
                      object SpeedButton45: TSpeedButton
                        Left = 286
                        Top = 111
                        Width = 19
                        Height = 19
                        Glyph.Data = {
                          36010000424D3601000000000000760000002800000011000000100000000100
                          040000000000C0000000C40E0000C40E00001000000000000000000000000000
                          80000080000000808000800000008000800080800000C0C0C000808080000000
                          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                          777770000000777777700F077777700000007777700FFF077777700000007770
                          0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                          000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                          FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                          E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                          000077707E7E0777777770000000777700007777777770000000}
                        OnClick = SpeedButton45Click
                      end
                      object cboNCobraAtras_D: TwwDBLookupCombo
                        Left = 8
                        Top = 110
                        Width = 275
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'60'#9'Descrição'#9'F'
                          'CODPROVDESC'#9'15'#9'Código'#9'F'
                          'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                        DataField = 'IDRUBRICADIVIDABENEFTRASO'
                        DataSource = dsBenef
                        LookupTable = qryLkpProvCobraA_D
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 0
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object cboNCobraDevo_D: TwwDBLookupCombo
                        Left = 8
                        Top = 71
                        Width = 275
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'60'#9'Descrição'#9'F'
                          'CODPROVDESC'#9'15'#9'Código'#9'F'
                          'IDPROVENTO'#9'10'#9'IDPROVENTO'#9'F')
                        DataField = 'IDRUBRICADIVIDABENEFICIODEVOL'
                        DataSource = dsBenef
                        LookupTable = qryLkpProvCobraD_D
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 1
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                      object cboNCobra_D: TwwDBLookupCombo
                        Left = 8
                        Top = 34
                        Width = 275
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCRICAO'#9'60'#9'Descrição'#9'F'
                          'CODPROVDESC'#9'15'#9'Código'#9'F'
                          'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                        DataField = 'IDRUBRICADIVIDABENEFNORMAL'
                        DataSource = dsBenef
                        LookupTable = qryLkpProvCobraN_D
                        LookupField = 'IDPROVENTO'
                        Options = [loTitles]
                        ParentFont = False
                        TabOrder = 2
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                      end
                    end
                  end
                end
              end
              object tbsBenefRelatParam: TTabSheet
                Caption = 'Relatórios Parametrizáveis'
                object Label67: TLabel
                  Left = 0
                  Top = 412
                  Width = 1234
                  Height = 31
                  Align = alBottom
                  AutoSize = False
                  Caption = 
                    'Atenção : Esses relatórios devem seguir as normas para eles espe' +
                    'cificadas. Caso contrário, não funcionarão ao serem executados a' +
                    ' partir do programa. Verifique a norma de cada um dos relatórios' +
                    ' clicando no botão ao lado da lista de opções de cada um deles.'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  WordWrap = True
                end
                object GroupBox12: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 1234
                  Height = 412
                  Align = alClient
                  TabOrder = 0
                  object Label66: TLabel
                    Left = 9
                    Top = 9
                    Width = 209
                    Height = 13
                    Caption = 'Relatório de Simulação de Benefício'
                  end
                  object sbtnNormaRelatBeneficio: TSpeedButton
                    Left = 372
                    Top = 21
                    Width = 25
                    Height = 25
                    Hint = 'Norma para Relatório de Simulação de Benefício'
                    Caption = 'N'
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = sbtnNormaRelatBeneficioClick
                  end
                  object dblkpcmbRelatBarra: TwwDBLookupCombo
                    Left = 9
                    Top = 23
                    Width = 358
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'NAME'#9'100'#9'Nome do Relatório')
                    DataField = 'IDRELATBENEFICIO'
                    DataSource = dsBenef
                    LookupTable = qryRelatorios
                    LookupField = 'IDREPORTS'
                    Options = [loTitles]
                    ParentFont = False
                    TabOrder = 0
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    OnCloseUp = dblkpcmbRelatBarraCloseUp
                  end
                end
              end
            end
          end
        end
        object tsIsencaoiRAcJud: TTabSheet
          Caption = 'Tratamento de Isenção de IR - Ação Judicial'
          ImageIndex = 3
          object dbgrdIsentoAcJud: TwwDBGrid
            Left = 0
            Top = 0
            Width = 1242
            Height = 471
            Selected.Strings = (
              'COD_ISENTA'#9'10'#9'Cód. Rubrica Isenta'
              'RUB_ISENTA'#9'50'#9'Rubrica Isenta IR'
              'COD_INCIDE'#9'10'#9'Cód. Rubrica Incide'
              'RUB_INCIDE'#9'50'#9'Rubrica que Incide IR')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsIsentoIRAcJud
            TabOrder = 1
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
          object pnlIsentoAcJud: TPanel
            Left = 0
            Top = 0
            Width = 1242
            Height = 471
            Align = alClient
            TabOrder = 0
            object GroupBox36: TGroupBox
              Left = 12
              Top = 16
              Width = 353
              Height = 129
              Caption = ' Associar Rubricas com Isenção de IR - Ações Judiciais '
              TabOrder = 0
              object sbtnRubIsenta: TSpeedButton
                Left = 314
                Top = 41
                Width = 19
                Height = 19
                Glyph.Data = {
                  36010000424D3601000000000000760000002800000011000000100000000100
                  040000000000C0000000C40E0000C40E00001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                  777770000000777777700F077777700000007777700FFF077777700000007770
                  0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                  000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                  FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                  E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                  000077707E7E0777777770000000777700007777777770000000}
                OnClick = sbtnRubIsentaClick
              end
              object sbtnRubIncide: TSpeedButton
                Left = 314
                Top = 94
                Width = 19
                Height = 19
                Glyph.Data = {
                  36010000424D3601000000000000760000002800000011000000100000000100
                  040000000000C0000000C40E0000C40E00001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                  777770000000777777700F077777700000007777700FFF077777700000007770
                  0FFFFFF07777700000007778FFFFFCF07777700000001778FFCCCFFF07778000
                  000011778FFFFFCF07778000000011178FFCCCFFF0778000000071110000FFFC
                  FF07700000007710E7E706CFFFF070000000770E7E7E70FFF887700000007707
                  E7E7E0F8877770000000770E7E7E70877777700000007707E7E7E07777777000
                  000077707E7E0777777770000000777700007777777770000000}
                OnClick = sbtnRubIncideClick
              end
              object Label122: TLabel
                Left = 14
                Top = 25
                Width = 84
                Height = 13
                Caption = 'Rubrica Isenta'
              end
              object Label125: TLabel
                Left = 14
                Top = 79
                Width = 125
                Height = 13
                Caption = 'Rubrica que incide IR'
              end
              object dblkRubIsentaIRAcJud: TwwDBLookupCombo
                Left = 14
                Top = 41
                Width = 298
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'60'#9'Descrição'#9'F'
                  'CODPROVDESC'#9'15'#9'Código'#9'F'
                  'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                DataField = 'IDRUBISENTOAC'
                DataSource = dsIsentoIRAcJud
                LookupTable = qryRubIsentaIR
                LookupField = 'IDPROVENTO'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
              end
              object dblkRubIncideIRAcJud: TwwDBLookupCombo
                Left = 14
                Top = 94
                Width = 298
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'60'#9'Descrição'#9'F'
                  'CODPROVDESC'#9'15'#9'Código'#9'F'
                  'IDPROVENTO'#9'10'#9'Ident.'#9'F')
                DataField = 'IDRUBRICA'
                DataSource = dsIsentoIRAcJud
                LookupTable = qryRubIncideIR
                LookupField = 'IDPROVENTO'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 1340
        object edPaiDetalhe: TEdit
          Left = 85
          Top = 4
          Width = 508
          Height = 21
          BorderStyle = bsNone
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
      end
      inherited Dock974: TDock97
        Left = 1254
        Height = 499
      end
    end
    inherited pnlMestre: TPanel [1]
      Width = 1348
      Height = 44
      object lblValores: TLabel
        Left = 15
        Top = -1
        Width = 222
        Height = 23
        AutoSize = False
        Caption = 'Plano Previdenciário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = []
        ParentFont = False
      end
      object lblFundacao: TLabel
        Left = 363
        Top = -1
        Width = 222
        Height = 23
        AutoSize = False
        Caption = 'Fundação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = []
        ParentFont = False
      end
      object dbedNome: TwwDBEdit
        Left = 15
        Top = 19
        Width = 337
        Height = 21
        DataField = 'NOME'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbedNomeExit
      end
      object dblkpcmbFundacao: TwwDBLookupCombo
        Left = 364
        Top = 19
        Width = 369
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'50'#9'Fundação')
        DataField = 'IDFUNDACAO'
        DataSource = ds
        LookupTable = qryFundacao
        LookupField = 'IDPESSOA'
        Options = [loTitles]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
    end
  end
  inherited Dock972: TDock97
    Width = 1350
  end
  inherited Dock971: TDock97
    Top = 651
    Width = 1350
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      2
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 437
    Top = 5
  end
  inherited ds: TwwDataSource
    AutoEdit = False
    Left = 297
    Top = 5
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PLANPREV'
      'set'
      '  NOME = :NOME,'
      '  FLGAUTONUMINSC = :FLGAUTONUMINSC,'
      '  FLGCALCULALIMITE = :FLGCALCULALIMITE,'
      '  FLGRECALCCONTRIB = :FLGRECALCCONTRIB,'
      '  IDFUNDACAO = :IDFUNDACAO,'
      '  IDREGRAADMISSAO = :IDREGRAADMISSAO,'
      '  IDREGRACANCDESC = :IDREGRACANCDESC,'
      '  IDREGRACANCELAME = :IDREGRACANCELAME,'
      '  IDREGRADESISTENC = :IDREGRADESISTENC,'
      '  IDREGRATRANSFPLA = :IDREGRATRANSFPLA,'
      '  IDTETOSALPART = :IDTETOSALPART,'
      '  NUMINSCINICIAL = :NUMINSCINICIAL,'
      '  PATROLIMITE = :PATROLIMITE,'
      '  MENSCOBR = :MENSCOBR,'
      '  MENSCOBR2 = :MENSCOBR2,'
      '  FLGRESERVAULTCOT = :FLGRESERVAULTCOT,'
      '  FLGUSAEVOLFUNC = :FLGUSAEVOLFUNC,'
      '  IDREGRAELEGREINS = :IDREGRAELEGREINS,'
      '  IDRGELEGBENEF = :IDRGELEGBENEF,'
      '  IDREGRAVLRDIVIDA = :IDREGRAVLRDIVIDA,'
      '  IDREGRASDODEVEDOR = :IDREGRASDODEVEDOR,'
      '  IDREGRASALPARCELA = :IDREGRASALPARCELA,'
      '  IDREGRAOPPARCELAS = :IDREGRAOPPARCELAS,'
      '  IDREGRAAMORTIZA = :IDREGRAAMORTIZA,'
      '  FLGCONTABMANTIDO = :FLGCONTABMANTIDO,'
      '  IDREGRACARENCIA = :IDREGRACARENCIA,'
      '  IDRGCARENCIAPART = :IDRGCARENCIAPART,'
      '  IDRGCARENCIAPATRO = :IDRGCARENCIAPATRO,'
      '  IDRGTOTCARENCIA = :IDRGTOTCARENCIA,'
      '  FLGTIPOBUSCACOTA = :FLGTIPOBUSCACOTA,'
      '  FLGTIPOGRAVAINSS = :FLGTIPOGRAVAINSS,'
      '  CODIGOSPC = :CODIGOSPC,'
      '  FLGREAJINSSNREQ = :FLGREAJINSSNREQ,'
      '  FLGGERACTNAOENV = :FLGGERACTNAOENV,'
      '  MESPGABONO = :MESPGABONO,'
      '  FLGDTALIMRESERVA = :FLGDTALIMRESERVA,'
      '  FLGNDEVCNAFOLHA = :FLGNDEVCNAFOLHA,'
      '  FLGNGRAVACONTZERO = :FLGNGRAVACONTZERO,'
      '  IDREGRASIMULAENQ = :IDREGRASIMULAENQ,'
      '  DATACRIACAO = :DATACRIACAO,'
      '  LIMITEMUDANCAPERC = :LIMITEMUDANCAPERC'
      ''
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV'
      ''
      ' ')
    InsertSQL.Strings = (
      'insert into PLANPREV'
      '  (IDPLANOPREV,NOME, FLGAUTONUMINSC, FLGCALCULALIMITE,'
      'FLGRECALCCONTRIB, IDFUNDACAO,'
      '   IDREGRAADMISSAO, IDREGRACANCDESC, IDREGRACANCELAME,'
      'IDREGRADESISTENC,'
      '   IDREGRATRANSFPLA, IDTETOSALPART, NUMINSCINICIAL, PATROLIMITE,'
      'MENSCOBR,'
      '   MENSCOBR2, FLGRESERVAULTCOT, FLGUSAEVOLFUNC,'
      'IDREGRAELEGREINS, IDRGELEGBENEF,'
      '   IDREGRAVLRDIVIDA, IDREGRASDODEVEDOR, IDREGRASALPARCELA,'
      'IDREGRAOPPARCELAS,'
      '   IDREGRAAMORTIZA, FLGCONTABMANTIDO, IDREGRACARENCIA,'
      'IDRGCARENCIAPART,'
      '   IDRGCARENCIAPATRO, IDRGTOTCARENCIA, FLGTIPOBUSCACOTA,'
      'FLGTIPOGRAVAINSS,'
      '   CODIGOSPC, FLGREAJINSSNREQ, FLGGERACTNAOENV, MESPGABONO,'
      
        'FLGDTALIMRESERVA, FLGNDEVCNAFOLHA, FLGNGRAVACONTZERO, IDREGRASIM' +
        'ULAENQ, DATACRIACAO, LIMITEMUDANCAPERC)'
      'values'
      '  (:IDPLANOPREV,:NOME, :FLGAUTONUMINSC, :FLGCALCULALIMITE, '
      ':FLGRECALCCONTRIB, :IDFUNDACAO, '
      '   :IDREGRAADMISSAO, :IDREGRACANCDESC, :IDREGRACANCELAME, '
      ':IDREGRADESISTENC, '
      
        '   :IDREGRATRANSFPLA, :IDTETOSALPART, :NUMINSCINICIAL, :PATROLIM' +
        'ITE, '
      ':MENSCOBR, '
      '   :MENSCOBR2, :FLGRESERVAULTCOT, :FLGUSAEVOLFUNC, '
      ':IDREGRAELEGREINS, :IDRGELEGBENEF, '
      '   :IDREGRAVLRDIVIDA, :IDREGRASDODEVEDOR, :IDREGRASALPARCELA, '
      ':IDREGRAOPPARCELAS, '
      '   :IDREGRAAMORTIZA, :FLGCONTABMANTIDO, :IDREGRACARENCIA, '
      ':IDRGCARENCIAPART, '
      '   :IDRGCARENCIAPATRO, :IDRGTOTCARENCIA, :FLGTIPOBUSCACOTA, '
      ':FLGTIPOGRAVAINSS, '
      '   :CODIGOSPC, :FLGREAJINSSNREQ, :FLGGERACTNAOENV, :MESPGABONO, '
      
        ':FLGDTALIMRESERVA, :FLGNDEVCNAFOLHA, :FLGNGRAVACONTZERO, :IDREGR' +
        'ASIMULAENQ, :DATACRIACAO, :LIMITEMUDANCAPERC)'
      ''
      ' ')
    DeleteSQL.Strings = (
      'delete from PLANPREV'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV')
    Left = 344
    Top = 5
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'PLANPREV.NOME'
      'PLANPREV.IDPLANOPREV')
    TipodeDado.Strings = (
      'C'
      'N')
    Descricao.Strings = (
      'Plano Previdenciário'
      'Código do Plano')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PLANPREV')
    CamposChave.Strings = (
      'PLANPREV.IDPLANOPREV')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '50'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      '')
    ExibePergunta = False
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 279
    Top = 5
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 385
    Top = 55
  end
  inherited qry: TwwQuery
    BeforePost = qryBeforePost
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      'SELECT IDPLANOPREV,        NOME,'
      
        '       FLGAUTONUMINSC,     FLGCALCULALIMITE,     FLGRECALCCONTRI' +
        'B,'
      '       IDFUNDACAO,         IDREGRAADMISSAO,'
      
        '       IDREGRACANCDESC,    IDREGRACANCELAME,     IDREGRADESISTEN' +
        'C,'
      '       IDREGRATRANSFPLA,   IDTETOSALPART,        NUMINSCINICIAL,'
      '       PATROLIMITE,        MENSCOBR,'
      '       MENSCOBR2,          FLGRESERVAULTCOT,     FLGUSAEVOLFUNC,'
      '       IDREGRAELEGREINS,   IDRGELEGBENEF,'
      '       IDREGRAVLRDIVIDA,'
      '       IDREGRASDODEVEDOR , IDREGRASALPARCELA,'
      '       IDREGRAOPPARCELAS , IDREGRAAMORTIZA,'
      '       NVL( FLGCONTABMANTIDO,0) FLGCONTABMANTIDO,'
      '       IDREGRACARENCIA,    IDRGCARENCIAPART,'
      '       IDRGCARENCIAPATRO,  IDRGTOTCARENCIA,'
      '       FLGTIPOBUSCACOTA,   FLGTIPOGRAVAINSS,'
      '       CODIGOSPC, FLGREAJINSSNREQ, FLGGERACTNAOENV, MESPGABONO,'
      '       FLGDTALIMRESERVA, FLGNDEVCNAFOLHA, FLGNGRAVACONTZERO,'
      '       IDREGRASIMULAENQ, DATACRIACAO, LIMITEMUDANCAPERC'
      'FROM'
      '       PLANPREV'
      'WHERE'
      '       IDPLANOPREV = :IDPLANOPREV'
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
    Left = 390
    Top = 5
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
        Value = 12
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 451
    Top = 55
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT FUNDACAO.IDPESSOA, PESSOA.NOME'
      'FROM   PESSOA, FUNDACAO'
      'WHERE  FUNDACAO.IDPESSOA = PESSOA.IDPESSOA'
      'AND    PESSOA.TIPO = '#39'J'#39)
    ValidateWithMask = True
    Left = 457
    Top = 498
  end
  object qryMoeda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MOESIGLA, MOECODIGO,  MOEDESC'
      'FROM   MOEDA'
      'ORDER BY MOEDESC')
    ValidateWithMask = True
    Left = 731
    Top = 427
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDREGRA, IDTIPOREGRA,'
      '       NOMEREGRA, PUBLICADA'
      'FROM   REGRA'
      'ORDER  BY NOMEREGRA')
    ValidateWithMask = True
    Left = 731
    Top = 384
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    BeforePost = qryDetBeforePost
    AfterScroll = qryDetAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT CP.IDPLANOPREV,        CP.IDCONTRIBUICAO,        CP.FLGAC' +
        'EITAOPCAO,'
      '       CP.FLGCOBRADECTERC,    CP.FLGCOBRA13DTFIM,'
      
        '       CP.FLGDESCFOLHA,       CP.FLGEDITAOP1,           CP.FLGED' +
        'ITAOP2,'
      '       CP.FLGEDITAOP3,        CP.FLGINTERNO,'
      '       CP.FLGNAOEXIGEREC,     CP.FLGOBRIGAOP1,'
      '       CP.FLGOBRIGAOP2,       CP.FLGOBRIGAOP3,          '
      
        '       CP.FLGPAGADOR,         CP.FLGTOTAL,              CP.IDCON' +
        'TRIBPAI,'
      
        '       CP.IDCONTRIBPAI2,      CP.IDCONTRIBPAI3,         CP.IDPLA' +
        'NOPAI,'
      
        '       CP.IDREGRACALCOP1,     CP.IDREGRACALCOP2,        CP.IDREG' +
        'RACALCOP3,'
      '       CP.IDREGRACALCULO,     CP.IDREGRACALCULO13,      '
      '       CP.IDREGRACOBRANCA,    CP.IDREGRAPRIMPAGTO,'
      '       CP.IDREGRAULTPAGTO,'
      
        '       CP.IDREGRAVALIDAOP1,   CP.IDREGRAVALIDAOP2,      CP.IDREG' +
        'RAVALIDAOP3,'
      
        '       CP.IDRUBDECTERC,       CP.IDRUBDECTERCATRA,      CP.IDRUB' +
        'DECTERCDEVOL,'
      
        '       CP.IDRUBRICA,          CP.IDRUBRICAATRASO,       CP.IDRUB' +
        'RICADEVOLUC,'
      '       CP.NOMEVALORBASE1,'
      
        '       CP.NOMEVALORBASE2,     CP.NOMEVALORBASE3,        CP.NUMOP' +
        'COES,'
      '       CP.ORDEMCALCULO,         '
      
        '       CP.VLRACEITADIVERG,    C.NOME,                   CP.FLGCO' +
        'BRA13DTFIM,'
      '       CP.IDREGRAPRIMPGTO13,     CP.IDREGRAULTPGTO13, '
      '       CP.FLGCONTINGENCIA,'
      
        '       CP.CRITVALORBASE1,     CP.CRITVALORBASE2,        CP.CRITV' +
        'ALORBASE3,'
      
        '       CP.CRITSALARIO,        CP.FLGDESCFOLHAULT,       CP.IDREG' +
        'RAVLRRESERVA,'
      
        '       CP.IDRUBADIANT,        CP.IDRUBDEVOLADIANT,      CP.IDRUB' +
        'ADIANT13,'
      
        '       CP.IDRUBDEVADIANT13, NVL(FLGPARCELAMENTO,0) FLGPARCELAMEN' +
        'TO,'
      ''
      
        '       CP.IDRUBACJUD, CP.IDRUBDADACJUD, CP.IDRUB13ACJUD, CP.IDRU' +
        'B13DESCACJUD,'
      
        '       CP.IDRUBATRACJUD, CP.IDRUBDEVACJUD, CP.IDRUBDEVADTACJUD, ' +
        'CP.IDRUB13ATRACJUD,'
      '       CP.IDRUB13DEVACJUD, CP.IDRUB13DVADTACJUD,'
      '       NVL(cp.FLGCARENCIA,0) FLGCARENCIA,'
      
        '       CP.IDRUBFERIASNORM, CP.IDRUBFERIASATRASO, CP.IDRUBFERIASD' +
        'EVOL,'
      '       CP.CODALTACRESCIMO, CP.IDEMPRESAALT,'
      
        '       CP.DATAINICIOPADRAO, CP.DATAFIMPADRAO--Helio - SOL Nº 253' +
        '577/18124 PPM Nº 1299709'
      
        '       , CPP.CODALTBAIXANPAGO, CPP.CODALTBAIXANPAGOPGA   -- edil' +
        'aine'
      'FROM   CONTPREV CP, CONTRIBUICAO C,'
      
        '       (SELECT DISTINCT IDCONTRIBUICAO, CODALTBAIXANPAGO, CODALT' +
        'BAIXANPAGOPGA'
      '          FROM CONTPLANPATRO'
      '         WHERE IDPLANOPREV = :IDPLANOPREV'
      '       ) CPP'
      'WHERE  CP.IDPLANOPREV = :IDPLANOPREV'
      'AND    CP.IDCONTRIBUICAO = C.IDCONTRIBUICAO'
      'AND    CP.IDCONTRIBUICAO = CPP.IDCONTRIBUICAO(+)'
      'ORDER BY C.NOME'
      ' '
      ' '
      ' ')
    UpdateObject = updDet
    ControlType.Strings = (
      'FLGACEITAOPCAO;CheckBox;1;0'
      'FLGDESCFOLHA;CheckBox;1;0'
      'FLGINTERNO;CheckBox;1;0'
      'FLGCOBRADECTERC;CheckBox;1;0'
      'FLGNAOEXIGEREC;CheckBox;1;0')
    ValidateWithMask = True
    Left = 480
    Top = 7
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTPREV'
      'set'
      '  FLGACEITAOPCAO = :FLGACEITAOPCAO,'
      '  FLGCOBRADECTERC = :FLGCOBRADECTERC,'
      '  FLGCOBRA13DTFIM = :FLGCOBRA13DTFIM,'
      '  FLGDESCFOLHA = :FLGDESCFOLHA,'
      '  FLGEDITAOP1 = :FLGEDITAOP1,'
      '  FLGEDITAOP2 = :FLGEDITAOP2,'
      '  FLGEDITAOP3 = :FLGEDITAOP3,'
      '  FLGINTERNO = :FLGINTERNO,'
      '  FLGNAOEXIGEREC = :FLGNAOEXIGEREC,'
      '  FLGOBRIGAOP1 = :FLGOBRIGAOP1,'
      '  FLGOBRIGAOP2 = :FLGOBRIGAOP2,'
      '  FLGOBRIGAOP3 = :FLGOBRIGAOP3,'
      '  FLGPAGADOR = :FLGPAGADOR,'
      '  FLGTOTAL = :FLGTOTAL,'
      '  IDCONTRIBPAI = :IDCONTRIBPAI,'
      '  IDCONTRIBPAI2 = :IDCONTRIBPAI2,'
      '  IDCONTRIBPAI3 = :IDCONTRIBPAI3,'
      '  IDPLANOPAI = :IDPLANOPAI,'
      '  IDREGRACALCOP1 = :IDREGRACALCOP1,'
      '  IDREGRACALCOP2 = :IDREGRACALCOP2,'
      '  IDREGRACALCOP3 = :IDREGRACALCOP3,'
      '  IDREGRACALCULO = :IDREGRACALCULO,'
      '  IDREGRACALCULO13 = :IDREGRACALCULO13,'
      '  IDREGRACOBRANCA = :IDREGRACOBRANCA,'
      '  IDREGRAPRIMPAGTO = :IDREGRAPRIMPAGTO,'
      '  IDREGRAULTPAGTO = :IDREGRAULTPAGTO,'
      '  IDREGRAVALIDAOP1 = :IDREGRAVALIDAOP1,'
      '  IDREGRAVALIDAOP2 = :IDREGRAVALIDAOP2,'
      '  IDREGRAVALIDAOP3 = :IDREGRAVALIDAOP3,'
      '  IDRUBDECTERC = :IDRUBDECTERC,'
      '  IDRUBDECTERCATRA = :IDRUBDECTERCATRA,'
      '  IDRUBDECTERCDEVOL = :IDRUBDECTERCDEVOL,'
      '  IDRUBRICA = :IDRUBRICA,'
      '  IDRUBRICAATRASO = :IDRUBRICAATRASO,'
      '  IDRUBRICADEVOLUC = :IDRUBRICADEVOLUC,'
      '  NOMEVALORBASE1 = :NOMEVALORBASE1,'
      '  NOMEVALORBASE2 = :NOMEVALORBASE2,'
      '  NOMEVALORBASE3 = :NOMEVALORBASE3,'
      '  NUMOPCOES = :NUMOPCOES,'
      '  ORDEMCALCULO = :ORDEMCALCULO,'
      '  VLRACEITADIVERG = :VLRACEITADIVERG,'
      '  IDREGRAPRIMPGTO13 = :IDREGRAPRIMPGTO13,'
      '  IDREGRAULTPGTO13 = :IDREGRAULTPGTO13,'
      '  FLGCONTINGENCIA = :FLGCONTINGENCIA,'
      '  CRITVALORBASE1 = :CRITVALORBASE1,'
      '  CRITVALORBASE2 = :CRITVALORBASE2,'
      '  CRITVALORBASE3 = :CRITVALORBASE3,'
      '  CRITSALARIO = :CRITSALARIO,'
      '  FLGDESCFOLHAULT = :FLGDESCFOLHAULT,'
      '  IDRUBADIANT = :IDRUBADIANT,'
      '  IDRUBDEVOLADIANT = :IDRUBDEVOLADIANT,'
      '  IDRUBADIANT13 = :IDRUBADIANT13,'
      '  IDRUBDEVADIANT13 = :IDRUBDEVADIANT13,'
      '  FLGPARCELAMENTO=  :FLGPARCELAMENTO,'
      '  IDRUBACJUD = :IDRUBACJUD,'
      '  IDRUBDADACJUD = :IDRUBDADACJUD,'
      '  IDRUB13ACJUD = :IDRUB13ACJUD,'
      '  IDRUB13DESCACJUD = :IDRUB13DESCACJUD,'
      '  IDRUBATRACJUD = :IDRUBATRACJUD,'
      '  IDRUBDEVACJUD = :IDRUBDEVACJUD,'
      '  IDRUBDEVADTACJUD = :IDRUBDEVADTACJUD,'
      '  IDRUB13ATRACJUD = :IDRUB13ATRACJUD,'
      '  IDRUB13DEVACJUD = :IDRUB13DEVACJUD,'
      '  IDRUB13DVADTACJUD = :IDRUB13DVADTACJUD,'
      '  FLGCARENCIA =  :FLGCARENCIA,'
      '  IDRUBFERIASDEVOL  = :IDRUBFERIASDEVOL,'
      '  IDRUBFERIASATRASO = :IDRUBFERIASATRASO,'
      '  IDRUBFERIASNORM   = :IDRUBFERIASNORM,'
      '  IDREGRAVLRRESERVA = :IDREGRAVLRRESERVA,'
      '  CODALTACRESCIMO   = :CODALTACRESCIMO,'
      '  IDEMPRESAALT      = :IDEMPRESAALT,'
      '  DATAINICIOPADRAO = :DATAINICIOPADRAO,'
      '  DATAFIMPADRAO = :DATAFIMPADRAO'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDCONTRIBUICAO = :OLD_IDCONTRIBUICAO')
    InsertSQL.Strings = (
      'insert into CONTPREV'
      
        '  (IDPLANOPREV, IDCONTRIBUICAO, FLGACEITAOPCAO, FLGCOBRADECTERC,' +
        '   FLGCOBRA13DTFIM, FLGDESCFOLHA, FLGEDITAOP1, FLGEDITAOP2, FLGE' +
        'DITAOP3,'
      '   FLGINTERNO, FLGNAOEXIGEREC, FLGOBRIGAOP1, FLGOBRIGAOP2,'
      
        '   FLGOBRIGAOP3, FLGPAGADOR, FLGTOTAL, IDCONTRIBPAI, IDCONTRIBPA' +
        'I2,'
      
        '   IDCONTRIBPAI3, IDPLANOPAI, IDREGRACALCOP1, IDREGRACALCOP2, ID' +
        'REGRACALCOP3,'
      '   IDREGRACALCULO, IDREGRACALCULO13, IDREGRACOBRANCA,'
      '   IDREGRAPRIMPAGTO, IDREGRAULTPAGTO, IDREGRAVALIDAOP1,'
      
        '   IDREGRAVALIDAOP2, IDREGRAVALIDAOP3, IDRUBDECTERC, IDRUBDECTER' +
        'CATRA,'
      
        '   IDRUBDECTERCDEVOL, IDRUBRICA, IDRUBRICAATRASO, IDRUBRICADEVOL' +
        'UC,'
      '   NOMEVALORBASE1, NOMEVALORBASE2, NOMEVALORBASE3, NUMOPCOES,'
      '   ORDEMCALCULO, VLRACEITADIVERG, IDREGRAPRIMPGTO13,'
      '   IDREGRAULTPGTO13,'
      
        '   FLGCONTINGENCIA, CRITVALORBASE1, CRITVALORBASE2, CRITVALORBAS' +
        'E3, CRITSALARIO,'
      
        '   FLGDESCFOLHAULT, IDRUBADIANT, IDRUBDEVOLADIANT, IDRUBADIANT13' +
        ','
      '   IDRUBDEVADIANT13, FLGPARCELAMENTO,'
      '   IDRUBACJUD, IDRUBDADACJUD, IDRUB13ACJUD, IDRUB13DESCACJUD,'
      
        '   IDRUBATRACJUD, IDRUBDEVACJUD, IDRUBDEVADTACJUD, IDRUB13ATRACJ' +
        'UD,'
      '   IDRUB13DEVACJUD, IDRUB13DVADTACJUD, FLGCARENCIA,'
      
        '   IDRUBFERIASDEVOL, IDRUBFERIASATRASO, IDRUBFERIASNORM, IDREGRA' +
        'VLRRESERVA,'
      '   CODALTACRESCIMO, IDEMPRESAALT,'
      '   DATAINICIOPADRAO, DATAFIMPADRAO'
      '  )'
      'values'
      
        '  (:IDPLANOPREV, :IDCONTRIBUICAO, :FLGACEITAOPCAO, :FLGCOBRADECT' +
        'ERC,'
      
        '   :FLGCOBRA13DTFIM, :FLGDESCFOLHA, :FLGEDITAOP1, :FLGEDITAOP2, ' +
        ':FLGEDITAOP3,'
      '   :FLGINTERNO, :FLGNAOEXIGEREC, :FLGOBRIGAOP1,'
      
        '   :FLGOBRIGAOP2, :FLGOBRIGAOP3, :FLGPAGADOR, :FLGTOTAL, :IDCONT' +
        'RIBPAI,'
      
        '   :IDCONTRIBPAI2, :IDCONTRIBPAI3, :IDPLANOPAI, :IDREGRACALCOP1,' +
        ' :IDREGRACALCOP2,'
      '   :IDREGRACALCOP3, :IDREGRACALCULO, :IDREGRACALCULO13,'
      '   :IDREGRACOBRANCA, :IDREGRAPRIMPAGTO, :IDREGRAULTPAGTO,'
      
        '   :IDREGRAVALIDAOP1, :IDREGRAVALIDAOP2, :IDREGRAVALIDAOP3, :IDR' +
        'UBDECTERC,'
      
        '   :IDRUBDECTERCATRA, :IDRUBDECTERCDEVOL, :IDRUBRICA, :IDRUBRICA' +
        'ATRASO,'
      '   :IDRUBRICADEVOLUC, :NOMEVALORBASE1,'
      '   :NOMEVALORBASE2, :NOMEVALORBASE3, :NUMOPCOES,  :ORDEMCALCULO,'
      '   :VLRACEITADIVERG, :IDREGRAPRIMPGTO13, :IDREGRAULTPGTO13,'
      '   :FLGCONTINGENCIA,'
      
        '   :CRITVALORBASE1, :CRITVALORBASE2, :CRITVALORBASE3, :CRITSALAR' +
        'IO, :FLGDESCFOLHAULT,'
      '   :IDRUBADIANT, :IDRUBDEVOLADIANT, :IDRUBADIANT13,'
      '   :IDRUBDEVADIANT13, :FLGPARCELAMENTO,'
      
        '   :IDRUBACJUD, :IDRUBDADACJUD, :IDRUB13ACJUD, :IDRUB13DESCACJUD' +
        ','
      
        '   :IDRUBATRACJUD, :IDRUBDEVACJUD, :IDRUBDEVADTACJUD, :IDRUB13AT' +
        'RACJUD,'
      '   :IDRUB13DEVACJUD, :IDRUB13DVADTACJUD, :FLGCARENCIA,'
      
        '   :IDRUBFERIASDEVOL, :IDRUBFERIASATRASO, :IDRUBFERIASNORM, :IDR' +
        'EGRAVLRRESERVA,'
      '   :CODALTACRESCIMO, :IDEMPRESAALT,'
      '   :DATAINICIOPADRAO, :DATAFIMPADRAO )'
      '')
    DeleteSQL.Strings = (
      'delete from CONTPREV'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDCONTRIBUICAO = :OLD_IDCONTRIBUICAO')
    Left = 530
    Top = 5
  end
  object dsBenef: TwwDataSource
    DataSet = qryBenef
    Left = 576
    Top = 5
  end
  object qryBenef: TwwQuery
    CachedUpdates = True
    BeforePost = qryBenefBeforePost
    AfterScroll = qryBenefAfterScroll
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      
        'SELECT BP.IDPLANOPREV,          BP.IDBENEFICIO,             BP.F' +
        'LGABONOFINALBEN,'
      '       BP.FLGACEITAOPCAO,       BP.FLGCALCTODOMES,'
      
        '       BP.FLGCORRECAOATRASO,    BP.FLGCORRECAODEVOL,        BP.F' +
        'LGEDITAOP1,'
      
        '       BP.FLGEDITAOP2,          BP.FLGEDITAOP3,             BP.F' +
        'LGOBRIGANPROC,'
      
        '       BP.FLGOBRIGAOP1,         BP.FLGOBRIGAOP2,            BP.F' +
        'LGOBRIGAOP3,'
      
        '       BP.FLGPOSSUIABONO,       BP.FLGQUITAASSISTEN,        BP.F' +
        'LGQUITAEMPRESTI,'
      
        '       BP.FLGQUITAPREVIDEN,     BP.FLGRECALCULAFIM,         BP.F' +
        'LGREFERENCIA,'
      '       BP.IDBENEFREF,           BP.IDPLANOBENEFREF,'
      '       BP.IDREGRABENEFICIA,     BP.CODALTERADORCORR,'
      
        '       BP.IDREGRACALCABONO,     BP.IDREGRACALCINSS,         BP.I' +
        'DREGRACALCOP1,'
      
        '       BP.IDREGRACALCOP2,       BP.IDREGRACALCOP3,          BP.I' +
        'DREGRACALCULO,'
      
        '       BP.IDREGRAELEGIBILI,     BP.IDREGRAFIM,              BP.I' +
        'DREGRAINICIO,'
      '       BP.IDREGRAPAGAATRASO,    BP.IDREGRAPAGAMENTO,'
      '       BP.IDREGRAPRIMPAGTO,     BP.IDREGRASIMULA,'
      '       BP.IDREGRAULTPAGTO,      BP.IDREGRAVALIDAOP1,'
      '       BP.IDREGRAVALIDAOP2,     BP.IDREGRAVALIDAOP3,'
      
        '       BP.IDRGVALORTOTAL,       BP.IDRUBABONO,              BP.I' +
        'DRUBANTECABONO,'
      
        '       BP.IDRUBDESCANTECAB,     BP.IDRUBDEVOLUCAO,          BP.I' +
        'DRUBRICA,'
      '       BP.IDRUBRICACORRECAO,    BP.IDRUBRICADIF,'
      '       BP.INDICEREAJBENEF,      BP.NOMEVALORBASE1,'
      
        '       BP.NOMEVALORBASE2,       BP.NOMEVALORBASE3,          BP.N' +
        'UMOPCOES,'
      
        '       BP.PRAZOCONCESSAO,       BP.TPMODALIDADE,            BP.F' +
        'LGBENEFINF,'
      
        '       BP.IDRUBRICAATRASO,      BP.IDRUBRICAREVISAO,        BP.F' +
        'LGDATAINDICERES,'
      
        '       BP.FLGUSAEVOLFUNC,       BP.FLGPAGAINSS,             BP.F' +
        'LGPAGAINTEG,'
      
        '       BP.IDRELATBENEFICIO,     BP.ORIGEMCMBENEFICIO,       BP.I' +
        'DREGRABENEFMIN,'
      
        '       BP.IDREGRASRB,           BP.FLGACEITAACERTO,         BP.I' +
        'DRUBDEVOLABONO,'
      
        '       BP.IDRUBADIANT,          BP.IDRUBDEVOLADIANT,        BP.I' +
        'DRUBADIANT13,'
      '       BP.IDRUBDEVADIANT13,     BP.FLGACEITAZERO,'
      '       B.NOME,'
      
        '       BP.IDRUBACJUD,           BP.IDRUBATRACJUD,           BP.I' +
        'DRUBDEVACJUD,'
      
        '       BP.IDRUBREVACJUD,        BP.IDRUBADTACJUD,           BP.I' +
        'DRUBDADACJUD,'
      
        '       BP.IDRUB13ACJUD,         BP.IDRUB13DESACJUD,         BP.I' +
        'DRUB13PGAN1ACJUD,'
      
        '       BP.IDRUB13DVANACJUD,     BP.IDRUB13ADTACJUD,         BP.I' +
        'DRUB13DADACJUD,'
      
        '       BP.IDREGRADTINDRES,      BP.IDRGDATAELEG,            BP.I' +
        'DRGVALORPREV,'
      
        '       BP.FLGACTVLRSRB,         BP.FLGACTVLRATUAL,          BP.F' +
        'LGACTVLRTOTBEN,'
      '       BP.FLGTPBUSCAVALOR,      BP.FLGMOVRESAPOSCONC,'
      
        '       BP.IDRGPLANPREVCONT,     BP.LIMITEALT, BP.PERCENTUALALT, ' +
        'BP.USUARIOALT,'
      '       BP.NUMDIASBENEFANT,'
      '       BP.IDRUBACERTOABONO, BP.IDRUBDEVANTABONO,'
      
        '       BP.IDRUBATRASOABONO, BP.IDRUBATR13ACJUD,  BP.IDRUBDEV13AC' +
        'JUD,'
      
        '       BP.IDRUBATRREVACJUD, BP.IDRUBDEVREVACJUD, BP.IDRUBATRREVI' +
        'SAO, BP.IDRUBDEVREVISAO,'
      
        '       BP.IDREGRAQUITANT,   BP.IDRUBRICAQUITANT, BP.FLGDESINDRES' +
        ','
      
        '       BP.IDRUBNORADICJUD,  BP.IDRUBATRADICJUD,  BP.IDRUBDEVADIC' +
        'JUD,'
      '       BP.FLGISENTOIRRF,'
      
        '       BP.FLGVALORTITULAR1, BP.FLGVALORTITULAR2, BP.FLGVALORTITU' +
        'LAR3,'
      '      --Andre Oliveira SOL160185 '
      
        '       BP.IDREGRAVALIDAOPTEXTO1, BP.IDREGRAVALIDAOPTEXTO2, BP.ID' +
        'REGRAVALIDAOPTEXTO3, '
      
        '       BP.IDREGRACALCOPTEXTO1, BP.IDREGRACALCOPTEXTO2, BP.IDREGR' +
        'ACALCOPTEXTO3,'
      
        '       BP.NOMECAMPOTEXTO1, BP.NOMECAMPOTEXTO2, BP.NOMECAMPOTEXTO' +
        '3,'
      
        '       BP.FLGOBRIGAOPTEXTO1, BP.FLGOBRIGAOPTEXTO2, BP.FLGOBRIGAO' +
        'PTEXTO3, '
      
        '       BP.FLGEDITAOPTEXTO1, BP.FLGEDITAOPTEXTO2, BP.FLGEDITAOPTE' +
        'XTO3,'
      '       BP.NUMOPCOESTEXTO, BP.FLGOPCAOTEXTO'#9
      '       --Andre Oliveira SOL160185 '#9#9
      '       ,BP.IDRUBRICAATRASORRA,   BP.IDRUBRICADEVOLUCAORRA,      '
      '        BP.IDRUBRICAREVATRASORRA,BP.IDRUBRICAREVDEVOLUCAORRA,'
      '        BP.IDRUBRICACORATRASORRA, BP.IDRUBRICACORDEVOLUCAORRA,'
      '       BP.IDRUBBIT , '
      '       BP.IDRUBATRABIT ,'
      '       BP.IDRUBDEVABIT  ,'
      '       BP.IDRUB13BIT ,'
      '       BP.IDRUBATR13BIT ,'
      '       BP.IDRUBDEV13BIT ,'
      '       BP.IDRUBREVABIT,'
      '       BP.IDRUBATRREVBIT ,'
      '       BP.IDRUBDEVREVBIT,    '
      '       BP.IDRUBRICADIVIDABENEFNORMAL,'
      '       BP.IDRUBRICADIVIDABENEFICIODEVOL,'
      '       BP.IDRUBRICADIVIDABENEFTRASO,'
      '       BP.IDRUBRICADIVIDABENEF13,'
      '       BP.IDRUBRICADIVIDABENEF13DEVOL,'
      '       BP.IDRUBRICADIVIDABENEF13ATRASO,'
      '       BP.FLGAPRESENTABSFAB,'
      '       BP.FLGAPRESENTADEFICIT,'
      '       BP.IDREGRACALCBS,'
      '       BP.IDREGRACALCFAB,'
      '       BP.IDREGRACALCBASEDEFICIT,'
      
        '       BP.IDRUBRICAACERTO,                             -- SIG367' +
        '52'
      
        '       BP.IDPLANPREVCONTAB                             -- SIG135' +
        '968'
      'FROM   BENEFPLANPREV BP, BENEFICIO B'
      'WHERE  BP.IDPLANOPREV = :IDPLANOPREV'
      'AND    BP.IDBENEFICIO = B.IDBENEFICIO'
      'ORDER BY B.NOME'
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updBenef
    ControlType.Strings = (
      'FLGREFERENCIA;CheckBox;1;0'
      'FLGACEITAOPCAO;CheckBox;1;0'
      'FLGPOSSUIABONO;CheckBox;1;0'
      'FLGABONOFINALBEN;CheckBox;1;0')
    ValidateWithMask = True
    Left = 623
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
    object qryBenefIDBENEFICIO: TFloatField
      DisplayLabel = 'Cód'
      DisplayWidth = 10
      FieldName = 'IDBENEFICIO'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDBENEFICIO'
    end
    object qryBenefNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 50
      FieldName = 'NOME'
      Origin = 'BASEDADOS.BENEFICIO.NOME'
      Size = 60
    end
    object qryBenefFLGREFERENCIA: TFloatField
      DisplayLabel = 'Benef. ~Ref.'
      DisplayWidth = 10
      FieldName = 'FLGREFERENCIA'
      Origin = 'BASEDADOS.BENEFPLANPREV.FLGREFERENCIA'
    end
    object qryBenefFLGACEITAOPCAO: TFloatField
      DisplayLabel = 'Aceita~Opção'
      DisplayWidth = 10
      FieldName = 'FLGACEITAOPCAO'
      Origin = 'BASEDADOS.BENEFPLANPREV.FLGACEITAOPCAO'
    end
    object qryBenefFLGPOSSUIABONO: TFloatField
      DisplayLabel = 'Possui~Abono'
      DisplayWidth = 10
      FieldName = 'FLGPOSSUIABONO'
      Origin = 'BASEDADOS.BENEFPLANPREV.FLGPOSSUIABONO'
    end
    object qryBenefFLGABONOFINALBEN: TFloatField
      DisplayLabel = 'Abono no ~Final'
      DisplayWidth = 10
      FieldName = 'FLGABONOFINALBEN'
      Origin = 'BASEDADOS.BENEFPLANPREV.FLGABONOFINALBEN'
    end
    object qryBenefIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDPLANOPREV'
      Visible = False
    end
    object qryBenefFLGCALCTODOMES: TFloatField
      FieldName = 'FLGCALCTODOMES'
      Origin = 'BASEDADOS.BENEFPLANPREV.FLGCALCTODOMES'
      Visible = False
    end
    object qryBenefFLGCORRECAOATRASO: TFloatField
      FieldName = 'FLGCORRECAOATRASO'
      Origin = 'BASEDADOS.BENEFPLANPREV.FLGCORRECAOATRASO'
      Visible = False
    end
    object qryBenefFLGCORRECAODEVOL: TFloatField
      FieldName = 'FLGCORRECAODEVOL'
      Origin = 'BASEDADOS.BENEFPLANPREV.FLGCORRECAODEVOL'
      Visible = False
    end
    object qryBenefFLGEDITAOP1: TFloatField
      FieldName = 'FLGEDITAOP1'
      Origin = 'BASEDADOS.BENEFPLANPREV.FLGEDITAOP1'
      Visible = False
    end
    object qryBenefFLGEDITAOP2: TFloatField
      FieldName = 'FLGEDITAOP2'
      Origin = 'BASEDADOS.BENEFPLANPREV.FLGEDITAOP2'
      Visible = False
    end
    object qryBenefFLGEDITAOP3: TFloatField
      FieldName = 'FLGEDITAOP3'
      Origin = 'BASEDADOS.BENEFPLANPREV.FLGEDITAOP3'
      Visible = False
    end
    object qryBenefFLGOBRIGANPROC: TFloatField
      FieldName = 'FLGOBRIGANPROC'
      Origin = 'BASEDADOS.BENEFPLANPREV.FLGOBRIGANPROC'
      Visible = False
    end
    object qryBenefFLGOBRIGAOP1: TFloatField
      FieldName = 'FLGOBRIGAOP1'
      Origin = 'BASEDADOS.BENEFPLANPREV.FLGOBRIGAOP1'
      Visible = False
    end
    object qryBenefFLGOBRIGAOP2: TFloatField
      FieldName = 'FLGOBRIGAOP2'
      Origin = 'BASEDADOS.BENEFPLANPREV.FLGOBRIGAOP2'
      Visible = False
    end
    object qryBenefFLGOBRIGAOP3: TFloatField
      FieldName = 'FLGOBRIGAOP3'
      Origin = 'BASEDADOS.BENEFPLANPREV.FLGOBRIGAOP3'
      Visible = False
    end
    object qryBenefFLGQUITAASSISTEN: TFloatField
      FieldName = 'FLGQUITAASSISTEN'
      Origin = 'BASEDADOS.BENEFPLANPREV.FLGQUITAASSISTEN'
      Visible = False
    end
    object qryBenefFLGQUITAEMPRESTI: TFloatField
      FieldName = 'FLGQUITAEMPRESTI'
      Origin = 'BASEDADOS.BENEFPLANPREV.FLGQUITAEMPRESTI'
      Visible = False
    end
    object qryBenefFLGQUITAPREVIDEN: TFloatField
      FieldName = 'FLGQUITAPREVIDEN'
      Origin = 'BASEDADOS.BENEFPLANPREV.FLGQUITAPREVIDEN'
      Visible = False
    end
    object qryBenefFLGRECALCULAFIM: TFloatField
      FieldName = 'FLGRECALCULAFIM'
      Origin = 'BASEDADOS.BENEFPLANPREV.FLGRECALCULAFIM'
      Visible = False
    end
    object qryBenefIDBENEFREF: TFloatField
      FieldName = 'IDBENEFREF'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDBENEFREF'
      Visible = False
    end
    object qryBenefIDPLANOBENEFREF: TFloatField
      FieldName = 'IDPLANOBENEFREF'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDPLANOBENEFREF'
      Visible = False
    end
    object qryBenefIDREGRABENEFICIA: TFloatField
      FieldName = 'IDREGRABENEFICIA'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDREGRABENEFICIA'
      Visible = False
    end
    object qryBenefCODALTERADORCORR: TFloatField
      FieldName = 'CODALTERADORCORR'
      Origin = 'BASEDADOS.BENEFPLANPREV.CODALTERADORCORR'
      Visible = False
    end
    object qryBenefIDREGRACALCABONO: TFloatField
      FieldName = 'IDREGRACALCABONO'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDREGRACALCABONO'
      Visible = False
    end
    object qryBenefIDREGRACALCINSS: TFloatField
      FieldName = 'IDREGRACALCINSS'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDREGRACALCINSS'
      Visible = False
    end
    object qryBenefIDREGRACALCOP1: TFloatField
      FieldName = 'IDREGRACALCOP1'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDREGRACALCOP1'
      Visible = False
    end
    object qryBenefIDREGRACALCOP2: TFloatField
      FieldName = 'IDREGRACALCOP2'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDREGRACALCOP2'
      Visible = False
    end
    object qryBenefIDREGRACALCOP3: TFloatField
      FieldName = 'IDREGRACALCOP3'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDREGRACALCOP3'
      Visible = False
    end
    object qryBenefIDREGRACALCULO: TFloatField
      FieldName = 'IDREGRACALCULO'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDREGRACALCULO'
      Visible = False
    end
    object qryBenefIDREGRAELEGIBILI: TFloatField
      FieldName = 'IDREGRAELEGIBILI'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDREGRAELEGIBILI'
      Visible = False
    end
    object qryBenefIDREGRAFIM: TFloatField
      FieldName = 'IDREGRAFIM'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDREGRAFIM'
      Visible = False
    end
    object qryBenefIDREGRAINICIO: TFloatField
      FieldName = 'IDREGRAINICIO'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDREGRAINICIO'
      Visible = False
    end
    object qryBenefIDREGRAPAGAATRASO: TFloatField
      FieldName = 'IDREGRAPAGAATRASO'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDREGRAPAGAATRASO'
      Visible = False
    end
    object qryBenefIDREGRAPAGAMENTO: TFloatField
      FieldName = 'IDREGRAPAGAMENTO'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDREGRAPAGAMENTO'
      Visible = False
    end
    object qryBenefIDREGRAPRIMPAGTO: TFloatField
      FieldName = 'IDREGRAPRIMPAGTO'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDREGRAPRIMPAGTO'
      Visible = False
    end
    object qryBenefIDREGRASIMULA: TFloatField
      FieldName = 'IDREGRASIMULA'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDREGRASIMULA'
      Visible = False
    end
    object qryBenefIDREGRAULTPAGTO: TFloatField
      FieldName = 'IDREGRAULTPAGTO'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDREGRAULTPAGTO'
      Visible = False
    end
    object qryBenefIDREGRAVALIDAOP1: TFloatField
      FieldName = 'IDREGRAVALIDAOP1'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDREGRAVALIDAOP1'
      Visible = False
    end
    object qryBenefIDREGRAVALIDAOP2: TFloatField
      FieldName = 'IDREGRAVALIDAOP2'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDREGRAVALIDAOP2'
      Visible = False
    end
    object qryBenefIDREGRAVALIDAOP3: TFloatField
      FieldName = 'IDREGRAVALIDAOP3'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDREGRAVALIDAOP3'
      Visible = False
    end
    object qryBenefIDRGVALORTOTAL: TFloatField
      FieldName = 'IDRGVALORTOTAL'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRGVALORTOTAL'
      Visible = False
    end
    object qryBenefIDRUBABONO: TFloatField
      FieldName = 'IDRUBABONO'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRUBABONO'
      Visible = False
    end
    object qryBenefIDRUBANTECABONO: TFloatField
      FieldName = 'IDRUBANTECABONO'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRUBANTECABONO'
      Visible = False
    end
    object qryBenefIDRUBDESCANTECAB: TFloatField
      FieldName = 'IDRUBDESCANTECAB'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRUBDESCANTECAB'
      Visible = False
    end
    object qryBenefIDRUBDEVOLUCAO: TFloatField
      FieldName = 'IDRUBDEVOLUCAO'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRUBDEVOLUCAO'
      Visible = False
    end
    object qryBenefIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRUBRICA'
      Visible = False
    end
    object qryBenefIDRUBRICACORRECAO: TFloatField
      FieldName = 'IDRUBRICACORRECAO'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRUBRICACORRECAO'
      Visible = False
    end
    object qryBenefIDRUBRICADIF: TFloatField
      FieldName = 'IDRUBRICADIF'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRUBRICADIF'
      Visible = False
    end
    object qryBenefINDICEREAJBENEF: TFloatField
      FieldName = 'INDICEREAJBENEF'
      Origin = 'BASEDADOS.BENEFPLANPREV.INDICEREAJBENEF'
      Visible = False
    end
    object qryBenefNOMEVALORBASE1: TStringField
      FieldName = 'NOMEVALORBASE1'
      Origin = 'BASEDADOS.BENEFPLANPREV.NOMEVALORBASE1'
      Visible = False
      Size = 60
    end
    object qryBenefNOMEVALORBASE2: TStringField
      FieldName = 'NOMEVALORBASE2'
      Origin = 'BASEDADOS.BENEFPLANPREV.NOMEVALORBASE2'
      Visible = False
      Size = 60
    end
    object qryBenefNOMEVALORBASE3: TStringField
      FieldName = 'NOMEVALORBASE3'
      Origin = 'BASEDADOS.BENEFPLANPREV.NOMEVALORBASE3'
      Visible = False
      Size = 60
    end
    object qryBenefNUMOPCOES: TFloatField
      FieldName = 'NUMOPCOES'
      Origin = 'BASEDADOS.BENEFPLANPREV.NUMOPCOES'
      Visible = False
    end
    object qryBenefPRAZOCONCESSAO: TFloatField
      FieldName = 'PRAZOCONCESSAO'
      Origin = 'BASEDADOS.BENEFPLANPREV.PRAZOCONCESSAO'
      Visible = False
    end
    object qryBenefTPMODALIDADE: TStringField
      FieldName = 'TPMODALIDADE'
      Origin = 'BASEDADOS.BENEFPLANPREV.TPMODALIDADE'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object qryBenefFLGBENEFINF: TFloatField
      FieldName = 'FLGBENEFINF'
      Origin = 'BASEDADOS.BENEFPLANPREV.FLGBENEFINF'
      Visible = False
    end
    object qryBenefIDRUBRICAATRASO: TFloatField
      FieldName = 'IDRUBRICAATRASO'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRUBRICAATRASO'
      Visible = False
    end
    object qryBenefIDRUBRICAREVISAO: TFloatField
      FieldName = 'IDRUBRICAREVISAO'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRUBRICAREVISAO'
      Visible = False
    end
    object qryBenefFLGDATAINDICERES: TFloatField
      FieldName = 'FLGDATAINDICERES'
      Origin = 'BASEDADOS.BENEFPLANPREV.FLGDATAINDICERES'
      Visible = False
    end
    object qryBenefFLGUSAEVOLFUNC: TFloatField
      FieldName = 'FLGUSAEVOLFUNC'
      Origin = 'BASEDADOS.BENEFPLANPREV.FLGUSAEVOLFUNC'
      Visible = False
    end
    object qryBenefFLGPAGAINSS: TFloatField
      FieldName = 'FLGPAGAINSS'
      Origin = 'BASEDADOS.BENEFPLANPREV.FLGPAGAINSS'
      Visible = False
    end
    object qryBenefFLGPAGAINTEG: TFloatField
      FieldName = 'FLGPAGAINTEG'
      Origin = 'BASEDADOS.BENEFPLANPREV.FLGPAGAINTEG'
      Visible = False
    end
    object qryBenefIDRELATBENEFICIO: TFloatField
      FieldName = 'IDRELATBENEFICIO'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRELATBENEFICIO'
      Visible = False
    end
    object qryBenefORIGEMCMBENEFICIO: TFloatField
      FieldName = 'ORIGEMCMBENEFICIO'
      Origin = 'BASEDADOS.BENEFPLANPREV.ORIGEMCMBENEFICIO'
      Visible = False
    end
    object qryBenefIDREGRABENEFMIN: TFloatField
      FieldName = 'IDREGRABENEFMIN'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDREGRABENEFMIN'
      Visible = False
    end
    object qryBenefIDREGRASRB: TFloatField
      FieldName = 'IDREGRASRB'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDREGRASRB'
      Visible = False
    end
    object qryBenefFLGACEITAACERTO: TFloatField
      FieldName = 'FLGACEITAACERTO'
      Origin = 'BASEDADOS.BENEFPLANPREV.FLGACEITAACERTO'
      Visible = False
    end
    object qryBenefIDRUBDEVOLABONO: TFloatField
      FieldName = 'IDRUBDEVOLABONO'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRUBDEVOLABONO'
      Visible = False
    end
    object qryBenefIDRUBADIANT: TFloatField
      FieldName = 'IDRUBADIANT'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRUBADIANT'
      Visible = False
    end
    object qryBenefIDRUBDEVOLADIANT: TFloatField
      FieldName = 'IDRUBDEVOLADIANT'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRUBDEVOLADIANT'
      Visible = False
    end
    object qryBenefIDRUBADIANT13: TFloatField
      FieldName = 'IDRUBADIANT13'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRUBADIANT13'
      Visible = False
    end
    object qryBenefIDRUBDEVADIANT13: TFloatField
      FieldName = 'IDRUBDEVADIANT13'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRUBDEVADIANT13'
      Visible = False
    end
    object qryBenefFLGACEITAZERO: TFloatField
      FieldName = 'FLGACEITAZERO'
      Origin = 'BASEDADOS.BENEFPLANPREV.FLGACEITAZERO'
      Visible = False
    end
    object qryBenefIDRUBACJUD: TFloatField
      FieldName = 'IDRUBACJUD'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRUBACJUD'
      Visible = False
    end
    object qryBenefIDRUBATRACJUD: TFloatField
      FieldName = 'IDRUBATRACJUD'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRUBATRACJUD'
      Visible = False
    end
    object qryBenefIDRUBDEVACJUD: TFloatField
      FieldName = 'IDRUBDEVACJUD'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRUBDEVACJUD'
      Visible = False
    end
    object qryBenefIDRUBREVACJUD: TFloatField
      FieldName = 'IDRUBREVACJUD'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRUBREVACJUD'
      Visible = False
    end
    object qryBenefIDRUBADTACJUD: TFloatField
      FieldName = 'IDRUBADTACJUD'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRUBADTACJUD'
      Visible = False
    end
    object qryBenefIDRUBDADACJUD: TFloatField
      FieldName = 'IDRUBDADACJUD'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRUBDADACJUD'
      Visible = False
    end
    object qryBenefIDRUB13ACJUD: TFloatField
      FieldName = 'IDRUB13ACJUD'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRUB13ACJUD'
      Visible = False
    end
    object qryBenefIDRUB13DESACJUD: TFloatField
      FieldName = 'IDRUB13DESACJUD'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRUB13DESACJUD'
      Visible = False
    end
    object qryBenefIDRUB13PGAN1ACJUD: TFloatField
      FieldName = 'IDRUB13PGAN1ACJUD'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRUB13PGAN1ACJUD'
      Visible = False
    end
    object qryBenefIDRUB13DVANACJUD: TFloatField
      FieldName = 'IDRUB13DVANACJUD'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRUB13DVANACJUD'
      Visible = False
    end
    object qryBenefIDRUB13ADTACJUD: TFloatField
      FieldName = 'IDRUB13ADTACJUD'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRUB13ADTACJUD'
      Visible = False
    end
    object qryBenefIDRUB13DADACJUD: TFloatField
      FieldName = 'IDRUB13DADACJUD'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRUB13DADACJUD'
      Visible = False
    end
    object qryBenefIDREGRADTINDRES: TFloatField
      FieldName = 'IDREGRADTINDRES'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDREGRADTINDRES'
      Visible = False
    end
    object qryBenefIDRGDATAELEG: TFloatField
      FieldName = 'IDRGDATAELEG'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRGDATAELEG'
      Visible = False
    end
    object qryBenefIDRGVALORPREV: TFloatField
      FieldName = 'IDRGVALORPREV'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRGVALORPREV'
      Visible = False
    end
    object qryBenefFLGACTVLRSRB: TFloatField
      FieldName = 'FLGACTVLRSRB'
      Origin = 'BASEDADOS.BENEFPLANPREV.FLGACTVLRSRB'
      Visible = False
    end
    object qryBenefFLGACTVLRATUAL: TFloatField
      FieldName = 'FLGACTVLRATUAL'
      Origin = 'BASEDADOS.BENEFPLANPREV.FLGACTVLRATUAL'
      Visible = False
    end
    object qryBenefFLGACTVLRTOTBEN: TFloatField
      FieldName = 'FLGACTVLRTOTBEN'
      Origin = 'BASEDADOS.BENEFPLANPREV.FLGACTVLRTOTBEN'
      Visible = False
    end
    object qryBenefFLGTPBUSCAVALOR: TFloatField
      FieldName = 'FLGTPBUSCAVALOR'
      Origin = 'BASEDADOS.BENEFPLANPREV.FLGTPBUSCAVALOR'
      Visible = False
    end
    object qryBenefFLGMOVRESAPOSCONC: TFloatField
      FieldName = 'FLGMOVRESAPOSCONC'
      Origin = 'BASEDADOS.BENEFPLANPREV.FLGMOVRESAPOSCONC'
      Visible = False
    end
    object qryBenefIDRGPLANPREVCONT: TFloatField
      FieldName = 'IDRGPLANPREVCONT'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRGPLANPREVCONT'
      Visible = False
    end
    object qryBenefLIMITEALT: TFloatField
      FieldName = 'LIMITEALT'
      Origin = 'BASEDADOS.BENEFPLANPREV.LIMITEALT'
      Visible = False
    end
    object qryBenefPERCENTUALALT: TFloatField
      FieldName = 'PERCENTUALALT'
      Origin = 'BASEDADOS.BENEFPLANPREV.PERCENTUALALT'
      Visible = False
    end
    object qryBenefUSUARIOALT: TFloatField
      FieldName = 'USUARIOALT'
      Origin = 'BASEDADOS.BENEFPLANPREV.USUARIOALT'
      Visible = False
    end
    object qryBenefNUMDIASBENEFANT: TFloatField
      FieldName = 'NUMDIASBENEFANT'
      Origin = 'BASEDADOS.BENEFPLANPREV.NUMDIASBENEFANT'
      Visible = False
    end
    object qryBenefIDRUBACERTOABONO: TFloatField
      FieldName = 'IDRUBACERTOABONO'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRUBACERTOABONO'
      Visible = False
    end
    object qryBenefIDRUBDEVANTABONO: TFloatField
      FieldName = 'IDRUBDEVANTABONO'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRUBDEVANTABONO'
      Visible = False
    end
    object qryBenefIDRUBATRASOABONO: TFloatField
      FieldName = 'IDRUBATRASOABONO'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRUBATRASOABONO'
      Visible = False
    end
    object qryBenefIDRUBATR13ACJUD: TFloatField
      FieldName = 'IDRUBATR13ACJUD'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRUBATR13ACJUD'
      Visible = False
    end
    object qryBenefIDRUBDEV13ACJUD: TFloatField
      FieldName = 'IDRUBDEV13ACJUD'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRUBDEV13ACJUD'
      Visible = False
    end
    object qryBenefIDRUBATRREVACJUD: TFloatField
      FieldName = 'IDRUBATRREVACJUD'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRUBATRREVACJUD'
      Visible = False
    end
    object qryBenefIDRUBDEVREVACJUD: TFloatField
      FieldName = 'IDRUBDEVREVACJUD'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRUBDEVREVACJUD'
      Visible = False
    end
    object qryBenefIDRUBATRREVISAO: TFloatField
      FieldName = 'IDRUBATRREVISAO'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRUBATRREVISAO'
      Visible = False
    end
    object qryBenefIDRUBDEVREVISAO: TFloatField
      FieldName = 'IDRUBDEVREVISAO'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRUBDEVREVISAO'
      Visible = False
    end
    object qryBenefIDREGRAQUITANT: TFloatField
      FieldName = 'IDREGRAQUITANT'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDREGRAQUITANT'
      Visible = False
    end
    object qryBenefIDRUBRICAQUITANT: TFloatField
      FieldName = 'IDRUBRICAQUITANT'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRUBRICAQUITANT'
      Visible = False
    end
    object qryBenefFLGDESINDRES: TFloatField
      FieldName = 'FLGDESINDRES'
      Origin = 'BASEDADOS.BENEFPLANPREV.FLGDESINDRES'
      Visible = False
    end
    object qryBenefIDRUBNORADICJUD: TFloatField
      FieldName = 'IDRUBNORADICJUD'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRUBNORADICJUD'
      Visible = False
    end
    object qryBenefIDRUBATRADICJUD: TFloatField
      FieldName = 'IDRUBATRADICJUD'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRUBATRADICJUD'
      Visible = False
    end
    object qryBenefIDRUBDEVADICJUD: TFloatField
      FieldName = 'IDRUBDEVADICJUD'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDRUBDEVADICJUD'
      Visible = False
    end
    object qryBenefFLGISENTOIRRF: TFloatField
      FieldName = 'FLGISENTOIRRF'
      Origin = 'BASEDADOS.BENEFPLANPREV.FLGISENTOIRRF'
      Visible = False
    end
    object qryBenefFLGVALORTITULAR1: TFloatField
      FieldName = 'FLGVALORTITULAR1'
      Origin = 'BASEDADOS.BENEFPLANPREV.FLGVALORTITULAR1'
      Visible = False
    end
    object qryBenefFLGVALORTITULAR2: TFloatField
      FieldName = 'FLGVALORTITULAR2'
      Origin = 'BASEDADOS.BENEFPLANPREV.FLGVALORTITULAR2'
      Visible = False
    end
    object qryBenefFLGVALORTITULAR3: TFloatField
      FieldName = 'FLGVALORTITULAR3'
      Origin = 'BASEDADOS.BENEFPLANPREV.FLGVALORTITULAR3'
      Visible = False
    end
    object qryBenefIDREGRAVALIDAOPTEXTO1: TFloatField
      FieldName = 'IDREGRAVALIDAOPTEXTO1'
      Visible = False
    end
    object qryBenefIDREGRAVALIDAOPTEXTO2: TFloatField
      FieldName = 'IDREGRAVALIDAOPTEXTO2'
      Visible = False
    end
    object qryBenefIDREGRAVALIDAOPTEXTO3: TFloatField
      FieldName = 'IDREGRAVALIDAOPTEXTO3'
      Visible = False
    end
    object qryBenefIDREGRACALCOPTEXTO1: TFloatField
      FieldName = 'IDREGRACALCOPTEXTO1'
      Visible = False
    end
    object qryBenefIDREGRACALCOPTEXTO2: TFloatField
      FieldName = 'IDREGRACALCOPTEXTO2'
      Visible = False
    end
    object qryBenefIDREGRACALCOPTEXTO3: TFloatField
      FieldName = 'IDREGRACALCOPTEXTO3'
      Visible = False
    end
    object qryBenefNOMECAMPOTEXTO1: TStringField
      FieldName = 'NOMECAMPOTEXTO1'
      Visible = False
      Size = 200
    end
    object qryBenefNOMECAMPOTEXTO2: TStringField
      FieldName = 'NOMECAMPOTEXTO2'
      Visible = False
      Size = 200
    end
    object qryBenefNOMECAMPOTEXTO3: TStringField
      FieldName = 'NOMECAMPOTEXTO3'
      Visible = False
      Size = 200
    end
    object qryBenefFLGOBRIGAOPTEXTO1: TFloatField
      FieldName = 'FLGOBRIGAOPTEXTO1'
      Visible = False
    end
    object qryBenefFLGOBRIGAOPTEXTO2: TFloatField
      FieldName = 'FLGOBRIGAOPTEXTO2'
      Visible = False
    end
    object qryBenefFLGOBRIGAOPTEXTO3: TFloatField
      FieldName = 'FLGOBRIGAOPTEXTO3'
      Visible = False
    end
    object qryBenefFLGEDITAOPTEXTO1: TFloatField
      FieldName = 'FLGEDITAOPTEXTO1'
      Visible = False
    end
    object qryBenefFLGEDITAOPTEXTO2: TFloatField
      FieldName = 'FLGEDITAOPTEXTO2'
      Visible = False
    end
    object qryBenefFLGEDITAOPTEXTO3: TFloatField
      FieldName = 'FLGEDITAOPTEXTO3'
      Visible = False
    end
    object qryBenefNUMOPCOESTEXTO: TFloatField
      FieldName = 'NUMOPCOESTEXTO'
      Visible = False
    end
    object qryBenefFLGOPCAOTEXTO: TFloatField
      FieldName = 'FLGOPCAOTEXTO'
      Visible = False
    end
    object qryBenefIDRUBRICAATRASORRA: TFloatField
      FieldName = 'IDRUBRICAATRASORRA'
      Visible = False
    end
    object qryBenefIDRUBRICADEVOLUCAORRA: TFloatField
      FieldName = 'IDRUBRICADEVOLUCAORRA'
      Visible = False
    end
    object qryBenefIDRUBRICAREVATRASORRA: TFloatField
      FieldName = 'IDRUBRICAREVATRASORRA'
      Visible = False
    end
    object qryBenefIDRUBRICAREVDEVOLUCAORRA: TFloatField
      FieldName = 'IDRUBRICAREVDEVOLUCAORRA'
      Visible = False
    end
    object qryBenefIDRUBBIT: TFloatField
      FieldName = 'IDRUBBIT'
      Visible = False
    end
    object qryBenefIDRUBATRABIT: TFloatField
      FieldName = 'IDRUBATRABIT'
      Visible = False
    end
    object qryBenefIDRUBDEVABIT: TFloatField
      FieldName = 'IDRUBDEVABIT'
      Visible = False
    end
    object qryBenefIDRUB13BIT: TFloatField
      FieldName = 'IDRUB13BIT'
      Visible = False
    end
    object qryBenefIDRUBATR13BIT: TFloatField
      FieldName = 'IDRUBATR13BIT'
      Visible = False
    end
    object qryBenefIDRUBDEV13BIT: TFloatField
      FieldName = 'IDRUBDEV13BIT'
      Visible = False
    end
    object qryBenefIDRUBREVABIT: TFloatField
      FieldName = 'IDRUBREVABIT'
      Visible = False
    end
    object qryBenefIDRUBATRREVBIT: TFloatField
      FieldName = 'IDRUBATRREVBIT'
      Visible = False
    end
    object qryBenefIDRUBDEVREVBIT: TFloatField
      FieldName = 'IDRUBDEVREVBIT'
      Visible = False
    end
    object qryBenefIDRUBRICADIVIDABENEFNORMAL: TFloatField
      FieldName = 'IDRUBRICADIVIDABENEFNORMAL'
      Visible = False
    end
    object qryBenefIDRUBRICADIVIDABENEFICIODEVOL: TFloatField
      FieldName = 'IDRUBRICADIVIDABENEFICIODEVOL'
      Visible = False
    end
    object qryBenefIDRUBRICADIVIDABENEFTRASO: TFloatField
      FieldName = 'IDRUBRICADIVIDABENEFTRASO'
      Visible = False
    end
    object qryBenefIDRUBRICADIVIDABENEF13: TFloatField
      FieldName = 'IDRUBRICADIVIDABENEF13'
      Visible = False
    end
    object qryBenefIDRUBRICADIVIDABENEF13DEVOL: TFloatField
      FieldName = 'IDRUBRICADIVIDABENEF13DEVOL'
      Visible = False
    end
    object qryBenefIDRUBRICADIVIDABENEF13ATRASO: TFloatField
      FieldName = 'IDRUBRICADIVIDABENEF13ATRASO'
      Visible = False
    end
    object qryBenefFLGAPRESENTABSFAB: TFloatField
      FieldName = 'FLGAPRESENTABSFAB'
      Visible = False
    end
    object qryBenefFLGAPRESENTADEFICIT: TFloatField
      FieldName = 'FLGAPRESENTADEFICIT'
      Visible = False
    end
    object qryBenefIDREGRACALCBS: TFloatField
      FieldName = 'IDREGRACALCBS'
      Visible = False
    end
    object qryBenefIDREGRACALCFAB: TFloatField
      FieldName = 'IDREGRACALCFAB'
      Visible = False
    end
    object qryBenefIDREGRACALCBASEDEFICIT: TFloatField
      FieldName = 'IDREGRACALCBASEDEFICIT'
      Visible = False
    end
    object qryBenefIDRUBRICACORATRASORRA: TFloatField
      FieldName = 'IDRUBRICACORATRASORRA'
      Visible = False
    end
    object qryBenefIDRUBRICACORDEVOLUCAORRA: TFloatField
      FieldName = 'IDRUBRICACORDEVOLUCAORRA'
      Visible = False
    end
    object qryBenefIDRUBRICAACERTO: TFloatField
      FieldName = 'IDRUBRICAACERTO'
      Visible = False
    end
    object qryBenefIDPLANPREVCONTAB: TFloatField
      FieldName = 'IDPLANPREVCONTAB'
    end
  end
  object updBenef: TUpdateSQL
    ModifySQL.Strings = (
      'update BENEFPLANPREV'
      'set'
      '       FLGABONOFINALBEN = :FLGABONOFINALBEN,'
      '       FLGACEITAOPCAO = :FLGACEITAOPCAO,'
      '       FLGCALCTODOMES = :FLGCALCTODOMES,'
      '       FLGCORRECAOATRASO = :FLGCORRECAOATRASO,'
      '       FLGCORRECAODEVOL = :FLGCORRECAODEVOL,'
      '       FLGEDITAOP1 = :FLGEDITAOP1,'
      '       FLGEDITAOP2 = :FLGEDITAOP2,'
      '       FLGEDITAOP3 = :FLGEDITAOP3,'
      '       FLGOBRIGANPROC = :FLGOBRIGANPROC,'
      '       FLGOBRIGAOP1 = :FLGOBRIGAOP1,'
      '       FLGOBRIGAOP2 = :FLGOBRIGAOP2,'
      '       FLGOBRIGAOP3 = :FLGOBRIGAOP3,'
      '       FLGPOSSUIABONO = :FLGPOSSUIABONO,'
      '       FLGQUITAASSISTEN = :FLGQUITAASSISTEN,'
      '       FLGQUITAEMPRESTI = :FLGQUITAEMPRESTI,'
      '       FLGQUITAPREVIDEN = :FLGQUITAPREVIDEN,'
      '       FLGRECALCULAFIM = :FLGRECALCULAFIM,'
      '       FLGREFERENCIA = :FLGREFERENCIA,'
      '       IDBENEFREF = :IDBENEFREF,'
      '       IDPLANOBENEFREF = :IDPLANOBENEFREF,'
      '       IDREGRABENEFICIA = :IDREGRABENEFICIA,'
      '       CODALTERADORCORR = :CODALTERADORCORR,'
      '       IDREGRACALCABONO = :IDREGRACALCABONO,'
      '       IDREGRACALCINSS = :IDREGRACALCINSS,'
      '       IDREGRACALCOP1 = :IDREGRACALCOP1,'
      '       IDREGRACALCOP2 = :IDREGRACALCOP2,'
      '       IDREGRACALCOP3 = :IDREGRACALCOP3,'
      '       IDREGRACALCULO = :IDREGRACALCULO,'
      '       IDREGRAELEGIBILI = :IDREGRAELEGIBILI,'
      '       IDREGRAFIM = :IDREGRAFIM,'
      '       IDREGRAINICIO = :IDREGRAINICIO,'
      '       IDREGRAPAGAATRASO = :IDREGRAPAGAATRASO,'
      '       IDREGRAPAGAMENTO = :IDREGRAPAGAMENTO,'
      '       IDREGRAPRIMPAGTO = :IDREGRAPRIMPAGTO,'
      '       IDREGRASIMULA = :IDREGRASIMULA,'
      '       IDREGRAULTPAGTO = :IDREGRAULTPAGTO,'
      '       IDREGRAVALIDAOP1 = :IDREGRAVALIDAOP1,'
      '       IDREGRAVALIDAOP2 = :IDREGRAVALIDAOP2,'
      '       IDREGRAVALIDAOP3 = :IDREGRAVALIDAOP3,'
      '       IDRGVALORTOTAL = :IDRGVALORTOTAL,'
      '       IDRUBABONO = :IDRUBABONO,'
      '       IDRUBANTECABONO = :IDRUBANTECABONO,'
      '       IDRUBDESCANTECAB = :IDRUBDESCANTECAB,'
      '       IDRUBDEVOLUCAO = :IDRUBDEVOLUCAO,'
      '       IDRUBRICA = :IDRUBRICA,'
      '       IDRUBRICACORRECAO = :IDRUBRICACORRECAO,'
      '       IDRUBRICADIF = :IDRUBRICADIF,'
      '       INDICEREAJBENEF = :INDICEREAJBENEF,'
      '       NOMEVALORBASE1 = :NOMEVALORBASE1,'
      '       NOMEVALORBASE2 = :NOMEVALORBASE2,'
      '       NOMEVALORBASE3 = :NOMEVALORBASE3,'
      '       NUMOPCOES = :NUMOPCOES,'
      '       PRAZOCONCESSAO = :PRAZOCONCESSAO,'
      '       TPMODALIDADE = :TPMODALIDADE,'
      '       FLGBENEFINF = :FLGBENEFINF,'
      '       IDRUBRICAATRASO = :IDRUBRICAATRASO,'
      '       IDRUBRICAREVISAO = :IDRUBRICAREVISAO,'
      '       FLGDATAINDICERES = :FLGDATAINDICERES,'
      '       FLGUSAEVOLFUNC = :FLGUSAEVOLFUNC,'
      '       FLGPAGAINSS = :FLGPAGAINSS,'
      '       FLGPAGAINTEG = :FLGPAGAINTEG,'
      '       IDRELATBENEFICIO = :IDRELATBENEFICIO,'
      '       ORIGEMCMBENEFICIO = :ORIGEMCMBENEFICIO,'
      '       IDREGRABENEFMIN = :IDREGRABENEFMIN,'
      '       IDREGRASRB = :IDREGRASRB,'
      '       FLGACEITAACERTO = :FLGACEITAACERTO,'
      '       IDRUBDEVOLABONO = :IDRUBDEVOLABONO,'
      '       IDRUBADIANT = :IDRUBADIANT,'
      '       IDRUBDEVOLADIANT = :IDRUBDEVOLADIANT,'
      '       IDRUBADIANT13 = :IDRUBADIANT13,'
      '       IDRUBDEVADIANT13 = :IDRUBDEVADIANT13,'
      '       FLGACEITAZERO = :FLGACEITAZERO,'
      '       IDRUBACJUD = :IDRUBACJUD,'
      '       IDRUBATRACJUD = :IDRUBATRACJUD,'
      '       IDRUBDEVACJUD = :IDRUBDEVACJUD,'
      '       IDRUBREVACJUD = :IDRUBREVACJUD,'
      '       IDRUBADTACJUD = :IDRUBADTACJUD,'
      '       IDRUBDADACJUD = :IDRUBDADACJUD,'
      '       IDRUB13ACJUD = :IDRUB13ACJUD,'
      '       IDRUB13DESACJUD = :IDRUB13DESACJUD,'
      '       IDRUB13PGAN1ACJUD = :IDRUB13PGAN1ACJUD,'
      '       IDRUB13DVANACJUD = :IDRUB13DVANACJUD,'
      '       IDRUB13ADTACJUD = :IDRUB13ADTACJUD,'
      '       IDRUB13DADACJUD = :IDRUB13DADACJUD,'
      '       IDREGRADTINDRES = :IDREGRADTINDRES,'
      '       IDRGDATAELEG = :IDRGDATAELEG,'
      '       IDRGVALORPREV = :IDRGVALORPREV,'
      '       FLGACTVLRSRB = :FLGACTVLRSRB,'
      '       FLGACTVLRATUAL = :FLGACTVLRATUAL,'
      '       FLGACTVLRTOTBEN = :FLGACTVLRTOTBEN,'
      '       FLGTPBUSCAVALOR = :FLGTPBUSCAVALOR,'
      '       FLGMOVRESAPOSCONC = :FLGMOVRESAPOSCONC,'
      '       IDRGPLANPREVCONT = :IDRGPLANPREVCONT,'
      '       LIMITEALT = :LIMITEALT,'
      '       PERCENTUALALT = :PERCENTUALALT,'
      '       USUARIOALT     = :USUARIOALT,'
      '       NUMDIASBENEFANT = :NUMDIASBENEFANT,'
      '       IDRUBACERTOABONO = :IDRUBACERTOABONO,'
      '       IDRUBDEVANTABONO = :IDRUBDEVANTABONO,'
      '       IDRUBATRASOABONO = :IDRUBATRASOABONO  ,'
      '       IDRUBATR13ACJUD = :IDRUBATR13ACJUD  ,  '
      '       IDRUBDEV13ACJUD = :IDRUBDEV13ACJUD   , '
      '       IDRUBATRREVACJUD =  :IDRUBATRREVACJUD   ,  '
      '       IDRUBDEVREVACJUD =  :IDRUBDEVREVACJUD   ,   '
      '       IDRUBATRREVISAO =   :IDRUBATRREVISAO  ,  '
      '       IDRUBDEVREVISAO  =  :IDRUBDEVREVISAO ,'
      '       IDREGRAQUITANT   = :IDREGRAQUITANT,'
      '       IDRUBRICAQUITANT = :IDRUBRICAQUITANT,'
      '       FLGDESINDRES     = :FLGDESINDRES,'
      '       IDRUBNORADICJUD  = :IDRUBNORADICJUD,'
      '       IDRUBATRADICJUD  = :IDRUBATRADICJUD,'
      '       IDRUBDEVADICJUD  = :IDRUBDEVADICJUD,'
      '       FLGISENTOIRRF  = :FLGISENTOIRRF,'
      '       FLGVALORTITULAR1 = :FLGVALORTITULAR1, '
      '       FLGVALORTITULAR2 = :FLGVALORTITULAR2, '
      '       FLGVALORTITULAR3 = :FLGVALORTITULAR3,'
      '       IDRUBRICAATRASORRA      =:IDRUBRICAATRASORRA,'
      '       IDRUBRICADEVOLUCAORRA   =:IDRUBRICADEVOLUCAORRA,'
      '       IDRUBRICAREVATRASORRA   =:IDRUBRICAREVATRASORRA,'
      '       IDRUBRICAREVDEVOLUCAORRA=:IDRUBRICAREVDEVOLUCAORRA,'
      '       IDRUBRICACORATRASORRA = :IDRUBRICACORATRASORRA,'
      '       IDRUBRICACORDEVOLUCAORRA = :IDRUBRICACORDEVOLUCAORRA,'
      '      IDREGRAVALIDAOPTEXTO1 = :IDREGRAVALIDAOPTEXTO1,'
      '      IDREGRAVALIDAOPTEXTO2 = :IDREGRAVALIDAOPTEXTO2,'
      '      IDREGRAVALIDAOPTEXTO3 = :IDREGRAVALIDAOPTEXTO3,'
      '      IDREGRACALCOPTEXTO1  = :IDREGRACALCOPTEXTO1,'
      '      IDREGRACALCOPTEXTO2  = :IDREGRACALCOPTEXTO2,'
      '      IDREGRACALCOPTEXTO3  = :IDREGRACALCOPTEXTO3,'
      '      NOMECAMPOTEXTO1  = :NOMECAMPOTEXTO1,'
      '      NOMECAMPOTEXTO2  = :NOMECAMPOTEXTO2,'
      '      NOMECAMPOTEXTO3 = :NOMECAMPOTEXTO3,'
      '       FLGOBRIGAOPTEXTO1 = :FLGOBRIGAOPTEXTO1,'
      '       FLGOBRIGAOPTEXTO2  = :FLGOBRIGAOPTEXTO2,'
      '       FLGOBRIGAOPTEXTO3 = :FLGOBRIGAOPTEXTO3,'
      '       FLGEDITAOPTEXTO1  = :FLGEDITAOPTEXTO1,'
      '       FLGEDITAOPTEXTO2 = :FLGEDITAOPTEXTO2,'
      '       FLGEDITAOPTEXTO3  = :FLGEDITAOPTEXTO3,'
      '       NUMOPCOESTEXTO  = :NUMOPCOESTEXTO,'
      '      FLGOPCAOTEXTO = :FLGOPCAOTEXTO,'
      '      IDRUBBIT= :IDRUBBIT, '
      '      IDRUBATRABIT = :IDRUBATRABIT,'
      '      IDRUBDEVABIT = :IDRUBDEVABIT  ,'
      '      IDRUB13BIT = :IDRUB13BIT,'
      '      IDRUBATR13BIT = :IDRUBATR13BIT,'
      '      IDRUBDEV13BIT = :IDRUBDEV13BIT,'
      '      IDRUBREVABIT= :IDRUBREVABIT,'
      '      IDRUBATRREVBIT = :IDRUBATRREVBIT,'
      '      IDRUBDEVREVBIT = :IDRUBDEVREVBIT,'
      ''
      '      IDRUBRICADIVIDABENEFNORMAL = :IDRUBRICADIVIDABENEFNORMAL,'
      
        '      IDRUBRICADIVIDABENEFICIODEVOL = :IDRUBRICADIVIDABENEFICIOD' +
        'EVOL,'
      '      IDRUBRICADIVIDABENEFTRASO = :IDRUBRICADIVIDABENEFTRASO,'
      '      IDRUBRICADIVIDABENEF13 = :IDRUBRICADIVIDABENEF13,'
      
        '      IDRUBRICADIVIDABENEF13DEVOL = :IDRUBRICADIVIDABENEF13DEVOL' +
        ','
      
        '      IDRUBRICADIVIDABENEF13ATRASO = :IDRUBRICADIVIDABENEF13ATRA' +
        'SO,'
      '      FLGAPRESENTABSFAB = :FLGAPRESENTABSFAB,'
      '      FLGAPRESENTADEFICIT = :FLGAPRESENTADEFICIT,'
      '      IDREGRACALCBS = :IDREGRACALCBS,'
      '      IDREGRACALCFAB = :IDREGRACALCFAB,'
      '      IDREGRACALCBASEDEFICIT = :IDREGRACALCBASEDEFICIT,'
      '      IDRUBRICAACERTO = :IDRUBRICAACERTO,'
      '      IDPLANPREVCONTAB = :IDPLANPREVCONTAB'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    InsertSQL.Strings = (
      'insert into BENEFPLANPREV ('
      
        '       IDPLANOPREV,          IDBENEFICIO,             FLGABONOFI' +
        'NALBEN,'
      '       FLGACEITAOPCAO,       FLGCALCTODOMES,'
      
        '       FLGCORRECAOATRASO,    FLGCORRECAODEVOL,        FLGEDITAOP' +
        '1,'
      
        '       FLGEDITAOP2,          FLGEDITAOP3,             FLGOBRIGAN' +
        'PROC,'
      
        '       FLGOBRIGAOP1,         FLGOBRIGAOP2,            FLGOBRIGAO' +
        'P3,'
      
        '       FLGPOSSUIABONO,       FLGQUITAASSISTEN,        FLGQUITAEM' +
        'PRESTI,'
      
        '       FLGQUITAPREVIDEN,     FLGRECALCULAFIM,         FLGREFEREN' +
        'CIA,'
      '       IDBENEFREF,           IDPLANOBENEFREF,'
      '       IDREGRABENEFICIA,     CODALTERADORCORR,'
      
        '       IDREGRACALCABONO,     IDREGRACALCINSS,         IDREGRACAL' +
        'COP1,'
      
        '       IDREGRACALCOP2,       IDREGRACALCOP3,          IDREGRACAL' +
        'CULO,'
      
        '       IDREGRAELEGIBILI,     IDREGRAFIM,              IDREGRAINI' +
        'CIO,'
      '       IDREGRAPAGAATRASO,    IDREGRAPAGAMENTO,'
      '       IDREGRAPRIMPAGTO,     IDREGRASIMULA,'
      '       IDREGRAULTPAGTO,      IDREGRAVALIDAOP1,'
      '       IDREGRAVALIDAOP2,     IDREGRAVALIDAOP3,'
      
        '       IDRGVALORTOTAL,       IDRUBABONO,              IDRUBANTEC' +
        'ABONO,'
      '       IDRUBDESCANTECAB,     IDRUBDEVOLUCAO,          IDRUBRICA,'
      '       IDRUBRICACORRECAO,    IDRUBRICADIF,'
      '       INDICEREAJBENEF,      NOMEVALORBASE1,'
      '       NOMEVALORBASE2,       NOMEVALORBASE3,          NUMOPCOES,'
      
        '       PRAZOCONCESSAO,       TPMODALIDADE,            FLGBENEFIN' +
        'F,'
      
        '       IDRUBRICAATRASO,      IDRUBRICAREVISAO,        FLGDATAIND' +
        'ICERES,'
      
        '       FLGUSAEVOLFUNC,       FLGPAGAINSS,             FLGPAGAINT' +
        'EG,'
      
        '       IDRELATBENEFICIO,     ORIGEMCMBENEFICIO,       IDREGRABEN' +
        'EFMIN,'
      
        '       IDREGRASRB,           FLGACEITAACERTO,         IDRUBDEVOL' +
        'ABONO,'
      
        '       IDRUBADIANT,          IDRUBDEVOLADIANT,        IDRUBADIAN' +
        'T13,'
      '       IDRUBDEVADIANT13,     FLGACEITAZERO,'
      
        '       IDRUBACJUD,           IDRUBATRACJUD,           IDRUBDEVAC' +
        'JUD,'
      
        '       IDRUBREVACJUD,        IDRUBADTACJUD,           IDRUBDADAC' +
        'JUD,'
      
        '       IDRUB13ACJUD,         IDRUB13DESACJUD,         IDRUB13PGA' +
        'N1ACJUD,'
      
        '       IDRUB13DVANACJUD,     IDRUB13ADTACJUD,         IDRUB13DAD' +
        'ACJUD,'
      
        '       IDREGRADTINDRES,      IDRGDATAELEG,            IDRGVALORP' +
        'REV,'
      
        '       FLGACTVLRSRB,         FLGACTVLRATUAL,          FLGACTVLRT' +
        'OTBEN,'
      '       FLGTPBUSCAVALOR,      FLGMOVRESAPOSCONC,'
      
        '       IDRGPLANPREVCONT,     LIMITEALT, PERCENTUALALT, USUARIOAL' +
        'T,'
      '       NUMDIASBENEFANT,      IDRUBACERTOABONO,        '
      '       IDRUBDEVANTABONO,'
      '       IDRUBATRASOABONO,  IDRUBATR13ACJUD,  IDRUBDEV13ACJUD,'
      '       IDRUBATRREVACJUD,  IDRUBDEVREVACJUD,   IDRUBATRREVISAO,'
      '       IDRUBDEVREVISAO,   FLGDESINDRES,'
      '       IDRUBNORADICJUD, IDRUBATRADICJUD, IDRUBDEVADICJUD, '
      
        '       FLGISENTOIRRF,  FLGVALORTITULAR1, FLGVALORTITULAR2, FLGVA' +
        'LORTITULAR3,'
      
        '      IDREGRAVALIDAOPTEXTO1, IDREGRAVALIDAOPTEXTO2, IDREGRAVALID' +
        'AOPTEXTO3,'
      
        '      IDREGRACALCOPTEXTO1, IDREGRACALCOPTEXTO2, IDREGRACALCOPTEX' +
        'TO3,'
      '      NOMECAMPOTEXTO1, NOMECAMPOTEXTO2, NOMECAMPOTEXTO3, '
      '      FLGOBRIGAOPTEXTO1, FLGOBRIGAOPTEXTO2, FLGOBRIGAOPTEXTO3, '
      '      FLGEDITAOPTEXTO1,'
      '      IDRUBRICAATRASORRA,IDRUBRICADEVOLUCAORRA,'
      '      IDRUBRICAREVATRASORRA,IDRUBRICAREVDEVOLUCAORRA,'
      '      IDRUBRICACORATRASORRA, IDRUBRICACORDEVOLUCAORRA,'
      '      FLGEDITAOPTEXTO2, FLGEDITAOPTEXTO3, '
      
        '      NUMOPCOESTEXTO, FLGOPCAOTEXTO,    IDRUBBIT,   IDRUBATRABIT' +
        ' ,   IDRUBDEVABIT  ,   IDRUB13BIT  ,  IDRUBATR13BIT ,  IDRUBDEV1' +
        '3BIT,  IDRUBREVABIT,   IDRUBATRREVBIT ,    IDRUBDEVREVBIT,'
      
        '      IDRUBRICADIVIDABENEFNORMAL,IDRUBRICADIVIDABENEFICIODEVOL,I' +
        'DRUBRICADIVIDABENEFTRASO,IDRUBRICADIVIDABENEF13,IDRUBRICADIVIDAB' +
        'ENEF13DEVOL,IDRUBRICADIVIDABENEF13ATRASO,'
      
        '      FLGAPRESENTABSFAB, FLGAPRESENTADEFICIT, IDREGRACALCBS, IDR' +
        'EGRACALCFAB, IDREGRACALCBASEDEFICIT, IDRUBRICAACERTO, IDPLANPREV' +
        'CONTAB'
      '      )'
      'VALUES ('
      
        '       :IDPLANOPREV,          :IDBENEFICIO,             :FLGABON' +
        'OFINALBEN,'
      '       :FLGACEITAOPCAO,       :FLGCALCTODOMES,'
      
        '       :FLGCORRECAOATRASO,    :FLGCORRECAODEVOL,        :FLGEDIT' +
        'AOP1,'
      
        '       :FLGEDITAOP2,          :FLGEDITAOP3,             :FLGOBRI' +
        'GANPROC,'
      
        '       :FLGOBRIGAOP1,         :FLGOBRIGAOP2,            :FLGOBRI' +
        'GAOP3,'
      
        '       :FLGPOSSUIABONO,       :FLGQUITAASSISTEN,        :FLGQUIT' +
        'AEMPRESTI,'
      
        '       :FLGQUITAPREVIDEN,     :FLGRECALCULAFIM,         :FLGREFE' +
        'RENCIA,'
      '       :IDBENEFREF,           :IDPLANOBENEFREF,'
      '       :IDREGRABENEFICIA,     :CODALTERADORCORR,'
      
        '       :IDREGRACALCABONO,     :IDREGRACALCINSS,         :IDREGRA' +
        'CALCOP1,'
      
        '       :IDREGRACALCOP2,       :IDREGRACALCOP3,          :IDREGRA' +
        'CALCULO,'
      
        '       :IDREGRAELEGIBILI,     :IDREGRAFIM,              :IDREGRA' +
        'INICIO,'
      '       :IDREGRAPAGAATRASO,    :IDREGRAPAGAMENTO,'
      '       :IDREGRAPRIMPAGTO,     :IDREGRASIMULA,'
      '       :IDREGRAULTPAGTO,      :IDREGRAVALIDAOP1,'
      '       :IDREGRAVALIDAOP2,     :IDREGRAVALIDAOP3,'
      
        '       :IDRGVALORTOTAL,       :IDRUBABONO,              :IDRUBAN' +
        'TECABONO,'
      
        '       :IDRUBDESCANTECAB,     :IDRUBDEVOLUCAO,          :IDRUBRI' +
        'CA,'
      '       :IDRUBRICACORRECAO,    :IDRUBRICADIF,'
      '       :INDICEREAJBENEF,      :NOMEVALORBASE1,'
      
        '       :NOMEVALORBASE2,       :NOMEVALORBASE3,          :NUMOPCO' +
        'ES,'
      
        '       :PRAZOCONCESSAO,       :TPMODALIDADE,            :FLGBENE' +
        'FINF,'
      
        '       :IDRUBRICAATRASO,      :IDRUBRICAREVISAO,        :FLGDATA' +
        'INDICERES,'
      
        '       :FLGUSAEVOLFUNC,       :FLGPAGAINSS,             :FLGPAGA' +
        'INTEG,'
      
        '       :IDRELATBENEFICIO,     :ORIGEMCMBENEFICIO,       :IDREGRA' +
        'BENEFMIN,'
      
        '       :IDREGRASRB,           :FLGACEITAACERTO,         :IDRUBDE' +
        'VOLABONO,'
      
        '       :IDRUBADIANT,          :IDRUBDEVOLADIANT,        :IDRUBAD' +
        'IANT13,'
      '       :IDRUBDEVADIANT13,     :FLGACEITAZERO,'
      
        '       :IDRUBACJUD,           :IDRUBATRACJUD,           :IDRUBDE' +
        'VACJUD,'
      
        '       :IDRUBREVACJUD,        :IDRUBADTACJUD,           :IDRUBDA' +
        'DACJUD,'
      
        '       :IDRUB13ACJUD,         :IDRUB13DESACJUD,         :IDRUB13' +
        'PGAN1ACJUD,'
      
        '       :IDRUB13DVANACJUD,     :IDRUB13ADTACJUD,         :IDRUB13' +
        'DADACJUD,'
      
        '       :IDREGRADTINDRES,      :IDRGDATAELEG,            :IDRGVAL' +
        'ORPREV,'
      
        '       :FLGACTVLRSRB,         :FLGACTVLRATUAL,          :FLGACTV' +
        'LRTOTBEN,'
      '       :FLGTPBUSCAVALOR,      :FLGMOVRESAPOSCONC,'
      
        '       :IDRGPLANPREVCONT,     :LIMITEALT, :PERCENTUALALT, :USUAR' +
        'IOALT,'
      '       :NUMDIASBENEFANT,      :IDRUBACERTOABONO,'
      '       :IDRUBDEVANTABONO,'
      '       :IDRUBATRASOABONO,  :IDRUBATR13ACJUD,  :IDRUBDEV13ACJUD,'
      
        '       :IDRUBATRREVACJUD,  :IDRUBDEVREVACJUD,   :IDRUBATRREVISAO' +
        ','
      '       :IDRUBDEVREVISAO,   :FLGDESINDRES,'
      '       :IDRUBNORADICJUD,   :IDRUBATRADICJUD,  :IDRUBDEVADICJUD,'
      
        '       :FLGISENTOIRRF, :FLGVALORTITULAR1, :FLGVALORTITULAR2, :FL' +
        'GVALORTITULAR3,'
      
        '       :IDREGRAVALIDAOPTEXTO1, :IDREGRAVALIDAOPTEXTO2, :IDREGRAV' +
        'ALIDAOPTEXTO3,'
      
        '      :IDREGRACALCOPTEXTO1, :IDREGRACALCOPTEXTO2, :IDREGRACALCOP' +
        'TEXTO3,'
      '      :NOMECAMPOTEXTO1, :NOMECAMPOTEXTO2, :NOMECAMPOTEXTO3,'
      
        '      :FLGOBRIGAOPTEXTO1, :FLGOBRIGAOPTEXTO2, :FLGOBRIGAOPTEXTO3' +
        ','
      '      :FLGEDITAOPTEXTO1,'
      
        '      :IDRUBRICAATRASORRA,:IDRUBRICADEVOLUCAORRA,:IDRUBRICAREVAT' +
        'RASORRA,:IDRUBRICAREVDEVOLUCAORRA,'
      '      :IDRUBRICACORATRASORRA, :IDRUBRICACORDEVOLUCAORRA,'
      '      :FLGEDITAOPTEXTO2, :FLGEDITAOPTEXTO3,'
      '      :NUMOPCOESTEXTO, :FLGOPCAOTEXTO,'
      
        '       :IDRUBBIT,   :IDRUBATRABIT ,   :IDRUBDEVABIT  ,   :IDRUB1' +
        '3BIT  ,  :IDRUBATR13BIT ,  :IDRUBDEV13BIT,  :IDRUBREVABIT,   :ID' +
        'RUBATRREVBIT ,    :IDRUBDEVREVBIT,'
      
        '       :IDRUBRICADIVIDABENEFNORMAL, :IDRUBRICADIVIDABENEFICIODEV' +
        'OL, :IDRUBRICADIVIDABENEFTRASO, :IDRUBRICADIVIDABENEF13, :IDRUBR' +
        'ICADIVIDABENEF13DEVOL, :IDRUBRICADIVIDABENEF13ATRASO,'
      
        '       :FLGAPRESENTABSFAB, :FLGAPRESENTADEFICIT, :IDREGRACALCBS,' +
        ' :IDREGRACALCFAB, :IDREGRACALCBASEDEFICIT, :IDRUBRICAACERTO, :ID' +
        'PLANPREVCONTAB'
      '       )'
      ''
      ''
      ''
      ' ')
    DeleteSQL.Strings = (
      'delete from BENEFPLANPREV'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO')
    Left = 669
    Top = 5
  end
  object qryContribCorresp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT C.IDCONTRIBUICAO, C.NOME'
      'FROM   CONTPREV  CP,'
      '       CONTRIBUICAO C'
      'WHERE  CP.IDPLANOPREV = :IDPLANOPREV'
      'AND    CP.IDCONTRIBUICAO <> :IDCONTRIBUICAO'
      'AND    CP.IDCONTRIBUICAO = C.IDCONTRIBUICAO'
      'ORDER BY C.NOME')
    ValidateWithMask = True
    Left = 731
    Top = 297
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCONTRIBUICAO'
        ParamType = ptUnknown
      end>
  end
  object qryContribuicao: TwwQuery
    AfterScroll = qryContribuicaoAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCONTRIBUICAO,'
      '       FLGOBRIGATORIA, '
      '       IDTPPERIODICIDADE, NOME,'
      '       QTDEPARCELAS'
      'FROM CONTRIBUICAO'
      'ORDER BY NOME'
      ' ')
    ValidateWithMask = True
    Left = 731
    Top = 340
  end
  object qryBeneficio: TwwQuery
    AfterScroll = qryBeneficioAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT CODBENEFICIO,         CODNATUREZA,                FLGBENE' +
        'FOBRIGATO,  FLGDESTBENEF,'
      
        '       FLGRESGATE,           IDBENEFICIO,         IDEVENTOGERADO' +
        'R,'
      '       IDTPPAGTOBENEFIC,  NOME,'
      '       NUMORDEMEVENTO'
      'FROM BENEFICIO'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 688
    Top = 465
  end
  object qryTpReajuste: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTPPERIODICIDADE, NOME, QTDEMESES'
      'FROM TPPERIODICIDADE'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 630
    Top = 465
  end
  object qryBenefReferen: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT B.IDBENEFICIO, B.NOME, BP.IDREGRACALCULO'
      'FROM   BENEFICIO B, BENEFPLANPREV BP'
      'WHERE  BP.IDPLANOPREV = :IDPLANOPREV'
      'AND    BP.FLGREFERENCIA = 1'
      'AND    BP.IDBENEFICIO = B.IDBENEFICIO'
      'ORDER BY B.NOME')
    ValidateWithMask = True
    Left = 572
    Top = 465
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryProventos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPROVENTO, DESCRICAO, CODPROVDESC'
      'FROM   PROVDESC'
      'WHERE  (FLGDESCONTO = 0)'
      '  AND (FLGTPRUBRICA LIKE '#39'%B%'#39') AND'
      '  (FLGESTADORUB <> 2)'
      'ORDER BY DESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 514
    Top = 465
  end
  object qryDescontos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPROVENTO,DESCRICAO, CODPROVDESC'
      'FROM PROVDESC'
      'WHERE (FLGDESCONTO = 1)'
      'AND   (FLGTPRUBRICA LIKE '#39'%B%'#39')'
      'ORDER BY DESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 464
    Top = 465
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 731
    Top = 253
  end
  object qryProvDesc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDPROVENTO,           DESCRICAO,               CODPROVDES' +
        'C,'
      
        '       FLGATRASODEVOL,       FLGCOMPOEREMTOTAL,       FLGCOMPOES' +
        'ALBENEF,'
      
        '       FLGCOMPOESALPART,     FLGCONSOLIDA,            FLGCONSTAF' +
        'OLHA,'
      '       FLGDESCONTO,          FLGDESCPENSAO,'
      '       FLGESPECIAL,          FLGFGTS,'
      '       FLGINCIDECONTRIB,     FLGINCIDESALPART,        FLGINSS,'
      
        '       FLGINTERNO,           FLGIRRF,                 FLGOBRIGAF' +
        'AVOREC,'
      '       FLGPRORATA,           FLGRAIS,'
      '       FLGTPRUBRICA,         FLGUSO,'
      '       NUMPRIORIDADE'
      'FROM   PROVDESC'
      ''
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updProvDesc
    ValidateWithMask = True
    Left = 740
    Top = 133
  end
  object updProvDesc: TUpdateSQL
    ModifySQL.Strings = (
      'update PROVDESC'
      'set'
      '  DESCRICAO = :DESCRICAO,'
      '  CODPROVDESC = :CODPROVDESC,'
      '  FLGATRASODEVOL = :FLGATRASODEVOL,'
      '  FLGCOMPOEREMTOTAL = :FLGCOMPOEREMTOTAL,'
      '  FLGCOMPOESALBENEF = :FLGCOMPOESALBENEF,'
      '  FLGCOMPOESALPART = :FLGCOMPOESALPART,'
      '  FLGCONSOLIDA = :FLGCONSOLIDA,'
      '  FLGCONSTAFOLHA = :FLGCONSTAFOLHA,'
      '  FLGDESCONTO = :FLGDESCONTO,'
      '  FLGDESCPENSAO = :FLGDESCPENSAO,'
      '  FLGESPECIAL = :FLGESPECIAL,'
      '  FLGFGTS = :FLGFGTS,'
      '  FLGINCIDECONTRIB = :FLGINCIDECONTRIB,'
      '  FLGINCIDESALPART = :FLGINCIDESALPART,'
      '  FLGINSS = :FLGINSS,'
      '  FLGINTERNO = :FLGINTERNO,'
      '  FLGIRRF = :FLGIRRF,'
      '  FLGOBRIGAFAVOREC = :FLGOBRIGAFAVOREC,'
      '  FLGPRORATA = :FLGPRORATA,'
      '  FLGRAIS = :FLGRAIS,'
      '  FLGTPRUBRICA = :FLGTPRUBRICA,'
      '  FLGUSO = :FLGUSO,'
      '  NUMPRIORIDADE = :NUMPRIORIDADE'
      'where'
      '  IDPROVENTO = :OLD_IDPROVENTO'
      ' '
      ' ')
    InsertSQL.Strings = (
      'insert into PROVDESC'
      
        '  (IDPROVENTO, DESCRICAO, CODPROVDESC, FLGATRASODEVOL, FLGCOMPOE' +
        'REMTOTAL, '
      
        '   FLGCOMPOESALBENEF, FLGCOMPOESALPART, FLGCONSOLIDA, FLGCONSTAF' +
        'OLHA,'
      
        '   FLGDESCONTO, FLGDESCPENSAO, FLGESPECIAL, FLGFGTS, FLGINCIDECO' +
        'NTRIB,'
      
        '   FLGINCIDESALPART, FLGINSS, FLGINTERNO, FLGIRRF, FLGOBRIGAFAVO' +
        'REC, FLGPRORATA,'
      '   FLGRAIS, FLGTPRUBRICA, FLGUSO, NUMPRIORIDADE)'
      'values'
      
        '  (:IDPROVENTO, :DESCRICAO, :CODPROVDESC, :FLGATRASODEVOL, :FLGC' +
        'OMPOEREMTOTAL,'
      
        '   :FLGCOMPOESALBENEF, :FLGCOMPOESALPART, :FLGCONSOLIDA, :FLGCON' +
        'STAFOLHA,'
      '   :FLGDESCONTO, :FLGDESCPENSAO, :FLGESPECIAL,'
      
        '   :FLGFGTS, :FLGINCIDECONTRIB, :FLGINCIDESALPART, :FLGINSS, :FL' +
        'GINTERNO,'
      '   :FLGIRRF, :FLGOBRIGAFAVOREC, :FLGPRORATA, :FLGRAIS, '
      '   :FLGTPRUBRICA, :FLGUSO, :NUMPRIORIDADE)'
      ' '
      ' ')
    DeleteSQL.Strings = (
      'delete from PROVDESC'
      'where'
      '  IDPROVENTO = :OLD_IDPROVENTO')
    Left = 740
    Top = 89
  end
  object qryRubricaXPess: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODPROVDESC,DESCRPROVDESC,IDPESSOA,IDRUBRICA'
      'FROM   RUBRICAXPESS'
      'WHERE  IDRUBRICA IN (SELECT IDPROVENTO FROM PROVDESC)'
      ''
      ' '
      ' ')
    UpdateObject = updRubricaXPess
    ValidateWithMask = True
    Left = 740
    Top = 46
  end
  object updRubricaXPess: TUpdateSQL
    ModifySQL.Strings = (
      'update RUBRICAXPESS'
      'set'
      '  CODPROVDESC = :CODPROVDESC,'
      '  DESCRPROVDESC = :DESCRPROVDESC,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDRUBRICA = :IDRUBRICA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDRUBRICA = :OLD_IDRUBRICA')
    InsertSQL.Strings = (
      'insert into RUBRICAXPESS'
      '  (CODPROVDESC, DESCRPROVDESC, IDPESSOA, IDRUBRICA)'
      'values'
      '  (:CODPROVDESC, :DESCRPROVDESC, :IDPESSOA, :IDRUBRICA)')
    DeleteSQL.Strings = (
      'delete from RUBRICAXPESS'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDRUBRICA = :OLD_IDRUBRICA')
    Left = 740
    Top = 3
  end
  object qryRubAcerto: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT IDPROVENTO,DESCRICAO, CODPROVDESC'
      'FROM PROVDESC'
      'WHERE (FLGDESCONTO = 0)'
      'ORDER BY DESCRICAO'
      '')
    ValidateWithMask = True
    Left = 498
    Top = 77
  end
  object qryAlterador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODALTERADOR, DESCRICAO, IDEMPRESA,'
      
        '       DECODE(RECPAG,'#39'R'#39', '#39'Contas a Receber'#39', '#39'Contas a Pagar'#39') ' +
        'AS TIPO'
      'FROM   TIPOALTERADOR'
      'WHERE RECPAG = '#39'R'#39
      'AND ACRESDECRES = '#39'D'#39
      'ORDER BY RECPAG, DESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 686
    Top = 98
  end
  object qryRelatorios: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NAME, IDREPORTS, ORIGEMCM'
      'FROM   REPORTS'
      'WHERE  IDMODULO = 16'
      'ORDER BY NAME')
    ValidateWithMask = True
    Left = 542
    Top = 76
  end
  object QryDescontoNormal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDPROVENTO,DESCRICAO, CODPROVDESC'
      'FROM'
      '  PROVDESC'
      'WHERE'
      '  (FLGDESCONTO    = 1)   AND'
      '  (FLGATRASODEVOL = '#39'N'#39') AND'
      '  ((FLGTPRUBRICA LIKE '#39'%B%'#39') OR (FLGTPRUBRICA LIKE '#39'%P%'#39') )'
      'ORDER BY'
      '  DESCRICAO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 600
    Top = 537
  end
  object QryDescontoAtraso: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDPROVENTO,DESCRICAO, CODPROVDESC '
      'FROM'
      '  PROVDESC'
      'WHERE'
      '  (FLGDESCONTO    = 1)    AND'
      '  (FLGATRASODEVOL = '#39'A'#39')  AND'
      '  ((FLGTPRUBRICA LIKE '#39'%B%'#39') OR (FLGTPRUBRICA LIKE '#39'%P%'#39') )'
      'ORDER BY '
      '  DESCRICAO'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 629
    Top = 538
  end
  object QryProventoDevolucao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDPROVENTO,DESCRICAO, CODPROVDESC'
      'FROM'
      '  PROVDESC'
      'WHERE'
      '  (FLGDESCONTO    = 0)    AND'
      '  (FLGATRASODEVOL = '#39'D'#39')  AND'
      '  ((FLGTPRUBRICA LIKE '#39'%B%'#39') OR (FLGTPRUBRICA LIKE '#39'%P%'#39') ) AND'
      '  (FLGESTADORUB <> 2)'
      'ORDER BY'
      '  DESCRICAO'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 722
    Top = 537
  end
  object QryProventoNormal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDPROVENTO,DESCRICAO, CODPROVDESC'
      'FROM'
      '  PROVDESC'
      'WHERE'
      '  (FLGDESCONTO    = 0)   AND'
      '  (FLGATRASODEVOL = '#39'N'#39') AND'
      '  (FLGTPRUBRICA LIKE '#39'%B%'#39') AND'
      '  (FLGESTADORUB <> 2)'
      'ORDER BY '
      '  DESCRICAO'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 752
    Top = 537
  end
  object QryProventoAtraso: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDPROVENTO,DESCRICAO, CODPROVDESC'
      'FROM'
      '  PROVDESC'
      'WHERE'
      '  (FLGDESCONTO    = 0)    AND'
      '  (FLGATRASODEVOL = '#39'A'#39')  AND'
      '  (FLGTPRUBRICA LIKE '#39'%B%'#39') AND'
      '  (FLGESTADORUB <> 2)'
      'ORDER BY'
      '  DESCRICAO'
      '')
    ValidateWithMask = True
    Left = 786
    Top = 538
  end
  object QryDescontoDevolucao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDPROVENTO,DESCRICAO, CODPROVDESC'
      'FROM'
      '  PROVDESC'
      'WHERE'
      '  (FLGDESCONTO    = 1)    AND'
      '  (FLGATRASODEVOL = '#39'D'#39')  AND'
      '  (FLGTPRUBRICA LIKE '#39'%B%'#39')'
      'ORDER BY'
      '  DESCRICAO'
      ' '
      ' '
      ''
      '')
    ValidateWithMask = True
    Left = 662
    Top = 537
  end
  object MsProvento: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PROVDESC.IDPROVENTO'
      'PROVDESC.DESCRICAO'
      'PROVDESC.CODPROVDESC'
      'PROVDESC.DESCRPROVDESC')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código Interno'
      'Descrição'
      'Código Externo'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROVDESC')
    CamposChave.Strings = (
      'PROVDESC.IDPROVENTO'
      'PROVDESC.DESCRICAO')
    Filtro.Strings = (
      'PROVDESC.FLGDESCONTO = 0'
      'PROVDESC.FLGTPRUBRICA LIKE '#39'%B%'#39)
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '130'
      '15'
      '130')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
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
    Left = 295
    Top = 541
  end
  object MsProventoNormal: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PROVDESC.IDPROVENTO'
      'PROVDESC.DESCRICAO'
      'PROVDESC.CODPROVDESC'
      'PROVDESC.DESCRPROVDESC')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código Interno'
      'Descrição'
      'Código Externo'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROVDESC')
    CamposChave.Strings = (
      'PROVDESC.IDPROVENTO'
      'PROVDESC.DESCRICAO')
    Filtro.Strings = (
      'PROVDESC.FLGDESCONTO = 0'
      'PROVDESC.FLGTPRUBRICA LIKE '#39'%B%'#39
      'PROVDESC.FLGATRASODEVOL = '#39'N'#39
      'PROVDESC.FLGESTADORUB <> 2')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '130'
      '15'
      '130')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    Left = 363
    Top = 541
  end
  object MsProventoAtraso: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PROVDESC.IDPROVENTO'
      'PROVDESC.DESCRICAO'
      'PROVDESC.CODPROVDESC'
      'PROVDESC.DESCRPROVDESC')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código Interno'
      'Descrição'
      'Código Externo'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROVDESC')
    CamposChave.Strings = (
      'PROVDESC.IDPROVENTO'
      'PROVDESC.DESCRICAO')
    Filtro.Strings = (
      'PROVDESC.FLGDESCONTO = 0'
      'PROVDESC.FLGTPRUBRICA LIKE '#39'%B%'#39
      'PROVDESC.FLGATRASODEVOL = '#39'A'#39
      'PROVDESC.FLGESTADORUB <> 2')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '130'
      '15'
      '130')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    Left = 434
    Top = 541
  end
  object MsDescontoDevolucao: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PROVDESC.IDPROVENTO'
      'PROVDESC.DESCRICAO'
      'PROVDESC.CODPROVDESC'
      'PROVDESC.DESCRPROVDESC')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código Interno'
      'Descrição'
      'Código Externo'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROVDESC')
    CamposChave.Strings = (
      'PROVDESC.IDPROVENTO'
      'PROVDESC.DESCRICAO')
    Filtro.Strings = (
      'PROVDESC.FLGDESCONTO = 1'
      'PROVDESC.FLGTPRUBRICA LIKE '#39'%B%'#39
      'PROVDESC.FLGATRASODEVOL = '#39'D'#39
      'PROVDESC.FLGESTADORUB <> 2')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '130'
      '15'
      '130')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    Left = 399
    Top = 541
  end
  object MsDesconto: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PROVDESC.IDPROVENTO'
      'PROVDESC.DESCRICAO'
      'PROVDESC.CODPROVDESC'
      'PROVDESC.DESCRPROVDESC')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código Interno'
      'Descrição'
      'Código Externo'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROVDESC')
    CamposChave.Strings = (
      'PROVDESC.IDPROVENTO'
      'PROVDESC.DESCRICAO')
    Filtro.Strings = (
      'PROVDESC.FLGDESCONTO = 1')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '130'
      '15'
      '130')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    Left = 327
    Top = 541
  end
  object qryUsuarioSistema: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDUSUARIO,NOMEUSUARIO'
      'FROM USUARIOSISTEMA'
      'ORDER BY NOMEUSUARIO')
    ValidateWithMask = True
    Left = 632
    Top = 102
  end
  object qryBenefPPatro: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, IDBENEFICIO, IDPESSJUR'
      'FROM BENEFPLANPATRO'
      'WHERE IDPLANOPREV = :PIDPLANOPREV ')
    UpdateObject = updBenefPPatro
    ValidateWithMask = True
    Left = 222
    Top = 201
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object dsBenefPPatro: TwwDataSource
    DataSet = qryBenefPPatro
    Left = 222
    Top = 221
  end
  object updBenefPPatro: TUpdateSQL
    ModifySQL.Strings = (
      'update BENEFPLANPATRO'
      'set'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDBENEFICIO = :IDBENEFICIO,'
      '  IDPESSJUR = :IDPESSJUR'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  IDPESSJUR = :OLD_IDPESSJUR')
    InsertSQL.Strings = (
      'insert into BENEFPLANPATRO'
      '  (IDPLANOPREV, IDBENEFICIO, IDPESSJUR)'
      'values'
      '  (:IDPLANOPREV, :IDBENEFICIO, :IDPESSJUR)')
    DeleteSQL.Strings = (
      'delete from BENEFPLANPATRO'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  IDPESSJUR = :OLD_IDPESSJUR')
    Left = 222
    Top = 244
  end
  object qryContPPatro: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, IDCONTRIBUICAO, IDPESSJUR,'
      
        '       CODALTBAIXANPAGO, CODALTBAIXANPAGOPGA   -- edilaine SIG36' +
        '752'
      'FROM CONTPLANPATRO'
      'WHERE IDPLANOPREV = :PIDPLANOPREV '
      'ORDER BY IDCONTRIBUICAO')
    UpdateObject = updContPPatro
    ValidateWithMask = True
    Left = 222
    Top = 297
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object dsContPPatro: TwwDataSource
    DataSet = qryContPPatro
    Left = 222
    Top = 317
  end
  object updContPPatro: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTPLANPATRO'
      'set'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDCONTRIBUICAO= :IDCONTRIBUICAO,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  CODALTBAIXANPAGO = :CODALTBAIXANPAGO, '
      '  CODALTBAIXANPAGOPGA = :CODALTBAIXANPAGOPGA '
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDCONTRIBUICAO= :OLD_IDCONTRIBUICAO and'
      '  IDPESSJUR = :OLD_IDPESSJUR')
    InsertSQL.Strings = (
      'insert into CONTPLANPATRO'
      
        '  (IDPLANOPREV, IDCONTRIBUICAO, IDPESSJUR, CODALTBAIXANPAGO, COD' +
        'ALTBAIXANPAGOPGA )'
      'values'
      
        '  (:IDPLANOPREV, :IDCONTRIBUICAO, :IDPESSJUR, :CODALTBAIXANPAGO,' +
        ' :CODALTBAIXANPAGOPGA )')
    DeleteSQL.Strings = (
      'delete from CONTPLANPATRO'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDCONTRIBUICAO = :OLD_IDCONTRIBUICAO and'
      '  IDPESSJUR = :OLD_IDPESSJUR')
    Left = 222
    Top = 340
  end
  object qryMeses: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#39'01'#39' AS MES FROM DUAL UNION'
      'SELECT '#39'02'#39' AS MES FROM DUAL UNION'
      'SELECT '#39'03'#39' AS MES FROM DUAL UNION'
      'SELECT '#39'04'#39' AS MES FROM DUAL UNION'
      'SELECT '#39'05'#39' AS MES FROM DUAL UNION'
      'SELECT '#39'06'#39' AS MES FROM DUAL UNION'
      'SELECT '#39'07'#39' AS MES FROM DUAL UNION'
      'SELECT '#39'08'#39' AS MES FROM DUAL UNION'
      'SELECT '#39'09'#39' AS MES FROM DUAL UNION'
      'SELECT '#39'10'#39' AS MES FROM DUAL UNION'
      'SELECT '#39'11'#39' AS MES FROM DUAL UNION'
      'SELECT '#39'12'#39' AS MES FROM DUAL')
    ValidateWithMask = True
    Left = 732
    Top = 466
  end
  object qryIncPlanoPrevContabil: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO PLANPREVCONTABIL '
      '   (IDPLANOPREV, NOME)'
      'VALUES'
      '   (:IDPLANOPREV, :NOME)')
    ValidateWithMask = True
    Left = 533
    Top = 537
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NOME'
        ParamType = ptUnknown
      end>
  end
  object qryVerificaIRRF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT FLGISENTOIRRF'
      '  FROM PESSOAFISICA'
      '    WHERE IDPESSOA = :IDPESSOA'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 69
    Top = 522
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object MsProvDescD: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'P.IDPROVENTO'
      'P.DESCRICAO'
      'P.CODPROVDESC'
      'P.DESCRPROVDESC')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código Interno'
      'Descrição'
      'Código Externo'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROVDESC P')
    CamposChave.Strings = (
      'P.IDPROVENTO'
      'P.DESCRICAO')
    Filtro.Strings = (
      'P.FLGTPRUBRICA LIKE '#39'%B%'#39
      'P.FLGRRA = 1'
      'FLGATRASODEVOL = '#39'D'#39
      'FLGESTADORUB <> 2'
      'P.CODPROVDESC LIKE '#39'3%'#39)
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '130'
      '15'
      '130')
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
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
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
    Left = 531
    Top = 333
  end
  object MsProvDescA: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'P.IDPROVENTO'
      'P.DESCRICAO'
      'P.CODPROVDESC'
      'P.DESCRPROVDESC')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código Interno'
      'Descrição'
      'Código Externo'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROVDESC P')
    CamposChave.Strings = (
      'P.IDPROVENTO'
      'P.DESCRICAO')
    Filtro.Strings = (
      'P.FLGTPRUBRICA LIKE '#39'%B%'#39
      'P.FLGRRA = 1'
      'FLGATRASODEVOL = '#39'A'#39
      'FLGESTADORUB <> 2'
      'P.CODPROVDESC LIKE '#39'1%'#39)
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '130'
      '15'
      '130')
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
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
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
    Left = 531
    Top = 280
  end
  object MsProvDescN: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PROVDESC.IDPROVENTO'
      'PROVDESC.DESCRICAO'
      'PROVDESC.CODPROVDESC'
      'PROVDESC.DESCRPROVDESC')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código Interno'
      'Descrição'
      'Código Externo'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROVDESC')
    CamposChave.Strings = (
      'PROVDESC.IDPROVENTO'
      'PROVDESC.DESCRICAO')
    Filtro.Strings = (
      'PROVDESC.FLGRRA = 1 '
      'PROVDESC.FLGATRASODEVOL = '#39'N'#39)
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '130'
      '15'
      '130')
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
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
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
    Left = 531
    Top = 229
  end
  object qryLkpProvDescN: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select P.IDPROVENTO,'
      '       P.DESCRICAO,'
      '       P.CODPROVDESC,'
      '       P.FLGRRA'
      '  from PROVDESC P'
      ' where (P.FLGRRA = 1)'
      '   and (P.FLGDESCONTO = 0)'
      '   and (P.FLGTPRUBRICA like '#39'%B%'#39')'
      '   and (FLGESTADORUB <> 2)'
      '   and (FLGATRASODEVOL = '#39'N'#39')'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 480
    Top = 225
  end
  object qryLkpProvDescA: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPROVENTO,'
      '       P.DESCRICAO,'
      '       P.CODPROVDESC'
      '  FROM PROVDESC P'
      ' WHERE (P.FLGTPRUBRICA like '#39'%B%'#39')'
      '   AND (P.FLGRRA = 1)'
      '   AND (FLGATRASODEVOL = '#39'A'#39')'
      '   AND (FLGESTADORUB <> 2) '#9
      '   AND (P.CODPROVDESC like '#39'1%'#39') ')
    ValidateWithMask = True
    Left = 472
    Top = 273
  end
  object qryLkpProvDescD: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPROVENTO,'#9
      '       P.DESCRICAO,'
      '       P.CODPROVDESC'
      '  FROM PROVDESC P'
      ' WHERE (P.FLGTPRUBRICA like '#39'%B%'#39')'
      '   AND (P.FLGRRA = 1)'
      '   AND (FLGATRASODEVOL = '#39'D'#39')'
      '   AND (FLGESTADORUB <> 2)'#9
      '   AND (P. CODPROVDESC like '#39'3%'#39')')
    ValidateWithMask = True
    Left = 408
    Top = 321
  end
  object MsProvDescD_B: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PROVDESC.IDPROVENTO'
      'PROVDESC.DESCRICAO'
      'PROVDESC.CODPROVDESC'
      'PROVDESC.DESCRPROVDESC')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código Interno'
      'Descrição'
      'Código Externo'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROVDESC')
    CamposChave.Strings = (
      'PROVDESC.IDPROVENTO'
      'PROVDESC.DESCRICAO')
    Filtro.Strings = (
      'PROVDESC.FLGATRASODEVOL = '#39'D'#39
      'PROVDESC.FLGBITRIBUTACAO = 1 ')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '130'
      '15'
      '130')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
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
    Left = 355
    Top = 493
  end
  object MsProvDescA_B: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PROVDESC.IDPROVENTO'
      'PROVDESC.DESCRICAO'
      'PROVDESC.CODPROVDESC'
      'PROVDESC.DESCRPROVDESC')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código Interno'
      'Descrição'
      'Código Externo'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROVDESC')
    CamposChave.Strings = (
      'PROVDESC.IDPROVENTO'
      'PROVDESC.DESCRICAO')
    Filtro.Strings = (
      'PROVDESC.FLGATRASODEVOL = '#39'A'#39
      'PROVDESC.FLGBITRIBUTACAO = 1 ')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '130'
      '15'
      '130')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
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
    Left = 355
    Top = 440
  end
  object MsProvDescN_B: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PROVDESC.IDPROVENTO'
      'PROVDESC.DESCRICAO'
      'PROVDESC.CODPROVDESC'
      'PROVDESC.DESCRPROVDESC')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código Interno'
      'Descrição'
      'Código Externo'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROVDESC')
    CamposChave.Strings = (
      'PROVDESC.IDPROVENTO'
      'PROVDESC.DESCRICAO')
    Filtro.Strings = (
      'PROVDESC.FLGATRASODEVOL = '#39'N'#39
      'PROVDESC.FLGBITRIBUTACAO = 1 ')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '130'
      '15'
      '130')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
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
    Left = 355
    Top = 389
  end
  object qryLkpProvDescN_B: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select P.IDPROVENTO,'
      '       P.DESCRICAO,'
      '       P.CODPROVDESC,'
      '       P.FLGRRA'
      '  from PROVDESC P'
      ' where (P.FLGBITRIBUTACAO = 1)'
      '   and (P.FLGDESCONTO = 0)'
      '   and (P.FLGTPRUBRICA like '#39'%B%'#39')'
      '   and (FLGESTADORUB <> 2)'
      '   and (FLGATRASODEVOL = '#39'N'#39')'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 232
    Top = 385
  end
  object qryLkpProvDescA_B: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' SELECT * FROM PROVDESC '
      ' WHERE FLGBITRIBUTACAO = 1'
      '      AND FLGATRASODEVOL = '#39'A'#39
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 232
    Top = 433
  end
  object qryLkpProvDescD_B: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM PROVDESC '
      ' WHERE FLGBITRIBUTACAO = 1'
      '       AND FLGATRASODEVOL = '#39'D'#39)
    ValidateWithMask = True
    Left = 232
    Top = 481
  end
  object qryLkpProvCobraN_D: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select P.IDPROVENTO,'
      '       P.DESCRICAO,'
      '       P.CODPROVDESC,'
      '       P.FLGRRA'
      '  from PROVDESC P'
      ' where (P.FLGDIVIDABENEFICIO  = 1)'
      '   and (FLGATRASODEVOL = '#39'N'#39')'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 48
    Top = 369
  end
  object qryLkpProvCobraA_D: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' SELECT * FROM PROVDESC '
      ' WHERE FLGDIVIDABENEFICIO  = 1'
      '      AND FLGATRASODEVOL = '#39'A'#39
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 48
    Top = 417
  end
  object qryLkpProvCobraD_D: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM PROVDESC '
      ' WHERE FLGDIVIDABENEFICIO  = 1'
      '       AND FLGATRASODEVOL = '#39'D'#39)
    ValidateWithMask = True
    Left = 32
    Top = 465
  end
  object MsProvCobraD_D: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PROVDESC.IDPROVENTO'
      'PROVDESC.DESCRICAO'
      'PROVDESC.CODPROVDESC'
      'PROVDESC.DESCRPROVDESC')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código Interno'
      'Descrição'
      'Código Externo'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROVDESC')
    CamposChave.Strings = (
      'PROVDESC.IDPROVENTO'
      'PROVDESC.DESCRICAO')
    Filtro.Strings = (
      'PROVDESC.FLGATRASODEVOL = '#39'D'#39
      'PROVDESC.FLGDIVIDABENEFICIO = 1 ')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '130'
      '15'
      '130')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
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
    Left = 147
    Top = 477
  end
  object MsProvCobraA_D: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PROVDESC.IDPROVENTO'
      'PROVDESC.DESCRICAO'
      'PROVDESC.CODPROVDESC'
      'PROVDESC.DESCRPROVDESC')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código Interno'
      'Descrição'
      'Código Externo'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROVDESC')
    CamposChave.Strings = (
      'PROVDESC.IDPROVENTO'
      'PROVDESC.DESCRICAO')
    Filtro.Strings = (
      'PROVDESC.FLGATRASODEVOL = '#39'A'#39
      'PROVDESC.FLGDIVIDABENEFICIO  = 1')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '130'
      '15'
      '130')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
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
    Left = 147
    Top = 424
  end
  object MsProvCobraN_D: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PROVDESC.IDPROVENTO'
      'PROVDESC.DESCRICAO'
      'PROVDESC.CODPROVDESC'
      'PROVDESC.DESCRPROVDESC')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código Interno'
      'Descrição'
      'Código Externo'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROVDESC')
    CamposChave.Strings = (
      'PROVDESC.IDPROVENTO'
      'PROVDESC.DESCRICAO')
    Filtro.Strings = (
      'PROVDESC.FLGATRASODEVOL = '#39'N'#39
      'PROVDESC.FLGDIVIDABENEFICIO = 1')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '130'
      '15'
      '130')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
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
    Left = 147
    Top = 365
  end
  object qryRubxEvento: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPROVENTO, IDMOTIVO, IDREGRACALC'
      '   FROM   RUBXEVENTO'
      ''
      ''
      ' '
      ' ')
    UpdateObject = updRubxEvento
    ValidateWithMask = True
    Left = 868
    Top = 117
  end
  object updRubxEvento: TUpdateSQL
    ModifySQL.Strings = (
      'update RUBXEVENTO'
      'set'
      '  IDMOTIVO = :IDMOTIVO, '
      '  IDREGRACALC = :IDREGRACALC'
      'where'
      '  IDPROVENTO = :OLD_IDPROVENTO')
    InsertSQL.Strings = (
      'insert into RUBXEVENTO'
      '  (IDPROVENTO, IDMOTIVO, IDREGRACALC)'
      'values'
      '  (:IDPROVENTO, :IDMOTIVO, :IDREGRACALC)'
      ' ')
    DeleteSQL.Strings = (
      'delete from RUBXEVENTO'
      'where'
      '  IDPROVENTO = :OLD_IDPROVENTO')
    Left = 804
    Top = 121
  end
  object QryProventoAcerto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDPROVENTO,DESCRICAO, CODPROVDESC'
      'FROM'
      '  PROVDESC'
      'WHERE'
      '  (FLGDESCONTO = 0)   AND'
      '  (IDMODULO = 18) '
      'ORDER BY '
      '  DESCRICAO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 808
    Top = 537
  end
  object qryAltBaixa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODALTERADOR, DESCRICAO, IDEMPRESA,'
      
        '       DECODE(RECPAG,'#39'R'#39', '#39'Contas a Receber'#39', '#39'Contas a Pagar'#39') ' +
        'AS TIPO'
      'FROM   TIPOALTERADOR'
      'WHERE RECPAG = '#39'R'#39
      'ORDER BY RECPAG, DESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 774
    Top = 250
  end
  object qryIsentoIRAcJud: TwwQuery
    CachedUpdates = True
    BeforePost = qryIsentoIRAcJudBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT T.IDTRATAISENCAOIRACAOJUD,'
      '       T.IDPLANOPREV,'
      '       T.IDRUBRICA,'
      '       T.IDRUBISENTOAC,'
      '       R1.DESCRICAO   AS RUB_ISENTA,'
      '       R1.CODPROVDESC AS COD_ISENTA,'
      '       R2.DESCRICAO   AS RUB_INCIDE,'
      '       R2.CODPROVDESC AS COD_INCIDE'
      '  FROM TRATAISENCAOIRACAOJUD T'
      '  JOIN PROVDESC R1 ON R1.IDPROVENTO = T.IDRUBISENTOAC'
      '  JOIN PROVDESC R2 ON R2.IDPROVENTO = T.IDRUBRICA'
      'WHERE T.IDPLANOPREV = :PIDPLANOPREV'
      'ORDER BY R2.DESCRICAO  '
      '  '
      ''
      ' ')
    UpdateObject = updIsentoIR
    ValidateWithMask = True
    Left = 1005
    Top = 235
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PIDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object updIsentoIR: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE TRATAISENCAOIRACAOJUD'
      'SET'
      '   IDRUBRICA = :IDRUBRICA,'
      '   IDRUBISENTOAC = :IDRUBISENTOAC'
      'WHERE'
      '   IDTRATAISENCAOIRACAOJUD = :OLD_IDTRATAISENCAOIRACAOJUD')
    InsertSQL.Strings = (
      'INSERT INTO TRATAISENCAOIRACAOJUD'
      '   ('
      '    IDTRATAISENCAOIRACAOJUD,'
      '    IDPLANOPREV,'
      '    IDRUBRICA,'
      '    IDRUBISENTOAC'
      '   )'
      ' VALUES'
      '   ('
      '    SEQTRATAISENCAOIRACAOJUD.nextval,'
      '    :IDPLANOPREV,'
      '    :IDRUBRICA,'
      '    :IDRUBISENTOAC'
      '   )'
      ''
      ''
      ' '
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM TRATAISENCAOIRACAOJUD'
      'WHERE'
      '   IDTRATAISENCAOIRACAOJUD = :OLD_IDTRATAISENCAOIRACAOJUD ')
    Left = 1008
    Top = 284
  end
  object qryRubIncideIR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT RI.*'
      'FROM ('
      'SELECT R.ID, C.DESCRICAO, C.CODPROVDESC, C.IDPROVENTO, C.FLGIRRF'
      'FROM USERCALCULOSJUDICIAIS.RUBRICA R'
      'JOIN CM.PROVDESC C ON C.IDPROVENTO = R.IDPROVENTO'
      ''
      'union'
      ''
      
        'SELECT RAC.ID AS ID, C1.DESCRICAO, C1.CODPROVDESC, C1.IDPROVENTO' +
        ', C1.FLGIRRF'
      'FROM USERCALCULOSJUDICIAIS.RUBRICA RAC'
      'JOIN CM.PROVDESC C1 ON C1.IDPROVENTO = RAC.IDPROVENTOACERTO'
      ''
      'union'
      ''
      
        'SELECT RDV.ID AS ID, C2.DESCRICAO, C2.CODPROVDESC, C2.IDPROVENTO' +
        ', C2.FLGIRRF'
      'FROM USERCALCULOSJUDICIAIS.RUBRICA RDV'
      'JOIN CM.PROVDESC C2 ON C2.IDPROVENTO = RDV.IDPROVENTODEVOLUCAO'
      ''
      'union'
      ''
      
        'SELECT R13.ID AS ID, C3.DESCRICAO, C3.CODPROVDESC, C3.IDPROVENTO' +
        ', C3.FLGIRRF'
      'FROM USERCALCULOSJUDICIAIS.RUBRICA R13'
      'LEFT JOIN CM.PROVDESC C3 ON C3.IDPROVENTO = R13.IDPROVENTO13'
      ''
      'union'
      ''
      
        'SELECT R13A.ID AS ID, C4.DESCRICAO, C4.CODPROVDESC, C4.IDPROVENT' +
        'O, C4.FLGIRRF'
      'FROM USERCALCULOSJUDICIAIS.RUBRICA R13A'
      'JOIN CM.PROVDESC C4 ON C4.IDPROVENTO = R13A.IDPROVENTO13ACERTO'
      ''
      'union'
      ''
      
        'SELECT R13D.ID AS ID, C5.DESCRICAO, C5.CODPROVDESC, C5.IDPROVENT' +
        'O, C5.FLGIRRF'
      'FROM USERCALCULOSJUDICIAIS.RUBRICA R13D'
      
        'JOIN CM.PROVDESC C5 ON C5.IDPROVENTO = R13D.IDPROVENTO13DEVOLUCA' +
        'O'
      ') RI'
      'WHERE RI.FLGIRRF = 1'
      'ORDER BY 2')
    ValidateWithMask = True
    Left = 1072
    Top = 284
  end
  object qryRubIsentaIR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT RI.*'
      'FROM ('
      'SELECT R.ID, C.DESCRICAO, C.CODPROVDESC, C.IDPROVENTO, C.FLGIRRF'
      'FROM USERCALCULOSJUDICIAIS.RUBRICA R'
      'JOIN CM.PROVDESC C ON C.IDPROVENTO = R.IDPROVENTO'
      ''
      'union'
      ''
      
        'SELECT RAC.ID AS ID, C1.DESCRICAO, C1.CODPROVDESC, C1.IDPROVENTO' +
        ', C1.FLGIRRF'
      'FROM USERCALCULOSJUDICIAIS.RUBRICA RAC'
      'JOIN CM.PROVDESC C1 ON C1.IDPROVENTO = RAC.IDPROVENTOACERTO'
      ''
      'union'
      ''
      
        'SELECT RDV.ID AS ID, C2.DESCRICAO, C2.CODPROVDESC, C2.IDPROVENTO' +
        ', C2.FLGIRRF'
      'FROM USERCALCULOSJUDICIAIS.RUBRICA RDV'
      'JOIN CM.PROVDESC C2 ON C2.IDPROVENTO = RDV.IDPROVENTODEVOLUCAO'
      ''
      'union'
      ''
      
        'SELECT R13.ID AS ID, C3.DESCRICAO, C3.CODPROVDESC, C3.IDPROVENTO' +
        ', C3.FLGIRRF'
      'FROM USERCALCULOSJUDICIAIS.RUBRICA R13'
      'LEFT JOIN CM.PROVDESC C3 ON C3.IDPROVENTO = R13.IDPROVENTO13'
      ''
      'union'
      ''
      
        'SELECT R13A.ID AS ID, C4.DESCRICAO, C4.CODPROVDESC, C4.IDPROVENT' +
        'O, C4.FLGIRRF'
      'FROM USERCALCULOSJUDICIAIS.RUBRICA R13A'
      'JOIN CM.PROVDESC C4 ON C4.IDPROVENTO = R13A.IDPROVENTO13ACERTO'
      ''
      'union'
      ''
      
        'SELECT R13D.ID AS ID, C5.DESCRICAO, C5.CODPROVDESC, C5.IDPROVENT' +
        'O, C5.FLGIRRF'
      'FROM USERCALCULOSJUDICIAIS.RUBRICA R13D'
      
        'JOIN CM.PROVDESC C5 ON C5.IDPROVENTO = R13D.IDPROVENTO13DEVOLUCA' +
        'O'
      ') RI'
      'WHERE RI.FLGIRRF = 0'
      'ORDER BY 2')
    ValidateWithMask = True
    Left = 1072
    Top = 232
  end
  object dsIsentoIRAcJud: TDataSource
    DataSet = qryIsentoIRAcJud
    Left = 957
    Top = 235
  end
  object MSRubIsenta: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PROVDESC.IDPROVENTO'
      'PROVDESC.DESCRICAO'
      'PROVDESC.CODPROVDESC'
      'PROVDESC.DESCRPROVDESC')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código Interno'
      'Descrição'
      'Código Externo'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROVDESC')
    CamposChave.Strings = (
      'PROVDESC.IDPROVENTO'
      'PROVDESC.DESCRICAO')
    Filtro.Strings = (
      'PROVDESC.FLGESTADORUB <> 2')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '130'
      '15'
      '130')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    BeforeOpenCds = MSRubIsentaBeforeOpenCds
    Left = 1079
    Top = 333
  end
  object MSRubIncide: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PROVDESC.IDPROVENTO'
      'PROVDESC.DESCRICAO'
      'PROVDESC.CODPROVDESC'
      'PROVDESC.DESCRPROVDESC')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código Interno'
      'Descrição'
      'Código Externo'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROVDESC')
    CamposChave.Strings = (
      'PROVDESC.IDPROVENTO'
      'PROVDESC.DESCRICAO')
    Filtro.Strings = (
      'PROVDESC.FLGESTADORUB <> 2')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '130'
      '15'
      '130')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    BeforeOpenCds = MSRubIncideBeforeOpenCds
    Left = 1079
    Top = 385
  end
end
