inherited frmCadHstBeneficio: TfrmCadHstBeneficio
  Left = 341
  Top = 20
  HelpContext = 180036
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Cadastro Manual do Histórico de Benefícios'
  ClientHeight = 668
  ClientWidth = 784
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 784
    Height = 582
    inherited tbcDetalhe: TTabControlDetalhe [0]
      Top = 227
      Width = 782
      Height = 354
      Tabs.Strings = (
        'Histórico'
        'Alteradores')
      OnChanging = nil
      detdbGrids.Strings = (
        'dbgrdDet'
        'dbgrdAlt')
      inherited pgctrlDetalhe: TPageControl
        Width = 684
        Height = 295
        OnChange = pgctrlDetalheChange
        inherited tbsDet: TTabSheet
          Caption = 'Histórico'
          inherited dbgrdDet: TwwDBGrid
            Width = 676
            Height = 267
            Selected.Strings = (
              'MES'#9'10'#9'Mês de ~Pagamento'#9'F'
              'MESREFERENCIA'#9'10'#9'Mês de ~Referência'#9'F'
              'MESCOMPREEM'#9'7'#9'Mês de~Reembolso'#9'F'
              'VALORPREV'#9'10'#9'Valor ~Previsto'#9'F'
              'VLBENEFPGTO'#9'10'#9'Valor ~Efetivo'#9'F'
              'DATAPAGAMENTO'#9'10'#9'Data ~Prevista'#9'F'
              'DTEFETPGTO'#9'10'#9'Data ~Efetiva'#9'F'
              'VALORBS'#9'10'#9'Valor~BS'#9'F'
              'VALORFAB'#9'10'#9'Valor~FAB'#9'F'
              'VLRBASEDEFICIT'#9'10'#9'Base~Déficit'#9'F'
              'IDLOTE'#9'10'#9'Lote Nº'#9'F'
              'FLGDEVOLUCAO'#9'10'#9'Devolução'#9'F'
              'FLGCONCESSAO'#9'10'#9'Concessão'#9'F'
              'ESTADO'#9'10'#9'Estado'#9'F'
              'DESCRICAO'#9'33'#9'Motivo'#9'F'
              'VALOROP1'#9'10'#9'Valor~1ª Opção'#9'F'
              'VALOROP2'#9'10'#9'Valor~2ª Opção'#9'F'
              'VALOROP3'#9'10'#9'Valor~3ª Opção'#9'F'
              'VALORPREVMIN'#9'10'#9'Valor Mín.~Previsto'#9'F'
              'VALORTOTAL'#9'10'#9'Valor~Total'#9'F'
              'PERCENTUAL'#9'10'#9'Percentual'#9'F'
              'TIPOREGISTRO'#9'19'#9'Tipo Registro'#9'F'
              'TIPOMANUAL'#9'16'#9'Manual ?'#9'F'
              'NOMEUSU'#9'25'#9'Usuário'#9'F'
              'TRGDTINCLUSAO'#9'18'#9'Dt Inclusão'#9'F'
              'ALIMRESERVA'#9'10'#9'Baixou~Reserva ?'#9'F')
            MemoAttributes = [mSizeable]
            Font.Style = []
            KeyOptions = []
            ParentFont = False
            TitleAlignment = taCenter
            TitleLines = 2
            OnDblClick = dbgrdDetDblClick
          end
          inherited pnlControlesDet: TPanel
            Width = 676
            Height = 267
            object lblTipoRegistro: TLabel
              Left = 343
              Top = 105
              Width = 77
              Height = 13
              Caption = 'Tipo Registro'
            end
            object Label12: TLabel
              Left = 6
              Top = 105
              Width = 80
              Height = 13
              Caption = 'Valor Previsto'
            end
            object Label13: TLabel
              Left = 110
              Top = 105
              Width = 74
              Height = 13
              Caption = 'Valor Efetivo'
            end
            object Label14: TLabel
              Left = 6
              Top = 141
              Width = 78
              Height = 13
              Caption = 'Data Prevista'
            end
            object Label15: TLabel
              Left = 110
              Top = 141
              Width = 72
              Height = 13
              Caption = 'Data Efetiva'
            end
            object Label17: TLabel
              Left = 214
              Top = 105
              Width = 44
              Height = 13
              Caption = 'Lote Nº'
            end
            object LabelBloq: TLabel
              Left = 0
              Top = 254
              Width = 676
              Height = 13
              Align = alBottom
              Alignment = taCenter
              Caption = 
                'Este registro não pode ser alterado, pois o Benefício já foi pag' +
                'o.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clRed
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
              WordWrap = True
            end
            object Label20: TLabel
              Left = 214
              Top = 141
              Width = 39
              Height = 13
              Caption = 'Motivo'
            end
            object LblValorOp1: TLabel
              Left = 6
              Top = 177
              Width = 82
              Height = 13
              Caption = 'Valor Opção 1'
            end
            object LblValorOp2: TLabel
              Left = 110
              Top = 177
              Width = 82
              Height = 13
              Caption = 'Valor Opção 2'
            end
            object LblValorOp3: TLabel
              Left = 214
              Top = 177
              Width = 82
              Height = 13
              Caption = 'Valor Opção 3'
            end
            object lblValorSRBDet: TLabel
              Left = 317
              Top = 177
              Width = 59
              Height = 13
              Caption = 'Valor SRB'
            end
            object LblValorIntegral: TLabel
              Left = 421
              Top = 177
              Width = 77
              Height = 13
              Caption = 'Valor Integral'
            end
            object LblValorTotal: TLabel
              Left = 525
              Top = 177
              Width = 63
              Height = 13
              Caption = 'Valor Total'
            end
            object lblPercentual: TLabel
              Left = 601
              Top = 105
              Width = 62
              Height = 13
              Caption = 'Percentual'
            end
            object lblValorBS: TLabel
              Left = 6
              Top = 212
              Width = 50
              Height = 13
              Caption = 'Valor BS'
            end
            object lblValorFab: TLabel
              Left = 110
              Top = 212
              Width = 57
              Height = 13
              Caption = 'Valor FAB'
            end
            object lblBaseCalcD: TLabel
              Left = 214
              Top = 212
              Width = 103
              Height = 13
              Caption = 'Base Calc. Déficit'
            end
            object dbcboTipoRegistro: TwwDBComboBox
              Left = 343
              Top = 118
              Width = 251
              Height = 21
              ShowButton = True
              Style = csDropDownList
              MapList = True
              AllowClearKey = False
              AutoDropDown = True
              DataField = 'FLGTIPOREGISTRO'
              DataSource = dsDet
              DropDownCount = 8
              ItemHeight = 0
              Items.Strings = (
                'Normal'#9'0'
                'Abono'#9'1'
                'Antecipação de Abono'#9'2'
                'Revisão Normal'#9'3'
                'Abono Revisão'#9'4'
                'Antecipação de Abono Revisão'#9'5')
              Sorted = False
              TabOrder = 7
              UnboundDataType = wwDefault
            end
            object grpMesAnoRef: TGroupBox
              Left = 6
              Top = 1
              Width = 160
              Height = 49
              Caption = 'Ano e Mês de Referência'
              TabOrder = 0
              object Label10: TLabel
                Left = 87
                Top = 18
                Width = 6
                Height = 16
                Caption = '/'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object edAnoRef: TEdit
                Left = 8
                Top = 18
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
                OnChange = CampoAlterado
                OnExit = edAnoRefExit
                OnKeyPress = edAnoRefKeyPress
              end
              object edMesRef: TEdit
                Left = 96
                Top = 18
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
                OnChange = CampoAlterado
                OnExit = edMesRefExit
                OnKeyPress = edMesRefKeyPress
              end
            end
            object GroupBox1: TGroupBox
              Left = 171
              Top = 1
              Width = 167
              Height = 49
              Caption = 'Ano e Mês de Cobr/Pagto'
              TabOrder = 1
              object Label11: TLabel
                Left = 88
                Top = 18
                Width = 6
                Height = 16
                Caption = '/'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object edAnoCob: TEdit
                Left = 12
                Top = 18
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
                OnChange = CampoAlterado
                OnKeyPress = edAnoCobKeyPress
              end
              object edMesCob: TEdit
                Left = 97
                Top = 18
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
                OnChange = CampoAlterado
                OnExit = edMesCobExit
                OnKeyPress = edMesCobKeyPress
              end
            end
            object dbedValorEsperado: TwwDBEdit
              Left = 6
              Top = 118
              Width = 95
              Height = 21
              Hint = 'Valor previsto do benefício mensal.'
              DataField = 'VALORPREV'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnChange = CampoAlterado
            end
            object dbedRecebido: TwwDBEdit
              Left = 110
              Top = 118
              Width = 95
              Height = 21
              Hint = 'Valor efetivo do benefício mensal.'
              DataField = 'VLBENEFPGTO'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnChange = CampoAlterado
            end
            object dbdtPrevisao: TCMDateTimePicker
              Left = 6
              Top = 154
              Width = 95
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAPAGAMENTO'
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
              TabOrder = 9
              OnChange = CampoAlterado
            end
            object dbdtRecebimento: TCMDateTimePicker
              Left = 110
              Top = 154
              Width = 95
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DTEFETPGTO'
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
              TabOrder = 10
              OnChange = CampoAlterado
            end
            object dbrgrpForma: TDBRadioGroup
              Left = 5
              Top = 52
              Width = 103
              Height = 49
              Caption = ' Forma '
              DataField = 'FLGDEVOLUCAO'
              DataSource = dsDet
              Items.Strings = (
                'Pagamento'
                'Cobrança')
              TabOrder = 2
              Values.Strings = (
                '0'
                '1')
              OnChange = CampoAlterado
            end
            object dblkpcmbLote: TwwDBLookupCombo
              Left = 214
              Top = 118
              Width = 121
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'IDLOTE'#9'10'#9'IDLOTE'#9'F'
                'MESREFERENCIA'#9'7'#9'MESREFERENCIA'#9'F'
                'DESCRICAO'#9'200'#9'DESCRICAO'#9'F'
                'DATAPAGAMENTO'#9'18'#9'DATAPAGAMENTO'#9'F')
              DataField = 'IDLOTE'
              DataSource = dsDet
              LookupTable = qryLote
              LookupField = 'IDLOTE'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 6
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnChange = CampoAlterado
            end
            object dbrgrpEstado: TDBRadioGroup
              Left = 110
              Top = 52
              Width = 222
              Height = 49
              Caption = ' Estado '
              Columns = 2
              DataField = 'FLGENVIADO'
              DataSource = dsDet
              Items.Strings = (
                'A Processar'
                'Processado'
                'Retido'
                'Fora Convênio')
              TabOrder = 3
              Values.Strings = (
                '0'
                '1'
                '9'
                '8')
              OnChange = CampoAlterado
            end
            object cmbMotivo: TwwDBLookupCombo
              Left = 214
              Top = 154
              Width = 407
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'Descrição'#9'F')
              DataField = 'IDMOTIVO'
              DataSource = dsDet
              LookupTable = qryMotivo
              LookupField = 'IDMOTIVO'
              Options = [loColLines]
              ParentFont = False
              TabOrder = 11
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnChange = CampoAlterado
            end
            object dbedValorOp1: TwwDBEdit
              Left = 6
              Top = 190
              Width = 95
              Height = 21
              Hint = 'Valor da opção 1 vinculado ao benefício.'
              DataField = 'VALOROP1'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 12
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnChange = CampoAlterado
            end
            object dbedValorOp2: TwwDBEdit
              Left = 110
              Top = 190
              Width = 95
              Height = 21
              Hint = 'Valor da opção 2 vinculado ao benefício.'
              DataField = 'VALOROP2'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 13
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnChange = CampoAlterado
            end
            object dbedValorOp3: TwwDBEdit
              Left = 214
              Top = 190
              Width = 95
              Height = 21
              Hint = 'Valor da opção 3 vinculado ao benefício.'
              DataField = 'VALOROP3'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 14
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnChange = CampoAlterado
            end
            object dbedValorSRBDet: TwwDBEdit
              Left = 317
              Top = 190
              Width = 95
              Height = 21
              Hint = 'Valor interno anterior a execução da regra de benefício mínimo.'
              DataField = 'VALORSRB'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 15
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnChange = CampoAlterado
            end
            object dbedValorIntegral: TwwDBEdit
              Left = 421
              Top = 190
              Width = 95
              Height = 21
              Hint = 'Valor integral do benefício'
              DataField = 'VALORINTEGRAL'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 16
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnChange = CampoAlterado
            end
            object dbedValorTotal: TwwDBEdit
              Left = 525
              Top = 190
              Width = 95
              Height = 21
              Hint = 
                'Valor total do benefício para o grupo familiar. No caso do parti' +
                'cipante é igual ao Valor Integral.'
              DataField = 'VALORTOTAL'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 17
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnChange = CampoAlterado
            end
            object dbePercentual: TwwDBEdit
              Left = 601
              Top = 118
              Width = 48
              Height = 21
              Hint = 'Percentual da cota do pensionista no grupo familiar'
              DataField = 'PERCENTUAL'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 8
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnChange = CampoAlterado
            end
            object GroupBox2: TGroupBox
              Left = 343
              Top = 1
              Width = 227
              Height = 49
              Caption = 'Ano e Mês de Comp/Reembolso INSS'
              TabOrder = 18
              object Label22: TLabel
                Left = 88
                Top = 18
                Width = 6
                Height = 16
                Caption = '/'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object edAnoComp: TEdit
                Left = 12
                Top = 18
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
                OnKeyPress = edAnoCompKeyPress
              end
              object edMesComp: TEdit
                Left = 97
                Top = 18
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
                OnExit = edMesCompExit
                OnKeyPress = edMesCompKeyPress
              end
            end
            object dbedValorBS: TwwDBEdit
              Left = 6
              Top = 225
              Width = 95
              Height = 21
              Hint = 'Valor da opção 1 vinculado ao benefício.'
              DataField = 'VALORBS'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 19
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnChange = CampoAlterado
            end
            object dbedValorFab: TwwDBEdit
              Left = 110
              Top = 225
              Width = 95
              Height = 21
              Hint = 'Valor da opção 1 vinculado ao benefício.'
              DataField = 'VALORFAB'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 20
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnChange = CampoAlterado
            end
            object dbedBaseCalcD: TwwDBEdit
              Left = 214
              Top = 225
              Width = 95
              Height = 21
              Hint = 'Valor da opção 1 vinculado ao benefício.'
              DataField = 'VLRBASEDEFICIT'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 21
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnChange = CampoAlterado
            end
          end
        end
        object tbsAlteradores: TTabSheet
          Caption = 'Alteradores'
          ImageIndex = 1
          object dbgrdalt: TwwDBGrid
            Left = 0
            Top = 0
            Width = 676
            Height = 267
            Selected.Strings = (
              'IDPESSJUR'#9'13'#9'Pessoa Jurídica'
              'IDTITULAR'#9'10'#9'Titular'
              'IDPLANOPREV'#9'11'#9'Plano ~Previdenciário'
              'MES'#9'7'#9'Mês'
              'IDMOTIVO'#9'10'#9'Motivo'
              'NUMEROPROCESSO'#9'10'#9'Número do ~Processo'
              'IDBENEFICIO'#9'10'#9'Benefício'
              'IDPESSOA'#9'10'#9'Pessoa'
              'MESREFERENCIA'#9'11'#9'Mês de ~Referência'
              'VALOR'#9'10'#9'Valor'
              'FLGTIPO'#9'3'#9'Tipo'
              'DESCRICAO'#9'35'#9'Alterador'#9'F')
            MemoAttributes = [mSizeable]
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsAlter
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 1
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 676
            Height = 267
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label23: TLabel
              Left = 8
              Top = 8
              Width = 52
              Height = 13
              Caption = 'Alterador'
            end
            object Label24: TLabel
              Left = 8
              Top = 56
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object edValorAlterador: TEditNum
              Left = 8
              Top = 72
              Width = 121
              Height = 21
              TabOrder = 0
              IntDigits = 10
              Signal = False
              DecDigits = 2
              Numeric = True
            end
            object rgrpTipoAlterador: TRadioGroup
              Left = 288
              Top = 16
              Width = 185
              Height = 65
              Caption = ' Tipo '
              ItemIndex = 0
              Items.Strings = (
                'Crédito'
                'Débito')
              TabOrder = 1
              OnClick = rgrpTipoAlteradorClick
            end
            object edAlterador: TEditNum
              Left = 8
              Top = 24
              Width = 257
              Height = 21
              TabOrder = 2
              IntDigits = 10
              Signal = False
              DecDigits = 2
              Numeric = True
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 774
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnAltDet: TToolbarButton97
            Width = 24
          end
          inherited sbtnExcluiDet: TToolbarButton97
            Left = 49
          end
          object sbtnExcluiDetEnv: TToolbarButton97
            Left = 74
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Excluir'
            AllowAllUp = True
            Enabled = False
            ImageIndex = 2
            Images = ImlPadrao
            ParentShowHint = False
            ShowHint = True
            Visible = False
            OnClick = sbtnExcluiDetClick
          end
        end
        object wwDBGrid1: TwwDBGrid
          Left = 104
          Top = 32
          Width = 320
          Height = 120
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
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
      end
      inherited Dock974: TDock97
        Left = 688
        Height = 295
      end
    end
    inherited pnlMestre: TPanel [1]
      Width = 782
      Height = 226
      object Label1: TLabel
        Left = 8
        Top = 3
        Width = 69
        Height = 13
        Caption = 'Participante'
      end
      object Label2: TLabel
        Left = 416
        Top = 3
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object Label3: TLabel
        Left = 8
        Top = 32
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object Label4: TLabel
        Left = 8
        Top = 95
        Width = 56
        Height = 13
        Caption = 'Benefício'
      end
      object Label5: TLabel
        Left = 304
        Top = 32
        Width = 65
        Height = 13
        Caption = 'Data Início'
      end
      object Label6: TLabel
        Left = 380
        Top = 32
        Width = 77
        Height = 13
        Caption = 'Data Término'
      end
      object Label7: TLabel
        Left = 512
        Top = 3
        Width = 71
        Height = 13
        Caption = 'Inscrição Nº'
      end
      object Label8: TLabel
        Left = 8
        Top = 64
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object Label9: TLabel
        Left = 465
        Top = 32
        Width = 103
        Height = 13
        Caption = 'Último Pagamento'
      end
      object DBText1: TDBText
        Left = 8
        Top = 18
        Width = 385
        Height = 13
        DataField = 'NOME'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText2: TDBText
        Left = 8
        Top = 48
        Width = 281
        Height = 13
        DataField = 'NOMEPATRO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText3: TDBText
        Left = 8
        Top = 80
        Width = 289
        Height = 13
        DataField = 'NOMEPLANO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText4: TDBText
        Left = 8
        Top = 109
        Width = 185
        Height = 27
        Constraints.MaxWidth = 185
        DataField = 'NOMEBENEFICIO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object dbeMatricula: TDBText
        Left = 416
        Top = 18
        Width = 61
        Height = 13
        AutoSize = True
        DataField = 'MATRICULA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText6: TDBText
        Left = 512
        Top = 18
        Width = 42
        Height = 13
        AutoSize = True
        DataField = 'INSCRICAONUMERO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText7: TDBText
        Left = 304
        Top = 48
        Width = 65
        Height = 13
        DataField = 'DATAINICIO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText8: TDBText
        Left = 380
        Top = 48
        Width = 65
        Height = 13
        DataField = 'DATAFINAL'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText9: TDBText
        Left = 465
        Top = 48
        Width = 65
        Height = 13
        DataField = 'ULTMESPREPARO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 612
        Top = 3
        Width = 75
        Height = 13
        Caption = 'Processo  Nº'
      end
      object DBText10: TDBText
        Left = 612
        Top = 18
        Width = 48
        Height = 13
        AutoSize = True
        DataField = 'NUMEROPROCESSO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label21: TLabel
        Left = 575
        Top = 32
        Width = 51
        Height = 13
        Caption = 'Situação'
      end
      object DBText5: TDBText
        Left = 575
        Top = 48
        Width = 65
        Height = 13
        DataField = 'SITUACAOBENEF'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblPercentualBF: TLabel
        Left = 670
        Top = 32
        Width = 62
        Height = 13
        Caption = 'Percentual'
      end
      object dbtPercentual: TDBText
        Left = 670
        Top = 48
        Width = 65
        Height = 13
        DataField = 'PERCENTUAL'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object gbValores: TGroupBox
        Left = 200
        Top = 113
        Width = 577
        Height = 113
        Caption = ' Valores vinculados ao Benefício '
        TabOrder = 0
        object LblVlrInfInss: TLabel
          Left = 186
          Top = 19
          Width = 57
          Height = 13
          Caption = 'RMI INSS'
        end
        object LblValorSRB: TLabel
          Left = 7
          Top = 19
          Width = 26
          Height = 13
          Caption = 'SRB'
        end
        object lblValorTotalVincBenef: TLabel
          Left = 393
          Top = 67
          Width = 67
          Height = 13
          AutoSize = False
          Caption = 'Valor Total'
        end
        object lblValorAtual: TLabel
          Left = 393
          Top = 43
          Width = 63
          Height = 13
          Caption = 'Valor Atual'
        end
        object lblValorAtualBS: TLabel
          Left = 7
          Top = 43
          Width = 83
          Height = 13
          Caption = 'Valor Atual BS'
        end
        object lblValorTotalBS: TLabel
          Left = 7
          Top = 67
          Width = 83
          Height = 13
          Caption = 'Valor Total BS'
        end
        object lblValorAtualFab: TLabel
          Left = 197
          Top = 43
          Width = 90
          Height = 13
          Caption = 'Valor Atual FAB'
        end
        object lblValorTotalFab: TLabel
          Left = 197
          Top = 67
          Width = 90
          Height = 13
          Caption = 'Valor Total FAB'
        end
        object lblBaseCalcDef: TLabel
          Left = 356
          Top = 91
          Width = 103
          Height = 13
          Caption = 'Base Calc. Déficit'
        end
        object lblPercPensao: TLabel
          Left = 7
          Top = 91
          Width = 178
          Height = 13
          Caption = 'Percentual aplicado na Pensão'
          Visible = False
        end
        object dbedVlrInfInss: TwwDBEdit
          Left = 253
          Top = 15
          Width = 100
          Height = 21
          DataField = 'VLRINFINSS'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbedValorSRB: TwwDBEdit
          Left = 69
          Top = 15
          Width = 100
          Height = 21
          DataField = 'VALORSRB'
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
        object dbeValorAtual: TwwDBEdit
          Left = 464
          Top = 39
          Width = 100
          Height = 21
          DataField = 'VALORATUAL'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeValorTotal: TwwDBEdit
          Left = 464
          Top = 64
          Width = 100
          Height = 21
          DataField = 'VALORTOTAL'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbBenefMinimo: TDBCheckBox
          Left = 416
          Top = 12
          Width = 135
          Height = 17
          Caption = 'Benefício Minimo ?'
          DataField = 'FLGBENEFMIN'
          DataSource = ds
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbedValorAtualBS: TwwDBEdit
          Left = 93
          Top = 39
          Width = 100
          Height = 21
          DataField = 'VLRBSATUAL'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbedValorTotalBS: TwwDBEdit
          Left = 93
          Top = 64
          Width = 100
          Height = 21
          DataField = 'VLRBSTOTAL'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbedValorAtualFab: TwwDBEdit
          Left = 289
          Top = 39
          Width = 100
          Height = 21
          DataField = 'VLRFABATUAL'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbedValorTotalFab: TwwDBEdit
          Left = 289
          Top = 64
          Width = 100
          Height = 21
          DataField = 'VLRFABTOTAL'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbedBaseCalcDef: TwwDBEdit
          Left = 464
          Top = 87
          Width = 100
          Height = 21
          DataField = 'VLRBASEDEFICIT'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbedPercPensao: TwwDBEdit
          Left = 191
          Top = 87
          Width = 46
          Height = 21
          Color = clSilver
          DataField = 'PERCPENSAO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
          UnboundDataType = wwDefault
          UnboundAlignment = taCenter
          WantReturns = False
          WordWrap = False
        end
      end
      object gpInfoTitular: TGroupBox
        Left = 200
        Top = 64
        Width = 577
        Height = 45
        Caption = ' Valores vinculados ao Titular  '
        TabOrder = 1
        Visible = False
        object lblVlrTitFab: TLabel
          Left = 197
          Top = 24
          Width = 57
          Height = 13
          Caption = 'Valor FAB'
        end
        object lblVlrTitBs: TLabel
          Left = 7
          Top = 24
          Width = 50
          Height = 13
          Caption = 'Valor BS'
        end
        object lblVlrTitTotal: TLabel
          Left = 390
          Top = 24
          Width = 67
          Height = 13
          AutoSize = False
          Caption = 'Valor Total'
        end
        object dbedlVlrTitFab: TwwDBEdit
          Left = 257
          Top = 17
          Width = 100
          Height = 21
          Color = clSilver
          DataField = 'FABTITULAR'
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
        object dbedlVlrTitBs: TwwDBEdit
          Left = 61
          Top = 17
          Width = 100
          Height = 21
          Color = clSilver
          DataField = 'BSTITULAR'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbedlVlrTitTotal: TwwDBEdit
          Left = 464
          Top = 17
          Width = 100
          Height = 21
          Color = clSilver
          DataField = 'VLRTOTALTITULAR'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 784
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
    Top = 629
    Width = 784
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 144
    Top = 66
    TargetsData = (
      1
      3
      (
        ''
        'Text'
        0)
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
    Left = 207
    Top = 390
  end
  inherited ds: TwwDataSource
    Left = 461
    Top = 6
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update BENEFBFCIARIO'
      'set'
      '  VALORATUAL = :VALORATUAL,'
      '  VALORTOTAL = :VALORTOTAL,'
      '  VLRINFINSS = :VLRINFINSS,'
      '  VLRCALCINSS = :VLRCALCINSS,'
      '  VALORSRB = :VALORSRB,'
      '  FLGBENEFMIN = :FLGBENEFMIN,'
      '--Inicio - Helio - SOL Nº 253577/17584 PPM Nº 994289'
      '  VLRBSATUAL     = :VLRBSATUAL,'
      '  VLRBSTOTAL     = :VLRBSTOTAL,'
      '  VLRFABATUAL    = :VLRFABATUAL,'
      '  VLRFABTOTAL    = :VLRFABTOTAL,'
      '  VLRBASEDEFICIT = :VLRBASEDEFICIT'
      '--Fim - Helio - SOL Nº 253577/17584 PPM Nº 994289'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO and'
      '  IDPLANOORIGEM = :OLD_IDPLANOORIGEM'
      ' ')
    Left = 391
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Beneficiário e Benefício'
    Colunas.Strings = (
      'V.MATRICULA'
      'V.MATRICULADEP'
      'V.INSCRICAONUMERO'
      'B.NOME'
      'TIT.NOME'
      'P.NOME'
      'PL.NOME'
      'PT.NOME'
      'BF.NUMEROPROCESSO'
      'PLC.NOME'
      'SB.DESCRICAO')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'N'
      'C'
      'L')
    Descricao.Strings = (
      'Matrícula Titular'
      'Matrícula Beneficiário'
      'Nº Inscrição'
      'Benefício'
      'Participante'
      'Beneficiário'
      'Plano Previdenciário'
      'Patrocinadora'
      'Nº Processo'
      'Plano Origem'
      'Situação do Benefício')
    SensivelACaixa.Strings = (
      'S'
      'S'
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
      'PESSOA P'
      'PESSOA PT'
      'PESSOA TIT'
      'PLANPREV PL'
      'BENEFICIO B'
      'BENEFBFCIARIO BF'
      'VWPARTICIPDEPEN V'
      'PATRO PAT'
      'PLANPREVCONTABIL PLC'
      'SITBENEFICIO SB')
    CamposChave.Strings = (
      'BF.IDPESSJUR'
      'BF.IDPLANOPREV'
      'BF.IDTITULAR'
      'BF.IDPESSOA'
      'BF.SEQPROPOSTA'
      'BF.IDBENEFICIO'
      'BF.NUMEROPROCESSO'
      'BF.IDPLANOORIGEM'
      'SB.IDSITBENEFICIO')
    Filtro.Strings = (
      'BF.IDPESSJUR = V.IDPESSJUR'
      'BF.SEQPROPOSTA = V.SEQPROPOSTA'
      'BF.IDTITULAR = V.IDTITULAR'
      'BF.IDPESSOA = V.IDPESSOA'
      'B.IDBENEFICIO = BF.IDBENEFICIO'
      'P.IDPESSOA = BF.IDPESSOA'
      'PT.IDPESSOA = BF.IDPESSJUR'
      'TIT.IDPESSOA = BF.IDTITULAR'
      'PL.IDPLANOPREV = BF.IDPLANOPREV'
      'BF.IDPESSJUR = PAT.IDPESSOA'
      'PLC.IDPLANOPREV = BF.IDPLANOORIGEM'
      'BF.IDSITBENEFICIO = SB.IDSITBENEFICIO')
    Mascaras.Strings = (
      ''
      ''
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
      '13'
      '10'
      '25'
      '25'
      '25'
      '25'
      '25'
      '10'
      '25'
      '40')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
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
    ComparaMaiuscula.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    BeforeOpenCds = MontaSelectBeforeOpenCds
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '(SELECT DESCRICAO FROM SITBENEFICIO)')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      'DESCRICAO')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      'DESCRICAO')
    Left = 618
    Top = 3
  end
  inherited ImlPadrao: TImageList
    Left = 185
    Top = 66
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 38
    Top = 458
  end
  inherited qry: TwwQuery
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      
        'SELECT P.NOME,             PT.NOME AS NOMEPATRO, PL.NOME AS NOME' +
        'PLANO, B.NOME AS NOMEBENEFICIO,'
      
        '       EL.MATRICULA,       PP.INSCRICAONUMERO,   BF.IDPESSJUR,  ' +
        '       BF.IDPLANOPREV,'
      
        '       BF.IDTITULAR,       BF.IDPESSOA,          BF.SEQPROPOSTA,' +
        '       BF.IDBENEFICIO,'
      
        '       BF.DATAINICIO,      BF.DATAFINAL,         BF.ULTMESPREPAR' +
        'O,     SP.FLGINTERNO,'
      
        '       BF.NUMEROPROCESSO,  BF.VALORATUAL,        BF.VALORTOTAL, ' +
        '       BF.IDPLANOORIGEM,'
      
        '       PP.INSCRICAODATA,   PP.IDSITPART,         PF.DATANASC,   ' +
        '       BF.VALORCALCULADO,'
      
        '       BF.FLGFORMAPAGTO,   BF.FONTEPAGADORA,     BF.VLRINFINSS, ' +
        '       BF.VLRCALCINSS,'
      
        '       BF.VALORSRB,        BF.FLGBENEFMIN,       BF.FLGPAGAINSS ' +
        'AS FLGPAGAINSSBENEF,'
      '       BP.FLGPAGAINSS,     BP.FLGREFERENCIA,     BFC.PERCENTUAL,'
      
        '       DECODE(BF.IDSITBENEFICIO, 1, '#39'Ativo'#39', 2, '#39'Retido'#39', 3, '#39'Ca' +
        'ncelado'#39','
      '              4, '#39'Pendente'#39', '#39'Outros'#39') AS SITUACAOBENEF,'
      '       --Inicio - Helio - SOL Nº 253577/17584 PPM Nº 994289'
      '       BF.VLRBSATUAL,'
      '       BF.VLRBSTOTAL,'
      '       BF.VLRFABATUAL,'
      '       BF.VLRFABTOTAL,'
      '       BF.VLRBASEDEFICIT,'
      '       BP.FLGAPRESENTABSFAB,'
      '       BP.FLGAPRESENTADEFICIT'
      '      ,BF.CODPORTFORMA'
      '       --Fim - Helio - SOL Nº 253577/17584 PPM Nº 994289'
      '       --inicio edilaine WO18367'
      '       ,BF.FABTITULAR, BF.BSTITULAR'
      '       ,NVL(BF.VLRTOTALTITULAR,0) AS VLRTOTALTITULAR'
      
        '       ,CM.FN_BF_BUSCA_PERC_PENSAO(bf.numeroprocesso) AS PERCPEN' +
        'SAO'
      '       --fim edilaine WO18367'
      
        'FROM   PESSOA P, PESSOA PT, PESSOAFISICA PF, PLANPREV PL, BENEFI' +
        'CIO B,'
      '       BENEFBFCIARIO BF, BENEFPLANPREV BP, BFCIARIOTITPLAN BFC,'
      '       PARTPREVPLAN PP, ELEGPATRO EL, SITPART SP,'
      '       PARAMAPREV PR -- WO18367'
      'WHERE  (BF.IDPESSJUR      = :IDPESSJUR)'
      'AND    (BF.IDPLANOPREV    = :IDPLANOPREV)'
      'AND    (BF.IDPLANOORIGEM    = :IDPLANOORIGEM)'
      'AND    (BF.IDTITULAR      = :IDTITULAR)'
      'AND    (BF.IDPESSOA       = :IDPESSOA)'
      'AND    (BF.SEQPROPOSTA    = :SEQPROPOSTA)'
      'AND    (BF.IDBENEFICIO    = :IDBENEFICIO)'
      'AND    (BF.NUMEROPROCESSO = :NUMEROPROCESSO)'
      'AND    (BF.IDBENEFICIO    = B.IDBENEFICIO)'
      'AND    (BF.IDPLANOPREV    = PL.IDPLANOPREV)'
      'AND    (BP.IDBENEFICIO    = BF.IDBENEFICIO)'
      'AND    (BP.IDPLANOPREV    = BF.IDPLANOPREV)'
      'AND    (BF.IDPESSOA       = P.IDPESSOA)'
      'AND    (BF.IDPESSJUR      = PT.IDPESSOA)'
      'AND    (BF.IDPESSJUR      = PP.IDPESSJUR)'
      
        'AND    (BF.IDPLANOPREV    = PP.IDPLANOPREV OR BF.IDPLANOORIGEM =' +
        ' PP.IDPLANOPREV)'
      'AND    (BF.IDTITULAR      = PP.IDPESSOA)'
      'AND    (BF.SEQPROPOSTA    = PP.SEQPROPOSTA)'
      'AND    (PP.IDPESSJUR      = EL.IDPESSJUR)'
      'AND    (PP.IDPESSOA       = EL.IDPESSOA)'
      'AND    (PP.IDSITPART      = SP.IDSITPART)'
      'AND    (EL.IDPESSOA       = PF.IDPESSOA)'
      'AND    (BFC.IDTITULAR     = BF.IDTITULAR)'
      'AND    (BFC.IDPESSOA      = BF.IDPESSOA)'
      'AND    (BFC.IDBENEFICIO   = BF.IDBENEFICIO)'
      'AND    (BFC.IDPLANOPREV   = BF.IDPLANOPREV)'
      'AND    (BFC.IDPLANOORIGEM = BF.IDPLANOORIGEM)'
      'AND    (BFC.IDPESSJUR     = BF.IDPESSJUR)'
      'AND    (BFC.SEQPROPOSTA   = BF.SEQPROPOSTA)'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 425
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
        Value = 12
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOORIGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 76438
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end>
    object qryNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryNOMEPATRO: TStringField
      FieldName = 'NOMEPATRO'
      Size = 60
    end
    object qryNOMEPLANO: TStringField
      FieldName = 'NOMEPLANO'
      Size = 50
    end
    object qryNOMEBENEFICIO: TStringField
      FieldName = 'NOMEBENEFICIO'
      Size = 60
    end
    object qryMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qrySEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
    end
    object qryIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
    end
    object qryDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
    end
    object qryDATAFINAL: TDateTimeField
      FieldName = 'DATAFINAL'
    end
    object qryULTMESPREPARO: TStringField
      FieldName = 'ULTMESPREPARO'
      FixedChar = True
      Size = 7
    end
    object qryFLGINTERNO: TStringField
      FieldName = 'FLGINTERNO'
      FixedChar = True
      Size = 2
    end
    object qryNUMEROPROCESSO: TFloatField
      FieldName = 'NUMEROPROCESSO'
    end
    object qryVALORATUAL: TFloatField
      FieldName = 'VALORATUAL'
      DisplayFormat = '##0.00'
    end
    object qryVALORTOTAL: TFloatField
      FieldName = 'VALORTOTAL'
      DisplayFormat = '##0.00'
    end
    object qryIDPLANOORIGEM: TFloatField
      FieldName = 'IDPLANOORIGEM'
    end
    object qryINSCRICAODATA: TDateTimeField
      FieldName = 'INSCRICAODATA'
    end
    object qryIDSITPART: TFloatField
      FieldName = 'IDSITPART'
    end
    object qryDATANASC: TDateTimeField
      FieldName = 'DATANASC'
    end
    object qryVALORCALCULADO: TFloatField
      FieldName = 'VALORCALCULADO'
    end
    object qryFLGFORMAPAGTO: TStringField
      FieldName = 'FLGFORMAPAGTO'
      FixedChar = True
      Size = 1
    end
    object qryFONTEPAGADORA: TFloatField
      FieldName = 'FONTEPAGADORA'
    end
    object qryVLRINFINSS: TFloatField
      FieldName = 'VLRINFINSS'
      DisplayFormat = '##0.00'
    end
    object qryVLRCALCINSS: TFloatField
      FieldName = 'VLRCALCINSS'
    end
    object qryVALORSRB: TFloatField
      FieldName = 'VALORSRB'
      DisplayFormat = '##0.00'
    end
    object qryFLGBENEFMIN: TFloatField
      FieldName = 'FLGBENEFMIN'
    end
    object qryFLGPAGAINSSBENEF: TFloatField
      FieldName = 'FLGPAGAINSSBENEF'
    end
    object qryFLGPAGAINSS: TFloatField
      FieldName = 'FLGPAGAINSS'
    end
    object qryFLGREFERENCIA: TFloatField
      FieldName = 'FLGREFERENCIA'
    end
    object qryPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
    end
    object qrySITUACAOBENEF: TStringField
      FieldName = 'SITUACAOBENEF'
      Size = 9
    end
    object qryVLRBSATUAL: TFloatField
      FieldName = 'VLRBSATUAL'
      DisplayFormat = '##0.00'
    end
    object qryVLRBSTOTAL: TFloatField
      FieldName = 'VLRBSTOTAL'
      DisplayFormat = '##0.00'
    end
    object qryVLRFABATUAL: TFloatField
      FieldName = 'VLRFABATUAL'
      DisplayFormat = '#,##0.00'
    end
    object qryVLRFABTOTAL: TFloatField
      FieldName = 'VLRFABTOTAL'
      DisplayFormat = '#,##0.00'
    end
    object qryVLRBASEDEFICIT: TFloatField
      FieldName = 'VLRBASEDEFICIT'
      DisplayFormat = '#,##0.00'
    end
    object qryFLGAPRESENTABSFAB: TFloatField
      FieldName = 'FLGAPRESENTABSFAB'
    end
    object qryFLGAPRESENTADEFICIT: TFloatField
      FieldName = 'FLGAPRESENTADEFICIT'
    end
    object qryCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
    end
    object qryFABTITULAR: TFloatField
      FieldName = 'FABTITULAR'
      DisplayFormat = '##0.00'
    end
    object qryBSTITULAR: TFloatField
      FieldName = 'BSTITULAR'
      DisplayFormat = '##0.00'
    end
    object qryVLRTOTALTITULAR: TFloatField
      FieldName = 'VLRTOTALTITULAR'
      DisplayFormat = '##0.00'
    end
    object qryPERCPENSAO: TFloatField
      FieldName = 'PERCPENSAO'
    end
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 720
    Top = 352
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    AfterInsert = qryDetAfterInsert
    BeforePost = qryDetBeforePost
    BeforeDelete = qryDetBeforeDelete
    AfterScroll = qryDetAfterScroll
    DatabaseName = 'basedados'
    SQL.Strings = (
      
        'SELECT H.IDTITULAR, H.IDPESSJUR, H.IDPLANOPREV, H.IDBENEFICIO, H' +
        '.IDMOTIVO, H.IDPESSOA,'
      
        '       H.NUMEROPROCESSO, H.MES, H.SEQBENEFICIO, H.SEQPROPOSTA, H' +
        '.IDLOTE, H.VLBENEFPGTO,'
      
        '       H.DATAPAGAMENTO, H.CODPORTFORMA, H.VALORPREV, H.FLGACERTO' +
        'DESFEITO, H.CODREFERENCIA,'
      
        '       H.FLGENVIADO, H.MESREFERENCIA, H.FLGCONCESSAO, H.FLGDEVOL' +
        'UCAO, H.FLGFORMAPAGTO, H.VALORTOTAL,'
      
        '       H.FONTEPAGADORA, H.VALORINTEGRAL, H.DTEFETPGTO, M.DESCRIC' +
        'AO, H.VALORCALCULADO,'
      
        '       DECODE(FLGENVIADO,8,'#39'Fora convênio'#39',9,'#39'Retido'#39',1,'#39'Process' +
        'ado'#39','#39'A Processar'#39') ESTADO,'
      
        '       H.FLGMANUAL, H.IDPLANOORIGEM, H.VALOROP1, H.VALOROP2, H.V' +
        'ALOROP3, H.VALORPREVMIN,'
      '       H.VALORSRB,'
      '       H.PERCENTUAL,'
      '       H.IDSEQINTERNOFB,'
      '       H.TRGDTINCLUSAO,'
      '       H.TRGUSERINCLUSAO,'
      '       '#39'                                        '#39' AS NOMEUSU,'
      '       DECODE(NVL(H.FLGMANUAL,0),'
      '         0, '#39'Não manual'#39','
      '         1, '#39'Inclusão Manual'#39','
      '         2, '#39'Alteração Manual'#39','
      '         '#39'Não identificado'#39') AS TIPOMANUAL,'
      '       H.FLGTIPOREGISTRO,'
      '       DECODE(NVL(H.FLGTIPOREGISTRO,0),'
      '         0, '#39'Normal'#39','
      '         1, '#39'Abono'#39','
      '         2, '#39'Antecipação de abono'#39','
      '         3, '#39'Revisão Normal'#39','
      '         4, '#39'Abono revisão'#39','
      '         5, '#39'Antecipação de abono revisão'#39','
      '         '#39'Não identificado'#39') AS TIPOREGISTRO,'
      
        '       DECODE(NVL(H.FLGALIMRESERVA,0), 0, '#39'Não'#39', '#39'Sim'#39') AS ALIMR' +
        'ESERVA,'
      '       h.MESCOMPREEM,'
      '       --Inicio - Helio - SOL Nº 253577/17584 PPM Nº 994289'
      '       H.VALORBS,'
      '       H.VALORFAB,'
      '       H.VLRBASEDEFICIT,'
      '       H.JUSTIFICATIVAEXCLUSAO,'
      '       --Fim - Helio - SOL Nº 253577/17584 PPM Nº 994289'
      '       --edilaine WO18367 - inicio'
      '       H.BSTITULAR,'
      '       H.FABTITULAR,'
      
        '       CM.FN_BF_BUSCA_PERC_PENSAO(bf.numeroprocesso, H.VALORBS, ' +
        'H.BSTITULAR, H.PERCENTUAL, H.MESREFERENCIA) AS PERC_PENSAO'
      '       --edilaine WO18367 - fim'
      ''
      'FROM   HSTBENEFBFCIARIO H,'
      '       MOTIVO M,'
      '-- WO18367'
      '       BENEFBFCIARIO BF,'
      '       BENEFPLANPREV BP,'
      '       PARAMAPREV    PR'
      '-- WO18367'
      ''
      'WHERE (H.IDPESSJUR    = :IDPESSJUR)'
      'AND (H.IDPLANOPREV    = :IDPLANOPREV)'
      'AND (H.IDPLANOORIGEM  = :IDPLANOORIGEM)'
      'AND (H.IDTITULAR      = :IDTITULAR)'
      'AND (H.IDPESSOA       = :IDPESSOA)'
      'AND (H.SEQPROPOSTA    = :SEQPROPOSTA)'
      'AND (H.IDBENEFICIO    = :IDBENEFICIO)'
      'AND (H.NUMEROPROCESSO = :NUMEROPROCESSO)'
      'AND (H.IDMOTIVO       =  M.IDMOTIVO)'
      '-- WO18367'
      'AND  BF.IDPESSJUR       = H.IDPESSJUR'
      'AND   BF.IDPLANOPREV    = H.IDPLANOPREV'
      'AND   BF.IDPLANOORIGEM  = H.IDPLANOORIGEM'
      'AND   BF.IDTITULAR      = H.IDTITULAR'
      'AND   BF.IDPESSOA       = H.IDPESSOA'
      'AND   BF.SEQPROPOSTA    = H.SEQPROPOSTA'
      'AND   BF.IDBENEFICIO    = H.IDBENEFICIO'
      'AND   BF.NUMEROPROCESSO = H.NUMEROPROCESSO'
      'AND   BP.IDBENEFICIO    = H.IDBENEFICIO'
      'AND   BP.IDPLANOPREV    = H.IDPLANOPREV'
      '-- WO18367'
      'ORDER BY H.MESREFERENCIA DESC'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' ')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 136
    Top = 390
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOORIGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end>
    object qryDetMES: TStringField
      DisplayLabel = 'Mês de ~Pagamento'
      DisplayWidth = 10
      FieldName = 'MES'
      FixedChar = True
      Size = 7
    end
    object qryDetMESREFERENCIA: TStringField
      DisplayLabel = 'Mês de ~Referência'
      DisplayWidth = 10
      FieldName = 'MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object qryDetMESCOMPREEM: TStringField
      DisplayLabel = 'Mês de~Reembolso'
      DisplayWidth = 7
      FieldName = 'MESCOMPREEM'
      FixedChar = True
      Size = 7
    end
    object qryDetVALORPREV: TFloatField
      DisplayLabel = 'Valor ~Previsto'
      DisplayWidth = 10
      FieldName = 'VALORPREV'
      DisplayFormat = '#,##0.00'
    end
    object qryDetVLBENEFPGTO: TFloatField
      DisplayLabel = 'Valor ~Efetivo'
      DisplayWidth = 10
      FieldName = 'VLBENEFPGTO'
      DisplayFormat = '#,##0.00'
    end
    object qryDetDATAPAGAMENTO: TDateTimeField
      DisplayLabel = 'Data ~Prevista'
      DisplayWidth = 10
      FieldName = 'DATAPAGAMENTO'
    end
    object qryDetDTEFETPGTO: TDateTimeField
      DisplayLabel = 'Data ~Efetiva'
      DisplayWidth = 10
      FieldName = 'DTEFETPGTO'
    end
    object qryDetVALORBS: TFloatField
      DisplayLabel = 'Valor~BS'
      DisplayWidth = 10
      FieldName = 'VALORBS'
      DisplayFormat = '#,##0.00'
    end
    object qryDetVALORFAB: TFloatField
      DisplayLabel = 'Valor~FAB'
      DisplayWidth = 10
      FieldName = 'VALORFAB'
      DisplayFormat = '#,##0.00'
    end
    object qryDetVLRBASEDEFICIT: TFloatField
      DisplayLabel = 'Base~Déficit'
      DisplayWidth = 10
      FieldName = 'VLRBASEDEFICIT'
      DisplayFormat = '#,##0.00'
    end
    object qryDetBSTITULAR: TFloatField
      DisplayLabel = 'Valor BS~Titular'
      DisplayWidth = 10
      FieldName = 'BSTITULAR'
      DisplayFormat = '#,##0.00'
    end
    object qryDetFABTITULAR: TFloatField
      DisplayLabel = 'Valor FAB~Titular'
      DisplayWidth = 10
      FieldName = 'FABTITULAR'
      DisplayFormat = '#,##0.00'
    end
    object qryDetPERC_PENSAO: TFloatField
      DisplayLabel = '% Aplicado~Pensão'
      DisplayWidth = 10
      FieldName = 'PERC_PENSAO'
    end
    object qryDetIDLOTE: TFloatField
      DisplayLabel = 'Lote Nº'
      DisplayWidth = 10
      FieldName = 'IDLOTE'
    end
    object qryDetFLGDEVOLUCAO: TFloatField
      DisplayLabel = 'Devolução'
      DisplayWidth = 10
      FieldName = 'FLGDEVOLUCAO'
    end
    object qryDetFLGCONCESSAO: TFloatField
      DisplayLabel = 'Concessão'
      DisplayWidth = 10
      FieldName = 'FLGCONCESSAO'
    end
    object qryDetESTADO: TStringField
      DisplayLabel = 'Estado'
      DisplayWidth = 10
      FieldName = 'ESTADO'
      Size = 13
    end
    object qryDetDESCRICAO: TStringField
      DisplayLabel = 'Motivo'
      DisplayWidth = 33
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object qryDetVALOROP1: TFloatField
      DisplayLabel = 'Valor~1ª Opção'
      DisplayWidth = 10
      FieldName = 'VALOROP1'
    end
    object qryDetVALOROP2: TFloatField
      DisplayLabel = 'Valor~2ª Opção'
      DisplayWidth = 10
      FieldName = 'VALOROP2'
    end
    object qryDetVALOROP3: TFloatField
      DisplayLabel = 'Valor~3ª Opção'
      DisplayWidth = 10
      FieldName = 'VALOROP3'
    end
    object qryDetVALORPREVMIN: TFloatField
      DisplayLabel = 'Valor Mín.~Previsto'
      DisplayWidth = 10
      FieldName = 'VALORPREVMIN'
    end
    object qryDetVALORTOTAL: TFloatField
      DisplayLabel = 'Valor~Total'
      DisplayWidth = 10
      FieldName = 'VALORTOTAL'
      DisplayFormat = '#,##0.00'
    end
    object qryDetPERCENTUAL: TFloatField
      DisplayLabel = 'Percentual'
      DisplayWidth = 10
      FieldName = 'PERCENTUAL'
    end
    object qryDetTIPOREGISTRO: TStringField
      DisplayLabel = 'Tipo Registro'
      DisplayWidth = 19
      FieldName = 'TIPOREGISTRO'
      Size = 28
    end
    object qryDetTIPOMANUAL: TStringField
      DisplayLabel = 'Manual ?'
      DisplayWidth = 16
      FieldName = 'TIPOMANUAL'
      Size = 16
    end
    object qryDetNOMEUSU: TStringField
      DisplayLabel = 'Usuário'
      DisplayWidth = 25
      FieldName = 'NOMEUSU'
      FixedChar = True
      Size = 40
    end
    object qryDetTRGDTINCLUSAO: TDateTimeField
      DisplayLabel = 'Dt Inclusão'
      DisplayWidth = 18
      FieldName = 'TRGDTINCLUSAO'
    end
    object qryDetALIMRESERVA: TStringField
      DisplayLabel = 'Baixou~Reserva ?'
      DisplayWidth = 10
      FieldName = 'ALIMRESERVA'
      Size = 3
    end
    object qryDetIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Visible = False
    end
    object qryDetIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object qryDetIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryDetIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
      Visible = False
    end
    object qryDetIDMOTIVO: TFloatField
      FieldName = 'IDMOTIVO'
      Visible = False
    end
    object qryDetIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryDetNUMEROPROCESSO: TFloatField
      FieldName = 'NUMEROPROCESSO'
      Visible = False
    end
    object qryDetSEQBENEFICIO: TFloatField
      FieldName = 'SEQBENEFICIO'
      Visible = False
    end
    object qryDetSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
      Visible = False
    end
    object qryDetCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Visible = False
    end
    object qryDetFLGACERTODESFEITO: TFloatField
      FieldName = 'FLGACERTODESFEITO'
      Visible = False
    end
    object qryDetCODREFERENCIA: TStringField
      FieldName = 'CODREFERENCIA'
      Visible = False
      Size = 30
    end
    object qryDetFLGENVIADO: TFloatField
      FieldName = 'FLGENVIADO'
      Visible = False
    end
    object qryDetFLGFORMAPAGTO: TStringField
      FieldName = 'FLGFORMAPAGTO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryDetFONTEPAGADORA: TFloatField
      FieldName = 'FONTEPAGADORA'
      Visible = False
    end
    object qryDetVALORINTEGRAL: TFloatField
      FieldName = 'VALORINTEGRAL'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object qryDetVALORCALCULADO: TFloatField
      FieldName = 'VALORCALCULADO'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object qryDetFLGMANUAL: TFloatField
      FieldName = 'FLGMANUAL'
      Visible = False
    end
    object qryDetIDPLANOORIGEM: TFloatField
      FieldName = 'IDPLANOORIGEM'
      Visible = False
    end
    object qryDetVALORSRB: TFloatField
      FieldName = 'VALORSRB'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object qryDetIDSEQINTERNOFB: TFloatField
      FieldName = 'IDSEQINTERNOFB'
      Visible = False
    end
    object qryDetTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object qryDetFLGTIPOREGISTRO: TFloatField
      FieldName = 'FLGTIPOREGISTRO'
      Visible = False
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update HSTBENEFBFCIARIO'
      'set'
      '  IDTITULAR = :IDTITULAR,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDBENEFICIO = :IDBENEFICIO,'
      '  IDMOTIVO = :IDMOTIVO,'
      '  IDPESSOA = :IDPESSOA,'
      '  NUMEROPROCESSO = :NUMEROPROCESSO,'
      '  MES = :MES,'
      '  SEQBENEFICIO = :SEQBENEFICIO,'
      '  SEQPROPOSTA = :SEQPROPOSTA,'
      '  IDLOTE = :IDLOTE,'
      '  VLBENEFPGTO = :VLBENEFPGTO,'
      '  DATAPAGAMENTO = :DATAPAGAMENTO,'
      '  VALORPREV = :VALORPREV,'
      '  FLGACERTODESFEITO = :FLGACERTODESFEITO,'
      '  CODREFERENCIA = :CODREFERENCIA,'
      '  FLGENVIADO = :FLGENVIADO,'
      '  MESREFERENCIA = :MESREFERENCIA,'
      '  FLGCONCESSAO = :FLGCONCESSAO,'
      '  FLGDEVOLUCAO = :FLGDEVOLUCAO,'
      '  FLGFORMAPAGTO = :FLGFORMAPAGTO,'
      '  VALORTOTAL = :VALORTOTAL,'
      '  FONTEPAGADORA = :FONTEPAGADORA,'
      '  VALORINTEGRAL = :VALORINTEGRAL,'
      '  DTEFETPGTO =  :DTEFETPGTO,'
      '  VALORCALCULADO = :VALORCALCULADO,'
      '  FLGMANUAL = :FLGMANUAL,'
      '  IDPLANOORIGEM = :IDPLANOORIGEM,'
      '  VALOROP1 = :VALOROP1,'
      '  VALOROP2 = :VALOROP2,'
      '  VALOROP3 = :VALOROP3,'
      '  VALORSRB = :VALORSRB,'
      '  VALORPREVMIN = :VALORPREVMIN,'
      '  PERCENTUAL = :PERCENTUAL,'
      '  IDSEQINTERNOFB = :IDSEQINTERNOFB,'
      '  FLGTIPOREGISTRO = :FLGTIPOREGISTRO,'
      '  MESCOMPREEM  =:MESCOMPREEM,'
      '  --Inicio - Helio - SOL Nº 253577/17584 PPM Nº 994289'
      '  VALORBS = :VALORBS, '
      '  VALORFAB = :VALORFAB,'
      '  VLRBASEDEFICIT = :VLRBASEDEFICIT'
      '  --Fim - Helio - SOL Nº 253577/17584 PPM Nº 994289'
      'where'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  IDMOTIVO = :OLD_IDMOTIVO and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO and'
      '  MES = :OLD_MES and'
      '  SEQBENEFICIO = :OLD_SEQBENEFICIO and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  MESREFERENCIA = :OLD_MESREFERENCIA and'
      '  IDPLANOORIGEM = :OLD_IDPLANOORIGEM'
      ' '
      ' '
      ' ')
    InsertSQL.Strings = (
      'insert into HSTBENEFBFCIARIO'
      
        '  (IDTITULAR, IDPESSJUR, IDPLANOPREV, IDBENEFICIO, IDMOTIVO, IDP' +
        'ESSOA, '
      '   NUMEROPROCESSO, MES, SEQBENEFICIO, SEQPROPOSTA, IDLOTE, '
      'VLBENEFPGTO, '
      '   DATAPAGAMENTO, CODPORTFORMA, VALORPREV, FLGACERTODESFEITO, '
      'CODREFERENCIA, '
      '   FLGENVIADO, MESREFERENCIA, FLGCONCESSAO, FLGDEVOLUCAO, '
      'FLGFORMAPAGTO, '
      '   VALORTOTAL, FONTEPAGADORA, VALORINTEGRAL, DTEFETPGTO, '
      'VALORCALCULADO, '
      '   FLGMANUAL, IDPLANOORIGEM, VALOROP1, VALOROP2, VALOROP3, '
      'VALORPREVMIN, VALORSRB, PERCENTUAL, IDSEQINTERNOFB,'
      'FLGTIPOREGISTRO, MESCOMPREEM,'
      
        'VALORBS, VALORFAB, VLRBASEDEFICIT)  --Helio - SOL Nº 253577/1758' +
        '4 PPM Nº 994289'
      'values'
      
        '  (:IDTITULAR, :IDPESSJUR, :IDPLANOPREV, :IDBENEFICIO, :IDMOTIVO' +
        ', '
      ':IDPESSOA, '
      '   :NUMEROPROCESSO, :MES, :SEQBENEFICIO, :SEQPROPOSTA, :IDLOTE, '
      ':VLBENEFPGTO, '
      '   :DATAPAGAMENTO, :CODPORTFORMA, :VALORPREV, '
      ':FLGACERTODESFEITO, :CODREFERENCIA, '
      '   :FLGENVIADO, :MESREFERENCIA, :FLGCONCESSAO, :FLGDEVOLUCAO, '
      ':FLGFORMAPAGTO, '
      '   :VALORTOTAL, :FONTEPAGADORA, :VALORINTEGRAL, :DTEFETPGTO, '
      ':VALORCALCULADO, '
      '   :FLGMANUAL, :IDPLANOORIGEM, :VALOROP1, :VALOROP2, :VALOROP3, '
      ':VALORPREVMIN, :VALORSRB, :PERCENTUAL, :IDSEQINTERNOFB,'
      ':FLGTIPOREGISTRO, :MESCOMPREEM,'
      
        ':VALORBS, :VALORFAB, :VLRBASEDEFICIT)  --Helio - SOL Nº 253577/1' +
        '7584 PPM Nº 994289')
    DeleteSQL.Strings = (
      'delete from HSTBENEFBFCIARIO'
      'where'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  IDMOTIVO = :OLD_IDMOTIVO and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO and'
      '  MES = :OLD_MES and'
      '  SEQBENEFICIO = :OLD_SEQBENEFICIO and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  MESREFERENCIA = :OLD_MESREFERENCIA and'
      '  IDPLANOORIGEM = :OLD_IDPLANOORIGEM')
    Left = 260
    Top = 398
  end
  object qryLote: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDLOTE, MESREFERENCIA, DESCRICAO,DATAPAGAMENTO'
      'FROM CTRLINTERFACE'
      'WHERE TIPO = '#39'B'#39
      'AND (FLGVOLTATMP = 0 OR FLGVOLTATMP IS NULL)'
      'AND IDREFERENCIA IS NULL'
      'ORDER BY MESREFERENCIA DESC, IDLOTE DESC, DESCRICAO'
      '')
    ValidateWithMask = True
    Left = 653
    Top = 332
  end
  object qryMotivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   IDMOTIVO,DESCRICAO'
      'FROM     MOTIVO'#9
      'WHERE'
      #9'IDMOTIVO  NOT IN (3007,3008)'
      'ORDER BY UPPER(DESCRICAO)'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 632
    Top = 395
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 653
    Top = 204
  end
  object updAlt: TUpdateSQL
    ModifySQL.Strings = (
      ''
      'UPDATE HSTATRASOBENEF'
      '   SET '
      '   IDPESSJUR = :IDPESSJUR ,'
      '   IDTITULAR = :IDTITULAR ,'
      '   IDPLANOPREV = :IDPLANOPREV ,'
      '   MES = :MES ,'
      '   IDMOTIVO = :IDMOTIVO ,'
      '   NUMEROPROCESSO = :NUMEROPROCESSO ,'
      '   IDBENEFICIO = :IDBENEFICIO ,'
      '   IDPESSOA = :IDPESSOA ,'
      '   MESREFERENCIA = :MESREFERENCIA ,'
      '   SEQPROPOSTA = :SEQPROPOSTA ,'
      '   SEQBENEFICIO= :SEQBENEFICIO,'
      '   CODALTERADOR = :CODALTERADOR ,'
      '   VALOR = :VALOR ,'
      '   FLGTIPO = :FLGTIPO ,'
      '   FLGRETROATIVO = :FLGRETROATIVO'
      ''
      ' WHERE '
      ' IDPESSJUR = :OLD_IDPESSJUR and '
      ' IDTITULAR = :OLD_IDTITULAR and  '
      ' IDPLANOPREV = :OLD_IDPLANOPREV and '
      ' IDBENEFICIO = :OLD_IDBENEFICIO and'
      ' MES = :OLD_MES and'
      ' IDMOTIVO = :OLD_IDMOTIVO and'
      ' NUMEROPROCESSO = :OLD_NUMEROPROCESSO and'
      ' IDPESSOA = :OLD_IDPESSOA and'
      ' MESREFERENCIA = :OLD_MESREFERENCIA and'
      ' SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      ' SEQBENEFICIO= :OLD_SEQBENEFICIO and'
      ' CODALTERADOR = :OLD_CODALTERADOR')
    InsertSQL.Strings = (
      'INSERT INTO HSTATRASOBENEF'
      '  (IDPESSJUR,'
      '   IDTITULAR,'
      '   IDPLANOPREV,'
      '   MES,'
      '   IDMOTIVO,'
      '   NUMEROPROCESSO,'
      '   IDBENEFICIO,'
      '   IDPESSOA,'
      '   MESREFERENCIA,'
      '   SEQPROPOSTA,'
      '   SEQBENEFICIO,'
      '   CODALTERADOR,'
      '   VALOR,'
      '   FLGTIPO,'
      '   FLGRETROATIVO)'
      'VALUES'
      '  (:IDPESSJUR,'
      '   :IDTITULAR,'
      '   :IDPLANOPREV,'
      '   :MES,'
      '   :IDMOTIVO,'
      '   :NUMEROPROCESSO,'
      '   :IDBENEFICIO,'
      '   :IDPESSOA,'
      '   :MESREFERENCIA,'
      '   :SEQPROPOSTA,'
      '   :SEQBENEFICIO,'
      '   :CODALTERADOR,'
      '   :VALOR,'
      '   :FLGTIPO,'
      '   :FLGRETROATIVO)')
    DeleteSQL.Strings = (
      'DELETE FROM HSTATRASOBENEF'
      ' WHERE IDPESSJUR = :OLD_IDPESSJUR and '
      ' IDTITULAR = :OLD_IDTITULAR and'
      ' IDPLANOPREV = :OLD_IDPLANOPREV and '
      ' IDBENEFICIO = :OLD_IDBENEFICIO and'
      ' MES = :OLD_MES and'
      ' IDMOTIVO = :OLD_IDMOTIVO and'
      ' NUMEROPROCESSO = :OLD_NUMEROPROCESSO and'
      ' IDPESSOA = :OLD_IDPESSOA and'
      ' MESREFERENCIA = :OLD_MESREFERENCIA and'
      ' SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      ' SEQBENEFICIO= :OLD_SEQBENEFICIO and '
      ' CODALTERADOR = :OLD_CODALTERADOR')
    Left = 436
    Top = 406
  end
  object QryAlter: TwwQuery
    CachedUpdates = True
    BeforePost = QryAlterBeforePost
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT H.IDPESSJUR,'
      '       H.IDTITULAR,'
      '       H.IDPLANOPREV,'
      '       H.MES,'
      '       H.IDMOTIVO,'
      '       H.NUMEROPROCESSO,'
      '       H.IDBENEFICIO,'
      '       H.IDPESSOA,'
      '       H.MESREFERENCIA,'
      '       H.SEQPROPOSTA,'
      '       H.SEQBENEFICIO,'
      '       H.CODALTERADOR,'
      '       H.VALOR,'
      '       H.FLGTIPO,'
      '       H.FLGRETROATIVO,'
      '       H.TRGDTINCLUSAO,'
      '       H.TRGUSERINCLUSAO,'
      '       T.DESCRICAO'
      '  FROM HSTATRASOBENEF H, TIPOALTERADOR T'
      ' WHERE H.IDPESSJUR = :IDPESSJUR'
      '   AND H.IDTITULAR = :IDTITULAR'
      '   AND H.CODALTERADOR = T.CODALTERADOR'
      '   AND H.IDPESSOA = :IDPESSOA'
      ''
      ' '
      ' ')
    UpdateObject = updAlt
    ValidateWithMask = True
    Left = 441
    Top = 286
    ParamData = <
      item
        DataType = ftString
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object QryAlterDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.TIPOALTERADOR.DESCRICAO'
      Size = 35
    end
    object QryAlterIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Origin = 'BASEDADOS.HSTATRASOBENEF.IDPESSJUR'
    end
    object QryAlterIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Origin = 'BASEDADOS.HSTATRASOBENEF.IDTITULAR'
    end
    object QryAlterIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.HSTATRASOBENEF.IDPLANOPREV'
    end
    object QryAlterMES: TStringField
      FieldName = 'MES'
      Origin = 'BASEDADOS.HSTATRASOBENEF.MES'
      FixedChar = True
      Size = 7
    end
    object QryAlterIDMOTIVO: TFloatField
      FieldName = 'IDMOTIVO'
      Origin = 'BASEDADOS.HSTATRASOBENEF.IDMOTIVO'
    end
    object QryAlterNUMEROPROCESSO: TFloatField
      FieldName = 'NUMEROPROCESSO'
      Origin = 'BASEDADOS.HSTATRASOBENEF.NUMEROPROCESSO'
    end
    object QryAlterIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
      Origin = 'BASEDADOS.HSTATRASOBENEF.IDBENEFICIO'
    end
    object QryAlterIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.HSTATRASOBENEF.IDPESSOA'
    end
    object QryAlterMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      Origin = 'BASEDADOS.HSTATRASOBENEF.MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object QryAlterSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
      Origin = 'BASEDADOS.HSTATRASOBENEF.SEQPROPOSTA'
    end
    object QryAlterSEQBENEFICIO: TFloatField
      FieldName = 'SEQBENEFICIO'
      Origin = 'BASEDADOS.HSTATRASOBENEF.SEQBENEFICIO'
    end
    object QryAlterCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
      Origin = 'BASEDADOS.HSTATRASOBENEF.CODALTERADOR'
    end
    object QryAlterVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'BASEDADOS.HSTATRASOBENEF.VALOR'
    end
    object QryAlterFLGTIPO: TStringField
      FieldName = 'FLGTIPO'
      Origin = 'BASEDADOS.HSTATRASOBENEF.FLGTIPO'
      FixedChar = True
      Size = 1
    end
    object QryAlterFLGRETROATIVO: TFloatField
      FieldName = 'FLGRETROATIVO'
      Origin = 'BASEDADOS.HSTATRASOBENEF.FLGRETROATIVO'
    end
    object QryAlterTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.HSTATRASOBENEF.TRGDTINCLUSAO'
    end
    object QryAlterTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.HSTATRASOBENEF.TRGUSERINCLUSAO'
      Size = 30
    end
  end
  object dsAlter: TwwDataSource
    AutoEdit = False
    DataSet = QryAlter
    Left = 439
    Top = 342
  end
  object qryTipoAlterador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT T.CODALTERADOR, T.DESCRICAO, T.ACRESDECRES FROM TIPOALTER' +
        'ADOR T'
      '       WHERE  EXISTS(SELECT 1'
      '                       FROM ALTERADORXBENEF'
      '                      WHERE CODALTERADOR = T.CODALTERADOR)'
      'AND ACRESDECRES = :ACRESDECRES'
      '      ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 531
    Top = 340
    ParamData = <
      item
        DataType = ftString
        Name = 'ACRESDECRES'
        ParamType = ptInput
      end>
  end
  object dscampo: TwwDataSource
    DataSet = qrycampo
    Left = 161
    Top = 176
  end
  object qrycampo: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'select flgevento, mescobranca, numrecebimento'
      'from HSTCONTRIBPREV')
    ValidateWithMask = True
    Left = 233
    Top = 152
  end
  object updAlterBenef: TUpdateSQL
    ModifySQL.Strings = (
      ' UPDATE ALTERADORXBENEF'
      '    SET FLGDEVOL  =  :FLGDEVOL ,'
      '        FLGATRASO =  :FLGATRASO'
      '  WHERE IDPLANOPREV  = :OLD_IDPLANOPREV'
      '    AND IDBENEFICIO  = :OLD_IDBENEFICIO'
      '    AND CODALTERADOR = :OLD_CODALTERADOR'
      ' '
      ' ')
    Left = 264
    Top = 73
  end
  object qryAlterBenef: TwwQuery
    CachedUpdates = True
    DatabaseName = 'basedados'
    SQL.Strings = (
      '      SELECT ALT.*, TP.DESCRICAO'
      '        FROM ALTERADORXBENEF  ALT, TIPOALTERADOR TP'
      '        WHERE ALT.IDPLANOPREV  = :IDPLANOPREV'
      '          AND ALT.IDBENEFICIO  = :IDBENEFICIO'
      '          AND ALT.CODALTERADOR = :CODALTERADOR'
      '          AND ALT.CODALTERADOR = TP.CODALTERADOR')
    UpdateObject = updAlterBenef
    ValidateWithMask = True
    Left = 272
    Top = 17
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODALTERADOR'
        ParamType = ptUnknown
      end>
    object qryAlterBenefDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.TIPOALTERADOR.DESCRICAO'
      Size = 35
    end
    object qryAlterBenefIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.ALTERADORXBENEF.IDPLANOPREV'
    end
    object qryAlterBenefIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
      Origin = 'BASEDADOS.ALTERADORXBENEF.IDBENEFICIO'
    end
    object qryAlterBenefCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
      Origin = 'BASEDADOS.ALTERADORXBENEF.CODALTERADOR'
    end
    object qryAlterBenefFLGATRASO: TFloatField
      FieldName = 'FLGATRASO'
      Origin = 'BASEDADOS.ALTERADORXBENEF.FLGATRASO'
    end
    object qryAlterBenefFLGDEVOL: TFloatField
      FieldName = 'FLGDEVOL'
      Origin = 'BASEDADOS.ALTERADORXBENEF.FLGDEVOL'
    end
    object qryAlterBenefTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.ALTERADORXBENEF.TRGDTINCLUSAO'
    end
  end
  object wwDataSource1: TwwDataSource
    DataSet = qryAlterBenef
    Left = 336
    Top = 33
  end
  object qryMovBenef: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT * FROM MOVBENEF'
      'WHERE 1 = 2')
    UpdateObject = updMovBenef
    ValidateWithMask = True
    Left = 360
    Top = 200
  end
  object updMovBenef: TUpdateSQL
    InsertSQL.Strings = (
      'insert into MOVBENEF'
      '  (IDMOVBENEF, IDPLANOPREV, IDTITULAR, NUMEROPROCESSO, '
      'SEQPROPOSTA, DATAMOV,  VALORTOTAL, DATAINICIO, IDPESSJUR,'
      ' IDBENEFICIO, IDPESSOA, TIPOMOV, VALORATUAL,   VALORCOTAS,'
      ' DATAFINAL, DATAINICIOANT, DATAFINALANT, VALORATUALANT, '
      'IDSITANTERIOR, IDDESFAZER,'
      ' MOTRETENC, FLGDATAPREVANT,    IDPLANOORIGEM, IDLOTEMOV, '
      'VALORSRB, VALORSRBANT, FLGVOLTAPATRO, USUARIOALT,  '
      ' PLNCODIGO, IDRETROATIVO, IDMODULO, FLGEMPRESTIMO, IDCALCULO, '
      'OBSERVACAO,    DTINICIOLIBERACAO, VALORTOTALANT,'
      '--Inicio - Helio - SOL Nº 253577/17584 PPM Nº 994289'
      'VLRBSATUALANT, VLRBSTOTALANT, VLRBSATUALNOVO,'
      'VLRBSTOTALNOVO, VLRFABATUALANT, VLRFABTOTALANT,'
      'VLRFABATUALNOVO, VLRFABTOTALNOVO)'
      '--Fim - Helio - SOL Nº 253577/17584 PPM Nº 994289'
      'values'
      '  (CM.SEQMOVBENEF.NEXTVAL, :IDPLANOPREV, :IDTITULAR, '
      ':NUMEROPROCESSO, :SEQPROPOSTA,   :DATAMOV, :VALORTOTAL,'
      ' :DATAINICIO, :IDPESSJUR, :IDBENEFICIO, :IDPESSOA,    :TIPOMOV,'
      ' :VALORATUAL, :VALORCOTAS, :DATAFINAL, :DATAINICIOANT, '
      
        ':DATAFINALANT,    :VALORATUALANT, :IDSITANTERIOR, :IDDESFAZER,  ' +
        ' '
      ' :MOTRETENC, :FLGDATAPREVANT,'
      ' :IDPLANOORIGEM, :IDLOTEMOV, :VALORSRB,    :VALORSRBANT,'
      ' :FLGVOLTAPATRO, :USUARIOALT, :PLNCODIGO, :IDRETROATIVO,  '
      ' :IDMODULO, :FLGEMPRESTIMO, :IDCALCULO, :OBSERVACAO, '
      ':DTINICIOLIBERACAO,  :VALORTOTALANT,'
      ':VLRBSATUALANT, :VLRBSTOTALANT, :VLRBSATUALNOVO,'
      ':VLRBSTOTALNOVO, :VLRFABATUALANT, :VLRFABTOTALANT,'
      ':VLRFABATUALNOVO, :VLRFABTOTALNOVO)')
    Left = 272
    Top = 200
  end
  object qryJustificativaExclusao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPESSJUR,'
      'IDPLANOPREV,'
      'IDPLANOORIGEM,'
      'IDTITULAR,'
      'IDPESSOA,'
      'SEQPROPOSTA,'
      'IDBENEFICIO,'
      'NUMEROPROCESSO,'
      'MES,'
      'IDMOTIVO,'
      'SEQBENEFICIO,'
      'MESREFERENCIA,'
      'JUSTIFICATIVAEXCLUSAO'
      'FROM   HSTBENEFBFCIARIO'
      'WHERE (IDPESSJUR = :IDPESSJUR)'
      'AND (IDPLANOPREV = :IDPLANOPREV)'
      'AND (IDPLANOORIGEM = :IDPLANOORIGEM)'
      'AND (IDTITULAR = :IDTITULAR)'
      'AND (IDPESSOA = :IDPESSOA)'
      'AND (SEQPROPOSTA = :SEQPROPOSTA)'
      'AND (IDBENEFICIO = :IDBENEFICIO)'
      'AND (NUMEROPROCESSO = :NUMEROPROCESSO)')
    UpdateObject = updJustificativaExclusao
    ValidateWithMask = True
    Left = 497
    Top = 228
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOORIGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end>
    object qryJustificativaExclusaoIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.IDPESSJUR'
    end
    object qryJustificativaExclusaoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.IDPLANOPREV'
    end
    object qryJustificativaExclusaoIDPLANOORIGEM: TFloatField
      FieldName = 'IDPLANOORIGEM'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.IDPLANOORIGEM'
    end
    object qryJustificativaExclusaoIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.IDTITULAR'
    end
    object qryJustificativaExclusaoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.IDPESSOA'
    end
    object qryJustificativaExclusaoSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.SEQPROPOSTA'
    end
    object qryJustificativaExclusaoIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.IDBENEFICIO'
    end
    object qryJustificativaExclusaoNUMEROPROCESSO: TFloatField
      FieldName = 'NUMEROPROCESSO'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.NUMEROPROCESSO'
    end
    object qryJustificativaExclusaoMES: TStringField
      FieldName = 'MES'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.MES'
      FixedChar = True
      Size = 7
    end
    object qryJustificativaExclusaoIDMOTIVO: TFloatField
      FieldName = 'IDMOTIVO'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.IDMOTIVO'
    end
    object qryJustificativaExclusaoSEQBENEFICIO: TFloatField
      FieldName = 'SEQBENEFICIO'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.SEQBENEFICIO'
    end
    object qryJustificativaExclusaoMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object qryJustificativaExclusaoJUSTIFICATIVAEXCLUSAO: TMemoField
      FieldName = 'JUSTIFICATIVAEXCLUSAO'
      Origin = 'BASEDADOS.HSTBENEFBFCIARIO.JUSTIFICATIVAEXCLUSAO'
      BlobType = ftMemo
      Size = 400
    end
  end
  object updJustificativaExclusao: TUpdateSQL
    ModifySQL.Strings = (
      'update HSTBENEFBFCIARIO'
      'set'
      '  JUSTIFICATIVAEXCLUSAO = :JUSTIFICATIVAEXCLUSAO'
      'where'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  IDMOTIVO = :OLD_IDMOTIVO and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO and'
      '  MES = :OLD_MES and'
      '  SEQBENEFICIO = :OLD_SEQBENEFICIO and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  MESREFERENCIA = :OLD_MESREFERENCIA and'
      '  IDPLANOORIGEM = :OLD_IDPLANOORIGEM')
    Left = 549
    Top = 232
  end
end
