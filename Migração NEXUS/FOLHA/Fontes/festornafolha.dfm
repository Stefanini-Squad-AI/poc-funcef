inherited frmEstornaFolha: TfrmEstornaFolha
  Left = 0
  Top = 0
  HelpContext = 180016
  BorderStyle = bsNone
  Caption = 'Estorno de Folha de Benefícios'
  ClientHeight = 654
  ClientWidth = 1028
  Font.Height = -12
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 1028
    Height = 615
  end
  object pnlDesktop: TPanel [1]
    Left = 0
    Top = 0
    Width = 1028
    Height = 615
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 3
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object pgCtrlEstorno: TPageControl
      Left = 5
      Top = 155
      Width = 1018
      Height = 455
      ActivePage = tbsDadosIndividual
      Align = alClient
      HotTrack = True
      TabOrder = 2
      object tbsCAP: TTabSheet
        Caption = 'Lançamentos no Contas a Pagar'
        object lblTotCAPParticip: TLabel
          Left = 513
          Top = 340
          Width = 73
          Height = 15
          Caption = 'Total Líquido:'
        end
        object Splitter1: TSplitter
          Left = 0
          Top = 385
          Width = 1178
          Height = 3
          Cursor = crVSplit
          Align = alBottom
        end
        object pnlDocumentos: TPanel
          Left = 0
          Top = 0
          Width = 1178
          Height = 385
          Align = alClient
          TabOrder = 0
          object lblCAP: TLabel
            Left = 1
            Top = 1
            Width = 1176
            Height = 19
            Align = alTop
            AutoSize = False
            Caption = '  Documentos da Versão selecionada'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Layout = tlCenter
          end
          object dbgrCAP: TwwDBGrid
            Left = 1
            Top = 20
            Width = 1176
            Height = 364
            Selected.Strings = (
              'NODOCUMENTO'#9'15'#9'Número do Documento'
              'DATAPROGRAMADA'#9'10'#9'Vencto'
              'VALORLANC'#9'10'#9'Valor Líquido'
              'SALDO'#9'10'#9'Saldo a Pagar'
              'NOME'#9'34'#9'Favorecido'
              'NOMETXT'#9'20'#9'Arquivo TXT'
              'HISTORICOCOMPL'#9'60'#9'Descrição do Lançamento')
            MemoAttributes = []
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            EditControlOptions = []
            Align = alClient
            DataSource = dsCAP
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            TitleLines = 1
            TitleButtons = False
            OnCalcCellColors = dbgrCAPCalcCellColors
            IndicatorColor = icYellow
          end
        end
        object pnlRubricaIndividual: TPanel
          Left = 0
          Top = 388
          Width = 1178
          Height = 182
          Align = alBottom
          TabOrder = 1
          Visible = False
          object lblCAPParticip: TLabel
            Left = 1
            Top = 1
            Width = 1176
            Height = 19
            Align = alTop
            AutoSize = False
            Caption = '  Rubricas do Recebedor selecionado'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Layout = tlCenter
          end
          object lblValorLiquido: TLabel
            Left = 1
            Top = 159
            Width = 1176
            Height = 22
            Align = alBottom
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Valor Líquido : R$'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -15
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object dbgrCAPParticip: TwwDBGrid
            Left = 1
            Top = 20
            Width = 1176
            Height = 139
            Selected.Strings = (
              'MES'#9'7'#9'Mês Ref.'
              'CODRUBEXIBICAO'#9'10'#9'Código'
              'DESCRUBEXIBICAO'#9'67'#9'Descrição da Rubrica'
              'ESTADO'#9'6'#9'P/D/I'
              'VALOR'#9'10'#9'Valor'
              'PLACONTAC'#9'15'#9'Conta crédito'
              'PLACONTAD'#9'15'#9'Conta débito'
              'IDPLANOCONTABIL'#9'10'#9'Plano Contábil'
              'UNIDNEGOC'#9'12'#9'Atividade / Projeto'
              'SITUACAO'#9'18'#9'Situação'
              'CODCENTROCUSTOC'#9'10'#9'C Custo crédito'
              'CODCENTROCUSTOD'#9'10'#9'C Custo débito'
              'CODSUBCONTA'#9'10'#9'Subconta')
            MemoAttributes = []
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            EditControlOptions = []
            Align = alClient
            DataSource = dsCAPParticip
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icYellow
          end
        end
      end
      object tbsContabilizacao: TTabSheet
        Caption = 'Contabilização da Versão '
        object Splitter2: TSplitter
          Left = 0
          Top = 77
          Width = 762
          Height = 3
          Cursor = crVSplit
          Align = alTop
        end
        object pnlPlanilha: TPanel
          Left = 0
          Top = 0
          Width = 762
          Height = 77
          Align = alTop
          TabOrder = 0
          object lblTituloPlanilha: TLabel
            Left = 1
            Top = 1
            Width = 760
            Height = 19
            Align = alTop
            AutoSize = False
            Caption = '  Planilhas Contábeis Lançadas'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Layout = tlCenter
          end
          object dbgPlanilha: TwwDBGrid
            Left = 1
            Top = 20
            Width = 760
            Height = 56
            Selected.Strings = (
              'PEREXERCICIO'#9'10'#9'Exercício'
              'PERNUMERO'#9'10'#9'Mês'
              'PLNPLANIL'#9'10'#9'Planilha'
              'PLNTOTDEB'#9'10'#9'Total')
            MemoAttributes = []
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            EditControlOptions = []
            Align = alClient
            DataSource = dsPlanil
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icYellow
          end
        end
        object pnlContabilidade: TPanel
          Left = 0
          Top = 80
          Width = 762
          Height = 209
          Align = alClient
          TabOrder = 1
          object lblTituloContabilidade: TLabel
            Left = 1
            Top = 1
            Width = 760
            Height = 19
            Align = alTop
            AutoSize = False
            Caption = '  Lançamentos Contábeis da Planilha selecionada'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Layout = tlCenter
          end
          object lblContaLiquidoRecebedor: TLabel
            Left = 1
            Top = 186
            Width = 760
            Height = 22
            Align = alBottom
            Alignment = taCenter
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
            Visible = False
          end
          object dbgContabilidade: TwwDBGrid
            Left = 1
            Top = 20
            Width = 760
            Height = 166
            Selected.Strings = (
              'LACDEBCRE'#9'3'#9'D/C'
              'LACVALOR'#9'10'#9'Valor'
              'PLACONTA'#9'16'#9'Conta'
              'PLANOME'#9'29'#9'Descrição'
              'LACHIST1'#9'40'#9'Histórico 1'
              'LACHIST2'#9'40'#9'Histórico 2'
              'LACHIST3'#9'40'#9'Histórico 3'
              'LACHIST4'#9'40'#9'Histórico 4')
            MemoAttributes = []
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            EditControlOptions = []
            Align = alClient
            DataSource = dsContab
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icYellow
          end
        end
      end
      object tbsDadosIndividual: TTabSheet
        Caption = 'Dados para Estorno Individual'
        object gbOpcaoIndividual: TGroupBox
          Left = 0
          Top = 0
          Width = 1010
          Height = 41
          Align = alTop
          Caption = ' Faz Estorno Individual '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TabStop = True
          object rbPagamentoPendente: TRadioButton
            Left = 9
            Top = 16
            Width = 143
            Height = 17
            Hint = 
              'Esta opção estorna o pagamento da Versão colocando-o como penden' +
              'te para futuro pagamento.'
            Caption = 'Pagamento Pendente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TabStop = True
            OnClick = rbEstornoIndividualClick
          end
          object rbErroProcesso: TRadioButton
            Left = 285
            Top = 16
            Width = 137
            Height = 17
            Hint = 
              'Esta opção retira o pagamento indevido da Versão colocando-o com' +
              'o estornado, e lançando a contabilização de inversa das respecti' +
              'vas rubricas.'
            Caption = 'Pagamento Indevido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            TabStop = True
            OnClick = rbEstornoIndividualClick
          end
          object rbNovoCAP: TRadioButton
            Left = 426
            Top = 16
            Width = 142
            Height = 17
            Hint = 
              'Esta opção estorna o pagamento da versão lançando o pagamento em' +
              ' um novo Contas a Pagar'
            Caption = 'Novo Contas a Pagar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            TabStop = True
            OnClick = rbEstornoIndividualClick
          end
          object rbReprocessamento: TRadioButton
            Left = 155
            Top = 16
            Width = 127
            Height = 17
            Hint = 
              'Esta opção estorna o pagamento da Versão para reprocessamento do' +
              ' pagamento.'
            Caption = 'Reprocessamento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            TabStop = True
            OnClick = rbEstornoIndividualClick
          end
          object rbAlterarFormaPag: TRadioButton
            Left = 573
            Top = 16
            Width = 181
            Height = 17
            Hint = 
              'Esta opção permite alterar o portador forma de pagamento, a cont' +
              'a bancária do recebedor e a data programada.'
            Caption = 'Alterar Forma de Pagamento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            OnClick = rbEstornoIndividualClick
          end
        end
        object pgctrlDadosEstorno: TPageControl
          Left = 0
          Top = 41
          Width = 1010
          Height = 171
          ActivePage = tbsIndividualAlterador
          Align = alTop
          HotTrack = True
          TabOrder = 1
          object tbsIndividualAlterador: TTabSheet
            Caption = 'Alterador para o Documento no Contas a Pagar'
            Enabled = False
            object gbEvento: TGroupBox
              Left = 40
              Top = 13
              Width = 450
              Height = 116
              Caption = 
                ' Selecione o Tipo de Evento para o Documento original do Contas ' +
                'a Pagar '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object lblTodoProcesso: TLabel
                Left = 39
                Top = 25
                Width = 80
                Height = 15
                Caption = 'Tipo de evento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object lbAlterador: TLabel
                Left = 297
                Top = 25
                Width = 83
                Height = 15
                Caption = 'Data do Evento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object dblkTipoEvento: TwwDBLookupCombo
                Left = 38
                Top = 41
                Width = 241
                Height = 23
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'60'#9'DESCRICAO'#9'F')
                LookupTable = qryTipoEventoDocum
                LookupField = 'IDTIPOEVENTODOCUM'
                ParentFont = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                ShowMatchText = True
                OnChange = HabilitaProcessar
              end
              object dtEvento: TCMDateTimePicker
                Left = 296
                Top = 42
                Width = 107
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
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ShowButton = True
                TabOrder = 1
                OnChange = HabilitaProcessar
              end
            end
            object gbAlterador: TGroupBox
              Left = 496
              Top = 13
              Width = 450
              Height = 116
              Caption = 
                ' Selecione o Alterador para o Documento original do Contas a Pag' +
                'ar '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              object Label4: TLabel
                Left = 39
                Top = 25
                Width = 49
                Height = 15
                Caption = 'Alterador'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object lblTituloValorAlterador: TLabel
                Left = 152
                Top = 81
                Width = 27
                Height = 15
                Caption = 'Valor'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object lblValorAlterador: TLabel
                Left = 194
                Top = 78
                Width = 104
                Height = 23
                Alignment = taRightJustify
                AutoSize = False
                Color = clGray
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                Layout = tlCenter
              end
              object Label10: TLabel
                Left = 297
                Top = 25
                Width = 115
                Height = 15
                Caption = 'Data de Lançamento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object dblkAlteradorCAPOriginal: TwwDBLookupCombo
                Left = 38
                Top = 41
                Width = 241
                Height = 23
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'35'#9'Descrição')
                LookupTable = qryAlteradorCAPOriginal
                LookupField = 'CODALTERADOR'
                ParentFont = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                ShowMatchText = True
                OnChange = HabilitaProcessar
              end
              object dtAlterador: TCMDateTimePicker
                Left = 296
                Top = 42
                Width = 107
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
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ShowButton = True
                TabOrder = 1
                OnChange = HabilitaProcessar
              end
            end
          end
          object tbsIndividualCAR: TTabSheet
            Caption = 'Dados para o Contas a Receber'
            Enabled = False
            object lblCARProcessoPortForma: TLabel
              Left = 5
              Top = 5
              Width = 228
              Height = 15
              Caption = 'Contas / Caixas x Forma de Recebimento'
            end
            object lblProcessoTipoReceb: TLabel
              Left = 6
              Top = 49
              Width = 118
              Height = 15
              Caption = 'Tipo de Recebimento'
            end
            object lblProcessoDtLancto: TLabel
              Left = 166
              Top = 96
              Width = 115
              Height = 15
              Caption = 'Data de Lançamento'
            end
            object lblProcessodtVencto: TLabel
              Left = 326
              Top = 96
              Width = 110
              Height = 15
              Caption = 'Data de Vencimento'
            end
            object lblTituloValorCAR: TLabel
              Left = 556
              Top = 96
              Width = 27
              Height = 15
              Caption = 'Valor'
            end
            object lblCARProcUnidNegoc: TLabel
              Left = 374
              Top = 5
              Width = 97
              Height = 15
              Caption = 'Atividade / Projeto'
            end
            object lblCARProcCRespon: TLabel
              Left = 551
              Top = 5
              Width = 159
              Height = 15
              Caption = 'Centro de Responsabilidade'
            end
            object lblValorCAR: TLabel
              Left = 484
              Top = 112
              Width = 104
              Height = 23
              Alignment = taRightJustify
              AutoSize = False
              Color = clGray
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Layout = tlCenter
            end
            object Label2: TLabel
              Left = 374
              Top = 49
              Width = 108
              Height = 15
              Caption = 'Tipo de Documento'
            end
            object dblkCARPortadorForma: TwwDBLookupCombo
              Left = 5
              Top = 22
              Width = 354
              Height = 23
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'Descrição')
              LookupTable = qryPortRecebimento
              LookupField = 'CODPORTFORMA'
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
              OnChange = HabilitaProcessar
            end
            object dblkCARTipoRecebimento: TwwDBLookupCombo
              Left = 5
              Top = 65
              Width = 354
              Height = 23
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'35'#9'Descrição'
                'CODTIPRECDES'#9'15'#9'Código')
              LookupTable = qryTipoRecebimento
              LookupField = 'CODTIPRECDES'
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
              OnChange = HabilitaProcessar
            end
            object dtLanctoCAR: TCMDateTimePicker
              Left = 166
              Top = 114
              Width = 122
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 5
              OnChange = HabilitaProcessar
              OnExit = dtLanctoCARExit
            end
            object dtVenctoCAR: TCMDateTimePicker
              Left = 325
              Top = 112
              Width = 122
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 6
              OnChange = HabilitaProcessar
            end
            object dblkCARUnidNegoc: TwwDBLookupCombo
              Left = 372
              Top = 22
              Width = 169
              Height = 23
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'25'#9'Descrição'
                'UNECODIGO'#9'10'#9'Código')
              LookupTable = qryUnidNegoc
              LookupField = 'UNIDNEGOC'
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
              OnChange = HabilitaProcessar
            end
            object dblkCARCentroRespon: TwwDBLookupCombo
              Left = 550
              Top = 22
              Width = 179
              Height = 23
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Descrição'
                'CODCENTRORESPON'#9'10'#9'Código'
                'ANALITICOSINTET'#9'1'#9'A/S')
              LookupTable = qryCentRespon
              LookupField = 'CODCENTRORESPON'
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
              OnChange = HabilitaProcessar
            end
            object dblkCARTipoDoc: TwwDBLookupCombo
              Left = 373
              Top = 65
              Width = 355
              Height = 23
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'35'#9'Descrição'
                'CODTIPRECDES'#9'15'#9'Código')
              LookupTable = qryTipoDocCAR
              LookupField = 'DESCRICAO'
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
              OnChange = HabilitaProcessar
            end
          end
          object tbsIndividualNovoCAP: TTabSheet
            Caption = 'Dados para Novo Contas a Pagar'
            Enabled = False
            ImageIndex = 2
            object lblUnidNegoc: TLabel
              Left = 375
              Top = 8
              Width = 97
              Height = 15
              Caption = 'Atividade / Projeto'
            end
            object lblCentRespon: TLabel
              Left = 568
              Top = 8
              Width = 159
              Height = 15
              Caption = 'Centro de Responsabilidade'
            end
            object lblAlteradorUmParticip: TLabel
              Left = 375
              Top = 52
              Width = 190
              Height = 15
              Caption = 'Alterador (Ex.: Correção Monetária)'
            end
            object lblValor: TLabel
              Left = 602
              Top = 52
              Width = 95
              Height = 15
              Caption = 'Valor do Alterador'
            end
            object lblValorNovoCAP: TLabel
              Left = 705
              Top = 96
              Width = 27
              Height = 15
              Caption = 'Valor'
            end
            object lbldtvencto: TLabel
              Left = 507
              Top = 96
              Width = 110
              Height = 15
              Caption = 'Data de Vencimento'
            end
            object lbldtenvio: TLabel
              Left = 375
              Top = 96
              Width = 115
              Height = 15
              Caption = 'Data de Lançamento'
            end
            object lblTipoDesemb: TLabel
              Left = 4
              Top = 52
              Width = 119
              Height = 15
              Caption = 'Tipo de Desembolso '
            end
            object lblNovoPortForma: TLabel
              Left = 4
              Top = 8
              Width = 218
              Height = 15
              Caption = 'Contas / Caixas x Forma de Pagamento'
            end
            object lblValorCAP: TLabel
              Left = 633
              Top = 112
              Width = 104
              Height = 23
              Alignment = taRightJustify
              AutoSize = False
              Caption = '2.200,00  '
              Color = clGray
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Layout = tlCenter
            end
            object Label3: TLabel
              Left = 6
              Top = 96
              Width = 108
              Height = 15
              Caption = 'Tipo de Documento'
            end
            object dblkCAPTipoDoc: TwwDBLookupCombo
              Left = 4
              Top = 111
              Width = 349
              Height = 23
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'35'#9'Descrição'
                'CODTIPRECDES'#9'15'#9'Código')
              LookupTable = qryTipoDocCAP
              LookupField = 'DESCRICAO'
              TabOrder = 6
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
              OnChange = HabilitaProcessar
            end
            object dblkUnidNegoc: TwwDBLookupCombo
              Left = 375
              Top = 25
              Width = 169
              Height = 23
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'25'#9'Descrição'
                'UNECODIGO'#9'10'#9'Código')
              LookupTable = qryUnidNegoc
              LookupField = 'UNIDNEGOC'
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
              OnChange = HabilitaProcessar
            end
            object dblkCentRespon: TwwDBLookupCombo
              Left = 568
              Top = 25
              Width = 169
              Height = 23
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Descrição'
                'CODCENTRORESPON'#9'10'#9'Código'
                'ANALITICOSINTET'#9'1'#9'A/S')
              LookupTable = qryCentRespon
              LookupField = 'CODCENTRORESPON'
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
              OnChange = HabilitaProcessar
            end
            object dblkAlteradorUmParticip: TwwDBLookupCombo
              Left = 375
              Top = 68
              Width = 202
              Height = 23
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'35'#9'Descrição')
              LookupTable = qryAlterador
              LookupField = 'CODALTERADOR'
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
            object dtvenctoCAP: TCMDateTimePicker
              Left = 507
              Top = 112
              Width = 109
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 8
              OnChange = HabilitaProcessar
            end
            object dtenvioCAP: TCMDateTimePicker
              Left = 375
              Top = 112
              Width = 107
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 7
              OnChange = HabilitaProcessar
            end
            object dblkTipoDesemb: TwwDBLookupCombo
              Left = 4
              Top = 68
              Width = 349
              Height = 23
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'35'#9'Descrição'
                'CODTIPRECDES'#9'15'#9'Código')
              LookupTable = qryTipoDesembolso
              LookupField = 'CODTIPRECDES'
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
              OnChange = HabilitaProcessar
            end
            object dblkNovoPortForma: TwwDBLookupCombo
              Left = 4
              Top = 25
              Width = 348
              Height = 23
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'Descrição')
              LookupTable = qryPortPagamento
              LookupField = 'CODPORTFORMA'
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
              OnChange = HabilitaProcessar
            end
            object EditVlAlterador: TRealEdit
              Left = 600
              Top = 68
              Width = 105
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 5
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
          end
          object tbsIndividualReprocessamento: TTabSheet
            Caption = 'Lote para Reprocessamento'
            ImageIndex = 3
            object ckVoltaPreparo: TCheckBox
              Left = 5
              Top = 4
              Width = 148
              Height = 17
              Caption = 'Voltar para o preparo'
              TabOrder = 0
              OnClick = ckVoltaPreparoClick
            end
            object pnlReprocessamento: TPanel
              Left = 0
              Top = 32
              Width = 1002
              Height = 109
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 1
              object lblDescLote: TLabel
                Left = 5
                Top = 18
                Width = 87
                Height = 16
                Caption = 'Escolha o Lote'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object dbtDescricao: TDBText
                Left = 224
                Top = 17
                Width = 524
                Height = 18
                Color = clWhite
                DataField = 'DESCRICAO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
              end
              object lbMesReferencia: TLabel
                Left = 4
                Top = 58
                Width = 94
                Height = 16
                Caption = 'Mês Referência:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object dbtMesref: TDBText
                Left = 118
                Top = 57
                Width = 113
                Height = 18
                Alignment = taCenter
                Color = clWhite
                DataField = 'MESREF'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
              end
              object lbDtPagamento: TLabel
                Left = 247
                Top = 58
                Width = 101
                Height = 16
                Caption = 'Data Pagamento:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object dbtDataPagto: TDBText
                Left = 365
                Top = 57
                Width = 113
                Height = 18
                Alignment = taCenter
                Color = clWhite
                DataField = 'DATAPAGAMENTO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
              end
              object lb: TLabel
                Left = 492
                Top = 58
                Width = 126
                Height = 16
                Caption = 'Data Criação do Lote:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object dbtDatacria: TDBText
                Left = 637
                Top = 57
                Width = 113
                Height = 18
                Alignment = taCenter
                Color = clWhite
                DataField = 'DATAPREPARO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
              end
              object cmbLote: TwwDBLookupCombo
                Left = 107
                Top = 13
                Width = 107
                Height = 24
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'IDLOTE'#9'10'#9'Lote'#9'F'
                  'MESREFERENCIA'#9'7'#9'Mês'#9'F'
                  'NUMREG'#9'10'#9'N.Reg.'#9'F'
                  'VLRTOTAL'#9'10'#9'Valor'#9'F'
                  'DESCRICAO'#9'40'#9'Descrição'#9'F')
                LookupTable = qryCtrlInterface
                LookupField = 'IDLOTE'
                Options = [loColLines, loRowLines, loTitles]
                ParentFont = False
                TabOrder = 0
                AutoDropDown = False
                ShowButton = True
                AllowClearKey = True
                OnChange = cmbLoteChange
              end
            end
          end
          object tbsIndividualFormaPag: TTabSheet
            Caption = 'Forma de Pagamento'
            ImageIndex = 4
            object Label7: TLabel
              Left = 35
              Top = 16
              Width = 170
              Height = 15
              Caption = 'Portador Forma de Pagamento'
            end
            object Label8: TLabel
              Left = 540
              Top = 16
              Width = 98
              Height = 15
              Caption = 'Data Programada'
            end
            object Label9: TLabel
              Left = 331
              Top = 16
              Width = 166
              Height = 15
              Caption = 'Conta Bancária do Recebedor'
            end
            object dblkPortForma: TwwDBLookupCombo
              Left = 33
              Top = 34
              Width = 264
              Height = 23
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'Descrição'#9'F')
              LookupTable = qryPortPagamento
              LookupField = 'CODPORTFORMA'
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
              OnChange = HabilitaProcessar
            end
            object dtDataProg: TCMDateTimePicker
              Left = 540
              Top = 34
              Width = 121
              Height = 23
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
              TabOrder = 1
              OnChange = HabilitaProcessar
            end
            object dblkContaRecebedor: TwwDBLookupCombo
              Left = 336
              Top = 34
              Width = 134
              Height = 23
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CONTACORRENTE'#9'15'#9'Conta Corrente'#9'F'
                'NOMEBANCO'#9'30'#9'Banco'#9'F'
                'NOMEAGENCIA'#9'30'#9'Agência'#9'F')
              LookupTable = qryContaRecebedor
              LookupField = 'IDCBANCARIA'
              TabOrder = 2
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
              OnChange = HabilitaProcessar
            end
          end
        end
        object redInformacao: TRichEdit
          Left = 0
          Top = 212
          Width = 1010
          Height = 213
          Align = alClient
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Lines.Strings = (
            '  Informação : '
            
              'Para esta situação (estorno de todo o processo de um participant' +
              'e), será lançado um alterador, pelo valor líquido do contra-cheq' +
              'ue do '
            
              'participante, para o documento original - criado pela Efetivação' +
              ' da Folha de Benefícios.  Caso o documento original já tenha sid' +
              'o '
            
              'baixado (pago), será criado um Contas a Receber com este valor. ' +
              'Todos os históricos previdenciais relativos a esta efetivação se' +
              'rão '
            'apagados. ')
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 2
          OnMouseMove = redInformacaoMouseMove
        end
      end
      object tbsResultado: TTabSheet
        Caption = 'Resultado'
        ImageIndex = 3
        inline frameProgresso: TfrmFrameProgresso
          Width = 1010
          Height = 425
          Align = alClient
          PopupMenu = frameProgresso.PopupMenu1
          inherited Panel1: TPanel
            Width = 1010
            Height = 397
            inherited toolControles: TToolBar
              Width = 1008
              inherited lblNomeLog: TLabel
                Width = 760
                Font.Height = -12
              end
            end
            inherited redResultado: TRichEdit
              Width = 1008
              Height = 355
              Lines.Strings = ()
            end
            inherited redTemp: TRichEdit
              Top = 56
              Width = 760
              Height = 197
            end
          end
          inherited BarraProgresso: TProgressBar
            Top = 397
            Width = 1010
          end
          inherited StatusBar1: TStatusBar
            Top = 406
            Width = 1010
          end
          inherited ActionList1: TActionList
            Left = 320
            Top = 8
          end
          inherited ImageList1: TImageList
            Left = 248
            Top = 8
          end
          inherited qryFrame: TwwQuery
            Left = 400
            Top = 8
          end
          inherited PopupMenu1: TPopupMenu
            Left = 280
            Top = 8
          end
          inherited SaveDialog1: TSaveDialog
            Left = 360
            Top = 8
          end
        end
      end
    end
    object pnlSelecaoVersao: TPanel
      Left = 5
      Top = 5
      Width = 1018
      Height = 111
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 0
      object lblTituloVersao: TLabel
        Left = 14
        Top = 1
        Width = 322
        Height = 15
        Caption = 'Selecione a Versão de Pagamento da Folha de Benefícios '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lblTituloMotivo: TLabel
        Left = 14
        Top = 41
        Width = 97
        Height = 15
        Caption = 'Motivo do Estorno'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object gbOpcoesEstorno: TGroupBox
        Left = 585
        Top = 1
        Width = 176
        Height = 104
        Caption = ' Opções de Estorno '
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        TabStop = True
        object rbEstornoCompleto: TRadioButton
          Left = 19
          Top = 26
          Width = 137
          Height = 17
          Caption = 'Estorno Completo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TabStop = True
          OnClick = rbEstornoClick
        end
        object rbEstornoIndividual: TRadioButton
          Left = 20
          Top = 64
          Width = 137
          Height = 17
          Caption = 'Estorno Individual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          TabStop = True
          OnClick = rbEstornoClick
        end
      end
      object dblkFolha: TwwDBLookupCombo
        Left = 14
        Top = 17
        Width = 553
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'HISTORICO'#9'50'#9'Histórico'#9'F')
        LookupTable = qryHist
        LookupField = 'IDHSTFOLHABENEF'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnChange = dblkFolhaChange
        OnExit = dblkFolhaExit
      end
      object mmMotivo: TMemo
        Left = 14
        Top = 57
        Width = 553
        Height = 24
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 200
        ParentFont = False
        TabOrder = 1
        OnChange = HabilitaProcessar
        OnExit = HabilitaProcessar
      end
      object GroupBox2: TGroupBox
        Left = 14
        Top = 77
        Width = 555
        Height = 26
        TabOrder = 3
        object lblContabil: TLabel
          Left = 4
          Top = 10
          Width = 60
          Height = 13
          Caption = 'lblContabil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblfinanc: TLabel
          Left = 248
          Top = 10
          Width = 49
          Height = 13
          Caption = 'lblfinanc'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object pnlRecebedor: TPanel
      Left = 5
      Top = 116
      Width = 1018
      Height = 39
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 1
      Visible = False
      object lblTituloRecebedor: TLabel
        Left = 6
        Top = 4
        Width = 97
        Height = 30
        Alignment = taRightJustify
        Caption = 'Recebedor para estorno individual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object fcsbtnProcurar: TfcShapeBtn
        Left = 685
        Top = 2
        Width = 77
        Height = 18
        Caption = 'Procurar'
        Color = clBtnFace
        DitherColor = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        NumGlyphs = 0
        Offsets.TextY = -2
        ParentClipping = True
        ParentFont = False
        RoundRectBias = 25
        ShadeStyle = fbsHighlight
        Shape = bsRoundRect
        TabOrder = 0
        TextOptions.Alignment = taCenter
        TextOptions.LineSpacing = 1
        TextOptions.VAlignment = vaVCenter
        OnClick = fcsbtnProcurarClick
      end
      object edNome: TEdit
        Left = 111
        Top = 8
        Width = 452
        Height = 23
        Color = clInactiveCaption
        Enabled = False
        TabOrder = 1
      end
      object fcsbtnLimpa: TfcShapeBtn
        Left = 685
        Top = 19
        Width = 77
        Height = 18
        Caption = 'Limpar'
        Color = clBtnFace
        DitherColor = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Offsets.TextY = -2
        ParentClipping = True
        ParentFont = False
        RoundRectBias = 25
        ShadeStyle = fbsHighlight
        Shape = bsRoundRect
        TabOrder = 2
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        OnClick = fcsbtnLimpaClick
      end
      object edTipoPessoa: TEdit
        Left = 564
        Top = 8
        Width = 114
        Height = 23
        AutoSize = False
        Color = clInactiveCaption
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
    end
  end
  inherited Dock971: TDock97
    Top = 615
    Width = 1028
    inherited tb97Fundo: TToolbar97
      Left = 584
      DockPos = 584
      ParentShowHint = False
      inherited sep1: TToolbarSep97
        Left = 347
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 430
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep972: TToolbarSep97 [2]
        Left = 264
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 266
        ParentBiDiMode = False
        ParentShowHint = False
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 349
        ParentBiDiMode = False
        ParentShowHint = False
      end
      object bbtnProcessar: TBitBtn
        Left = 0
        Top = 0
        Width = 128
        Height = 33
        Caption = 'Processar'
        Enabled = False
        TabOrder = 2
        OnClick = bbtnProcessarClick
        Glyph.Data = {
          06010000424D060100000000000076000000280000000B000000120000000100
          0400000000009000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333333A
          000033833333333F00003088333333380000300883333337000030A088333338
          000030AA088333300000307A70883338000030AAAA08833F000030A7A7A08837
          000030AAAAAA03300000307A7A703338000030AAAA033338000030A7A0333330
          000030AA0333333800003070333333380000300333333338000030333333333F
          00003333333333300000}
      end
      object bbtnOutro: TBitBtn
        Left = 128
        Top = 0
        Width = 136
        Height = 33
        Caption = '&Processar Outro'
        TabOrder = 3
        Visible = False
        OnClick = bbtnOutroClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
          3333333777333777FF33339993707399933333773337F3777FF3399933000339
          9933377333777F3377F3399333707333993337733337333337FF993333333333
          399377F33333F333377F993333303333399377F33337FF333373993333707333
          333377F333777F333333993333101333333377F333777F3FFFFF993333000399
          999377FF33777F77777F3993330003399993373FF3777F37777F399933000333
          99933773FF777F3F777F339993707399999333773F373F77777F333999999999
          3393333777333777337333333999993333333333377777333333}
        NumGlyphs = 2
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 733
    Top = 27
    TargetsData = (
      1
      3
      (
        ''
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0)
      (
        ''
        'Filter'
        0))
  end
  object qryHist: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDHSTFOLHABENEF,'
      '       IDHSTFOLHABENEF||'#39' - '#39'||HISTORICO AS HISTORICO,'
      '       MESREFERENCIA,'
      '       DATAPREVPAGTO,'
      '       FLGESTADO,'
      '       FLGTIPOFOLHA,'
      '       PLNPROVISABONO'
      'FROM HSTFOLHABENEF'
      'WHERE (FLGESTADO IS NULL) OR (FLGESTADO IN (0,1))'
      'ORDER BY IDHSTFOLHABENEF DESC'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 411
    Top = 78
  end
  object qryParticip: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT P.NOME, P.IDPESSOA'
      'FROM HISTRUBSAL H, PESSOA P'
      'WHERE H.IDHSTFOLHABENEF = :IDHSTFOLHABENEF AND'
      '              H.IDPESSOA = P.IDPESSOA(+)')
    ValidateWithMask = True
    Left = 449
    Top = 78
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHSTFOLHABENEF'
        ParamType = ptUnknown
        Value = 8
      end>
  end
  object qryPortPagamento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODPORTFORMA, CODFORMA, DESCRICAO'
      'FROM PORTADORFORMA'
      'WHERE RECPAG = '#39'P'#39
      'AND IDPESSOA = :idPessoa'
      'ORDER BY DESCRICAO'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 8
    Top = 484
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idPessoa'
        ParamType = ptUnknown
      end>
  end
  object qryAlterador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODALTERADOR, DESCRICAO, ACRESDECRES, PLACONTA'
      'FROM TIPOALTERADOR'
      'WHERE RECPAG = '#39'P'#39
      'AND IDPESSOA = :idPessoa'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 68
    Top = 425
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idPessoa'
        ParamType = ptUnknown
      end>
  end
  object qryTipoDesembolso: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTIPRECDES, DESCRICAO'
      'FROM TIPORECEBDESEMB'
      'WHERE RECPAG = '#39'P'#39
      'AND IDPESSOA = :idPessoa'
      'ORDER BY CODTIPRECDES')
    ValidateWithMask = True
    Left = 80
    Top = 484
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idPessoa'
        ParamType = ptUnknown
        Value = 2
      end>
  end
  object qryTipoRecebimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTIPRECDES,DESCRICAO'
      'FROM TIPORECEBDESEMB'
      'WHERE RECPAG = '#39'R'#39' '
      'AND IDPESSOA = :idPessoa'
      'ORDER BY CODTIPRECDES')
    ValidateWithMask = True
    Left = 116
    Top = 484
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idPessoa'
        ParamType = ptUnknown
        Value = 2
      end>
  end
  object qryPortRecebimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODPORTFORMA, CODFORMA, DESCRICAO '
      'FROM PORTADORFORMA'
      'WHERE RECPAG = '#39'R'#39
      'AND IDPESSOA = :idPessoa'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 44
    Top = 485
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idPessoa'
        ParamType = ptUnknown
      end>
  end
  object qryAlteradorCAPOriginal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODALTERADOR, DESCRICAO, ACRESDECRES, PLACONTA'
      'FROM TIPOALTERADOR'
      'WHERE RECPAG = '#39'P'#39
      'AND IDPESSOA = :idPessoa'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 36
    Top = 424
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idPessoa'
        ParamType = ptUnknown
      end>
  end
  object qryUnidNegoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT UNIDNEGOC, NOME,UNECODIGO FROM UNIDNEGOCIO'
      'WHERE IDPESSOA = :IDPESSOA'
      'ORDER BY UNECODIGO')
    ValidateWithMask = True
    Left = 258
    Top = 484
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 2
      end>
  end
  object qryCentRespon: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODCENTRORESPON, NOME, ANALITICOSINTET, ATIVO'
      'FROM CENTRESPON'
      'WHERE IDPESSOA = :IDPESSOA '
      'AND CODCENTRORESPON <> '#39'9999999999'#39
      'AND ANALITICOSINTET = '#39'A'#39
      'ORDER BY CODCENTRORESPON')
    ValidateWithMask = True
    Left = 302
    Top = 476
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idpessoa'
        ParamType = ptUnknown
        Value = 2
      end>
  end
  object msRecebedor: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'E.MATRICULA'
      'PP.INSCRICAONUMERO'
      'PT.NOME'
      'PR.NOME'
      'PV.NOME'
      'PJ.NOME'
      'H.NUMBANCO'
      'H.NUMAGENCIA'
      'H.CONTACORRENTE')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Inscrição'
      'Titular'
      'Recebedor'
      'Plano '
      'Patrocinadora'
      'Banco'
      'Agência'
      'C/Corrente')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'HISTRUBSAL H'
      'ELEGPATRO E'
      'PARTPREVPLAN PP'
      'PESSOA PT'
      'PESSOA PR'
      'PESSOA PJ'
      'PLANPREV PV')
    CamposChave.Strings = (
      'PP.INSCRICAONUMERO'
      'E.MATRICULA'
      'PT.NOME'
      'PR.NOME'
      'H.IDTITULAR'
      'H.IDRESPONSAVEL'
      'H.IDPESSJUR'
      'H.MESCOBRANCA'
      'H.IDPATRO'
      'H.IDPLANOPREV'
      '0 '
      'PV.NOME'
      'PJ.NOME'
      'NVL(PP.FLGFITESPECIAL,0)')
    Filtro.Strings = (
      'H.IDPATRO = PP.IDPESSJUR'
      'H.IDTITULAR = PP.IDPESSOA'
      'H.IDPLANOPREV = PP.IDPLANOPREV'
      'H.IDTITULAR = E.IDPESSOA'
      'H.IDPATRO = E.IDPESSJUR'
      'H.IDTITULAR = PT.IDPESSOA'
      'H.IDRESPONSAVEL = PR.IDPESSOA'
      'NVL(H.FLGESTORNO,0) IN (0,1)'
      'H.IDPATRO = PJ.IDPESSOA'
      'H.IDPLANOPREV = PV.IDPLANOPREV')
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
      '13'
      '10'
      '40'
      '40'
      '40'
      '40'
      '4'
      '15'
      '15')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 724
    Top = 74
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 101
    Top = 426
  end
  object qryAlteraCompIRRF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '         '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 791
    Top = 264
  end
  object qryDocumentos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT G.CODDOCUMENTO, L.NUMLANCTO, D.STATUS, L.VALOR, L.PLNCODI' +
        'GO'
      'FROM (SELECT DISTINCT CODDOCUMENTO'
      '      FROM HISTRUBSAL'
      '      WHERE IDHSTFOLHABENEF = :pidhstfolhabenef'
      '      UNION'
      '      SELECT DISTINCT CODDOCUMENTO'
      '      FROM HSTFOLHABENEFCAP'
      
        '      WHERE IDHSTFOLHABENEF = :pidhstfolhabenef) G, DOCUMENTO D,' +
        ' LANCTODOCUM L'
      'WHERE D.CODDOCUMENTO = G.CODDOCUMENTO'
      'AND D.CODDOCUMENTO = L.CODDOCUMENTO(+)'
      'AND L.OPERACAO(+) = '#39'2'#39
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 372
    Top = 78
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pidhstfolhabenef'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pidhstfolhabenef'
        ParamType = ptUnknown
      end>
  end
  object dsCAPParticip: TwwDataSource
    DataSet = qryCAPParticip
    Left = 54
    Top = 78
  end
  object dsCAP: TwwDataSource
    DataSet = qryCAP
    Left = 121
    Top = 78
  end
  object dsPlanil: TwwDataSource
    DataSet = qryPlanilha
    Left = 187
    Top = 78
  end
  object dsContab: TwwDataSource
    DataSet = qryContab
    Left = 254
    Top = 78
  end
  object qryContab: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsPlanil
    SQL.Strings = (
      
        'SELECT PL.PERNUMERO,PL.PEREXERCICIO,PL.PLNPLANIL,PL.PLNTOTDEB, L' +
        'C.LACDEBCRE,LC.LACVALOR,'
      
        '       LC.PLACONTA,PC.PLANOME,LC.LACHIST1,LC.LACHIST2,LC.LACHIST' +
        '3,LC.LACHIST4'
      'FROM PLANILHA PL, LANCAMENTO LC, PLANOCONTA PC'
      'WHERE PL.PLNCODIGO = :PLNCODIGO   AND'
      '      PL.PLNCODIGO = LC.PLNCODIGO AND'
      '      LC.PLACONTA  = PC.PLACONTA  AND'
      '      LC.PLANO     = PC.PLANO'
      'ORDER BY LACDEBCRE DESC'
      ' ')
    ValidateWithMask = True
    Left = 225
    Top = 78
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end>
    object qryContabPERNUMERO: TFloatField
      DisplayWidth = 10
      FieldName = 'PERNUMERO'
      Origin = 'BASEDADOS.PLANILHA.PERNUMERO'
    end
    object qryContabPEREXERCICIO: TFloatField
      DisplayWidth = 10
      FieldName = 'PEREXERCICIO'
      Origin = 'BASEDADOS.PLANILHA.PEREXERCICIO'
    end
    object qryContabPLNPLANIL: TFloatField
      DisplayWidth = 10
      FieldName = 'PLNPLANIL'
      Origin = 'BASEDADOS.PLANILHA.PLNPLANIL'
    end
    object qryContabPLNTOTDEB: TFloatField
      DisplayWidth = 10
      FieldName = 'PLNTOTDEB'
      Origin = 'BASEDADOS.PLANILHA.PLNTOTDEB'
      DisplayFormat = '#0.00'
    end
    object qryContabLACDEBCRE: TStringField
      DisplayWidth = 1
      FieldName = 'LACDEBCRE'
      Origin = 'BASEDADOS.LANCAMENTO.LACDEBCRE'
      FixedChar = True
      Size = 1
    end
    object qryContabLACVALOR: TFloatField
      DisplayWidth = 10
      FieldName = 'LACVALOR'
      Origin = 'BASEDADOS.LANCAMENTO.LACVALOR'
    end
    object qryContabPLACONTA: TStringField
      DisplayWidth = 18
      FieldName = 'PLACONTA'
      Origin = 'BASEDADOS.LANCAMENTO.PLACONTA'
      FixedChar = True
      Size = 18
    end
    object qryContabPLANOME: TStringField
      DisplayWidth = 40
      FieldName = 'PLANOME'
      Origin = 'BASEDADOS.PLANOCONTA.PLANOME'
      Size = 40
    end
    object qryContabLACHIST1: TStringField
      DisplayWidth = 40
      FieldName = 'LACHIST1'
      Origin = 'BASEDADOS.LANCAMENTO.LACHIST1'
      Size = 40
    end
    object qryContabLACHIST2: TStringField
      DisplayWidth = 40
      FieldName = 'LACHIST2'
      Origin = 'BASEDADOS.LANCAMENTO.LACHIST2'
      Size = 40
    end
    object qryContabLACHIST3: TStringField
      DisplayWidth = 40
      FieldName = 'LACHIST3'
      Origin = 'BASEDADOS.LANCAMENTO.LACHIST3'
      Size = 40
    end
    object qryContabLACHIST4: TStringField
      DisplayWidth = 40
      FieldName = 'LACHIST4'
      Origin = 'BASEDADOS.LANCAMENTO.LACHIST4'
      Size = 40
    end
  end
  object qryPlanilha: TwwQuery
    AfterScroll = qryPlanilhaAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLNCODIGO, PERNUMERO, PEREXERCICIO, PLNPLANIL, PLNTOTDEB'
      'FROM ('
      
        'SELECT DISTINCT PL.PLNCODIGO,PL.PERNUMERO,PL.PEREXERCICIO,PL.PLN' +
        'PLANIL,PL.PLNTOTDEB'
      'FROM HSTFOLHABENEFCAP HS, LANCTODOCUM LC, PLANILHA PL'
      'WHERE HS.IDHSTFOLHABENEF = :IDHSTFOLHABENEF'
      'AND HS.CODDOCUMENTO = LC.CODDOCUMENTO (+)'
      'AND LC.PLNCODIGO = PL.PLNCODIGO'
      'UNION'
      
        'SELECT DISTINCT PL.PLNCODIGO,PL.PERNUMERO,PL.PEREXERCICIO,PL.PLN' +
        'PLANIL,PL.PLNTOTDEB'
      'FROM MOTIVOESTORNOFB M, PLANILHA PL'
      'WHERE M.IDHSTFOLHABENEF = :IDHSTFOLHABENEF'
      'AND M.PLNCODIGO = PL.PLNCODIGO'
      'UNION'
      
        'SELECT DISTINCT PL.PLNCODIGO,PL.PERNUMERO,PL.PEREXERCICIO,PL.PLN' +
        'PLANIL,PL.PLNTOTDEB'
      'FROM HSTFOLHABENEF H, PLANILHA PL'
      'WHERE H.IDHSTFOLHABENEF = :IDHSTFOLHABENEF'
      'AND H.PLNPROVISABONO = PL.PLNCODIGO'
      ') G'
      'ORDER BY PLNCODIGO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 158
    Top = 78
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHSTFOLHABENEF'
        ParamType = ptUnknown
        Value = 8
      end
      item
        DataType = ftInteger
        Name = 'IDHSTFOLHABENEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDHSTFOLHABENEF'
        ParamType = ptUnknown
      end>
    object qryPlanilhaPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryPlanilhaPERNUMERO: TFloatField
      FieldName = 'PERNUMERO'
    end
    object qryPlanilhaPEREXERCICIO: TFloatField
      FieldName = 'PEREXERCICIO'
    end
    object qryPlanilhaPLNPLANIL: TFloatField
      FieldName = 'PLNPLANIL'
    end
    object qryPlanilhaPLNTOTDEB: TFloatField
      FieldName = 'PLNTOTDEB'
      DisplayFormat = '#0.00'
    end
  end
  object qryCAP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  D.NODOCUMENTO,'
      '  D.DATAPROGRAMADA,'
      '  LANC.VALORLANC,'
      '  D.PLACONTA,'
      '  D.CODDOCUMENTO,'
      '  D.CODPORTFORMA,'
      '  D.IDFORCLI,'
      '  PFAV.NOME,'
      '  H.NOMETXT,'
      '  SALD.SALDO,'
      '  LANC.PLNCODIGO,'
      '  LANC.HISTORICOCOMPL,'
      '  CONT.QTD'
      ''
      'FROM'
      '  HSTFOLHABENEFCAP H,'
      '  DOCUMENTO D,'
      '  PESSOA PFAV,'
      ' (SELECT'
      '    L.CODDOCUMENTO,'
      '    L.PLNCODIGO,'
      '    L.HISTORICOCOMPL,'
      '    SUM(DECODE(L.DEBCRE,'#39'C'#39',VALOR,VALOR*-1)) VALORLANC'
      ''
      '  FROM'
      '    LANCTODOCUM L,'
      '    DOCUMENTO D1'
      ''
      'WHERE D1.CODDOCUMENTO = L.CODDOCUMENTO(+)'
      'AND   L.OPERACAO <> '#39'5'#39
      ''
      '  GROUP BY'
      '    L.CODDOCUMENTO,'
      '    L.PLNCODIGO,'
      '    L.HISTORICOCOMPL) LANC ,'
      ''
      ' (SELECT'
      '    L.CODDOCUMENTO,'
      '    SUM(DECODE(L.DEBCRE,'#39'C'#39',VALOR,VALOR*-1)) SALDO'
      ''
      '  FROM'
      '    LANCTODOCUM L,'
      '    DOCUMENTO D1'
      ''
      'WHERE D1.CODDOCUMENTO = L.CODDOCUMENTO(+)'
      '  GROUP BY'
      '    L.CODDOCUMENTO) SALD,'
      ''
      '  (SELECT'
      '     COUNT(DISTINCT IDRESPONSAVEL) AS QTD,'
      '     H.CODDOCUMENTO'
      ''
      '   FROM HISTRUBSAL H'
      '   WHERE H.IDHSTFOLHABENEF = :IDHSTFOLHABENEF'
      '     AND H.FLGESTORNO      = 0'
      ''
      '   GROUP BY'
      '     H.CODDOCUMENTO) CONT'
      ''
      'WHERE H.IDHSTFOLHABENEF = :IDHSTFOLHABENEF'
      '  AND H.CODDOCUMENTO    = D.CODDOCUMENTO (+)'
      '  AND D.IDFORCLI        = PFAV.IDPESSOA(+)'
      '  AND D.CODDOCUMENTO    = LANC.CODDOCUMENTO'
      '  AND D.CODDOCUMENTO    = SALD.CODDOCUMENTO'
      '  AND H.CODDOCUMENTO    = CONT.CODDOCUMENTO'
      ' ')
    ValidateWithMask = True
    Left = 92
    Top = 78
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDHSTFOLHABENEF'
        ParamType = ptUnknown
        Value = 216
      end
      item
        DataType = ftFloat
        Name = 'IDHSTFOLHABENEF'
        ParamType = ptUnknown
      end>
    object qryCAPNODOCUMENTO: TFloatField
      DisplayLabel = 'Número do Documento'
      DisplayWidth = 15
      FieldName = 'NODOCUMENTO'
    end
    object qryCAPDATAPROGRAMADA: TDateTimeField
      DisplayLabel = 'Vencto'
      DisplayWidth = 10
      FieldName = 'DATAPROGRAMADA'
    end
    object qryCAPVALORLANC: TFloatField
      DisplayLabel = 'Valor Líquido'
      DisplayWidth = 10
      FieldName = 'VALORLANC'
      DisplayFormat = '#0.00'
    end
    object qryCAPSALDO: TFloatField
      DisplayLabel = 'Saldo a Pagar'
      DisplayWidth = 10
      FieldName = 'SALDO'
      DisplayFormat = '#0.00'
    end
    object qryCAPNOME: TStringField
      DisplayLabel = 'Favorecido'
      DisplayWidth = 34
      FieldName = 'NOME'
      Size = 60
    end
    object qryCAPNOMETXT: TStringField
      DisplayLabel = 'Arquivo TXT'
      DisplayWidth = 20
      FieldName = 'NOMETXT'
    end
    object qryCAPHISTORICOCOMPL: TStringField
      DisplayLabel = 'Descrição do Lançamento'
      DisplayWidth = 60
      FieldName = 'HISTORICOCOMPL'
      Size = 60
    end
    object qryCAPIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Visible = False
    end
    object qryCAPPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Visible = False
      FixedChar = True
      Size = 18
    end
    object qryCAPCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Visible = False
    end
    object qryCAPCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Visible = False
    end
    object qryCAPPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object qryCAPQTD: TFloatField
      FieldName = 'QTD'
    end
  end
  object qryCAPParticip: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT H.MES,'
      '       '#39'123456789012345678'#39' AS PLACONTA,'
      '       H.PLACONTAC,'
      '       H.PLACONTAD,'
      '       H.CODCENTROCUSTOC,'
      '       H.CODCENTROCUSTOD,'
      '       0 AS CODSUBCONTA,'
      '       0 AS UNIDNEGOC,'
      '       '#39'1234567890'#39' AS CODCENTROCUSTO,'
      '       PD.IDPROVENTO AS CODIGO,'
      '       PD.DESCRICAO AS RUBRICA,'
      
        '       DECODE(PRM.FLGUSACODRUBEXT, 0, TO_CHAR(PD.IDPROVENTO), PD' +
        '.CODPROVDESC) AS CODRUBEXIBICAO,'
      
        '       DECODE(PRM.FLGUSACODRUBEXT, 0, PD.DESCRICAO, PD.DESCRPROV' +
        'DESC) AS DESCRUBEXIBICAO,'
      
        '       DECODE(NVL(H.FLGESPECIAL,PD.FLGESPECIAL),0,DECODE(NVL(H.F' +
        'LGDESCONTO,PD.FLGDESCONTO),0,'#39'P'#39',1,'#39'D'#39','#39'I'#39'),'#39'I'#39') AS ESTADO,'
      '       H.VALORPROVENTO,'
      '       DECODE(H.FLGESTORNO,'
      '              Null, '#39'PAGAMENTO NORMAL'#39','
      '              0,    '#39'PAGAMENTO NORMAL'#39','
      '              1,    '#39'PAGAMENTO PENDENTE'#39') AS SITUACAO,'
      '       H.FLGESTORNO,'
      '       NVL(H.IDPLANOCONTABIL, H.IDPLANOPREV) AS IDPLANOCONTABIL,'
      '       H.VALORPROVENTO AS VALOR'
      'FROM HISTRUBSAL H, PARAMAPREV PRM, PROVDESC PD'
      'WHERE H.IDHSTFOLHABENEF = :PIDHSTFOLHABENEF'
      'AND H.IDTITULAR = :PIDTITULAR'
      'AND H.IDRESPONSAVEL = :PIDRESPONSAVEL'
      'AND H.IDRUBRICA = PD.IDPROVENTO'
      'AND NVL(H.FLGESTORNO,0) IN (0,1)'
      'ORDER BY H.SEQRUBRICA'
      ' ')
    UpdateObject = UpdateSQL1
    ValidateWithMask = True
    Left = 25
    Top = 78
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDHSTFOLHABENEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDRESPONSAVEL'
        ParamType = ptUnknown
      end>
    object qryCAPParticipMES: TStringField
      DisplayLabel = 'Mês Ref.'
      DisplayWidth = 7
      FieldName = 'MES'
      FixedChar = True
      Size = 7
    end
    object qryCAPParticipCODRUBEXIBICAO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'CODRUBEXIBICAO'
      Size = 40
    end
    object qryCAPParticipDESCRUBEXIBICAO: TStringField
      DisplayLabel = 'Descrição da Rubrica'
      DisplayWidth = 67
      FieldName = 'DESCRUBEXIBICAO'
      Size = 130
    end
    object qryCAPParticipESTADO: TStringField
      DisplayLabel = 'P/D/I'
      DisplayWidth = 6
      FieldName = 'ESTADO'
      Size = 1
    end
    object qryCAPParticipVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VALOR'
    end
    object qryCAPParticipPLACONTAC: TStringField
      DisplayLabel = 'Conta crédito'
      DisplayWidth = 15
      FieldName = 'PLACONTAC'
      Size = 18
    end
    object qryCAPParticipPLACONTAD: TStringField
      DisplayLabel = 'Conta débito'
      DisplayWidth = 15
      FieldName = 'PLACONTAD'
      Size = 18
    end
    object qryCAPParticipIDPLANOCONTABIL: TFloatField
      DisplayLabel = 'Plano Contábil'
      DisplayWidth = 10
      FieldName = 'IDPLANOCONTABIL'
    end
    object qryCAPParticipUNIDNEGOC: TFloatField
      DisplayLabel = 'Atividade / Projeto'
      DisplayWidth = 12
      FieldName = 'UNIDNEGOC'
    end
    object qryCAPParticipSITUACAO: TStringField
      DisplayLabel = 'Situação'
      DisplayWidth = 18
      FieldName = 'SITUACAO'
      Size = 18
    end
    object qryCAPParticipCODCENTROCUSTOC: TStringField
      DisplayLabel = 'C Custo crédito'
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTOC'
      Size = 10
    end
    object qryCAPParticipCODCENTROCUSTOD: TStringField
      DisplayLabel = 'C Custo débito'
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTOD'
      Size = 10
    end
    object qryCAPParticipCODSUBCONTA: TFloatField
      DisplayLabel = 'Subconta'
      DisplayWidth = 10
      FieldName = 'CODSUBCONTA'
    end
    object qryCAPParticipCODIGO: TFloatField
      FieldName = 'CODIGO'
      Visible = False
    end
    object qryCAPParticipRUBRICA: TStringField
      FieldName = 'RUBRICA'
      Visible = False
      Size = 130
    end
    object qryCAPParticipVALORPROVENTO: TFloatField
      FieldName = 'VALORPROVENTO'
      Visible = False
    end
    object qryCAPParticipFLGESTORNO: TFloatField
      FieldName = 'FLGESTORNO'
      Visible = False
    end
  end
  object qryAux1: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 135
    Top = 427
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select plainativa, platipo, plasubconta, placcust'
      'from planoconta'
      'where placonta = :placonta'
      'and plano = :plano'
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 152
    Top = 484
    ParamData = <
      item
        DataType = ftString
        Name = 'placonta'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'plano'
        ParamType = ptUnknown
      end>
  end
  object qryTipoDocCAR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTIPDOC, DESCRICAO'
      'FROM TIPODOCRECPAG'
      'WHERE RECPAG = '#39'R'#39)
    ValidateWithMask = True
    Left = 222
    Top = 484
  end
  object qryTipoDocCAP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTIPDOC, DESCRICAO'
      'FROM TIPODOCRECPAG'
      'WHERE RECPAG = '#39'P'#39)
    ValidateWithMask = True
    Left = 187
    Top = 484
  end
  object UpdateSQL1: TUpdateSQL
    ModifySQL.Strings = (
      'update PROVDESC'
      'set'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  IDPROVENTO = :OLD_IDPROVENTO')
    InsertSQL.Strings = (
      'insert into PROVDESC'
      '  (DESCRICAO)'
      'values'
      '  (:DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from PROVDESC'
      'where'
      '  IDPROVENTO = :OLD_IDPROVENTO')
    Left = 173
    Top = 428
  end
  object qryCtrlInterface: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDLOTE, DATAPAGAMENTO, DATAPREPARO, VLRTOTAL, NUMREG, MES' +
        'REFERENCIA,'
      
        '       DESCRICAO, SUBSTR(MESREFERENCIA,6,2)||'#39'/'#39'||SUBSTR(MESREFE' +
        'RENCIA,1,4) AS MESREF'
      'FROM CTRLINTERFACE'
      'WHERE TIPO = '#39'B'#39
      'AND (FLGVOLTATMP = 0 OR FLGVOLTATMP IS NULL)'
      'AND (FLGCONCESSAO = 0 OR FLGCONCESSAO IS NULL)'
      'AND (IDREFERENCIA IS NULL)'
      'AND (FLGTIPOFOLHA = 6)'
      '')
    ValidateWithMask = True
    Left = 292
    Top = 78
  end
  object dsCtrlinterface: TDataSource
    DataSet = qryCtrlInterface
    Left = 321
    Top = 78
  end
  object qryLotes: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 233
    Top = 429
  end
  object qryContaRecebedor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PB.NOME AS NOMEBANCO,'
      'PA.NOME AS NOMEAGENCIA, '
      'CB.CONTACORRENTE,'
      'CB.IDCBANCARIA '
      'FROM '
      'PESSOA PB,'
      'PESSOA PA, '
      'CONTABANCARIA CB, '
      'AGENCIABANCARIA AB,'
      'BANCO BC'
      'WHERE'
      '(CB.IDPESSOA=:IDPESSOA) AND'
      '(CB.IDAGENCIA=AB.IDPESSOA) AND'
      '(AB.IDBANCO = BC.IDPESSOA) AND'
      '(PB.IDPESSOA = BC.IDPESSOA) AND'
      '(PA.IDPESSOA = AB.IDPESSOA)'
      'ORDER BY FLGCONTAPREF'
      ' ')
    ValidateWithMask = True
    Left = 281
    Top = 429
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOME'
      'FROM PESSOA'
      'WHERE IDPESSOA = :IDPESSOA'
      '')
    ValidateWithMask = True
    Left = 406
    Top = 428
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idpessoa'
        ParamType = ptUnknown
      end>
  end
  object qryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 565
    Top = 368
  end
  object qryAux3: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 605
    Top = 368
  end
  object qryHstLote: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 457
    Top = 429
  end
  object qryEstorno: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 337
    Top = 477
  end
  object qryTipoEventoDocum: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOEVENTODOCUM, IDMODULO, DESCRICAO, FLGATIVO '
      'FROM TIPOEVENTODOCUM')
    ValidateWithMask = True
    Left = 377
    Top = 484
    object qryTipoEventoDocumDESCRICAO: TStringField
      DisplayWidth = 60
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.TIPOEVENTODOCUM.DESCRICAO'
      Size = 60
    end
    object qryTipoEventoDocumIDTIPOEVENTODOCUM: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOEVENTODOCUM'
      Origin = 'BASEDADOS.TIPOEVENTODOCUM.IDTIPOEVENTODOCUM'
      Visible = False
    end
    object qryTipoEventoDocumIDMODULO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMODULO'
      Origin = 'BASEDADOS.TIPOEVENTODOCUM.IDMODULO'
      Visible = False
    end
    object qryTipoEventoDocumFLGATIVO: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGATIVO'
      Origin = 'BASEDADOS.TIPOEVENTODOCUM.FLGATIVO'
      Visible = False
    end
  end
end
