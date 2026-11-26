inherited frmCadTmpDesc: TfrmCadTmpDesc
  Left = 241
  Top = 150
  Width = 802
  Height = 532
  HelpContext = 180035
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsSizeable
  Caption = 'Cadastro Manual de Lançamentos para Folha de Benefícios'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 786
    Height = 408
    inherited pnlMestre: TPanel
      Width = 784
      Height = 62
      UseDockManager = False
      object Label1: TLabel
        Left = 8
        Top = 5
        Width = 139
        Height = 13
        Caption = 'Lançar Rubricas para ...'
      end
      object DBText1: TDBText
        Left = 8
        Top = 21
        Width = 42
        Height = 13
        AutoSize = True
        DataField = 'NOME'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 219
        Top = 5
        Width = 24
        Height = 13
        Caption = 'CPF'
      end
      object DBText2: TDBText
        Left = 219
        Top = 21
        Width = 42
        Height = 13
        AutoSize = True
        DataField = 'NUMDOCUMENTO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 589
        Top = 1
        Width = 103
        Height = 52
        Caption = 
          'Mostrar Rubricas vinculadas ao Mês de (limpar para exibir todas)' +
          ':'
        WordWrap = True
      end
      object mskedMes: TMaskEdit
        Left = 703
        Top = 32
        Width = 68
        Height = 21
        EditMask = '9999\/99;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 7
        ParentFont = False
        TabOrder = 1
        Text = '    /  '
        OnExit = mskedMesExit
        OnKeyPress = mskedMesKeyPress
      end
      object RdgTipoReg: TRadioGroup
        Left = 431
        Top = 1
        Width = 141
        Height = 61
        Caption = 'Registros'
        ItemIndex = 0
        Items.Strings = (
          'Todos'
          'Já processados'
          'Por Processar')
        TabOrder = 0
        OnClick = RdgTipoRegClick
      end
      object rgPlanos: TRadioGroup
        Left = 286
        Top = 1
        Width = 143
        Height = 62
        Caption = 'Planos'
        ItemIndex = 0
        Items.Strings = (
          'Todos'
          'Ativos'
          'Não Ativos')
        TabOrder = 2
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 63
      Width = 784
      Height = 344
      Tabs.Strings = (
        'Lançamentos')
      inherited pgctrlDetalhe: TPageControl
        Width = 686
        Height = 285
        inherited tbsDet: TTabSheet
          Caption = 'Lançamentos'
          inherited dbgrdDet: TwwDBGrid
            Width = 678
            Height = 257
            Selected.Strings = (
              'MESCOBRANCA'#9'9'#9'Mês de ~Cobrança'
              'MESREFERENCIA'#9'10'#9'Mês de ~Referência'
              'FLGDESCONTO'#9'10'#9'Desconto'
              'IDPROVENTO'#9'11'#9'Cód. Interno~da Rubrica'
              'CODPROVDESC'#9'15'#9'Cód. Externo~da Rubrica'
              'DESCRICAO'#9'40'#9'Descrição'
              'VALOR'#9'10'#9'Valor'
              'DATACOBRANCA'#9'10'#9'Data'
              'FLGDESCFOLHA'#9'7'#9'Folha ~Benef.?'
              'ORIGEM'#9'17'#9'Origem da Rubrica'
              'FLGATRASODEVOL'#9'10'#9'Atraso/~Devolução'
              'IDLOTE'#9'10'#9'Lote Nº'
              'DATARECEBIMENTO'#9'18'#9'Data Desconto'
              'IDMOTIVO'#9'10'#9'Motivo'
              'SITENVIO'#9'8'#9'Situação'
              'VALORRECEBIDO'#9'11'#9'Valor Desc.'
              'LOTEPREVIA'#9'10'#9'Lote Desc.'
              'IDTMPDESC'#9'11'#9'Sequencial'
              'FLGNAOPROCESSA'#9'13'#9'Não Processar')
            Font.Style = []
            ParentFont = False
            TitleLines = 2
          end
          inherited pnlControlesDet: TPanel
            Width = 678
            Height = 257
            object Label5: TLabel
              Left = 551
              Top = 5
              Width = 72
              Height = 13
              Caption = 'Data Efetiva'
            end
            object Label6: TLabel
              Left = 551
              Top = 45
              Width = 74
              Height = 13
              Caption = 'Valor Efetivo'
              FocusControl = dbeValorRecebido
            end
            object Label7: TLabel
              Left = 551
              Top = 85
              Width = 51
              Height = 13
              Caption = 'Situação'
            end
            object Label8: TLabel
              Left = 551
              Top = 125
              Width = 66
              Height = 13
              Caption = 'Lote Prévia'
            end
            object LabelAviso: TLabel
              Left = 473
              Top = 219
              Width = 204
              Height = 26
              Caption = 
                'Este registro não pode ser alterado, pois já foi processado pela' +
                ' Folha.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
              WordWrap = True
            end
            object cmContaD: TCMProcuraMaskContabil
              Left = 348
              Top = 7
              Width = 193
              Height = 82
              Caption = ' Conta Contábil '
              TabOrder = 11
              MostraMensagens = True
              MostraDescricao = True
              DataSource = dsDet
              DataField = 'PLACONTAD'
              Mensagens.EmBranco = 'Conta não pode estar em branco'
              Mensagens.NaoExiste = 'Conta não existe'
              Mensagens.Sintetica = 'Conta não pode ser sintética'
              Mensagens.Analitica = 'Conta não pode ser analítica'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = True
              AceitaTipoConta = SoAnalitica
              Plano = 0
              Status = scSoAtiva
            end
            object cmContaC: TCMProcuraMaskContabil
              Left = 348
              Top = 7
              Width = 193
              Height = 82
              Caption = ' Conta Contábil '
              TabOrder = 2
              MostraMensagens = True
              MostraDescricao = True
              DataSource = dsDet
              DataField = 'PLACONTAC'
              Mensagens.EmBranco = 'Conta não pode estar em branco'
              Mensagens.NaoExiste = 'Conta não existe'
              Mensagens.Sintetica = 'Conta não pode ser sintética'
              Mensagens.Analitica = 'Conta não pode ser analítica'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = True
              AceitaTipoConta = SoAnalitica
              Plano = 0
              Status = scSoAtiva
            end
            object grpMesAnoRef: TGroupBox
              Left = 6
              Top = 6
              Width = 162
              Height = 45
              Caption = 'Ano e Mês de Referência'
              TabOrder = 0
              object Label10: TLabel
                Left = 88
                Top = 17
                Width = 6
                Height = 16
                Caption = '/'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object edAnoRef: TEdit
                Left = 8
                Top = 17
                Width = 73
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 4
                ParentFont = False
                TabOrder = 0
              end
              object edMesRef: TEdit
                Left = 96
                Top = 17
                Width = 49
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 2
                ParentFont = False
                TabOrder = 1
              end
            end
            object GroupBox1: TGroupBox
              Left = 174
              Top = 6
              Width = 167
              Height = 45
              Caption = 'Ano e Mês de Cobr/Pgmto'
              TabOrder = 1
              object Label11: TLabel
                Left = 88
                Top = 17
                Width = 6
                Height = 16
                Caption = '/'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object edAnoCob: TEdit
                Left = 8
                Top = 17
                Width = 73
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 4
                ParentFont = False
                TabOrder = 0
              end
              object edMesCob: TEdit
                Left = 96
                Top = 17
                Width = 49
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 2
                ParentFont = False
                TabOrder = 1
              end
            end
            object dbrgrpAtrasoDevol: TDBRadioGroup
              Left = 6
              Top = 52
              Width = 335
              Height = 35
              Caption = ' Tipo da Rubrica '
              Columns = 3
              DataField = 'FLGATRASODEVOL'
              DataSource = dsDet
              Items.Strings = (
                'Normal'
                'Atraso'
                'Devolucao')
              TabOrder = 3
              Values.Strings = (
                'N'
                'A'
                'D')
              OnExit = dbrgrpAtrasoDevolExit
            end
            object GroupBox2: TGroupBox
              Left = 6
              Top = 88
              Width = 534
              Height = 115
              TabOrder = 4
              object lbOrigemRubrica: TLabel
                Left = 9
                Top = 40
                Width = 106
                Height = 13
                Caption = 'Origem da Rubrica'
              end
              object lbRubrica: TLabel
                Left = 9
                Top = 15
                Width = 45
                Height = 13
                Caption = 'Rubrica'
              end
              object lblValor: TLabel
                Left = 395
                Top = 50
                Width = 30
                Height = 13
                Caption = 'Valor'
                FocusControl = dbeValor
              end
              object lblDataPagamento: TLabel
                Left = 9
                Top = 66
                Width = 113
                Height = 13
                Caption = 'Data de Pagamento'
              end
              object Label17: TLabel
                Left = 395
                Top = 8
                Width = 44
                Height = 13
                Caption = 'Lote Nº'
              end
              object lblMotivo: TLabel
                Left = 9
                Top = 91
                Width = 39
                Height = 13
                Caption = 'Motivo'
              end
              object dbcbOrigemRubrica: TwwDBComboBox
                Left = 122
                Top = 37
                Width = 262
                Height = 21
                ShowButton = True
                Style = csDropDown
                MapList = True
                AllowClearKey = False
                AutoDropDown = True
                DataField = 'FLGTIPODESC'
                DataSource = dsDet
                DropDownCount = 8
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ItemHeight = 0
                Items.Strings = (
                  'Assistencial'#9'A'
                  'Convênios'#9'C'
                  'Empréstimo'#9'E'
                  'Previdenciário '#9'P')
                ParentFont = False
                Sorted = False
                TabOrder = 1
                UnboundDataType = wwDefault
              end
              object dblkpcmbRubrica: TwwDBLookupCombo
                Left = 60
                Top = 13
                Width = 324
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'JUNCAO'#9'69'#9'Código  Descrição'#9'F')
                DataField = 'IDPROVENTO'
                DataSource = dsDet
                LookupTable = qryRubrica
                LookupField = 'IDPROVENTO'
                Options = [loColLines, loRowLines, loTitles]
                ParentFont = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                OnChange = dblkpcmbRubricaChange
                OnEnter = dblkpcmbRubricaEnter
              end
              object dbeValor: TDBEdit
                Left = 396
                Top = 64
                Width = 97
                Height = 21
                DataField = 'VALOR'
                DataSource = dsDet
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 5
              end
              object DBDateEdit1: TCMDateTimePicker
                Left = 129
                Top = 62
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATACOBRANCA'
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
                TabOrder = 2
              end
              object dblkpcmbLote: TwwDBLookupCombo
                Left = 395
                Top = 23
                Width = 121
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'IDLOTE'#9'10'#9'Lote Nº'
                  'MESREFERENCIA'#9'7'#9'Mês'
                  'DESCRICAO'#9'200'#9'Descrição')
                DataField = 'IDLOTE'
                DataSource = dsDet
                LookupTable = qryLote
                LookupField = 'IDLOTE'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 4
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
              end
              object dblkMotivo: TwwDBLookupCombo
                Left = 60
                Top = 87
                Width = 324
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'50'#9'Descrição'#9'F')
                DataField = 'IDMOTIVO'
                DataSource = dsDet
                LookupTable = qryMotivo
                LookupField = 'IDMOTIVO'
                Options = [loColLines, loRowLines, loTitles]
                ParentFont = False
                TabOrder = 3
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                OnChange = dblkpcmbRubricaChange
                OnEnter = dblkpcmbRubricaEnter
              end
            end
            object CMDateTimePicker1: TCMDateTimePicker
              Left = 551
              Top = 19
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATARECEBIMENTO'
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
              TabOrder = 6
            end
            object dbeValorRecebido: TDBEdit
              Left = 551
              Top = 59
              Width = 97
              Height = 21
              DataField = 'VALORRECEBIDO'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 7
            end
            object dbeSituacao: TDBEdit
              Left = 552
              Top = 99
              Width = 97
              Height = 21
              DataField = 'SITENVIO'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 8
            end
            object dbeLotePrevia: TDBEdit
              Left = 552
              Top = 139
              Width = 97
              Height = 21
              DataField = 'LOTEPREVIA'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 9
            end
            object grpFavorecidoOutros: TGroupBox
              Left = 6
              Top = 203
              Width = 459
              Height = 57
              Caption = ' Favorecido '
              TabOrder = 5
              object Label22: TLabel
                Left = 12
                Top = 15
                Width = 69
                Height = 13
                Caption = 'CPF / CNPJ'
              end
              object Label23: TLabel
                Left = 117
                Top = 12
                Width = 118
                Height = 13
                Caption = 'Nome do Favorecido'
              end
              object sbtnAddFavOutros: TSpeedButton
                Left = 406
                Top = 26
                Width = 23
                Height = 22
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000120B0000120B00001000000000000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                  33333333333333333333333333333333333333333333333333FF333333333333
                  3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
                  E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
                  E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
                  E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
                  000033333373FF77777733333330003333333333333777333333333333333333
                  3333333333333333333333333333333333333333333333333333333333333333
                  3333333333333333333333333333333333333333333333333333}
                NumGlyphs = 2
                OnClick = sbtnAddFavOutrosClick
              end
              object sbtnRemFavOutros: TSpeedButton
                Left = 429
                Top = 26
                Width = 23
                Height = 22
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000120B0000120B00001000000000000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
                  55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
                  305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
                  005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
                  B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
                  B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
                  B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
                  B0557777FF577777F7F500000E055550805577777F7555575755500000555555
                  05555777775555557F5555000555555505555577755555557555}
                NumGlyphs = 2
                OnClick = sbtnRemFavOutrosClick
              end
              object edCPFFavOutros: TEdit
                Left = 9
                Top = 27
                Width = 103
                Height = 21
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
              end
              object edNomeFavOutros: TEdit
                Left = 117
                Top = 27
                Width = 289
                Height = 21
                Enabled = False
                TabOrder = 1
              end
            end
            object GroupBox3: TGroupBox
              Left = 545
              Top = 161
              Width = 131
              Height = 41
              TabOrder = 10
              object dbcbProcessar: TDBCheckBox
                Left = 14
                Top = 15
                Width = 105
                Height = 17
                Caption = 'Não processar '
                DataField = 'FLGNAOPROCESSA'
                DataSource = dsDet
                TabOrder = 0
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 776
      end
      inherited Dock974: TDock97
        Left = 690
        Height = 285
      end
    end
  end
  inherited Dock972: TDock97
    Width = 786
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 455
    Width = 786
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 168
    Top = 106
    TargetsData = (
      1
      2
      (
        ''
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 413
    Top = 3
  end
  inherited ds: TwwDataSource
    Left = 358
    Top = 3
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  NOME = :NOME'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      '  (NOME)'
      'values'
      '  (:NOME)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 248
    Top = 3
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Selecione beneficiário para lançar as rubricas'
    Colunas.Strings = (
      'V.MATRICULA'
      'V.MATRICULADEP'
      'PP.INSCRICAONUMERO'
      'TIT.NOME'
      'P.NOME'
      'PL.NOME'
      'PT.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matric. Titular'
      'Matric. Benef.'
      'Nº Insc'
      'Participante'
      'Beneficiário'
      'Plano Prev.'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA P'
      'PESSOA PT'
      'PESSOA TIT'
      'PLANPREV PL'
      'PARTPREVPLAN PP'
      'BENEFBFCIARIO BF'
      'VWPARTICIPDEPEN V')
    CamposChave.Strings = (
      'BF.IDPESSJUR'
      'BF.IDPLANOPREV'
      'BF.IDTITULAR'
      'BF.IDPESSOA')
    Filtro.Strings = (
      'BF.IDPESSJUR   = PP.IDPESSJUR'
      
        '((BF.IDPLANOPREV = PP.IDPLANOPREV AND BF.IDPESSOA = BF.IDTITULAR' +
        ') OR (BF.IDPLANOORIGEM = PP.IDPLANOPREV AND BF.IDPESSOA <> BF.ID' +
        'TITULAR))'
      'BF.IDTITULAR   = PP.IDPESSOA'
      'BF.SEQPROPOSTA = PP.SEQPROPOSTA'
      'P.IDPESSOA     = BF.IDPESSOA'
      'PP.IDPESSJUR   = PT.IDPESSOA'
      'V.IDTITULAR = BF.IDTITULAR'
      'V.IDTITULAR    = TIT.IDPESSOA'
      'V.IDPESSOA     = P.IDPESSOA'
      'PP.IDPLANOPREV = PL.IDPLANOPREV')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '13'
      '13'
      '10'
      '25'
      '25'
      '25'
      '25')
    UsaDistinct = True
    Left = 578
    Top = 3
  end
  inherited ImlPadrao: TImageList
    Left = 217
    Top = 106
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 46
    Top = 86
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT P.NOME, P.NUMDOCUMENTO, P.IDPESSOA, BF.IDPLANOPREV,'
      
        '       BF.IDTITULAR, BF.IDPESSOA, BF.IDBENEFICIO, BF.SEQPROPOSTA' +
        ','
      '       BF.IDPESSJUR'
      
        'FROM   PESSOA P, BFCIARIOTITPLAN BTIT, BENEFBFCIARIO BF, PARTPRE' +
        'VPLAN PP'
      'WHERE  P.IDPESSOA = :IDPESSOA'
      'AND    BF.IDTITULAR = :IDTITULAR '
      'AND    BF.IDPLANOPREV   = BTIT.IDPLANOPREV'
      'AND    BF.IDTITULAR     = BTIT.IDTITULAR'
      'AND    BF.IDPESSOA      = BTIT.IDPESSOA'
      'AND    BF.IDBENEFICIO   = BTIT.IDBENEFICIO'
      'AND    BF.SEQPROPOSTA   = BTIT.SEQPROPOSTA'
      'AND    BF.IDPESSJUR     = BTIT.IDPESSJUR'
      'AND    PP.IDPLANOPREV   = BTIT.IDPLANOPREV'
      'AND    PP.IDPESSOA      = BTIT.IDTITULAR'
      'AND    PP.IDPESSJUR     = BTIT.IDPESSJUR'
      'AND    PP.FLGDESATIVADO = 0'
      
        'AND    ( (BTIT.IDPESSOA = P.IDPESSOA) OR (BTIT.IDRESPONSAVEL = P' +
        '.IDPESSOA))'
      ''
      ''
      ' '
      ' ')
    Left = 305
    Top = 3
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 78328
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    RepetirInsert = False
    Left = 79
    Top = 86
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    BeforePost = qryDetBeforePost
    AfterScroll = qryDetAfterScroll
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      
        'SELECT T.IDPROVENTO, T.DATACOBRANCA, T.DATARECEBIMENTO, P.DESCRI' +
        'CAO,'
      '       P.CODPROVDESC, '
      
        '       P.FLGATRASODEVOL, T.FLGDESCFOLHA, P.FLGDESCONTO, T.FLGTIP' +
        'ODESC,'
      
        '       T.IDFAVORECIDO, T.IDLOTE,  T.IDMOTIVO, T.IDPESSJUR, T.IDP' +
        'ESSOA,'
      
        '       T.IDPLANOPREV, T.IDPROVENTO, T.IDTITULAR, T.MESCOBRANCA, ' +
        'T.MESREFERENCIA,'
      
        '       T.REFERENCIA, T.SEQPROPOSTA,  T.SITENVIO, T.VALOR, T.VALO' +
        'RINFO,'
      
        '       T.VALORRECEBIDO, T.LOTEPREVIA, T.TRGDTINCLUSAO, T.PLACONT' +
        'AC, T.PLACONTAD,'
      '       T.IDMODULO, T.SISTORIGEM,'
      
        '       DECODE(T.FLGTIPODESC,'#39'A'#39','#39'Assistencial'#39','#39'C'#39','#39'Convênio'#39','#39'E' +
        #39','#39'Empréstimo'#39','
      
        '              '#39'P'#39','#39'Previdenciário'#39','#39'Não identificado'#39') AS ORIGEM' +
        ','
      
        '       T.ROWID, T.FLGMANUAL, NVL(T.FLGNAOPROCESSA,0) AS FLGNAOPR' +
        'OCESSA,'
      '       T.IDTMPDESC,'
      '       T.IDSEQINTERNOFB'
      'FROM   TMPDESC T, PROVDESC P'
      'WHERE  T.MESCOBRANCA = :MESCOBRANCA'
      'AND    T.IDTITULAR = :IDTITULAR'
      'AND    T.IDPESSOA = :IDPESSOA'
      'AND    P.IDPROVENTO = T.IDPROVENTO'
      'AND    T.FLGDESCFOLHA = '#39'B'#39
      
        'ORDER BY T.MESCOBRANCA DESC, T.MESREFERENCIA DESC, T.FLGDESCONTO' +
        ' DESC'
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updDet
    ControlType.Strings = (
      'FLGDESCFOLHA;CheckBox;B;P'
      'FLGDESCONTO;CheckBox;1;0'
      'FLGNAOPROCESSA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 523
    Top = 3
    ParamData = <
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update TMPDESC'
      'set'
      '  IDPROVENTO = :IDPROVENTO,'
      '  DATACOBRANCA = :DATACOBRANCA,'
      '  DATARECEBIMENTO = :DATARECEBIMENTO,'
      '  DESCRICAO = :DESCRICAO,'
      '  FLGATRASODEVOL = :FLGATRASODEVOL,'
      '  FLGDESCFOLHA = :FLGDESCFOLHA,'
      '  FLGDESCONTO = :FLGDESCONTO,'
      '  FLGTIPODESC = :FLGTIPODESC,'
      '  IDFAVORECIDO = :IDFAVORECIDO,'
      '  IDLOTE = :IDLOTE,'
      '  IDMOTIVO = :IDMOTIVO,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDTITULAR = :IDTITULAR,'
      '  MESCOBRANCA = :MESCOBRANCA,'
      '  MESREFERENCIA = :MESREFERENCIA,'
      '  REFERENCIA = :REFERENCIA,'
      '  SEQPROPOSTA = :SEQPROPOSTA,'
      '  SITENVIO = :SITENVIO,'
      '  VALOR = :VALOR,'
      '  VALORRECEBIDO = :VALORRECEBIDO,'
      '  LOTEPREVIA = :LOTEPREVIA,'
      '  PLACONTAC = :PLACONTAC,'
      '  PLACONTAD = :PLACONTAD,'
      '  IDMODULO = :IDMODULO,'
      '  SISTORIGEM = :SISTORIGEM,'
      '  FLGMANUAL = :FLGMANUAL,'
      '  FLGNAOPROCESSA = :FLGNAOPROCESSA'
      'where'
      '  ROWID = :OLD_ROWID'
      ' ')
    InsertSQL.Strings = (
      'insert into TMPDESC'
      '  (IDPROVENTO, DATACOBRANCA, DATARECEBIMENTO, DESCRICAO, '
      'FLGATRASODEVOL, '
      
        '   FLGDESCFOLHA, FLGDESCONTO, FLGTIPODESC, IDFAVORECIDO, IDLOTE,' +
        ' '
      'IDMOTIVO, '
      '   IDPESSJUR, IDPESSOA, IDPLANOPREV, IDTITULAR, MESCOBRANCA, '
      'MESREFERENCIA, '
      '   REFERENCIA, SEQPROPOSTA, SITENVIO, VALOR, VALORRECEBIDO, '
      'LOTEPREVIA, '
      '   PLACONTAC, PLACONTAD, IDMODULO, SISTORIGEM, FLGMANUAL, '
      'FLGNAOPROCESSA, IDTMPDESC, IDSEQINTERNOFB)'
      'values'
      '  (:IDPROVENTO, :DATACOBRANCA, :DATARECEBIMENTO, :DESCRICAO,'
      ':FLGATRASODEVOL,'
      
        '   :FLGDESCFOLHA, :FLGDESCONTO, :FLGTIPODESC, :IDFAVORECIDO, :ID' +
        'LOTE,'
      ':IDMOTIVO,'
      
        '   :IDPESSJUR, :IDPESSOA, :IDPLANOPREV, :IDTITULAR, :MESCOBRANCA' +
        ','
      ':MESREFERENCIA,'
      
        '   :REFERENCIA, :SEQPROPOSTA, :SITENVIO, :VALOR, :VALORRECEBIDO,' +
        ' '
      ':LOTEPREVIA, '
      '   :PLACONTAC, :PLACONTAD, :IDMODULO, :SISTORIGEM, :FLGMANUAL, '
      ':FLGNAOPROCESSA, :IDTMPDESC, :IDSEQINTERNOFB)')
    DeleteSQL.Strings = (
      'delete from TMPDESC'
      'where'
      '  ROWID = :OLD_ROWID')
    Left = 468
    Top = 3
  end
  object qryLote: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDLOTE, MESREFERENCIA, DESCRICAO'
      'FROM CTRLINTERFACE'
      'WHERE TIPO = '#39'B'#39
      'AND ((FLGVOLTATMP = 0) OR (FLGVOLTATMP IS NULL))'
      'ORDER BY MESREFERENCIA DESC, IDLOTE DESC, DESCRICAO  '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 676
    Top = 3
  end
  object qryRubrica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPROVENTO, IDPROVENTO||'#39' - '#39'||DESCRICAO AS JUNCAO,'
      '       DESCRICAO, FLGDESCONTO, FLGOBRIGAFAVOREC'
      'FROM   PROVDESC'
      'WHERE  FLGATRASODEVOL = :FLGATRASODEVOL'
      'ORDER BY DESCRICAO'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 111
    Top = 86
    ParamData = <
      item
        DataType = ftString
        Name = 'FLGATRASODEVOL'
        ParamType = ptUnknown
      end>
  end
  object MontaSelectFAV: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Favorecido'
    Colunas.Strings = (
      'PESSOA.NUMDOCUMENTO'
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'CPF / CGC do Favorecido'
      'Nome do Favorecido')
    SensivelACaixa.Strings = (
      'S'
      'S')
    Tabelas.Strings = (
      'PESSOA'
      'FORNSERV')
    CamposChave.Strings = (
      'FORNSERV.IDPESSOA'
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = FORNSERV.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 736
    Top = 4
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 7
    Top = 85
  end
  object qryMotivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDMOTIVO,'
      '  DESCRICAO'
      ''
      'FROM'
      '  MOTIVO'
      ''
      'ORDER BY'
      '  UPPER(DESCRICAO)')
    ValidateWithMask = True
    Left = 147
    Top = 73
  end
  object qryConvenios: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      #9'CTR.IDLOTE,'
      '        LDC.ULTIMPORT,'
      #9'PES.NOME,'
      '        PES.NUMDOCUMENTO,'
      #9'LXC.IDFAVORECIDO,'
      '        LXC.IDRUBRICA'
      'FROM'
      #9'CTRLINTERFACE CTR,'
      #9'PESSOA PES,'
      #9'LAYOUTXCOLUNAS LXC,'
      #9'LAYOUTDESCONTO LDC,'
      '        TMPDESC TMP'
      'WHERE'
      #9'LXC.IDRUBRICA = :IDRUBRICA AND'
      '        LXC.IDFAVORECIDO = PES.IDPESSOA AND'
      '        LDC.ULTIMPORT = :MESREFERENCIA AND'
      '        LXC.IDLAYOUT = LDC.IDLAYOUT AND'
      #9'CTR.MESREFERENCIA = LDC.ULTIMPORT AND'
      #9'CTR.IDREFERENCIA = LDC.IDLAYOUT AND'
      '        CTR. TIPO = '#39'B'#39' AND'
      '        ((CTR.FLGVOLTATMP = 0) OR (CTR.FLGVOLTATMP IS NULL)) AND'
      #9'TMP.IDLOTE = CTR.IDLOTE '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 507
    Top = 129
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDRUBRICA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptUnknown
      end>
  end
end
