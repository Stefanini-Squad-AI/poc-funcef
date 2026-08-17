inherited frmCadHstContribuicaoBeneficiario: TfrmCadHstContribuicaoBeneficiario
  Left = 345
  Top = 20
  HelpContext = 160100
  Caption = 
    'Cadastro Manual do Histórico de Contribuições de Beneficiários (' +
    'Núcleo Familiar)'
  ClientHeight = 574
  ClientWidth = 683
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 683
    Height = 488
    inherited pnlMestre: TPanel
      Width = 681
      Height = 110
      object Label1: TLabel
        Left = 8
        Top = 0
        Width = 109
        Height = 13
        Caption = 'Participante Titular'
      end
      object Label2: TLabel
        Left = 353
        Top = 25
        Width = 126
        Height = 13
        Caption = 'Matrícula Beneficiário'
      end
      object Label3: TLabel
        Left = 8
        Top = 53
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object Label4: TLabel
        Left = 8
        Top = 81
        Width = 72
        Height = 13
        Caption = 'Contribuição'
      end
      object Label5: TLabel
        Left = 353
        Top = 81
        Width = 83
        Height = 13
        Caption = 'Data de Início'
      end
      object Label6: TLabel
        Left = 450
        Top = 81
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
        Left = 353
        Top = 53
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object Label9: TLabel
        Left = 554
        Top = 81
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
        DataField = 'NOMETITULAR'
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
        Top = 67
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
        Left = 353
        Top = 67
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
        Top = 95
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
        Left = 353
        Top = 39
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
        Left = 353
        Top = 95
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
        Top = 95
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
        Top = 95
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
      object Label18: TLabel
        Left = 8
        Top = 25
        Width = 68
        Height = 13
        Caption = 'Beneficiário'
      end
      object DBText10: TDBText
        Left = 8
        Top = 39
        Width = 48
        Height = 13
        AutoSize = True
        DataField = 'NOMEDEPENDENTE'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label19: TLabel
        Left = 353
        Top = 0
        Width = 136
        Height = 13
        Caption = 'Responsável do Núcleo'
      end
      object DBText11: TDBText
        Left = 353
        Top = 14
        Width = 48
        Height = 13
        AutoSize = True
        DataField = 'NOMERESPNUCLEO'
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
      Top = 111
      Width = 681
      Height = 376
      Tabs.Strings = (
        'Histórico'
        'Alteradores')
      TabIndex = 1
      detdbGrids.Strings = (
        'dbgrdDet'
        'dbgrdAlteradores')
      inherited Dock973: TDock97 [0]
        Width = 673
      end
      inherited Dock974: TDock97 [1]
        Left = 587
        Height = 317
      end
      inherited pgctrlDetalhe: TPageControl [2]
        Width = 583
        Height = 317
        inherited tbsDet: TTabSheet
          Caption = 'Histórico'
          inherited dbgrdDet: TwwDBGrid
            Width = 575
            Height = 289
            Selected.Strings = (
              'MESREFERENCIA'#9'7'#9'Mês de ~Referência'
              'MESCOBRANCA'#9'7'#9'Mês de ~Cobrança'
              'VALORESPERADO'#9'10'#9'Valor ~Esperado'
              'VALORRECEBIDO'#9'10'#9'Valor ~Recebido'
              'DATAPREVISAORECE'#9'10'#9'Data ~Prevista'
              'DATARECEBIMENTO'#9'10'#9'Data ~Efetiva'
              'FLGDEVOLUCAO'#9'10'#9'Devolução'
              'FLGCALCRESERVA'#9'10'#9'Alimentou~Reserva'
              'FLGDESCFOLHA'#9'10'#9'Cobrar Via ~Banco'
              'VALORPARARESERVA'#9'10'#9'Valor para ~Reserva'
              'DESCRICAO'#9'50'#9'Motivo'
              'VALOROP1'#9'27'#9'~Percentual de Contribuição'
              'SALCONTRIB'#9'25'#9'~Salário de Contribuição')
            Font.Style = []
            ParentFont = False
            TitleLines = 2
          end
          inherited pnlControlesDet: TPanel
            Width = 575
            Height = 289
            object Label12: TLabel
              Left = 6
              Top = 45
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
              Left = 6
              Top = 121
              Width = 78
              Height = 13
              Caption = 'Data Prevista'
            end
            object Label15: TLabel
              Left = 171
              Top = 121
              Width = 72
              Height = 13
              Caption = 'Data Efetiva'
            end
            object Label16: TLabel
              Left = 336
              Top = 164
              Width = 39
              Height = 13
              Caption = 'Motivo'
            end
            object Label17: TLabel
              Left = 336
              Top = 197
              Width = 197
              Height = 13
              Caption = 'Lote (Obrigatório para fazer Envio)'
            end
            object ToolbarButton971: TToolbarButton97
              Left = 134
              Top = 216
              Width = 25
              Height = 22
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
              OnClick = ToolbarButton971Click
            end
            object lblFormaPagto: TLabel
              Left = 6
              Top = 161
              Width = 120
              Height = 13
              Caption = 'Forma de Pagamento'
            end
            object lblCodDocPrev: TLabel
              Left = 6
              Top = 199
              Width = 92
              Height = 13
              Caption = 'Cod. Doc. Prev.'
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
            object memobs: TMemo
              Left = 6
              Top = 239
              Width = 323
              Height = 47
              BorderStyle = bsNone
              Color = clActiveBorder
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 11
              Visible = False
            end
            object dbrgrpSitRecebimento: TDBRadioGroup
              Left = 336
              Top = 87
              Width = 208
              Height = 77
              Caption = 'Situação da Contribuição'
              DataField = 'SITRECEBIMENTO'
              DataSource = dsDet
              Items.Strings = (
                'Não Enviada'
                'Enviada e Não Recebida'
                'Recebida SEM Divergência'
                'Recebida COM Divergência')
              TabOrder = 9
              Values.Strings = (
                '0'
                '1'
                '2'
                '3')
            end
            object rdgrpatrasodevol: TDBRadioGroup
              Left = 336
              Top = -4
              Width = 208
              Height = 31
              Columns = 2
              DataField = 'FLGDEVOLUCAO'
              DataSource = dsDet
              Items.Strings = (
                'Cobrança'
                'Devolução')
              TabOrder = 10
              TabStop = True
              Values.Strings = (
                '0'
                '1')
              OnChange = rdgrpatrasodevolChange
            end
            object dbrgrpForma: TDBRadioGroup
              Left = 336
              Top = 27
              Width = 208
              Height = 60
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
              OnChange = dbrgrpFormaChange
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
              end
              object edMesCob: TEdit
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
                OnExit = edMesRefExit
              end
            end
            object dbedEsperado: TwwDBEdit
              Left = 6
              Top = 58
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
              Top = 58
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
              Top = 134
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
              Top = 134
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
              Left = 336
              Top = 176
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
              Left = 336
              Top = 210
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
            end
            object DBLKPCMBFORMAPAGTO: TwwDBLookupCombo
              Left = 6
              Top = 174
              Width = 209
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'Descrição'#9'F')
              DataField = 'CODPORTFORMA'
              DataSource = dsDet
              LookupTable = qryFormaPagto
              LookupField = 'CODPORTFORMA'
              TabOrder = 14
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dbedCodDocPrev: TwwDBEdit
              Left = 6
              Top = 214
              Width = 121
              Height = 21
              DataField = 'CODDOCUMENTOPREV'
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
              OnExit = dbedEsperadoExit
              OnKeyPress = dbedCodDocPrevKeyPress
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
              Left = 171
              Top = 96
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
        object tbsAlteradores: TTabSheet
          Caption = 'Alteradores'
          ImageIndex = 1
          object dbgrdAlteradores: TwwDBGrid
            Left = 0
            Top = 0
            Width = 575
            Height = 289
            Selected.Strings = (
              'MESREFERENCIA'#9'7'#9'Mês de ~Referência'#9'F'
              'MESCOBRANCA'#9'7'#9'Mês de ~Cobrança'#9'F'
              'VALOR'#9'10'#9'Valor do ~Alterador'#9'F'
              'VALORRECEBIDO'#9'10'#9'Valor ~Recebido'#9'F'
              'DESCRICAO'#9'22'#9'Alterador'#9'F'
              'DATARECEBIMENTO'#9'15'#9'Data ~Recebimento'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsAlteradores
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
          object pnlAlteradores: TPanel
            Left = 0
            Top = 0
            Width = 575
            Height = 289
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object Label20: TLabel
              Left = 8
              Top = 8
              Width = 52
              Height = 13
              Caption = 'Alterador'
            end
            object Label21: TLabel
              Left = 8
              Top = 56
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object dblkpcmbTipoAlterador: TwwDBLookupCombo
              Left = 8
              Top = 24
              Width = 273
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'35'#9'DESCRICAO')
              LookupTable = qryTipoAlterador
              LookupField = 'CODALTERADOR'
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object edValorAlterador: TEditNum
              Left = 8
              Top = 72
              Width = 121
              Height = 21
              TabOrder = 1
              IntDigits = 10
              Signal = False
              DecDigits = 2
              Numeric = True
            end
            object rgrpTipoAlterador: TRadioGroup
              Left = 309
              Top = 19
              Width = 185
              Height = 65
              Caption = ' Tipo '
              ItemIndex = 0
              Items.Strings = (
                'Débito'
                'Crédito')
              TabOrder = 2
              OnClick = rgrpTipoAlteradorClick
            end
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 683
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
    Top = 535
    Width = 683
    inherited tb97Fundo: TToolbar97
      Left = 511
      DockPos = 531
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 342
      DockPos = 362
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 144
    Top = 18
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
    Left = 495
    Top = 9
  end
  inherited ds: TwwDataSource
    Left = 461
    Top = 6
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTRIBUICAO'
      'set'
      '  IDCONTRIBUICAO = :IDCONTRIBUICAO'
      'where'
      '  IDCONTRIBUICAO = :OLD_IDCONTRIBUICAO')
    InsertSQL.Strings = (
      'insert into CONTRIBUICAO'
      '  (IDCONTRIBUICAO)'
      'values'
      '  (:IDCONTRIBUICAO)')
    DeleteSQL.Strings = (
      'delete from CONTRIBUICAO'
      'where'
      '  IDCONTRIBUICAO = :OLD_IDCONTRIBUICAO')
    Left = 407
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Selecione o Pagador / Contribuição'
    Colunas.Strings = (
      'DP.MATRICULA'
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
      'Pagador'
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
      'BFCIARIOTITPLAN BTIT'
      'NUCLEOFAMILIAR N'
      'CONTRIBPREVNUCLEO CPP'
      'DEPENTIT DP'
      'PLANPREV PL')
    CamposChave.Strings = (
      'BTIT.IDPESSJUR'
      'BTIT.IDPLANOPREV'
      'BTIT.IDTITULAR'
      'BTIT.IDPESSOA'
      'BTIT.SEQPROPOSTA'
      'N.IDRESPNUCLEO'
      'CPP.IDCONTRIBUICAO'
      'N.IDNUCLEOFAMILIAR')
    Filtro.Strings = (
      'N.IDNUCLEOFAMILIAR   = BTIT.IDNUCLEOFAMILIAR'
      'CPP.IDNUCLEOFAMILIAR = BTIT.IDNUCLEOFAMILIAR'
      'BTIT.IDPESSJUR       = PP.IDPESSJUR'
      'BTIT.IDTITULAR       = PP.IDPESSOA'
      'C.IDCONTRIBUICAO     = CPP.IDCONTRIBUICAO'
      'EL.IDPESSJUR         = PP.IDPESSJUR'
      'EL.IDPESSOA          = PP.IDPESSOA'
      'PT.IDPESSOA          = BTIT.IDPESSJUR'
      'P.IDPESSOA           = N.IDRESPNUCLEO'
      'PL.IDPLANOPREV       = BTIT.IDPLANOPREV'
      'DP.IDTITULAR         = BTIT.IDTITULAR'
      'DP.IDPESSOA          = BTIT.IDPESSOA')
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
    Left = 610
    Top = 3
  end
  inherited ImlPadrao: TImageList
    Left = 213
    Top = 18
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 278
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT DISTINCT PDEP.NOME AS NOMEDEPENDENTE,'
      '       PTIT.NOME AS NOMETITULAR,'
      '       PRESP.NOME AS NOMERESPNUCLEO,'
      
        '       PT.NOME AS NOMEPATRO, PL.NOME AS NOMEPLANO, C.NOME AS NOM' +
        'ECONTRIB,'
      
        '       DP.MATRICULA,       PP.INSCRICAONUMERO,   BTIT.IDPESSJUR,' +
        ' BTIT.IDPLANOPREV,'
      
        '       BTIT.IDTITULAR,      BTIT.IDPESSOA AS IDDEPENDENTE,     B' +
        'TIT.IDPESSOA,'
      
        '       BTIT.SEQPROPOSTA,    CPP.IDCONTRIBUICAO,   CPP.DATAINICIO' +
        ','
      
        '       CPP.DATAFINAL,        CPP.ULTMESPREPARO,    CP.IDREGRACAL' +
        'CULO,       CP.IDREGRACALCULO13,'
      '       PP.INSCRICAODATA,'
      
        '       0 VALORBASE1, 0  VALORBASE2, 0 VALORBASE3, CP.FLGINTERNO ' +
        'AS FLGINTERNOCONTRIB,'
      
        '       PFTIT.DATANASC, PP.IDSITPART, N.IDRESPNUCLEO, N.IDNUCLEOF' +
        'AMILIAR,'
      
        '       DECODE(BTIT.IDPESSOA,BTIT.IDTITULAR,SP.FLGINTERNO,CP.FLGI' +
        'NTERNO) FLGINTERNO'
      '      ,CPP.IDPLANPREVCONTAB --SIG90704'
      'FROM   PESSOA PDEP,'
      '       PESSOA PRESP,'
      '       PESSOA PTIT,'
      '       PESSOA PT,'
      '       PESSOAFISICA PFTIT,'
      '       PLANPREV PL,'
      '       CONTRIBUICAO C,'
      '       PARTPREVPLAN PP,'
      '       ELEGPATRO EL,'
      '       DEPENTIT DP,'
      '       BFCIARIOTITPLAN BTIT,'
      '       NUCLEOFAMILIAR  N,'
      '       CONTRIBPREVNUCLEO CPP,'
      '       CONTPREV CP,'
      '       SITPART SP'
      'WHERE N.IDNUCLEOFAMILIAR    = :IDNUCLEOFAMILIAR'
      'AND   N.IDRESPNUCLEO        = :IDRESPNUCLEO'
      'AND   N.IDTITULAR           = :IDTITULAR'
      'AND   DP.IDTITULAR          = :IDTITULAR'
      'AND   DP.IDPESSOA           = :IDPESSOA '
      'AND   CPP.IDNUCLEOFAMILIAR  = N.IDNUCLEOFAMILIAR'
      'AND   CPP.IDCONTRIBUICAO    = :IDCONTRIBUICAO'
      'AND   BTIT.IDTITULAR        = N.IDTITULAR'
      'AND   BTIT.IDNUCLEOFAMILIAR = N.IDNUCLEOFAMILIAR'
      'AND   PP.IDPESSJUR          = BTIT.IDPESSJUR'
      'AND   PP.IDPESSOA           = BTIT.IDTITULAR'
      'AND   EL.IDPESSJUR          = PP.IDPESSJUR'
      'AND   EL.IDPESSOA           = PP.IDPESSOA'
      'AND   DP.IDTITULAR          = BTIT.IDTITULAR'
      'AND   DP.IDPESSOA           = BTIT.IDPESSOA'
      'AND   PDEP.IDPESSOA         = DP.IDPESSOA'
      'AND   PRESP.IDPESSOA        = N.IDRESPNUCLEO'
      'AND   PTIT.IDPESSOA         = BTIT.IDTITULAR'
      'AND   PT.IDPESSOA           = BTIT.IDPESSJUR'
      'AND   CPP.IDCONTRIBUICAO    = C.IDCONTRIBUICAO'
      'AND   BTIT.IDPLANOPREV      = PL.IDPLANOPREV'
      'AND   CP.IDPLANOPREV        = BTIT.IDPLANOPREV'
      'AND   CP.IDCONTRIBUICAO     = CPP.IDCONTRIBUICAO'
      'AND   PFTIT.IDPESSOA        = BTIT.IDTITULAR'
      'AND   SP.IDSITPART          = PP.IDSITPART')
    Left = 441
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDNUCLEOFAMILIAR'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftInteger
        Name = 'IDRESPNUCLEO'
        ParamType = ptUnknown
        Value = '1362545'
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
        Value = '1283938'
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCONTRIBUICAO'
        ParamType = ptUnknown
        Value = 180
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 280
    Top = 4
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    AfterInsert = qryDetAfterInsert
    BeforePost = qryDetBeforePost
    AfterScroll = qryDetAfterScroll
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT H.NUMRECEBIMENTO,'
      '       M.IDMOTIVO,'
      '       H.MESREFERENCIA,'
      '       H.MESCOBRANCA,'
      '       H.IDPESSJUR,'
      '       H.IDPLANOPREV,'
      '       H.IDPESSOA,'
      '       H.IDCONTRIBUICAO,'
      '       H.SEQPROPOSTA,'
      '       H.FLGDEVOLUCAO,'
      '       H.FLGDIVERGENTE,'
      '       H.FLGCONCESSAO,'
      '       H.FLGEVENTO,'
      '       H.FLGCALCRESERVA,'
      '       H.FLGDESCFOLHA,'
      '       H.FLGSITFUNDACAO,'
      '       H.FLGAPORTE,'
      '       H.VALORESPERADO,'
      '       H.VALORRECEBIDO,'
      '       H.VALORCALCULADO,'
      '       H.DATAPREVISAORECE,'
      '       H.DATARECEBIMENTO,'
      '       H.DATAINICIO,'
      '       H.DATAFINAL,'
      '       H.IDREGRACALCULO,'
      '       H.SITRECEBIMENTO,'
      '       H.TIPO,'
      '       H.VALOROP1,       H.SALCONTRIB,'
      '       H.VALOROP2,'
      '       H.VALOROP3,'
      '       H.IDLOTE,'
      
        '       DECODE(H.VALORPARARESERVA, NULL, H.VALORRECEBIDO, H.VALOR' +
        'PARARESERVA) AS VALORPARARESERVA,'
      '       M.DESCRICAO,'
      '       H.FLGMANUAL,'
      '       H.CODDOCUMENTOPREV,'
      '       H.FOLHAORIGEM,'
      '       H.IDTITULAR,'
      '       H.CODPORTFORMA,'
      '       H.IDPLANPREVCONTAB --SIG90704'
      '       '
      'FROM   HSTCONTRIBPREV H, MOTIVO M'
      'WHERE  (H.IDPESSJUR      = :IDPESSJUR)'
      'AND    (H.IDPLANOPREV    = :IDPLANOPREV)'
      'AND    (H.IDTITULAR        = :IDTITULAR   OR '
      '            H.IDTITULAR   IS NULL'
      '            ) '
      'AND    (H.IDPESSOA       = :IDPESSOA)'
      'AND    (H.SEQPROPOSTA    = :SEQPROPOSTA)'
      'AND    (H.IDCONTRIBUICAO = :IDCONTRIBUICAO)'
      'AND    (M.IDMOTIVO     = H.IDMOTIVO)'
      'ORDER BY MESREFERENCIA DESC'
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updDet
    ControlType.Strings = (
      'FLGDEVOLUCAO;CheckBox;1;0'
      'FLGCALCRESERVA;CheckBox;1;0'
      'FLGDESCFOLHA;CheckBox;0;1')
    ValidateWithMask = True
    Left = 282
    Top = 421
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
        Name = 'IDCONTRIBUICAO'
        ParamType = ptUnknown
      end>
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
      FieldName = 'CODDOCUMENTOPREV'
    end
    object qryDetFOLHAORIGEM: TStringField
      FieldName = 'FOLHAORIGEM'
      FixedChar = True
      Size = 1
    end
    object qryDetIDLOTE: TFloatField
      FieldName = 'IDLOTE'
    end
    object qryDetIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
    end
    object qryDetCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
    end
    object qryDetIDPLANPREVCONTAB: TFloatField
      FieldName = 'IDPLANPREVCONTAB'
    end
    object qryDetVALOROP1: TFloatField
      DisplayLabel = 'Percentual de Contribuição'
      FieldName = 'VALOROP1'
    end
    object qryDetSALCONTRIB: TFloatField
      DisplayLabel = 'Salário de Contribuição'
      FieldName = 'SALCONTRIB'
      KeyFields = 'SALCONTRIB'
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
      '  VALOROP1 = :VALOROP1, SALCONTRIB =:SALCONTRIB,'
      '  VALOROP2 = :VALOROP2,'
      '  VALOROP3 = :VALOROP3,'
      '  IDLOTE = :IDLOTE,'
      '  FLGMANUAL = :FLGMANUAL,'
      ' CODDOCUMENTOPREV = :CODDOCUMENTOPREV,'
      '  FOLHAORIGEM = :FOLHAORIGEM,'
      ' CODPORTFORMA  = :CODPORTFORMA,'
      '  IDPLANPREVCONTAB = :IDPLANPREVCONTAB'
      'where'
      '  NUMRECEBIMENTO = :OLD_NUMRECEBIMENTO and'
      '  IDMOTIVO = :OLD_IDMOTIVO and'
      '  MESREFERENCIA = :OLD_MESREFERENCIA and'
      '  MESCOBRANCA = :OLD_MESCOBRANCA')
    InsertSQL.Strings = (
      'insert into HSTCONTRIBPREV'
      
        '  (NUMRECEBIMENTO, IDMOTIVO, MESREFERENCIA, MESCOBRANCA, IDPESSJ' +
        'UR, IDPLANOPREV, '
      
        '   IDPESSOA, IDCONTRIBUICAO, SEQPROPOSTA, FLGDEVOLUCAO, FLGDIVER' +
        'GENTE, '
      
        '   FLGCONCESSAO, FLGEVENTO, FLGCALCRESERVA, FLGDESCFOLHA, FLGSIT' +
        'FUNDACAO, '
      
        '   FLGAPORTE, VALORESPERADO, VALORRECEBIDO, VALORCALCULADO, DATA' +
        'PREVISAORECE, '
      
        '   DATARECEBIMENTO, DATAINICIO, DATAFINAL, IDREGRACALCULO, SITRE' +
        'CEBIMENTO, '
      
        '   TIPO, VALOROP1, SALCONTRIB, VALOROP2, VALOROP3, IDLOTE, FLGMA' +
        'NUAL, FOLHAORIGEM,IDTITULAR,CODPORTFORMA, CODDOCUMENTOPREV,'
      '   IDPLANPREVCONTAB)'
      'values'
      
        '  (:NUMRECEBIMENTO, :IDMOTIVO, :MESREFERENCIA, :MESCOBRANCA, :ID' +
        'PESSJUR, '
      
        '   :IDPLANOPREV, :IDPESSOA, :IDCONTRIBUICAO, :SEQPROPOSTA, :FLGD' +
        'EVOLUCAO, '
      
        '   :FLGDIVERGENTE, :FLGCONCESSAO, :FLGEVENTO, :FLGCALCRESERVA, :' +
        'FLGDESCFOLHA, '
      
        '   :FLGSITFUNDACAO, :FLGAPORTE, :VALORESPERADO, :VALORRECEBIDO, ' +
        ':VALORCALCULADO, '
      
        '   :DATAPREVISAORECE, :DATARECEBIMENTO, :DATAINICIO, :DATAFINAL,' +
        ' :IDREGRACALCULO, '
      
        '   :SITRECEBIMENTO, :TIPO, :VALOROP1, :SALCONTRIB, :VALOROP2, :V' +
        'ALOROP3, :IDLOTE, :FLGMANUAL, '
      '   :FOLHAORIGEM,:IDTITULAR, :CODPORTFORMA, :CODDOCUMENTOPREV,'
      '   :IDPLANPREVCONTAB)')
    DeleteSQL.Strings = (
      'delete from HSTCONTRIBPREV'
      'where'
      '  NUMRECEBIMENTO = :OLD_NUMRECEBIMENTO and'
      '  IDMOTIVO = :OLD_IDMOTIVO and'
      '  MESREFERENCIA = :OLD_MESREFERENCIA and'
      '  MESCOBRANCA = :OLD_MESCOBRANCA')
    Left = 566
    Top = 145
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
    Left = 677
    Top = 56
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
    Left = 265
    Top = 150
  end
  object qryMotivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDMOTIVO, DESCRICAO'
      'FROM MOTIVO'
      'ORDER BY DESCRICAO ')
    ValidateWithMask = True
    Left = 323
    Top = 82
  end
  object qryLote: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDLOTE, MESREFERENCIA, DESCRICAO, DECODE(TIPO,'#39'B'#39','#39'Folha ' +
        'de Benefícios'#39','#39'Outros'#39') AS TIPO'
      'FROM   CTRLINTERFACE C'
      'WHERE  MESREFERENCIA = :MESREFERENCIA'
      '--C.FLGPREPARADO = 1  SIG 99100'
      '--AND    C.TIPO = '#39'B'#39
      '--AND    C.FLGIDATMP = 0  SIG 99100'
      '--AND    C. FLGRESGATE = 0  SIG 99100'
      '--AND    C.FLGLOTEPROCESSADO = 0  SIG 99100'
      'ORDER BY C.MESREFERENCIA DESC, C.IDLOTE DESC, C.DESCRICAO')
    ValidateWithMask = True
    Left = 230
    Top = 76
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MESREFERENCIA'
        ParamType = ptUnknown
      end>
  end
  object QRYMAIORMES: TwwQuery
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
    Left = 104
    Top = 105
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
  object UPDMAIORMES: TwwQuery
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
    Left = 189
    Top = 100
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
  object dsAlteradores: TwwDataSource
    AutoEdit = False
    DataSet = qryAlteradores
    Left = 445
    Top = 381
  end
  object qryAlteradores: TwwQuery
    CachedUpdates = True
    BeforePost = qryAlteradoresBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT HA.MESREFERENCIA,HA.NUMRECEBIMENTO,HA.MESCOBRANCA,HA.IDMO' +
        'TIVO,'
      '       HA.VALOR,HA.CODALTERADOR,HA.FLGTIPO,HA.FLGRETROATIVO,'
      '       HA.FLGEVENTO, TA.DESCRICAO, '
      '       HA.VALORRECEBIDO, HA.DATARECEBIMENTO'
      'FROM   HSTATRASOCONTRIB HA, TIPOALTERADOR TA'
      'WHERE  (HA.MESREFERENCIA  = ha.mesreferencia)'
      'AND    (HA.NUMRECEBIMENTO = :numrecebimento)'
      'AND    (HA.MESCOBRANCA    = ha.mescobranca)'
      'AND    (HA.IDMOTIVO       = ha.idmotivo)'
      'AND    (HA.CODALTERADOR = ta.codalterador)')
    UpdateObject = updAlterador
    ValidateWithMask = True
    Left = 269
    Top = 325
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numrecebimento'
        ParamType = ptUnknown
      end>
  end
  object qryTipoAlterador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODALTERADOR, DESCRICAO'
      'FROM TIPOALTERADOR'
      'WHERE RECPAG = :RECPAG'
      'AND EXISTS (SELECT 1 FROM ALTERADORXCONTRIB'
      'WHERE IDPLANOPREV = :IDPLANOPREV AND'
      'IDCONTRIBUICAO = :IDCONTRIBUICAO AND'
      'CODALTERADOR = TIPOALTERADOR.CODALTERADOR)'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 275
    Top = 382
    ParamData = <
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDCONTRIBUICAO'
        ParamType = ptUnknown
      end>
  end
  object updAlterador: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE HSTATRASOCONTRIB'
      '  SET    VALOR   = :VALOR,'
      '  FLGTIPO = :FLGTIPO,'
      '  CODALTERADOR =:CODALTERADOR'
      'WHERE  MESREFERENCIA  = :MESREFERENCIA'
      'AND    MESCOBRANCA    = :MESCOBRANCA'
      'AND    NUMRECEBIMENTO =   :NUMRECEBIMENTO'
      'AND    IDMOTIVO       =   :IDMOTIVO'
      'AND    CODALTERADOR   = :OLD_CODALTERADOR')
    InsertSQL.Strings = (
      'INSERT INTO HSTATRASOCONTRIB '
      '(MESREFERENCIA,  MESCOBRANCA, NUMRECEBIMENTO,  '
      'IDMOTIVO, VALOR, CODALTERADOR, FLGTIPO,     FLGRETROATIVO,   '
      'FLGEVENTO) '
      'values'
      '(:MESREFERENCIA, :MESCOBRANCA, :NUMRECEBIMENTO,  '
      ':IDMOTIVO, :VALOR, :CODALTERADOR, :FLGTIPO, :FLGRETROATIVO,   '
      ':FLGEVENTO)')
    DeleteSQL.Strings = (
      ' DELETE FROM HSTATRASOCONTRIB'
      ' WHERE  MESREFERENCIA  = :OLD_MESREFERENCIA '
      ' AND    MESCOBRANCA    = :OLD_MESCOBRANCA '
      ' AND    NUMRECEBIMENTO = :OLD_NUMRECEBIMENTO'
      ' AND    IDMOTIVO       =   :OLD_IDMOTIVO'
      ' AND    CODALTERADOR   = :OLD_CODALTERADOR')
    Left = 526
    Top = 385
  end
  object qryFormaPagto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.CODPORTFORMA, P.DESCRICAO'
      'FROM PORTADORFORMA P ORDER BY DESCRICAO ')
    ValidateWithMask = True
    Left = 199
    Top = 383
    object qryFormaPagtoCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Origin = 'BASEDADOS.PORTADORFORMA.CODPORTFORMA'
    end
    object qryFormaPagtoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.PORTADORFORMA.DESCRICAO'
      Size = 50
    end
  end
  object MontaSelectDOC: TMontaSelect
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
      ''
      ''
      ''
      ''
      ''
      '')
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
    Left = 187
    Top = 408
  end
  object QryDetAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT H.NUMRECEBIMENTO,'
      '       M.IDMOTIVO,'
      '       H.MESREFERENCIA,'
      '       H.MESCOBRANCA,'
      '       H.IDPESSJUR,'
      '       H.IDPLANOPREV,'
      '       H.IDPESSOA,'
      '       H.IDCONTRIBUICAO,'
      '       H.SEQPROPOSTA,'
      '       H.FLGDEVOLUCAO,'
      '       H.FLGDIVERGENTE,'
      '       H.FLGCONCESSAO,'
      '       H.FLGEVENTO,'
      '       H.FLGCALCRESERVA,'
      '       H.FLGDESCFOLHA,'
      '       H.FLGSITFUNDACAO,'
      '       H.FLGAPORTE,'
      '       H.VALORESPERADO,'
      '       H.VALORRECEBIDO,'
      '       H.VALORCALCULADO,'
      '       H.DATAPREVISAORECE,'
      '       H.DATARECEBIMENTO,'
      '       H.DATAINICIO,'
      '       H.DATAFINAL,'
      '       H.IDREGRACALCULO,'
      '       H.SITRECEBIMENTO,'
      '       H.TIPO,'
      '       H.VALOROP1,       H.SALCONTRIB,'
      '       H.VALOROP2,'
      '       H.VALOROP3,'
      '       H.IDLOTE,'
      
        '       DECODE(H.VALORPARARESERVA, NULL, H.VALORRECEBIDO, H.VALOR' +
        'PARARESERVA) AS VALORPARARESERVA,'
      '       M.DESCRICAO,'
      '       H.FLGMANUAL,'
      '       H.CODDOCUMENTOPREV,'
      '       H.FOLHAORIGEM,'
      '       H.IDTITULAR,'
      '       H.CODPORTFORMA,'
      '       H.IDPLANPREVCONTAB --SIG90704'
      '       '
      'FROM   HSTCONTRIBPREV H, MOTIVO M'
      'WHERE  (H.IDPESSJUR      = :IDPESSJUR)'
      'AND    (H.IDPLANOPREV    = :IDPLANOPREV)'
      'AND    (H.IDTITULAR        = :IDTITULAR   OR '
      '            H.IDTITULAR   IS NULL'
      '            ) '
      'AND    (H.IDPESSOA       = :IDPESSOA)'
      'AND    (H.SEQPROPOSTA    = :SEQPROPOSTA)'
      'AND    (H.IDCONTRIBUICAO = :IDCONTRIBUICAO)'
      'AND    (M.IDMOTIVO     = H.IDMOTIVO)'
      'ORDER BY MESREFERENCIA DESC'
      ' '
      ' '
      ' '
      ' ')
    ControlType.Strings = (
      'FLGDEVOLUCAO;CheckBox;1;0'
      'FLGCALCRESERVA;CheckBox;1;0'
      'FLGDESCFOLHA;CheckBox;0;1')
    ValidateWithMask = True
    Left = 246
    Top = 425
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
        Name = 'IDCONTRIBUICAO'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      DisplayLabel = 'Mês de ~Referência'
      DisplayWidth = 7
      FieldName = 'MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object StringField2: TStringField
      DisplayLabel = 'Mês de ~Cobrança'
      DisplayWidth = 7
      FieldName = 'MESCOBRANCA'
      FixedChar = True
      Size = 7
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Valor ~Esperado'
      DisplayWidth = 10
      FieldName = 'VALORESPERADO'
      DisplayFormat = '#0.00'
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Valor ~Recebido'
      DisplayWidth = 10
      FieldName = 'VALORRECEBIDO'
      DisplayFormat = '#0.00'
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Data ~Prevista'
      DisplayWidth = 10
      FieldName = 'DATAPREVISAORECE'
    end
    object DateTimeField2: TDateTimeField
      DisplayLabel = 'Data ~Efetiva'
      DisplayWidth = 10
      FieldName = 'DATARECEBIMENTO'
    end
    object FloatField3: TFloatField
      DisplayLabel = 'Devolução'
      DisplayWidth = 10
      FieldName = 'FLGDEVOLUCAO'
    end
    object FloatField4: TFloatField
      DisplayLabel = 'Alimentou~Reserva'
      DisplayWidth = 10
      FieldName = 'FLGCALCRESERVA'
    end
    object FloatField5: TFloatField
      DisplayLabel = 'Cobrar Via ~Banco'
      DisplayWidth = 10
      FieldName = 'FLGDESCFOLHA'
    end
    object FloatField6: TFloatField
      DisplayLabel = 'Valor para ~Reserva'
      DisplayWidth = 10
      FieldName = 'VALORPARARESERVA'
    end
    object StringField3: TStringField
      DisplayLabel = 'Motivo'
      DisplayWidth = 50
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object FloatField7: TFloatField
      FieldName = 'NUMRECEBIMENTO'
      Visible = False
    end
    object FloatField8: TFloatField
      FieldName = 'IDMOTIVO'
      Visible = False
    end
    object FloatField9: TFloatField
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object FloatField10: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object FloatField11: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object FloatField12: TFloatField
      FieldName = 'IDCONTRIBUICAO'
      Visible = False
    end
    object FloatField13: TFloatField
      FieldName = 'SEQPROPOSTA'
      Visible = False
    end
    object FloatField14: TFloatField
      FieldName = 'FLGDIVERGENTE'
      Visible = False
    end
    object FloatField15: TFloatField
      FieldName = 'FLGCONCESSAO'
      Visible = False
    end
    object FloatField16: TFloatField
      FieldName = 'FLGEVENTO'
      Visible = False
    end
    object StringField4: TStringField
      FieldName = 'FLGSITFUNDACAO'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object FloatField17: TFloatField
      FieldName = 'FLGAPORTE'
      Visible = False
    end
    object FloatField18: TFloatField
      FieldName = 'VALORCALCULADO'
      Visible = False
      DisplayFormat = '#0.00'
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'DATAINICIO'
      Visible = False
    end
    object DateTimeField4: TDateTimeField
      FieldName = 'DATAFINAL'
      Visible = False
    end
    object FloatField19: TFloatField
      FieldName = 'IDREGRACALCULO'
      Visible = False
    end
    object StringField5: TStringField
      FieldName = 'SITRECEBIMENTO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object StringField6: TStringField
      FieldName = 'TIPO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object FloatField20: TFloatField
      FieldName = 'VALOROP2'
      Visible = False
    end
    object FloatField21: TFloatField
      FieldName = 'VALOROP3'
      Visible = False
    end
    object FloatField22: TFloatField
      FieldName = 'FLGMANUAL'
      Visible = False
    end
    object FloatField23: TFloatField
      FieldName = 'CODDOCUMENTOPREV'
    end
    object StringField7: TStringField
      FieldName = 'FOLHAORIGEM'
      FixedChar = True
      Size = 1
    end
    object FloatField24: TFloatField
      FieldName = 'IDLOTE'
    end
    object FloatField25: TFloatField
      FieldName = 'IDTITULAR'
    end
    object FloatField26: TFloatField
      FieldName = 'CODPORTFORMA'
    end
    object FloatField27: TFloatField
      FieldName = 'IDPLANPREVCONTAB'
    end
    object FloatField28: TFloatField
      DisplayLabel = 'Percentual de Contribuição'
      FieldName = 'VALOROP1'
    end
    object FloatField29: TFloatField
      DisplayLabel = 'Salário de Contribuição'
      FieldName = 'SALCONTRIB'
      KeyFields = 'SALCONTRIB'
    end
  end
end
