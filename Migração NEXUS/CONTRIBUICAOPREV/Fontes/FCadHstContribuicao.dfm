inherited frmCadHstContribuicao: TfrmCadHstContribuicao
  Left = 416
  Top = 0
  HelpContext = 160068
  Caption = 'Cadastro Manual do Histórico de Contribuições'
  ClientHeight = 701
  ClientWidth = 664
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 664
    Height = 615
    inherited pnlMestre: TPanel
      Width = 662
      Height = 84
      object Label1: TLabel
        Left = 8
        Top = 0
        Width = 69
        Height = 13
        Caption = 'Participante'
      end
      object Label2: TLabel
        Left = 358
        Top = 0
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object Label3: TLabel
        Left = 8
        Top = 26
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object Label4: TLabel
        Left = 8
        Top = 55
        Width = 72
        Height = 13
        Caption = 'Contribuição'
      end
      object Label5: TLabel
        Left = 358
        Top = 55
        Width = 83
        Height = 13
        Caption = 'Data de Início'
      end
      object Label6: TLabel
        Left = 450
        Top = 55
        Width = 95
        Height = 13
        Caption = 'Data de Término'
      end
      object Label7: TLabel
        Left = 554
        Top = 0
        Width = 71
        Height = 13
        Caption = 'Inscrição Nº'
      end
      object Label8: TLabel
        Left = 358
        Top = 26
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object Label9: TLabel
        Left = 554
        Top = 55
        Width = 94
        Height = 13
        Caption = 'Última Cobrança'
      end
      object DBText1: TDBText
        Left = 8
        Top = 14
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
      object DBText2: TDBText
        Left = 8
        Top = 39
        Width = 42
        Height = 13
        AutoSize = True
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
        Left = 358
        Top = 39
        Width = 42
        Height = 13
        AutoSize = True
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
        Top = 69
        Width = 42
        Height = 13
        AutoSize = True
        DataField = 'NOMECONTRIB'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText5: TDBText
        Left = 358
        Top = 14
        Width = 42
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
        Left = 554
        Top = 14
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
        Left = 358
        Top = 69
        Width = 65
        Height = 17
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
        Left = 450
        Top = 69
        Width = 65
        Height = 17
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
        Left = 554
        Top = 69
        Width = 65
        Height = 17
        DataField = 'ULTMESPREPARO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 85
      Width = 660
      Height = 441
      Align = alNone
      Tabs.Strings = (
        'Histórico'
        'Log')
      inherited Dock973: TDock97 [0]
        Width = 652
      end
      inherited Dock974: TDock97 [1]
        Left = 566
        Height = 382
      end
      object chkDivTrat: TCheckBox [2]
        Left = 120
        Top = 2
        Width = 233
        Height = 17
        Caption = 'Não visualizar divergências tratadas'
        TabOrder = 3
        OnClick = chkDivTratClick
      end
      inherited pgctrlDetalhe: TPageControl [3]
        Width = 562
        Height = 382
        inherited tbsDet: TTabSheet
          Caption = 'Histórico'
          inherited dbgrdDet: TwwDBGrid
            Width = 554
            Height = 354
            Font.Style = []
            ParentFont = False
            TitleLines = 2
            OnDblClick = dbgrdDetDblClick
          end
          inherited pnlControlesDet: TPanel
            Width = 554
            Height = 354
            object Label12: TLabel
              Left = 8
              Top = 44
              Width = 87
              Height = 13
              Caption = 'Valor Esperado'
            end
            object Label13: TLabel
              Left = 171
              Top = 45
              Width = 88
              Height = 13
              Caption = 'Valor Recebido'
            end
            object Label14: TLabel
              Left = 8
              Top = 119
              Width = 78
              Height = 13
              Caption = 'Data Prevista'
            end
            object Label15: TLabel
              Left = 171
              Top = 120
              Width = 72
              Height = 13
              Caption = 'Data Efetiva'
            end
            object Label16: TLabel
              Left = 342
              Top = 149
              Width = 39
              Height = 13
              Caption = 'Motivo'
            end
            object Label17: TLabel
              Left = 342
              Top = 184
              Width = 197
              Height = 13
              Caption = 'Lote (Obrigatório para fazer Envio)'
            end
            object Label18: TLabel
              Left = 8
              Top = 157
              Width = 120
              Height = 13
              Caption = 'Forma de Pagamento'
            end
            object Label20: TLabel
              Left = 8
              Top = 245
              Width = 205
              Height = 13
              Caption = 'Identificação de Origem do Recurso'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label23: TLabel
              Left = 8
              Top = 197
              Width = 95
              Height = 13
              Caption = 'Tipo do Recurso'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label19: TLabel
              Left = 265
              Top = 195
              Width = 56
              Height = 13
              Caption = 'Ano DIRF'
            end
            object LblCodDocPrev: TLabel
              Left = 161
              Top = 195
              Width = 92
              Height = 13
              Caption = 'Cod. Doc. Prev.'
            end
            object btnProcura: TToolbarButton97
              Left = 244
              Top = 210
              Width = 17
              Height = 20
              AllowAllUp = True
              GroupIndex = 1
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
                33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
                8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
                F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
                F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
                0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
                B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
                B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
                333333333777733333333333FBFBFB3333333333333333333333}
              ImageIndex = 3
              Images = ImlPadrao
              Layout = blGlyphTop
              Opaque = False
              Spacing = 0
              OnClick = btnProcuraClick
            end
            object Label21: TLabel
              Left = 342
              Top = 221
              Width = 83
              Height = 13
              Caption = 'Plano Contábil'
            end
            object Label24: TLabel
              Left = 8
              Top = 81
              Width = 133
              Height = 13
              Caption = 'Salário de Contribuição'
            end
            object Label25: TLabel
              Left = 171
              Top = 82
              Width = 155
              Height = 13
              Caption = 'Percentual de Contribuição'
            end
            object dblgCodPortForma: TwwDBLookupCombo
              Left = 8
              Top = 172
              Width = 313
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'Descrição da Forma de Pagamento'#9'F')
              DataField = 'CODPORTFORMA'
              DataSource = dsDet
              LookupTable = qryPortadorForma
              LookupField = 'CODPORTFORMA'
              TabOrder = 9
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
            object dbrgrpSitRecebimento: TDBRadioGroup
              Left = 342
              Top = 81
              Width = 208
              Height = 69
              Caption = 'Situação da Contribuição'
              DataField = 'SITRECEBIMENTO'
              DataSource = dsDet
              Items.Strings = (
                'Não Enviada'
                'Enviada e Não Recebida'
                'Recebida SEM Divergência'
                'Recebida COM Divergência')
              TabOrder = 10
              Values.Strings = (
                '0'
                '1'
                '2'
                '3')
            end
            object rdgrpatrasodevol: TDBRadioGroup
              Left = 342
              Top = -4
              Width = 208
              Height = 31
              Columns = 2
              DataField = 'FLGDEVOLUCAO'
              DataSource = dsDet
              Items.Strings = (
                'Cobrança'
                'Devolução')
              TabOrder = 11
              TabStop = True
              Values.Strings = (
                '0'
                '1')
              OnChange = rdgrpatrasodevolChange
            end
            object dbrgrpForma: TDBRadioGroup
              Left = 342
              Top = 27
              Width = 208
              Height = 55
              Caption = 'Forma de Cobrança'
              DataField = 'FOLHAORIGEM'
              DataSource = dsDet
              Items.Strings = (
                'Desconto na Folha Patro'
                'Desconto na Folha Benefícios'
                'Cobrança Bancária')
              TabOrder = 2
              TabStop = True
              Values.Strings = (
                'P'
                'B'
                'C')
            end
            object grpMesAnoRef: TGroupBox
              Left = 6
              Top = -2
              Width = 160
              Height = 44
              Caption = 'Ano e Mês de Referência'
              TabOrder = 0
              OnExit = grpMesAnoRefExit
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
                Left = 11
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
                OnExit = edMesRefExit
              end
            end
            object grpMesCobranca: TGroupBox
              Left = 171
              Top = -2
              Width = 160
              Height = 44
              Caption = 'Ano e Mês de Cobr/Pgmto'
              TabOrder = 1
              OnExit = grpMesCobrancaExit
              object Label11: TLabel
                Left = 88
                Top = 18
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
                OnExit = edMesRefExit
              end
            end
            object dbedEsperado: TwwDBEdit
              Left = 8
              Top = 60
              Width = 121
              Height = 21
              DataField = 'VALORESPERADO'
              DataSource = dsDet
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
              OnExit = dbedEsperadoExit
            end
            object dbedRecebido: TwwDBEdit
              Left = 171
              Top = 60
              Width = 121
              Height = 21
              DataField = 'VALORRECEBIDO'
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
              OnExit = dbedRecebidoExit
            end
            object dbdtPrevisao: TCMDateTimePicker
              Left = 6
              Top = 135
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAPREVISAORECE'
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
              TabOrder = 7
              OnExit = dbdtPrevisaoExit
            end
            object dbdtRecebimento: TCMDateTimePicker
              Left = 171
              Top = 133
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
              TabOrder = 8
              OnExit = dbdtRecebimentoExit
            end
            object DBLKPCMBMOTIVO: TwwDBLookupCombo
              Left = 342
              Top = 161
              Width = 209
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'Descrição'#9'F')
              DataField = 'IDMOTIVO'
              DataSource = dsDet
              LookupTable = qryMotivo
              LookupField = 'IDMOTIVO'
              TabOrder = 12
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object wwDBLookupCombo1: TwwDBLookupCombo
              Left = 342
              Top = 198
              Width = 209
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'Lote'#9'F'
                'IDLOTE'#9'10'#9'No.'#9'F'
                'MESREFERENCIA'#9'7'#9'Mês'#9'F'
                'TIPO'#9'19'#9'Tipo'#9'F')
              DataField = 'IDLOTE'
              DataSource = dsDet
              LookupTable = qryLote
              LookupField = 'IDLOTE'
              TabOrder = 13
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnDropDown = wwDBLookupCombo1DropDown
            end
            object EdOrigemRecurso: TEdit
              Left = 6
              Top = 260
              Width = 537
              Height = 21
              MaxLength = 200
              TabOrder = 14
            end
            object cboTipoRecurso: TwwDBLookupCombo
              Left = 6
              Top = 211
              Width = 148
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'IDTIPORECURSO'#9'10'#9'IDTIPORECURSO'#9'F'
                'NOME'#9'20'#9'NOME'#9'F'
                'TRGDTINCLUSAO'#9'18'#9'TRGDTINCLUSAO'#9'F'
                'TRGUSERINCLUSAO'#9'30'#9'TRGUSERINCLUSAO'#9'F')
              LookupTable = qryTipoRecurso
              LookupField = 'idTipoRecurso'
              Style = csDropDownList
              TabOrder = 15
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
              OnCloseUp = cboTipoRecursoCloseUp
            end
            object GroupBox1: TGroupBox
              Left = 8
              Top = 284
              Width = 537
              Height = 63
              Caption = 'Observação'
              TabOrder = 17
              object memobs: TMemo
                Left = 10
                Top = 15
                Width = 522
                Height = 42
                BorderStyle = bsNone
                Color = clActiveBorder
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                Visible = False
              end
            end
            object edAnoDIRF: TEdit
              Left = 265
              Top = 210
              Width = 74
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 4
              ParentFont = False
              TabOrder = 16
            end
            object StringGrid1: TStringGrid
              Left = 840
              Top = 20
              Width = 321
              Height = 85
              TabOrder = 18
              Visible = False
              ColWidths = (
                64
                64
                64
                64
                64)
              RowHeights = (
                24
                24
                24
                24
                24)
            end
            object edtCodDocPrev: TwwDBEdit
              Left = 160
              Top = 211
              Width = 83
              Height = 21
              DataField = 'CODDOCUMENTOPREV'
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
            end
            object edtPlanoContabil: TwwDBEdit
              Left = 342
              Top = 237
              Width = 209
              Height = 21
              DataField = 'NOMEPLANO'
              DataSource = dsDet
              Enabled = False
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
              OnExit = dbedEsperadoExit
            end
            object dbeSalContrib: TwwDBEdit
              Left = 6
              Top = 96
              Width = 121
              Height = 21
              DataField = 'SALCONTRIB'
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
            end
            object dbePercContrib: TwwDBEdit
              Left = 173
              Top = 98
              Width = 121
              Height = 21
              DataField = 'VALOROP1'
              DataSource = dsDet
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
          end
        end
        object tbsLog: TTabSheet
          Caption = 'tbsLog'
          ImageIndex = 1
          object Panel1: TPanel
            Left = 0
            Top = 2
            Width = 553
            Height = 351
            Caption = 'Panel1'
            TabOrder = 0
            object MmOcorrencia: TMemo
              Left = 18
              Top = 14
              Width = 521
              Height = 332
              TabOrder = 0
            end
          end
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 6
      Top = 530
      Width = 307
      Height = 114
      Caption = 'Importar Arquivo'
      TabOrder = 2
      object LblImporta: TLabel
        Left = 8
        Top = 59
        Width = 108
        Height = 13
        Caption = 'Selecionar Arquivo'
      end
      object btnImporta: TToolbarButton97
        Left = 277
        Top = 72
        Width = 24
        Height = 25
        AllowAllUp = True
        GroupIndex = 1
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
          33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
          8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
          F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
          F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
          0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
          B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
          B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
          333333333777733333333333FBFBFB3333333333333333333333}
        ImageIndex = 3
        Images = ImlPadrao
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        OnClick = btnImportaClick
      end
      object Label22: TLabel
        Left = 8
        Top = 21
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object edtImporta: TEdit
        Left = 7
        Top = 75
        Width = 266
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 4
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object EdtDescricaoImportacao: TEdit
        Left = 7
        Top = 37
        Width = 266
        Height = 21
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 200
        ParentFont = False
        TabOrder = 1
      end
    end
    object GBExcluirImportacao: TGroupBox
      Left = 317
      Top = 530
      Width = 342
      Height = 114
      Caption = 'Excluir Importação'
      TabOrder = 3
      object btnExcluirArquivo: TSpeedButton
        Left = 229
        Top = 21
        Width = 46
        Height = 20
        Caption = 'Excluir'
        OnClick = btnExcluirArquivoClick
      end
      object btnPesquisarExcluirArq: TSpeedButton
        Left = 308
        Top = 49
        Width = 23
        Height = 22
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
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
        OnClick = btnPesquisarExcluirArqClick
      end
      object DBNavigator1: TDBNavigator
        Left = 68
        Top = 21
        Width = 160
        Height = 20
        DataSource = DscExcluirArquivo
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        TabOrder = 3
        OnClick = DBNavigator1Click
      end
      object EdtUsuario: TEdit
        Left = 7
        Top = 76
        Width = 194
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 1
      end
      object EdtData: TEdit
        Left = 211
        Top = 76
        Width = 121
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 2
      end
      object MemoDescricao: TMemo
        Left = 7
        Top = 49
        Width = 298
        Height = 22
        TabOrder = 0
        OnChange = MemoDescricaoChange
      end
    end
  end
  inherited Dock972: TDock97
    Width = 664
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 240
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
      object tbtnReceberTudo: TToolbarButton97
        Left = 180
        Top = 0
        Width = 60
        Height = 41
        Hint = 'Receber todas as contribuições não recebidas ...'
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Receber'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF55555555555559055555
          55555555577FF5555555555599905555555555557777F5555555555599905555
          555555557777FF5555555559999905555555555777777F555555559999990555
          5555557777777FF5555557990599905555555777757777F55555790555599055
          55557775555777FF5555555555599905555555555557777F5555555555559905
          555555555555777FF5555555555559905555555555555777FF55555555555579
          05555555555555777FF5555555555557905555555555555777FF555555555555
          5990555555555555577755555555555555555555555555555555}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = tbtnReceberTudoClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 662
    Width = 664
    inherited tb97Fundo: TToolbar97
      Left = 492
      DockPos = 531
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 323
      DockPos = 362
    end
    object BBtnImporta: TBitBtn
      Left = 88
      Top = 3
      Width = 90
      Height = 33
      Caption = 'Importar'
      Default = True
      Enabled = False
      ModalResult = 1
      TabOrder = 2
      OnClick = BBtnImportaClick
      NumGlyphs = 2
    end
    object BBtnContabiliza: TBitBtn
      Left = 177
      Top = 3
      Width = 89
      Height = 33
      Caption = 'Contabilizar'
      Default = True
      Enabled = False
      ModalResult = 1
      TabOrder = 3
      OnClick = BBtnContabilizaClick
      NumGlyphs = 2
    end
    object btnInverte: TBitBtn
      Left = 274
      Top = 8
      Width = 21
      Height = 20
      Hint = 'Inverte a Seleção de Planos'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = btnInverteClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888488888888888888844888888888888444448888888888444444488
        1888884444444888118884448844888881188448884888888118844888888188
        8118844888881188111888448881111111888884881111111888888888811111
        8888888888881188888888888888818888888888888888888888}
    end
    object btnMarcaTodas: TBitBtn
      Left = 295
      Top = 8
      Width = 21
      Height = 20
      Hint = 'Seleciona todos os Planos'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = btnMarcaTodasClick
      Glyph.Data = {
        D6000000424DD60000000000000076000000280000000C0000000C0000000100
        0400000000006000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888848888888
        0000888224888888000088222248888800008822822488880000882848224888
        0000888224822488000088222248228800008822822482880000882888224888
        0000888888822488000088888888228800008888888882880000}
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 1032
    Top = 65498
    TargetsData = (
      1
      4
      (
        ''
        'Text'
        0)
      (
        ''
        'Cells'
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
    Left = 302
    Top = 480
  end
  inherited ds: TwwDataSource
    Left = 304
    Top = 0
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
    Left = 368
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Selecione o Participante / Contribuição'
    Colunas.Strings = (
      'EL.MATRICULA'
      'PP.INSCRICAONUMERO'
      'C.NOME'
      'P.NOME'
      'PL.NOME'
      'PT.NOME')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Inscrição Nº'
      'Contribuição'
      'Participante'
      'Plano'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA PT'
      'PESSOA P'
      'ELEGPATRO EL'
      'PARTPREVPLAN PP'
      'CONTRIBUICAO C'
      'CONTRIBPREVPARTP CPP'
      'PLANPREV PL')
    CamposChave.Strings = (
      'CPP.IDPESSJUR'
      'CPP.IDPLANOPREV'
      'CPP.IDPESSOA'
      'CPP.SEQPROPOSTA'
      'CPP.IDCONTRIBUICAO')
    Filtro.Strings = (
      'CPP.IDPESSJUR      = PP.IDPESSJUR'
      'CPP.IDPLANOPREV    = PP.IDPLANOPREV'
      'CPP.IDPESSOA       = PP.IDPESSOA'
      'CPP.SEQPROPOSTA    = PP.SEQPROPOSTA'
      'C.IDCONTRIBUICAO   = CPP.IDCONTRIBUICAO'
      'PT.IDPESSOA        = CPP.IDPESSJUR'
      'P.IDPESSOA         = CPP.IDPESSOA'
      'PL.IDPLANOPREV     = CPP.IDPLANOPREV'
      'EL.IDPESSJUR       = PP.IDPESSJUR'
      'EL.IDPESSOA        = PP.IDPESSOA ')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '13'
      '10'
      '25'
      '25'
      '25'
      '25')
    OperComparador.Strings = (
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
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    RepeteConsulta = True
    LookupSQL.Strings = (
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
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 544
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 1033
    Top = 65498
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 608
    Top = 372
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      
        'SELECT P.NOME,             PT.NOME AS NOMEPATRO, PL.NOME AS NOME' +
        'PLANO, C.NOME AS NOMECONTRIB,'
      
        '       EL.MATRICULA,       PP.INSCRICAONUMERO,   CPP.IDPESSJUR, ' +
        'CPP.IDPLANOPREV,'
      
        '       CPP.IDPESSOA AS IDTITULAR,    CPP.IDPESSOA AS IDDEPENDENT' +
        'E,     CPP.IDPESSOA,'
      '       CPP.SEQPROPOSTA,    CPP.IDCONTRIBUICAO,   CPP.DATAINICIO,'
      
        '       CPP.DATAFINAL,      CPP.ULTMESPREPARO,    SP.FLGINTERNO, ' +
        '       CP.IDREGRACALCULO,'
      '       CP.IDREGRACALCULO13,'
      '       PP.INSCRICAODATA,   PP.IDSITPART,         PF.DATANASC,'
      
        '       DECODE(SP.FLGINTERNO, '#39'MA'#39', PP.SALMANTIDO, PP.SALPARTICIP' +
        'ACAO) AS SALARIO,'
      
        '       CPP.VALORBASE1, CPP.VALORBASE2, CPP.VALORBASE3, CP.FLGINT' +
        'ERNO AS FLGINTERNOCONTRIB,C.FLGORIGEM'
      ''
      
        'FROM   PESSOA P, PESSOA PT, PESSOAFISICA PF, PLANPREV PL, CONTRI' +
        'BUICAO C,'
      '       PARTPREVPLAN PP, ELEGPATRO EL, SITPART SP, CONTPREV CP,'
      '       CONTRIBPREVPARTP CPP'
      'WHERE  (CPP.IDPESSJUR      = :IDPESSJUR)'
      'AND    (CPP.IDPLANOPREV    = :IDPLANOPREV)'
      'AND    (CPP.IDPESSOA       = :IDPESSOA)'
      'AND    (CPP.SEQPROPOSTA    = :SEQPROPOSTA)'
      'AND    (CPP.IDCONTRIBUICAO = :IDCONTRIBUICAO)'
      'AND    (CPP.IDCONTRIBUICAO = C.IDCONTRIBUICAO)'
      'AND    (CPP.IDPLANOPREV    = PL.IDPLANOPREV)'
      'AND    (CPP.IDPESSOA       = P.IDPESSOA)'
      'AND    (CPP.IDPESSJUR      = PT.IDPESSOA)'
      'AND    (CPP.IDPESSJUR      = PP.IDPESSJUR)'
      'AND    (CPP.IDPLANOPREV    = PP.IDPLANOPREV)'
      'AND    (CPP.IDpessoa       = PP.IDPESSOA)'
      'AND    (CPP.SEQPROPOSTA    = PP.SEQPROPOSTA)'
      'AND    (PP.IDPESSJUR       = EL.IDPESSJUR)'
      'AND    (PP.IDPESSOA        = EL.IDPESSOA)'
      'AND    (PP.IDSITPART       = SP.IDSITPART)'
      'AND    (CPP.IDPLANOPREV    = CP.IDPLANOPREV)'
      'AND    (CPP.IDCONTRIBUICAO = CP.IDCONTRIBUICAO)'
      'AND    (EL.IDPESSOA        = PF.IDPESSOA)')
    Left = 256
    Top = 264
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
        Name = 'IDCONTRIBUICAO'
        ParamType = ptUnknown
        Value = 18
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 608
    Top = 304
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    AfterInsert = qryDetAfterInsert
    BeforePost = qryDetBeforePost
    AfterPost = qryDetAfterPost
    AfterScroll = qryDetAfterScroll
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      
        'SELECT  0 AS SELECIONA, NUMRECEBIMENTO,     M.IDMOTIVO,         ' +
        'H.MESREFERENCIA,    H.MESCOBRANCA,'
      
        '       H.IDPESSJUR,          H.IDPLANOPREV,      H.IDPESSOA,    ' +
        '     H.IDCONTRIBUICAO,'
      
        '       H.SEQPROPOSTA,        H.FLGDEVOLUCAO,     H.FLGDIVERGENTE' +
        ',    H.FLGCONCESSAO,'
      
        '       H.FLGEVENTO,          H.FLGCALCRESERVA,   H.FLGDESCFOLHA,' +
        '     H.FLGSITFUNDACAO,'
      
        '       H.FLGAPORTE,          H.VALORESPERADO,    H.VALORRECEBIDO' +
        ',    H.VALORCALCULADO,'
      
        '       H.DATAPREVISAORECE,   H.DATARECEBIMENTO,  H.DATAINICIO,  ' +
        '     H.DATAFINAL,'
      
        '       H.IDREGRACALCULO,     H.SITRECEBIMENTO,   H.TIPO,        ' +
        '     H.VALOROP1,'
      '       H.VALOROP2,           H.VALOROP3,         H.IDLOTE,'
      
        '       DECODE(VALORPARARESERVA, NULL, VALORRECEBIDO, VALORPARARE' +
        'SERVA) AS VALORPARARESERVA,'
      
        '       M.DESCRICAO, H.FLGMANUAL, H.CODDOCUMENTOPREV, H.FOLHAORIG' +
        'EM,'
      
        '       0 AS FLGALTERADO, H.CODPORTFORMA,H.IDTIPORECURSO,H.ORIGEM' +
        'RECURSO,T.NOME AS NOMETIPORECURSO, H.IDTITULAR,'
      
        '       (select anodirf from cm.CONTRIBUICAOXANOBASEXPESSOA CAP w' +
        'here CAP.NUMRECEBIMENTO = H.NUMRECEBIMENTO AND ROWNUM = 1) anodi' +
        'rf,'
      '       DECODE(H.PLNCODIGO,NULL,0,1) CONTABILIZA,'
      '       H.FLGIMPORTADO, H.DATAEMISSCOB, H.IDPLANPREVCONTAB,'
      ''
      
        '      (SELECT DECODE(H.IDPLANPREVCONTAB,2,'#39'REG/REPLAN'#39',74,'#39'NOVO ' +
        'PLANO'#39',PN.NOME) AS NOME'
      
        '      from PLANPREVCONTABIL PN WHERE ( H.IDPLANPREVCONTAB= PN.ID' +
        'PLANOPREV))as NomePlano'
      ''
      
        '     --  (SELECT DECODE(CO.IDPLANPREVCONTAB,2,'#39'REG/REPLAN'#39',74,'#39'N' +
        'OVO PLANO'#39',PN.NOME) AS NOME'
      
        '      -- from PLANPREVCONTABIL PN WHERE ( CO.IDPLANPREVCONTAB= P' +
        'N.IDPLANOPREV))as NomePlano'
      '      ,H.SALCONTRIB , H.OBSERVACAO'
      ''
      'FROM   HSTCONTRIBPREV H, MOTIVO M,CM.TIPORECURSO T'
      ''
      'WHERE  (H.IDPESSJUR      = :IDPESSJUR)'
      'AND    (H.IDPLANOPREV    = :IDPLANOPREV)'
      'AND    (H.IDPESSOA       = :IDPESSOA)'
      'AND    (NVL(H.IDTITULAR,H.IDPESSOA)       = :IDTITULAR)'
      ''
      '/*AND    (CO.IDPESSJUR      = H.IDPESSJUR)'
      'AND    (CO.IDPLANOPREV    = H.IDPLANOPREV)'
      'AND    (CO.IDPESSOA       = H.IDPESSOA)'
      'AND    (CO.IDCONTRIBUICAO = H.IDCONTRIBUICAO)'
      '*/'
      ''
      'AND    (H.SEQPROPOSTA    = :SEQPROPOSTA)'
      'AND    (H.IDCONTRIBUICAO = :IDCONTRIBUICAO)'
      'AND    (M.IDMOTIVO     = H.IDMOTIVO)'
      'AND    (T.IDTIPORECURSO (+) = H.IDTIPORECURSO  ) '
      'ORDER BY MESREFERENCIA DESC'
      ' ')
    UpdateObject = updDet
    ControlType.Strings = (
      'FLGDEVOLUCAO;CheckBox;1;0'
      'FLGCALCRESERVA;CheckBox;1;0'
      'FLGDESCFOLHA;CheckBox;0;1'
      'SELECIONA;CheckBox;1;0'
      'CONTABILIZA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 252
    Top = 488
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
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCONTRIBUICAO'
        ParamType = ptUnknown
      end>
    object qryDetSELECIONA: TFloatField
      DisplayLabel = 'Selecionar'
      DisplayWidth = 10
      FieldName = 'SELECIONA'
    end
    object qryDetCONTABILIZA: TFloatField
      DisplayLabel = 'Contabilizado'
      DisplayWidth = 10
      FieldName = 'CONTABILIZA'
    end
    object qryDetMESREFERENCIA: TStringField
      DisplayLabel = 'Mês de ~Referência'
      DisplayWidth = 7
      FieldName = 'MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object qryDetMESCOBRANCA: TStringField
      DisplayLabel = 'Mês de ~Cobrança'
      DisplayWidth = 7
      FieldName = 'MESCOBRANCA'
      FixedChar = True
      Size = 7
    end
    object qryDetVALORESPERADO: TFloatField
      DisplayLabel = 'Valor ~Esperado'
      DisplayWidth = 10
      FieldName = 'VALORESPERADO'
      DisplayFormat = '#0.00'
    end
    object qryDetVALORRECEBIDO: TFloatField
      DisplayLabel = 'Valor ~Recebido'
      DisplayWidth = 10
      FieldName = 'VALORRECEBIDO'
      DisplayFormat = '#0.00'
    end
    object qryDetDATAPREVISAORECE: TDateTimeField
      DisplayLabel = 'Data ~Prevista'
      DisplayWidth = 10
      FieldName = 'DATAPREVISAORECE'
    end
    object qryDetDATARECEBIMENTO: TDateTimeField
      DisplayLabel = 'Data ~Efetiva'
      DisplayWidth = 10
      FieldName = 'DATARECEBIMENTO'
    end
    object qryDetFLGDEVOLUCAO: TFloatField
      DisplayLabel = 'Devolução'
      DisplayWidth = 10
      FieldName = 'FLGDEVOLUCAO'
    end
    object qryDetFLGCALCRESERVA: TFloatField
      DisplayLabel = 'Alimentou~Reserva'
      DisplayWidth = 10
      FieldName = 'FLGCALCRESERVA'
    end
    object qryDetFLGDESCFOLHA: TFloatField
      DisplayLabel = 'Cobrar Via ~Banco'
      DisplayWidth = 10
      FieldName = 'FLGDESCFOLHA'
    end
    object qryDetVALORPARARESERVA: TFloatField
      DisplayLabel = 'Valor para ~Reserva'
      DisplayWidth = 10
      FieldName = 'VALORPARARESERVA'
    end
    object qryDetDESCRICAO: TStringField
      DisplayLabel = 'Motivo'
      DisplayWidth = 50
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object qryDetORIGEMRECURSO: TStringField
      DisplayLabel = 'Origem do Recurso'
      DisplayWidth = 200
      FieldName = 'ORIGEMRECURSO'
      Size = 200
    end
    object qryDetFLGIMPORTADO: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGIMPORTADO'
      Visible = False
    end
    object qryDetIDTITULAR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTITULAR'
      Visible = False
    end
    object qryDetANODIRF: TFloatField
      DisplayLabel = 'Ano DIRF'
      DisplayWidth = 10
      FieldName = 'ANODIRF'
      Visible = False
    end
    object qryDetNOMETIPORECURSO: TStringField
      DisplayWidth = 20
      FieldName = 'NOMETIPORECURSO'
      Visible = False
    end
    object qryDetNUMRECEBIMENTO: TFloatField
      FieldName = 'NUMRECEBIMENTO'
      Visible = False
    end
    object qryDetIDMOTIVO: TFloatField
      FieldName = 'IDMOTIVO'
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
    object qryDetIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryDetIDCONTRIBUICAO: TFloatField
      FieldName = 'IDCONTRIBUICAO'
      Visible = False
    end
    object qryDetSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
      Visible = False
    end
    object qryDetFLGDIVERGENTE: TFloatField
      FieldName = 'FLGDIVERGENTE'
      Visible = False
    end
    object qryDetFLGCONCESSAO: TFloatField
      FieldName = 'FLGCONCESSAO'
      Visible = False
    end
    object qryDetFLGEVENTO: TFloatField
      FieldName = 'FLGEVENTO'
      Visible = False
    end
    object qryDetFLGSITFUNDACAO: TStringField
      FieldName = 'FLGSITFUNDACAO'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object qryDetFLGAPORTE: TFloatField
      FieldName = 'FLGAPORTE'
      Visible = False
    end
    object qryDetVALORCALCULADO: TFloatField
      FieldName = 'VALORCALCULADO'
      Visible = False
      DisplayFormat = '#0.00'
    end
    object qryDetDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
      Visible = False
    end
    object qryDetDATAFINAL: TDateTimeField
      FieldName = 'DATAFINAL'
      Visible = False
    end
    object qryDetIDREGRACALCULO: TFloatField
      FieldName = 'IDREGRACALCULO'
      Visible = False
    end
    object qryDetSITRECEBIMENTO: TStringField
      FieldName = 'SITRECEBIMENTO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryDetTIPO: TStringField
      FieldName = 'TIPO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryDetVALOROP2: TFloatField
      FieldName = 'VALOROP2'
      Visible = False
    end
    object qryDetVALOROP3: TFloatField
      FieldName = 'VALOROP3'
      Visible = False
    end
    object qryDetFLGMANUAL: TFloatField
      FieldName = 'FLGMANUAL'
      Visible = False
    end
    object qryDetCODDOCUMENTOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'CODDOCUMENTOPREV'
      Visible = False
    end
    object qryDetFOLHAORIGEM: TStringField
      DisplayWidth = 1
      FieldName = 'FOLHAORIGEM'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryDetIDLOTE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDLOTE'
      Visible = False
    end
    object qryDetFLGALTERADO: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGALTERADO'
      Visible = False
    end
    object qryDetCODPORTFORMA: TFloatField
      DisplayWidth = 10
      FieldName = 'CODPORTFORMA'
      Visible = False
    end
    object qryDetIDTIPORECURSO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPORECURSO'
      Visible = False
    end
    object qryDetDATAEMISSCOB: TDateTimeField
      FieldName = 'DATAEMISSCOB'
    end
    object qryDetNOMEPLANO: TStringField
      FieldName = 'NOMEPLANO'
    end
    object qryDetIDPLANPREVCONTAB: TFloatField
      FieldName = 'IDPLANPREVCONTAB'
    end
    object qryDetSALCONTRIB: TFloatField
      DisplayLabel = 'Salário de Contribuição'
      FieldName = 'SALCONTRIB'
      KeyFields = 'SALCONTRIB'
    end
    object qryDetVALOROP1: TFloatField
      DisplayLabel = 'Percentual de Contribuição'
      FieldName = 'VALOROP1'
    end
    object qryDetOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 150
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update HSTCONTRIBPREV'
      'set'
      '  IDMOTIVO = :IDMOTIVO,'
      '  MESREFERENCIA = :MESREFERENCIA,'
      '  MESCOBRANCA = :MESCOBRANCA,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDCONTRIBUICAO = :IDCONTRIBUICAO,'
      '  SEQPROPOSTA = :SEQPROPOSTA,'
      '  FLGDEVOLUCAO = :FLGDEVOLUCAO,'
      '  FLGDIVERGENTE = :FLGDIVERGENTE,'
      '  FLGCONCESSAO = :FLGCONCESSAO,'
      '  FLGEVENTO = :FLGEVENTO,'
      '  FLGCALCRESERVA = :FLGCALCRESERVA,'
      '  FLGDESCFOLHA = :FLGDESCFOLHA,'
      '  FLGSITFUNDACAO = :FLGSITFUNDACAO,'
      '  FLGAPORTE = :FLGAPORTE,'
      '  VALORESPERADO = :VALORESPERADO,'
      '  VALORRECEBIDO = :VALORRECEBIDO,'
      '  VALORCALCULADO = :VALORCALCULADO,'
      '  DATAPREVISAORECE = :DATAPREVISAORECE,'
      '  DATARECEBIMENTO = :DATARECEBIMENTO,'
      '  DATAINICIO = :DATAINICIO,'
      '  DATAFINAL = :DATAFINAL,'
      '  IDREGRACALCULO = :IDREGRACALCULO,'
      '  SITRECEBIMENTO = :SITRECEBIMENTO,'
      '  TIPO = :TIPO,'
      '  VALOROP1 = :VALOROP1,'
      '  VALOROP2 = :VALOROP2,'
      '  VALOROP3 = :VALOROP3,'
      '  IDLOTE = :IDLOTE,'
      '  FLGMANUAL = :FLGMANUAL,'
      '  FOLHAORIGEM = :FOLHAORIGEM,'
      '  CODPORTFORMA = :CODPORTFORMA,'
      '  IDTIPORECURSO =:IDTIPORECURSO,'
      '  ORIGEMRECURSO =:ORIGEMRECURSO,'
      '  CODDOCUMENTOPREV =:CODDOCUMENTOPREV,'
      '  SALCONTRIB  =:SALCONTRIB,'
      '  OBSERVACAO =:OBSERVACAO'
      'where'
      '  NUMRECEBIMENTO = :OLD_NUMRECEBIMENTO and'
      '  IDMOTIVO = :OLD_IDMOTIVO and'
      '  MESREFERENCIA = :OLD_MESREFERENCIA and'
      '  MESCOBRANCA = :OLD_MESCOBRANCA'
      ' ')
    InsertSQL.Strings = (
      'insert into HSTCONTRIBPREV'
      
        '  (NUMRECEBIMENTO, IDMOTIVO, MESREFERENCIA, MESCOBRANCA, IDPESSJ' +
        'UR, IDPLANOPREV,'
      
        '   IDPESSOA, IDCONTRIBUICAO, SEQPROPOSTA, FLGDEVOLUCAO, FLGDIVER' +
        'GENTE,'
      
        '   FLGCONCESSAO, FLGEVENTO, FLGCALCRESERVA, FLGDESCFOLHA, FLGSIT' +
        'FUNDACAO,'
      
        '   FLGAPORTE, VALORESPERADO, VALORRECEBIDO, VALORCALCULADO, DATA' +
        'PREVISAORECE,'
      
        '   DATARECEBIMENTO, DATAINICIO, DATAFINAL, IDREGRACALCULO, SITRE' +
        'CEBIMENTO,'
      
        '   TIPO, VALOROP1, VALOROP2, VALOROP3, IDLOTE, FLGMANUAL, FOLHAO' +
        'RIGEM, CODPORTFORMA,IDTIPORECURSO,ORIGEMRECURSO, IDTITULAR, CODD' +
        'OCUMENTOPREV, DATAEMISSCOB, IDPLANPREVCONTAB, SALCONTRIB, OBSERV' +
        'ACAO )'
      'values'
      
        '  (:NUMRECEBIMENTO, :IDMOTIVO, :MESREFERENCIA, :MESCOBRANCA, :ID' +
        'PESSJUR,'
      
        '   :IDPLANOPREV, :IDPESSOA, :IDCONTRIBUICAO, :SEQPROPOSTA, :FLGD' +
        'EVOLUCAO,'
      
        '   :FLGDIVERGENTE, :FLGCONCESSAO, :FLGEVENTO, :FLGCALCRESERVA, :' +
        'FLGDESCFOLHA,'
      
        '   :FLGSITFUNDACAO, :FLGAPORTE, :VALORESPERADO, :VALORRECEBIDO, ' +
        ':VALORCALCULADO,'
      
        '   :DATAPREVISAORECE, :DATARECEBIMENTO, :DATAINICIO, :DATAFINAL,' +
        ' :IDREGRACALCULO,'
      
        '   :SITRECEBIMENTO, :TIPO, :VALOROP1, :VALOROP2, :VALOROP3, :IDL' +
        'OTE, :FLGMANUAL,'
      
        '   :FOLHAORIGEM, :CODPORTFORMA,:IDTIPORECURSO,:ORIGEMRECURSO,:ID' +
        'TITULAR, :CODDOCUMENTOPREV, :DATAEMISSCOB, :IDPLANPREVCONTAB, :S' +
        'ALCONTRIB, :OBSERVACAO)'
      ''
      ' '
      ' ')
    DeleteSQL.Strings = (
      'delete from HSTCONTRIBPREV'
      'where'
      '  NUMRECEBIMENTO = :OLD_NUMRECEBIMENTO and'
      '  IDMOTIVO = :OLD_IDMOTIVO and'
      '  MESREFERENCIA = :OLD_MESREFERENCIA and'
      '  MESCOBRANCA = :OLD_MESCOBRANCA')
    Left = 272
    Top = 424
  end
  object qryHistContribPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  MESREFERENCIA'
      'FROM'
      '  HSTCONTRIBPREV'
      'WHERE'
      '    IDPESSJUR   = :IDPESSJUR   AND'
      '    IDPLANOPREV = :IDPLANOPREV  AND'
      '    IDPESSOA    = :IDPESSOA     AND'
      '    SEQPROPOSTA = :SEQPROPOSTA  AND'
      '   (( VALORRECEBIDO <= 0 ) OR (VALORRECEBIDO IS NULL))')
    ValidateWithMask = True
    Left = 144
    Top = 48
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
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
  end
  object qryUpdateHistContribPrev: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 152
    Top = 96
  end
  object qryMotivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDMOTIVO, DESCRICAO'
      'FROM MOTIVO'
      'ORDER BY DESCRICAO ')
    ValidateWithMask = True
    Left = 144
    Top = 152
  end
  object qryLote: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDLOTE, MESREFERENCIA, DESCRICAO,'
      '       DECODE(TIPO,'#39'B'#39','#39'Folha de Benefícios'#39','#39'Outros'#39') AS TIPO,'
      '       DATAVOLTATMP'
      'FROM   CTRLINTERFACE'
      'WHERE  MESREFERENCIA = :MESREFERENCIA'
      'ORDER BY IDLOTE DESC'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 216
    Top = 152
    ParamData = <
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptUnknown
      end>
  end
  object qryMaiorMes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MAX(MESCOBRANCA) AS COBRANCA'
      '   FROM  HSTCONTRIBPREV'
      '     WHERE'
      '            IDPESSOA = :IDPESSOA'
      '   AND IDPLANOPREV = :IDPLANOPREV'
      '   AND IDPESSJUR  = :IDPESSJUR'
      '   AND IDCONTRIBUICAO = :IDCONTRIBUICAO')
    ValidateWithMask = True
    Left = 248
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCONTRIBUICAO'
        ParamType = ptUnknown
      end>
  end
  object updMaiorMes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE CONTRIBPREVPARTP'
      '     SET ULTMESPREPARO = :ULTMESPREPARO'
      ' WHERE'
      '   IDPESSOA = :IDPESSOA'
      '   AND IDPLANOPREV = :IDPLANOPREV'
      '   AND IDPESSJUR  = :IDPESSJUR'
      '   AND IDCONTRIBUICAO = :IDCONTRIBUICAO')
    ValidateWithMask = True
    Left = 296
    Top = 40
    ParamData = <
      item
        DataType = ftString
        Name = 'ULTMESPREPARO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCONTRIBUICAO'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 246
    Top = 308
  end
  object qryPortadorForma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODPORTFORMA, DESCRICAO'
      'FROM PORTADORFORMA'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 288
    Top = 152
  end
  object qryTipoRecurso: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPORECURSO,NOME FROM CM.TIPORECURSO'
      'WHERE ((IDMODULO=456) OR (IDMODULO IS NULL))')
    ValidateWithMask = True
    Left = 568
    Top = 241
  end
  object OpenDialog1: TOpenDialog
    Left = 609
    Top = 60
  end
  object MontaSelectCapCar: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.RAZAOSOCIAL'
      'DOCUMENTO.NODOCUMENTO'
      'DOCUMENTO.COMPLDOCUMENTO'
      'DOCUMENTO.NUMAPGR'
      'LANCTODOCUM.DATALANCTO'
      'DOCUMENTO.DATAVENCTO'
      'DOCUMENTO.DATAPROGRAMADA'
      'round(LANCTODOCUM.VALOR,2)'
      'LANCTODOCUM.HISTORICOCOMPL'
      'TIPODOCRECPAG.DESCRICAO'
      'PORTADORFORMA.DESCRICAO'
      'MODULO.NOMEMODULO'
      'RECBTOPAGTO.NUMCHQBORDERO'
      'PESSOA.NOME'
      'USUARIOSISTEMA.NOMEUSUARIO'
      'DOCUMENTO.IDPROCESSO')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'N'
      'D'
      'D'
      'D'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Razão Social'
      'Número do Documento'
      'Compl. Documento'
      'Nº Ap/Gr'
      'Data de Lançamento'
      'Data de Vencimento'
      'Data Programada'
      'Valor Moeda Corrente'
      'Histórico'
      'Tipo de Documento'
      'Forma de Pagamento/Cobrança'
      'Sistema de Origem'
      'Número do Cheque/Borderô'
      'Nome'
      'Usuário Inclusão'
      'Processo RAD')
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
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'DOCUMENTO'
      'LANCTODOCUM'
      'MOEDA'
      'TIPODOCRECPAG'
      'PORTADORFORMA'
      'MODULO'
      'RECBTOPAGTO'
      'USUARIOSISTEMA')
    CamposChave.Strings = (
      'DOCUMENTO.CODDOCUMENTO'
      'USUARIOSISTEMA.NOMEUSUARIO')
    Filtro.Strings = (
      'PESSOA.IDPESSOA          = DOCUMENTO.IDFORCLI'
      
        '(TIPODOCRECPAG.DEBCRE = LANCTODOCUM.DEBCRE) OR (DOCUMENTO.OPERAC' +
        'AO = '#39'15'#39')'
      'TIPODOCRECPAG.CODTIPDOC  = DOCUMENTO.CODTIPDOC'
      'LANCTODOCUM.CODDOCUMENTO = DOCUMENTO.CODDOCUMENTO'
      'LANCTODOCUM.OPERACAO     = DOCUMENTO.OPERACAO'
      'DOCUMENTO.CODPORTFORMA   = PORTADORFORMA.CODPORTFORMA(+)'
      'DOCUMENTO.IDMODULO       = MODULO.IDMODULO(+)'
      'DOCUMENTO.MOECODIGO      = MOEDA.MOECODIGO(+)'
      'LANCTODOCUM.CODDOCUMENTO = RECBTOPAGTO.CODDOCUMENTO(+)'
      'LANCTODOCUM.NUMLANCTO    = RECBTOPAGTO.NUMLANCTO(+)'
      'DOCUMENTO.IDUSUARIOINCLUSAO=USUARIOSISTEMA.IDUSUARIO(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      'DD/MM/YYYY'
      'DD/MM/YYYY'
      'DD/MM/YYYY'
      '#,##0.00'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '20'
      '15'
      '3'
      '10'
      '10'
      '10'
      '15'
      '40'
      '20'
      '20'
      '20'
      '10'
      '30'
      '20'
      '15'
      '10')
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
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
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
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 499
    Top = 60
  end
  object qryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 238
    Top = 372
  end
  object qryContabil: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT LC.PLACONTA, LC.CODSUBCONTA, LC.LACDEBCRE, LC.LACVALOR, L' +
        'C.LACVALHIST, LC.LACHIST1, LC.LACHIST2,'
      
        '                        LC.LACHIST3, LC.PLNCODIGO, LC.LACNUMLAN,' +
        ' LC.HITCODHIST, LC.IDPESSOA, LC.IDEMPRESA, LC.IDMODULO, '
      
        '                        LC.UNIDNEGOC, LC.IDUSUARIOINCLUSAO, LC.P' +
        'LANO, LC.LACTIPO, LC.LACNUMDOC, LC.LACHIST4, LC.LACHIST5, '
      
        '                        LC.LACTIPCONVOFICIAL, LC.LACVALOFICIAL, ' +
        'LC.LACTIPCONVGER, LC.LACVALGERENCIAL, '
      
        '                        LC.LACTIPCONVGEREN1, LC.LACVALGEREN1, LC' +
        '.LACTIPCONVGEREN2, LC.LACVALGEREN2, LC.LACATOUTMOEDA, '
      
        '                        LC.LACORIGEMAPLIC, LC.TIPCODIGO, LC.IDEL' +
        'EMDEMONSTRAT, LC.CODCENTROCUSTO, '
      
        '                        U.NOME,CC.NOME,CC.CODCENTROCUSTO, PL.PLN' +
        'DATDIA, -1.00 AS IDPESSJUR, -1.00 AS IDPLANOPREV '
      
        '                        FROM LANCAMENTO LC, UNIDNEGOCIO U, CENTC' +
        'UST CC, PLANILHA PL WHERE'
      '                        (LC.PLNCODIGO =  :plncodigo) AND'
      '                        (LC.PLNCODIGO = PL.PLNCODIGO) AND'
      
        '                        (CC.IDEMPRESA(+)      = LC.IDEMPRESA) AN' +
        'D'
      
        '                        (CC.CODCENTROCUSTO(+) = LC.CODCENTROCUST' +
        'O) AND'
      
        '                        (LC.IDPESSOA          = U.IDPESSOA(+)) A' +
        'ND'
      '                        (LC.UNIDNEGOC         = U.UNIDNEGOC(+))'
      ' ')
    UpdateObject = updContabil
    ValidateWithMask = True
    Left = 311
    Top = 316
    ParamData = <
      item
        DataType = ftInteger
        Name = 'plncodigo'
        ParamType = ptUnknown
      end>
    object qryContabilPLACONTA: TStringField
      DisplayLabel = 'Conta Contábil'
      DisplayWidth = 18
      FieldName = 'PLACONTA'
      Size = 18
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
    object qryContabilPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object qryContabilLACNUMLAN: TFloatField
      FieldName = 'LACNUMLAN'
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
    object qryContabilIDELEMDEMONSTRAT: TFloatField
      FieldName = 'IDELEMDEMONSTRAT'
      Visible = False
    end
    object qryContabilCODCENTROCUSTO_1: TStringField
      FieldName = 'CODCENTROCUSTO_1'
      Visible = False
      Size = 10
    end
    object qryContabilPLNDATDIA: TDateTimeField
      FieldName = 'PLNDATDIA'
    end
    object qryContabilIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryContabilIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
  end
  object updContabil: TUpdateSQL
    ModifySQL.Strings = (
      'update LANCAMENTO'
      'set'
      '  PLACONTA = :PLACONTA,'
      '  CODSUBCONTA = :CODSUBCONTA,'
      '  LACDEBCRE = :LACDEBCRE,'
      '  LACVALOR = :LACVALOR,'
      '  LACVALHIST = :LACVALHIST,'
      '  LACHIST1 = :LACHIST1,'
      '  LACHIST2 = :LACHIST2,'
      '  LACHIST3 = :LACHIST3,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  LACNUMLAN = :LACNUMLAN,'
      '  HITCODHIST = :HITCODHIST,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  IDMODULO = :IDMODULO,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  IDUSUARIOINCLUSAO = :IDUSUARIOINCLUSAO,'
      '  PLANO = :PLANO,'
      '  LACTIPO = :LACTIPO,'
      '  LACNUMDOC = :LACNUMDOC,'
      '  LACHIST4 = :LACHIST4,'
      '  LACHIST5 = :LACHIST5,'
      '  LACTIPCONVOFICIAL = :LACTIPCONVOFICIAL,'
      '  LACVALOFICIAL = :LACVALOFICIAL,'
      '  LACTIPCONVGER = :LACTIPCONVGER,'
      '  LACVALGERENCIAL = :LACVALGERENCIAL,'
      '  LACTIPCONVGEREN1 = :LACTIPCONVGEREN1,'
      '  LACVALGEREN1 = :LACVALGEREN1,'
      '  LACTIPCONVGEREN2 = :LACTIPCONVGEREN2,'
      '  LACVALGEREN2 = :LACVALGEREN2,'
      '  LACATOUTMOEDA = :LACATOUTMOEDA,'
      '  LACORIGEMAPLIC = :LACORIGEMAPLIC,'
      '  TIPCODIGO = :TIPCODIGO,'
      '  IDELEMDEMONSTRAT = :IDELEMDEMONSTRAT,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  PLNDATDIA = :PLNDATDIA'
      'where'
      '  PLNCODIGO = :OLD_PLNCODIGO')
    InsertSQL.Strings = (
      'insert into LANCAMENTO'
      
        '  (PLACONTA, CODSUBCONTA, LACDEBCRE, LACVALOR, LACVALHIST, LACHI' +
        'ST1, LACHIST2, '
      
        '   LACHIST3, PLNCODIGO, LACNUMLAN, HITCODHIST, IDPESSOA, IDEMPRE' +
        'SA, IDMODULO, '
      
        '   UNIDNEGOC, IDUSUARIOINCLUSAO, PLANO, LACTIPO, LACNUMDOC, LACH' +
        'IST4, LACHIST5, '
      
        '   LACTIPCONVOFICIAL, LACVALOFICIAL, LACTIPCONVGER, LACVALGERENC' +
        'IAL, LACTIPCONVGEREN1, '
      
        '   LACVALGEREN1, LACTIPCONVGEREN2, LACVALGEREN2, LACATOUTMOEDA, ' +
        'LACORIGEMAPLIC, '
      '   TIPCODIGO, IDELEMDEMONSTRAT, CODCENTROCUSTO, PLNDATDIA)'
      'values'
      
        '  (:PLACONTA, :CODSUBCONTA, :LACDEBCRE, :LACVALOR, :LACVALHIST, ' +
        ':LACHIST1, '
      
        '   :LACHIST2, :LACHIST3, :PLNCODIGO, :LACNUMLAN, :HITCODHIST, :I' +
        'DPESSOA, '
      
        '   :IDEMPRESA, :IDMODULO, :UNIDNEGOC, :IDUSUARIOINCLUSAO, :PLANO' +
        ', :LACTIPO, '
      
        '   :LACNUMDOC, :LACHIST4, :LACHIST5, :LACTIPCONVOFICIAL, :LACVAL' +
        'OFICIAL, '
      
        '   :LACTIPCONVGER, :LACVALGERENCIAL, :LACTIPCONVGEREN1, :LACVALG' +
        'EREN1, '
      
        '   :LACTIPCONVGEREN2, :LACVALGEREN2, :LACATOUTMOEDA, :LACORIGEMA' +
        'PLIC, :TIPCODIGO, '
      '   :IDELEMDEMONSTRAT, :CODCENTROCUSTO, :PLNDATDIA)')
    DeleteSQL.Strings = (
      'delete from LANCAMENTO'
      'where'
      '  PLNCODIGO = :OLD_PLNCODIGO')
    Left = 369
    Top = 323
  end
  object qryvaloralterador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 398
    Top = 164
  end
  object cdsChavesprimarias: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 488
    Top = 152
  end
  object QryImpAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 160
    Top = 632
  end
  object DscExcluirArquivo: TwwDataSource
    DataSet = QryExcluirArquivo
    Left = 272
    Top = 584
  end
  object QryExcluirArquivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'select ih.id, ih.idusuario, ih.data, ih.descricao, us.nomeusuari' +
        'o '
      
        'from cm.importacaohstcontrib ih join cm.usuariosistema us on ih.' +
        'idusuario = us.idusuario'
      
        'where ih.data >= to_date(to_char(sysdate - 10, '#39'DD/MM/YYYY'#39'), '#39'D' +
        'D/MM/YYYY'#39')'
      ''
      ''
      ''
      'order by ih.data, ih.descricao'
      '')
    ValidateWithMask = True
    Left = 240
    Top = 584
    object QryExcluirArquivoid: TFloatField
      FieldName = 'id'
    end
    object QryExcluirArquivoidusuario: TFloatField
      FieldName = 'idusuario'
    end
    object QryExcluirArquivonomeusuario: TStringField
      FieldName = 'nomeusuario'
    end
    object QryExcluirArquivodescricao: TMemoField
      FieldName = 'descricao'
      BlobType = ftMemo
    end
    object QryExcluirArquivodata: TDateTimeField
      FieldName = 'data'
    end
  end
end
