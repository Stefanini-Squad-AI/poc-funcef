inherited frmCadRequerBenefPensionista: TfrmCadRequerBenefPensionista
  Left = 416
  Top = 273
  Caption = 'Requerimento de Benefícios para Beneficiários de Pensionistas'
  ClientHeight = 534
  ClientWidth = 820
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 820
    Height = 448
    inherited pnlMestre: TPanel
      Width = 818
      Height = 89
      BevelInner = bvRaised
      object Label12: TLabel
        Left = 8
        Top = 4
        Width = 109
        Height = 13
        Caption = 'Participante Titular'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 486
        Top = 45
        Width = 118
        Height = 13
        Caption = 'Data do Falecimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 8
        Top = 45
        Width = 108
        Height = 13
        Caption = 'Beneficiário Titular'
      end
      object Label4: TLabel
        Left = 354
        Top = 4
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object Label9: TLabel
        Left = 354
        Top = 45
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object LblAlterador: TLabel
        Left = 488
        Top = 4
        Width = 104
        Height = 13
        Caption = 'Incluir Alteradores'
      end
      object dblkpcmbPensionista: TwwDBLookupCombo
        Left = 8
        Top = 60
        Width = 338
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'20'#9'Pensionista'#9'F'
          'MATRICULA'#9'15'#9'Matrícula'#9'F'
          'DATAMORTE'#9'18'#9'Falecido em'#9'F')
        LookupTable = qryPensionista
        LookupField = 'IDPESSOA'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnChange = dblkpcmbPensionistaChange
      end
      object dtMortePensionista: TCMDateTimePicker
        Left = 486
        Top = 60
        Width = 112
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
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        ShowButton = True
        TabOrder = 1
      end
      object bbtnProcurar: TBitBtn
        Left = 612
        Top = 9
        Width = 88
        Height = 33
        Hint = 'Procurar Participante Titular'
        Caption = '&Procurar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = bbtnProcParticipanteClick
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
          FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
          0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
          870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
          FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
          0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
      end
      object edNomeTitular: TEdit
        Left = 8
        Top = 18
        Width = 338
        Height = 21
        ReadOnly = True
        TabOrder = 3
      end
      object edMatriculaParticipante: TEdit
        Left = 354
        Top = 18
        Width = 121
        Height = 21
        ReadOnly = True
        TabOrder = 4
      end
      object edMatriculaPensionista: TEdit
        Left = 354
        Top = 60
        Width = 121
        Height = 21
        ReadOnly = True
        TabOrder = 5
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 90
      Width = 818
      Height = 357
      Tabs.Strings = (
        'Benefíciários do Benefício')
      inherited pgctrlDetalhe: TPageControl
        Width = 720
        Height = 298
        inherited tbsDet: TTabSheet
          Caption = 'Benefícios do Beneficiário'
          inherited dbgrdDet: TwwDBGrid
            Width = 712
            Height = 270
            Selected.Strings = (
              'DEPEN'#9'25'#9'Beneficiário'
              'NOME'#9'25'#9'Benefício'
              'DESCRICAO'#9'25'#9'Situação do ~Benefício'
              'DATAINICIO'#9'10'#9'Data de Inicio'
              'VALORATUAL'#9'10'#9'Valor do ~Benefício(R$)'
              'VALORCOTAS'#9'10'#9'Valor do ~Benefício(Cotas)'
              'NUMEROPROCESSO'#9'10'#9'Número do ~Processo'
              'DATAFINAL'#9'10'#9'Data Final'
              'DATAINICIOFUND'#9'10'#9'Data de Inicio ~na Fundação'
              'DATAINICIOINSS'#9'10'#9'Data de Inicio ~no INSS'
              'DATAREQUERIMENTO'#9'10'#9'Data de ~Requerimento'
              'DATAULTREAJUSTE'#9'10'#9'Data do Último ~Reajuste'
              'NUMORDEMEVENTO'#9'10'#9'Número de Ordem ~do Evento'
              'NUMPROCINSS'#9'15'#9'Número do Processo ~no INSS'
              'VALORCALCULADO'#9'10'#9'Valor Calculado'
              'VLRCALCINSS'#9'10'#9'Valor calculado ~INSS'
              'VLRINFINSS'#9'10'#9'Valor Informado ~INSS'
              'VALORBASE1'#9'10'#9'VALORBASE1'
              'VALORBASE2'#9'10'#9'VALORBASE2'
              'VALORBASE3'#9'10'#9'VALORBASE3'
              'CAMPOTEXTO1'#9'200'#9'CAMPOTEXTO1'
              'CAMPOTEXTO2'#9'200'#9'CAMPOTEXTO2'
              'CAMPOTEXTO3'#9'200'#9'CAMPOTEXTO3')
            FixedCols = 1
            Font.Style = []
            ParentFont = False
            TitleLines = 2
          end
          inherited pnlControlesDet: TPanel
            Width = 712
            Height = 270
            object Label15: TLabel
              Left = 421
              Top = -2
              Width = 99
              Height = 13
              Caption = 'Requerimento em'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label21: TLabel
              Left = 3
              Top = -2
              Width = 56
              Height = 13
              Caption = 'Benefício'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label6: TLabel
              Left = 3
              Top = 34
              Width = 70
              Height = 13
              Caption = 'Benefíciário'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object bbtnSelecionaBeneficiarios: TSpeedButton
              Left = 402
              Top = 12
              Width = 17
              Height = 21
              Hint = 'Selecionar beneficiários'
              Caption = 'B'
              Enabled = False
              ParentShowHint = False
              ShowHint = True
              OnClick = bbtnSelecionaBeneficiariosClick
            end
            object Label10: TLabel
              Left = 415
              Top = 34
              Width = 126
              Height = 13
              Caption = 'Matrícula Beneficiário'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dtDataRequerimento: TCMDateTimePicker
              Left = 421
              Top = 12
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAREQUERIMENTO'
              DataSource = dsDet
              Date = 28556
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
              Time = 28556
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 1
            end
            object grpPagamento: TGroupBox
              Left = 3
              Top = 179
              Width = 627
              Height = 87
              Caption = ' Informações referentes ao Pagamento do Benefício '
              TabOrder = 4
              object Label16: TLabel
                Left = 280
                Top = 14
                Width = 83
                Height = 13
                Caption = 'Data de Início'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label17: TLabel
                Left = 400
                Top = 14
                Width = 59
                Height = 13
                Caption = 'Data Final'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label20: TLabel
                Left = 12
                Top = 14
                Width = 111
                Height = 13
                Caption = 'Tipo de Pagamento'
              end
              object Label1: TLabel
                Left = 12
                Top = 49
                Width = 120
                Height = 13
                Caption = 'Forma de Pagamento'
              end
              object lblAgencia: TLabel
                Left = 280
                Top = 49
                Width = 120
                Height = 13
                Caption = 'Agência para Crédito'
              end
              object dtDataInicio: TCMDateTimePicker
                Left = 280
                Top = 27
                Width = 114
                Height = 21
                Hint = 'Data de Início do Pagamento do Benefício'
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATAINICIO'
                DataSource = dsDet
                Date = 28556
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
                Time = 28556
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                ShowButton = True
                TabOrder = 0
                OnExit = dtDataInicioExit
              end
              object dtDataFinal: TCMDateTimePicker
                Left = 400
                Top = 27
                Width = 114
                Height = 21
                Hint = 'Data Final do Pagamento do Benefício'
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATAFINAL'
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
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                ShowButton = True
                TabOrder = 1
              end
              object dblkcmbTpPgtoBenef: TwwDBLookupCombo
                Left = 12
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
                  'NOME'#9'60'#9'Tipo de Pagamento')
                DataField = 'IDTPPAGTOBENEFIC'
                DataSource = dsDet
                LookupTable = qryTpPgtoBenef
                LookupField = 'IDTPPAGTOBENEFIC'
                Options = [loTitles]
                Enabled = False
                ParentFont = False
                TabOrder = 2
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
              end
              object dblkpcmbPortForma: TwwDBLookupCombo
                Left = 12
                Top = 63
                Width = 262
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'50'#9'DESCRICAO')
                DataField = 'CODPORTFORMA'
                DataSource = dsDet
                LookupTable = qryPortForma
                LookupField = 'CODPORTFORMA'
                Options = [loTitles]
                Enabled = False
                ParentFont = False
                TabOrder = 3
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
              end
              object dblkpcmbAgencia: TwwDBLookupCombo
                Left = 280
                Top = 63
                Width = 235
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'60'#9'Agência'
                  'NUMAGENCIA'#9'15'#9'Nº')
                DataField = 'IDAGENCIARESGATE'
                DataSource = dsDet
                LookupTable = qryAgenciaResgate
                LookupField = 'IDPESSOA'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 4
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
              end
              object DBGrid1: TDBGrid
                Left = 36
                Top = 5
                Width = 565
                Height = 74
                DataSource = dsDet
                TabOrder = 5
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -9
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                Visible = False
              end
            end
            object dblkpcmbBeneficiario: TwwDBLookupCombo
              Left = 3
              Top = 47
              Width = 398
              Height = 21
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'Beneficiário')
              DataField = 'IDPESSOA'
              DataSource = dsDet
              LookupTable = qryBeneficiario
              LookupField = 'IDPESSOA'
              Options = [loTitles]
              Enabled = False
              ParentFont = False
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnCloseUp = dblkpcmbBeneficiarioCloseUp
            end
            object dblkpcmbBeneficio: TwwDBLookupCombo
              Left = 3
              Top = 12
              Width = 397
              Height = 21
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'Benefício'
                'NUMORDEMEVENTO'#9'10'#9'Ordem'
                'FLGBENEFOBRIGATO'#9'10'#9'Obrigatório')
              DataField = 'IDBENEFICIO'
              DataSource = dsDet
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
            object grpInfSupl: TGroupBox
              Left = 3
              Top = 77
              Width = 627
              Height = 96
              Caption = ' Informações da Benefício'
              TabOrder = 3
              object pnlBenefProv: TPanel
                Left = 391
                Top = 18
                Width = 231
                Height = 75
                BevelOuter = bvNone
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                object lblPercConc: TLabel
                  Left = 4
                  Top = 37
                  Width = 115
                  Height = 13
                  Caption = 'Perc. de Concessão'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lblPrazoProv: TLabel
                  Left = 126
                  Top = 37
                  Width = 79
                  Height = 13
                  Caption = 'Prazo Máximo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lblMesProv: TLabel
                  Left = 193
                  Top = 58
                  Width = 36
                  Height = 13
                  Caption = 'meses'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lblPercent: TLabel
                  Left = 107
                  Top = 58
                  Width = 10
                  Height = 13
                  Caption = '%'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object dbrgrpBenefProvisorio: TDBRadioGroup
                  Left = 4
                  Top = 4
                  Width = 137
                  Height = 31
                  Caption = ' Benefício Provisório'
                  Columns = 2
                  DataField = 'FLGPROVISORIO'
                  DataSource = dsDet
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  Items.Strings = (
                    'Não'
                    'Sim')
                  ParentFont = False
                  TabOrder = 0
                  TabStop = True
                  Values.Strings = (
                    '0'
                    '1')
                  OnClick = dbrgrpBenefProvisorioClick
                  OnEnter = dbrgrpBenefProvisorioEnter
                  OnExit = dbrgrpBenefProvisorioExit
                end
                object dbedPercConc: TwwDBEdit
                  Left = 4
                  Top = 50
                  Width = 101
                  Height = 21
                  DataField = 'PERCPROVISORIO'
                  DataSource = dsDet
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
                object dbedPrazoProv: TwwDBEdit
                  Left = 127
                  Top = 50
                  Width = 65
                  Height = 21
                  DataField = 'PRAZOPROVISORIO'
                  DataSource = dsDet
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
                  OnExit = dbedPrazoProvExit
                end
              end
              object pnlNaoBenefProv: TPanel
                Left = 4
                Top = 14
                Width = 390
                Height = 80
                BevelOuter = bvNone
                TabOrder = 1
                object lblValorBenef: TLabel
                  Left = 267
                  Top = 40
                  Width = 82
                  Height = 13
                  Caption = 'Valor Rateado'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label7: TLabel
                  Left = 267
                  Top = 3
                  Width = 63
                  Height = 13
                  Caption = 'Valor Total'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label8: TLabel
                  Left = 129
                  Top = 3
                  Width = 129
                  Height = 13
                  Caption = 'Salário Real Benefício'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label3: TLabel
                  Left = 2
                  Top = 3
                  Width = 22
                  Height = 13
                  Caption = 'DIB'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object reValorBeneficio: TcmMaskEditDlg
                  Left = 264
                  Top = 53
                  Width = 121
                  Height = 21
                  Hint = 'Clique no botão à direita para calcular o valor do benefício'
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 0
                  OnExit = reValorBeneficioExit
                  OnMouseMove = reValorBeneficioMouseMove
                  OnBtnClick = reValorBeneficioBtnClick
                  BtnGlyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    0400000000000001000000000000000000001000000010000000000000000000
                    800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
                    73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
                    0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
                    0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
                    0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
                    0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
                    0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
                    0333337F777777737F333308888888880333337F333333337F33330888888888
                    03333373FFFFFFFF733333700000000073333337777777773333}
                  BtnNumGlyphs = 2
                  BtnWidth = 17
                end
                object reValorTotal: TcmMaskEditDlg
                  Left = 264
                  Top = 15
                  Width = 121
                  Height = 21
                  Hint = 
                    'Clique no botão à direita para calcular o valor TOTAL do benefíc' +
                    'io'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 1
                  OnExit = reValorTotalExit
                  OnBtnClick = reValorTotalBtnClick
                  BtnGlyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    0400000000000001000000000000000000001000000010000000000000000000
                    800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
                    73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
                    0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
                    0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
                    0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
                    0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
                    0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
                    0333337F777777737F333308888888880333337F333333337F33330888888888
                    03333373FFFFFFFF733333700000000073333337777777773333}
                  BtnNumGlyphs = 2
                  BtnWidth = 17
                end
                object reValorSRB: TcmMaskEditDlg
                  Left = 129
                  Top = 15
                  Width = 121
                  Height = 21
                  Hint = 'Clique no botão à direita para calcular o valor do SRB'
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 2
                  OnBtnClick = reValorSRBBtnClick
                  BtnGlyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    0400000000000001000000000000000000001000000010000000000000000000
                    800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
                    73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
                    0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
                    0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
                    0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
                    0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
                    0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
                    0333337F777777737F333308888888880333337F333333337F33330888888888
                    03333373FFFFFFFF733333700000000073333337777777773333}
                  BtnNumGlyphs = 2
                  BtnWidth = 17
                end
                object dtInicioFund: TCMDateTimePicker
                  Left = 2
                  Top = 15
                  Width = 121
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATAINICIOFUND'
                  DataSource = dsDet
                  Date = 28556
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
                  Time = 28556
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ShowButton = True
                  TabOrder = 3
                  OnExit = dtInicioFundExit
                end
              end
            end
            object dbeMatriculaBenef: TwwDBEdit
              Left = 416
              Top = 47
              Width = 125
              Height = 21
              DataField = 'MATRICULA'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnExit = dbeMatriculaBenefExit
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 810
        object lblNomeBenef: TLabel [0]
          Left = 141
          Top = 3
          Width = 5
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        inherited tb97BotoesDetalhe: TToolbar97
          object sbtnConcedeUm: TToolbarButton97
            Left = 75
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Conceder'
            AllowAllUp = True
            GroupIndex = 2
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
              FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
              990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
              990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
              FFFF3FFFFF3333333F330000033FFFFF0FFF77777F3333337FF30EEE0333FFF0
              00FF7F337FFF333777FF0EEE00033F00000F7F33777F3777777F0EEE0E033000
              00007FFF7F7FF777777700000E00033000FF777773777F3777F3330EEE0E0330
              00FF337FFF7F7F3777F33300000E033000FF337777737F37773333330EEE0300
              03FF33337FFF77777333333300000333333F3333777773333333}
            ImageIndex = 0
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnConcedeUmClick
          end
        end
        object Panel1: TPanel
          Left = 240
          Top = 36
          Width = 185
          Height = 41
          Caption = 'Panel1'
          TabOrder = 1
        end
      end
      inherited Dock974: TDock97
        Left = 724
        Height = 298
        inherited tb97Detalhe: TToolbar97
          object bbtnElegibilidade: TBitBtn
            Left = 0
            Top = 81
            Width = 85
            Height = 27
            Hint = 'Verificar Regra de Concessão do Benefício'
            Cancel = True
            Caption = 'V&erificar'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            OnClick = bbtnElegibilidadeClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333FFF33F333FF3F330E0330FFFCCFCC33777FF7F3377F7730EEE030FFFC
              CFCC377777F7F33773770EEE0000FFFFFCCF777777773F33377FEEE0BFBF0FFF
              FCCF7777333373F337730E0BFBFBF0FFCCFF77733333373F77F330BFBFBFBF0F
              CCFF37F333333F7F773330FBFBFB0B0FFFFF37F3F33F737FFFFF30B0BF0FB000
              000037F73F73F777777730FB0BF0FB0FFFFF373F73F73F7F333F330030BF0F0F
              FF993F77373F737F3377CC33330BF00FFF9977FFF373F77F3F77CC993330009F
              99FF7777F337777F77F333993330F99F99FF3F77FF37F773773F993CC330FFF9
              9F9977F77F37F3377F77993CC330FFF99F997737733733377377}
            NumGlyphs = 2
          end
          object bbtnOpcoes: TBitBtn
            Left = 0
            Top = 108
            Width = 85
            Height = 27
            Hint = 'Verificar Regra de Concessão do Benefício'
            Cancel = True
            Caption = 'O&pções'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            OnClick = bbtnOpcoesClick
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
          end
          object bbtnOutrasInformacoes: TBitBtn
            Left = 0
            Top = 135
            Width = 85
            Height = 27
            Hint = 
              'Visualizar e Informar Outras Informações como Benefício Anterior' +
              ', Indice de Reajuste do INSS, ...'
            Cancel = True
            Caption = 'O&utros'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
            OnClick = bbtnOutrasInformacoesClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
              300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
              330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
              333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
              339977FF777777773377000BFB03333333337773FF733333333F333000333333
              3300333777333333337733333333333333003333333333333377333333333333
              333333333333333333FF33333333333330003333333333333777333333333333
              3000333333333333377733333333333333333333333333333333}
            NumGlyphs = 2
          end
        end
      end
    end
    object DbLAlterador: TwwDBLookupCombo
      Left = 488
      Top = 18
      Width = 67
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'4'#9'Descição'#9'F')
      LookupTable = qryIncluiAlterador
      LookupField = 'FLGINCLUIALTERADOR'
      Options = [loColLines, loRowLines, loTitles]
      ImeName = '268'
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      OnKeyPress = DbLAlteradorKeyPress
    end
  end
  inherited Dock972: TDock97
    Width = 820
    object lblNumProcesso: TLabel [0]
      Left = 516
      Top = 5
      Width = 286
      Height = 20
      Alignment = taCenter
      AutoSize = False
      Caption = 'Processo Nº 999.999.999'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lblSitProcesso: TLabel [1]
      Left = 513
      Top = 21
      Width = 286
      Height = 20
      Alignment = taCenter
      AutoSize = False
      Caption = 'Situação : Pendente de Concessão'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    inherited Toolbar971: TToolbar97
      object sbtnConceder: TToolbarButton97
        Left = 240
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Conceder'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FF0000000F0
          000033F77777773777773FFF0CCC0FF09990333F73F37337F33733FFF0C0FFF0
          99903333F7373337F337333FFF0FFFF0999033333F73FFF7FFF73333FFF000F0
          0000333333F77737777733333F07B70FFFFF3333337F337F33333333330BBB0F
          FFFF3FFFFF7F337F333300000307B70FFFFF77777F73FF733F330EEE033000FF
          0FFF7F337FF777337FF30EEE00033FF000FF7F33777F333777FF0EEE0E033300
          000F7FFF7F7FFF77777F00000E00000000007777737773777777330EEE0E0330
          00FF337FFF7F7F3777F33300000E033000FF337777737F3777F333330EEE0330
          00FF33337FFF7FF77733333300000000033F3333777777777333}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = sbtnConcederClick
      end
      object sbtnImprimirSimulacao: TToolbarButton97
        Left = 300
        Top = 0
        Width = 60
        Height = 41
        Hint = 'Chamar Relatório de Simulação de Benefício'
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Imprimir'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 0
        OnClick = sbtnImprimirSimulacaoClick
      end
      object sbtnCadContaCorrente: TToolbarButton97
        Left = 360
        Top = 0
        Width = 60
        Height = 41
        Hint = 'Cadastrar Conta Corrente para Participante'
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Con&ta '
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
          007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
          7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
          99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        ImageIndex = 1
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 0
        OnClick = sbtnCadContaCorrenteClick
      end
      object sbtnDemonsSRB: TToolbarButton97
        Left = 420
        Top = 0
        Width = 60
        Height = 41
        Hint = 'Imprimir Demonstrativo de Cálculo'
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Demons.'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        ImageIndex = 1
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 0
        Visible = False
        OnClick = sbtnDemonsSRBClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 495
    Width = 820
    inherited tb97Fundo: TToolbar97
      Left = 561
      DockPos = 561
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 392
      DockPos = 392
      inherited ToolbarSep971: TToolbarSep97
        Left = 162
      end
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
      end
      inherited bbtnCancelar: TBitBtn
        Left = 81
        ModalResult = 0
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 8
    Top = 65522
    TargetsData = (
      1
      1
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    OnStateChange = dsDetStateChange
    Left = 14
    Top = 516
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 312
    Top = 83
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PROCESSOBENEF'
      'set'
      '  NUMEROPROCESSO = :NUMEROPROCESSO,'
      '  IDEVENTOGERADOR = :IDEVENTOGERADOR,'
      '  DTEVENTO = :DTEVENTO,'
      '  DTDIREITO = :DTDIREITO,'
      '  DTREGISTRO = :DTREGISTRO,'
      '  IDSITPROCESSO = :IDSITPROCESSO'
      'where'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO')
    InsertSQL.Strings = (
      'insert into PROCESSOBENEF'
      '  (NUMEROPROCESSO, IDEVENTOGERADOR, DTEVENTO, DTDIREITO, '
      '   DTREGISTRO, IDSITPROCESSO)'
      'values'
      '  (:NUMEROPROCESSO, :IDEVENTOGERADOR, :DTEVENTO, :DTDIREITO, '
      '   :DTREGISTRO, :IDSITPROCESSO)')
    DeleteSQL.Strings = (
      'delete from PROCESSOBENEF'
      'where'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO')
    Left = 362
    Top = 131
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Beneficiário'
    Colunas.Strings = (
      'P.NUMEROPROCESSO'
      'PES.NOME'
      'BF.NOME '
      'P.DTEVENTO'
      'EL.MATRICULA'
      'PP.INSCRICAONUMERO'
      'DEPENTIT.MATRICULA'
      'PBENEF.NOME')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'D'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Nº do Processo'
      'Participante Titular'
      'Benefício Requerido'
      'Data do Evento'
      'Matrícula do Participante'
      'Nº de Inscrição'
      'Matricula Benef.'
      'Nome do Beneficiário')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'S'
      'S'
      'S'
      'N')
    Tabelas.Strings = (
      'PESSOA PBENEF'
      'PESSOA PES'
      'PESSOA PPENS'
      'PROCESSOBENEF P'
      'BENEFBFCIARIO B'
      'ELEGPATRO EL'
      'PARTPREVPLAN PP'
      'DEPENTIT'
      'DEPENTIT DPENS'
      'BENEFPLANPREV BPL'
      'BENEFICIO BF')
    CamposChave.Strings = (
      'P.NUMEROPROCESSO'
      'B.IDTITULAR'
      'B.SEQPROPOSTA'
      'B.IDPESSJUR'
      'B.IDPLANOPREV'
      'B.IDPESSOA'
      'B.IDTITBENEF'
      'B.IDPLANOORIGEM')
    Filtro.Strings = (
      'B.NUMEROPROCESSO = P.NUMEROPROCESSO'
      'PPENS.IDPESSOA   = B.IDTITBENEF'
      'PES.IDPESSOA     = B.IDTITULAR'
      'PBENEF.IDPESSOA  = B.IDPESSOA'
      'DEPENTIT.IDTITULAR = B.IDTITBENEF'
      'DEPENTIT.IDPESSOA  = B.IDTITULAR'
      'DPENS.IDTITULAR    = B.IDTITULAR'
      'DPENS.IDPESSOA     = B.IDPESSOA'
      'B.IDTITULAR      <> B.IDPESSOA'
      'BF.IDBENEFICIO   = B.IDBENEFICIO'
      'BPL.IDPLANOPREV  = B.IDPLANOPREV'
      'BPL.IDBENEFICIO  = B.IDBENEFICIO'
      'EL.IDPESSJUR     = B.IDPESSJUR'
      'EL.IDPESSOA      = B.IDTITBENEF'
      'PP.IDPESSJUR     = B.IDPESSJUR '
      'PP.IDPLANOPREV   = B.IDPLANOORIGEM'
      'PP.IDPESSOA '#9'    = B.IDTITBENEF'
      'PP.SEQPROPOSTA   = B.SEQPROPOSTA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '30'
      '30'
      '15'
      '13'
      '10'
      '15'
      '60')
    UsaDistinct = True
    Left = 231
    Top = 56
  end
  inherited ImlPadrao: TImageList
    Left = 17
    Top = 65522
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 206
    Top = 2
  end
  inherited qry: TwwQuery
    BeforePost = qryBeforePost
    SQL.Strings = (
      'SELECT P.NUMEROPROCESSO, P.IDEVENTOGERADOR, '
      '       P.DTEVENTO, P.DTDIREITO, P.DTREGISTRO,'
      '       P.IDSITPROCESSO, S.DESCRICAO'
      'FROM   PROCESSOBENEF P, SITBENEFICIO S'
      'WHERE  P.NUMEROPROCESSO = :NUMEROPROCESSO'
      'AND    P.IDSITPROCESSO = S.IDSITBENEFICIO')
    Left = 393
    Top = 3
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 528
    Top = 132
  end
  object qryTpPgtoBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTPPAGTOBENEFIC, NOME'
      'FROM TPPAGTOBENEFICIO')
    ValidateWithMask = True
    Left = 480
    Top = 454
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update BENEFBFCIARIO'
      'set'
      '  IDTITBENEF = :IDTITBENEF,'
      '  CODPORTFORMA = :CODPORTFORMA,'
      '  IDSITBENEFICIO = :IDSITBENEFICIO,'
      '  IDDEPENDENCIA = :IDDEPENDENCIA,'
      '  IDTPPAGTOBENEFIC = :IDTPPAGTOBENEFIC,'
      '  VALORATUAL = :VALORATUAL,'
      '  DATAREQUERIMENTO = :DATAREQUERIMENTO,'
      '  DATAINICIO = :DATAINICIO,'
      '  DATAFINAL = :DATAFINAL,'
      '  FLGFORMAPAGTO = :FLGFORMAPAGTO,'
      '  VALORCALCULADO = :VALORCALCULADO,'
      '  DATAULTREAJUSTE = :DATAULTREAJUSTE,'
      '  VLRCALCINSS = :VLRCALCINSS,'
      '  VLRINFINSS = :VLRINFINSS,'
      '  DATAINICIOINSS = :DATAINICIOINSS,'
      '  NUMPROCINSS = :NUMPROCINSS,'
      '  DATAINICIOFUND = :DATAINICIOFUND,'
      '  VALORCOTAS = :VALORCOTAS,'
      '  VALORTOTAL = :VALORTOTAL,'
      '  DATACONCESSAO = :DATACONCESSAO,'
      '  FLGPROVISORIO = :FLGPROVISORIO,'
      '  PERCPROVISORIO = :PERCPROVISORIO,'
      '  PRAZOPROVISORIO = :PRAZOPROVISORIO,'
      '  ULTMESREAJUSTE = :ULTMESREAJUSTE,'
      '  ULTVALORATUALREAJ = :ULTVALORATUALREAJ,'
      '  DIBBENEFANT = :DIBBENEFANT,'
      '  VALORBENEFANT = :VALORBENEFANT,'
      '  VALORBINSSANT1 = :VALORBINSSANT1,'
      '  VALORBINSSANT2 = :VALORBINSSANT2,'
      '  VALORBINSSANT3 = :VALORBINSSANT3,'
      '  FLGBENEFMIN = :FLGBENEFMIN,'
      '  VALORSRB = :VALORSRB,'
      '  VALORNADIB = :VALORNADIB,'
      '  IDPLANPREVCONTAB = :IDPLANPREVCONTAB,'
      '  FONTEPAGADORA = :FONTEPAGADORA,'
      '  PLACONTAD = :PLACONTAD, '
      '  PLACONTAC = :PLACONTAC,'
      '  VALORBASE1 = :VALORBASE1,'
      '  VALORBASE2 = :VALORBASE2,'
      '  VALORBASE3 = :VALORBASE3,'
      '  CAMPOTEXTO1 = :CAMPOTEXTO1,'
      '  CAMPOTEXTO2 = :CAMPOTEXTO2,'
      '  CAMPOTEXTO3 = :CAMPOTEXTO3 '
      'where'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO'
      ''
      ''
      ' ')
    InsertSQL.Strings = (
      'insert into BENEFBFCIARIO'
      '  (NUMEROPROCESSO, IDPESSJUR, IDPLANOPREV, IDTITULAR, IDPESSOA,'
      'SEQPROPOSTA,'
      '   IDBENEFICIO, CODPORTFORMA, IDSITBENEFICIO, IDDEPENDENCIA,'
      'IDTPPAGTOBENEFIC,'
      '   VALORATUAL, DATAREQUERIMENTO, DATAINICIO, DATAFINAL,'
      'FLGFORMAPAGTO, VALORCALCULADO, DATAULTREAJUSTE, VLRCALCINSS,'
      'VLRINFINSS,'
      '   DATAINICIOINSS, NUMPROCINSS, DATAINICIOFUND, VALORCOTAS,'
      'VALORTOTAL,'
      '   DATACONCESSAO, FLGPROVISORIO, PERCPROVISORIO,'
      'PRAZOPROVISORIO, ULTMESREAJUSTE,'
      '   ULTVALORATUALREAJ, DIBBENEFANT, VALORBENEFANT,'
      'VALORBINSSANT1, VALORBINSSANT2,'
      
        '   VALORBINSSANT3, FLGBENEFMIN, VALORSRB, IDPLANOORIGEM,VALORNAD' +
        'IB,IDTITBENEF,'
      'IDPLANPREVCONTAB, FONTEPAGADORA, PLACONTAD, PLACONTAC,'
      
        'CAMPOTEXTO1, CAMPOTEXTO2, CAMPOTEXTO3, VALORBASE1, VALORBASE2, V' +
        'ALORBASE3'
      ')'
      'values'
      
        '  (:NUMEROPROCESSO, :IDPESSJUR, :IDPLANOPREV, :IDTITULAR, :IDPES' +
        'SOA, '
      ':SEQPROPOSTA,'
      
        '   :IDBENEFICIO, :CODPORTFORMA, :IDSITBENEFICIO, :IDDEPENDENCIA,' +
        ' '
      ':IDTPPAGTOBENEFIC,'
      '   :VALORATUAL, :DATAREQUERIMENTO, :DATAINICIO, :DATAFINAL,    '
      
        ':FLGFORMAPAGTO, :VALORCALCULADO, :DATAULTREAJUSTE, :VLRCALCINSS,' +
        ' '
      ':VLRINFINSS,'
      '   :DATAINICIOINSS, :NUMPROCINSS, :DATAINICIOFUND, :VALORCOTAS, '
      ':VALORTOTAL,'
      '   :DATACONCESSAO, :FLGPROVISORIO, :PERCPROVISORIO, '
      ':PRAZOPROVISORIO, :ULTMESREAJUSTE,'
      '   :ULTVALORATUALREAJ, :DIBBENEFANT, :VALORBENEFANT, '
      ':VALORBINSSANT1, :VALORBINSSANT2,'
      
        '   :VALORBINSSANT3, :FLGBENEFMIN, :VALORSRB, :IDPLANOORIGEM, :VA' +
        'LORNADIB, :IDTITBENEF,'
      ':IDPLANPREVCONTAB, :FONTEPAGADORA,  :PLACONTAD, :PLACONTAC,'
      
        ':CAMPOTEXTO1, :CAMPOTEXTO2, :CAMPOTEXTO3, :VALORBASE1, :VALORBAS' +
        'E2, :VALORBASE3'
      ')'
      ' ')
    DeleteSQL.Strings = (
      'delete from BENEFBFCIARIO'
      'where'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO')
    Left = 103
    Top = 375
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    BeforePost = qryDetBeforePost
    AfterScroll = qryDetAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT BF.NUMEROPROCESSO,    BF.IDPESSJUR,       BF.IDPLANOPREV,' +
        ' BF.IDPLANOORIGEM,'
      '       BF.IDTITULAR,         BF.IDBENEFREFEREN,'
      '       BF.IDPESSOA,          BF.SEQPROPOSTA,     BF.IDBENEFICIO,'
      
        '       BF.CODPORTFORMA,      BF.IDSITBENEFICIO,  BF.IDDEPENDENCI' +
        'A,'
      
        '       BF.IDTPPAGTOBENEFIC,  BF.VALORATUAL,      BF.DATAREQUERIM' +
        'ENTO,'
      '       BF.DATAINICIO,        BF.DATAFINAL,'
      
        '       BF.FLGFORMAPAGTO,     BF.VALORCALCULADO,  BF.DATAULTREAJU' +
        'STE,'
      
        '       BF.VLRCALCINSS,       BF.VLRINFINSS,      BF.DATAINICIOIN' +
        'SS,'
      '       BF.NUMPROCINSS,       BF.DATAINICIOFUND,  BF.VALORCOTAS,'
      
        '       BF.VALORTOTAL,        BF.DATACONCESSAO,   BF.FLGPROVISORI' +
        'O,'
      
        '       BF.PERCPROVISORIO,    BF.PRAZOPROVISORIO, BF.ULTMESREAJUS' +
        'TE,'
      
        '       BF.ULTVALORATUALREAJ, BF.IDAGENCIARESGATE,B.NUMORDEMEVENT' +
        'O,'
      '       BF.DIBBENEFANT,       BF.VALORBENEFANT,'
      
        '       BF.VALORBINSSANT1,    BF.VALORBINSSANT2, BF.VALORBINSSANT' +
        '3,'
      '       BF.FLGBENEFMIN,       BF.VALORSRB,       BF.VALORNADIB,'
      
        '       BF.CODPORTFORMA,      BF.IDTITBENEF,     BF.FONTEPAGADORA' +
        ','
      '       BF.FLGDATAPREVISTA, '
      '       B.NOME, S.DESCRICAO,'
      '       B.TIPOBENEFICIO,  '
      '       BF.TRGUSERINCLUSAO,'
      '       -- Thiago Melo'
      '       B.FLGRESGATE,'
      '       --BPART.VALORBASE1,  BPART.VALORBASE2,'
      '       --BPART.VALORBASE3,'
      '       BF.VALORBASE1,  BF.VALORBASE2, BF.VALORBASE3,'
      '       -- Thiago Melo'
      '      --160185'
      '      -- Thiago Melo'
      '      --BPART.CAMPOTEXTO1, BPART.CAMPOTEXTO2, BPART.CAMPOTEXTO3,'
      '      BF.CAMPOTEXTO1, BF.CAMPOTEXTO2, BF.CAMPOTEXTO3,'
      '      -- Thiago Melo'
      '      --160185     '
      '       P.NOME DEPEN, BTIT.IDRESPONSAVEL,'
      
        '       BF.FLGTIPOINSS  , B.FLGPECULIO, BF.IDPLANPREVCONTAB,  BF.' +
        'PLACONTAD, BF.PLACONTAC'
      '       ,BF.IDPERFILINVEST      --SIG55933'
      
        'FROM   BENEFBFCIARIO BF, BENEFICIO B, BENEFPLANPREV BPL, SITBENE' +
        'FICIO S,'
      '       BENEFPLANOPART BPART, BFCIARIOTITPLAN BTIT, PESSOA P'
      'WHERE BF.NUMEROPROCESSO = :NUMEROPROCESSO'
      'AND    BF.IDPESSOA = P.IDPESSOA'
      'AND    B.IDBENEFICIO     = BF.IDBENEFICIO'
      'AND    BPL.IDBENEFICIO   = BF.IDBENEFICIO'
      'AND    BPL.IDPLANOPREV   = BF.IDPLANOPREV'
      'AND    BF.IDSITBENEFICIO = S.IDSITBENEFICIO(+)'
      'AND    BF.IDTITULAR      = BPART.IDPESSOA(+)'
      'AND    BF.SEQPROPOSTA    = BPART.SEQPROPOSTA(+)'
      'AND    BF.IDPESSJUR      = BPART.IDPESSJUR(+)'
      'AND    BF.IDPLANOPREV    = BPART.IDPLANOPREV(+)'
      'AND    BF.IDBENEFICIO    = BPART.IDBENEFICIO(+)'
      'AND    BF.IDTITULAR      = BTIT.IDTITULAR'
      'AND    BF.IDPESSJUR      = BTIT.IDPESSJUR'
      'AND    BF.IDPLANOPREV    = BTIT.IDPLANOPREV'
      'AND    BF.IDPLANOORIGEM  = BTIT.IDPLANOORIGEM'
      'AND    BF.IDPESSOA       = BTIT.IDPESSOA'
      'AND    BF.IDBENEFICIO    = BTIT.IDBENEFICIO'
      'AND    BF.SEQPROPOSTA    = BTIT.SEQPROPOSTA'
      
        'AND    ((BPL.FLGREFERENCIA = 0) OR ((BPL.FLGREFERENCIA = 1) AND ' +
        '(BPL.FLGPAGAINSS = 1)))'
      'ORDER BY B.NOME ,  P.NOME'
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
      ' '
      ' ')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 151
    Top = 406
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
        Value = 6
      end>
    object qryDetDEPEN: TStringField
      DisplayLabel = 'Beneficiário'
      DisplayWidth = 25
      FieldName = 'DEPEN'
      Size = 60
    end
    object qryDetNOME: TStringField
      DisplayLabel = 'Benefício'
      DisplayWidth = 25
      FieldName = 'NOME'
      Size = 60
    end
    object qryDetDESCRICAO: TStringField
      DisplayLabel = 'Situação do ~Benefício'
      DisplayWidth = 25
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object qryDetDATAINICIO: TDateTimeField
      DisplayLabel = 'Data de Inicio'
      DisplayWidth = 10
      FieldName = 'DATAINICIO'
    end
    object qryDetVALORATUAL: TFloatField
      DisplayLabel = 'Valor do ~Benefício(R$)'
      DisplayWidth = 10
      FieldName = 'VALORATUAL'
    end
    object qryDetVALORCOTAS: TFloatField
      DisplayLabel = 'Valor do ~Benefício(Cotas)'
      DisplayWidth = 10
      FieldName = 'VALORCOTAS'
    end
    object qryDetNUMEROPROCESSO: TFloatField
      DisplayLabel = 'Número do ~Processo'
      DisplayWidth = 10
      FieldName = 'NUMEROPROCESSO'
    end
    object qryDetDATAFINAL: TDateTimeField
      DisplayLabel = 'Data Final'
      DisplayWidth = 10
      FieldName = 'DATAFINAL'
    end
    object qryDetDATAINICIOFUND: TDateTimeField
      DisplayLabel = 'Data de Inicio ~na Fundação'
      DisplayWidth = 10
      FieldName = 'DATAINICIOFUND'
    end
    object qryDetDATAINICIOINSS: TDateTimeField
      DisplayLabel = 'Data de Inicio ~no INSS'
      DisplayWidth = 10
      FieldName = 'DATAINICIOINSS'
    end
    object qryDetDATAREQUERIMENTO: TDateTimeField
      DisplayLabel = 'Data de ~Requerimento'
      DisplayWidth = 10
      FieldName = 'DATAREQUERIMENTO'
    end
    object qryDetDATAULTREAJUSTE: TDateTimeField
      DisplayLabel = 'Data do Último ~Reajuste'
      DisplayWidth = 10
      FieldName = 'DATAULTREAJUSTE'
    end
    object qryDetNUMORDEMEVENTO: TFloatField
      DisplayLabel = 'Número de Ordem ~do Evento'
      DisplayWidth = 10
      FieldName = 'NUMORDEMEVENTO'
    end
    object qryDetNUMPROCINSS: TStringField
      DisplayLabel = 'Número do Processo ~no INSS'
      DisplayWidth = 15
      FieldName = 'NUMPROCINSS'
      EditMask = '#########/#;0;_'
      Size = 15
    end
    object qryDetVALORCALCULADO: TFloatField
      DisplayLabel = 'Valor Calculado'
      DisplayWidth = 10
      FieldName = 'VALORCALCULADO'
    end
    object qryDetVLRCALCINSS: TFloatField
      DisplayLabel = 'Valor calculado ~INSS'
      DisplayWidth = 10
      FieldName = 'VLRCALCINSS'
    end
    object qryDetVLRINFINSS: TFloatField
      DisplayLabel = 'Valor Informado ~INSS'
      DisplayWidth = 10
      FieldName = 'VLRINFINSS'
    end
    object qryDetVALORBASE1: TFloatField
      DisplayLabel = 'Valor Base 1'
      DisplayWidth = 10
      FieldName = 'VALORBASE1'
      Visible = False
    end
    object qryDetVALORBASE2: TFloatField
      DisplayLabel = 'Valor Base 2'
      DisplayWidth = 10
      FieldName = 'VALORBASE2'
      Visible = False
    end
    object qryDetVALORBASE3: TFloatField
      DisplayLabel = 'Valor Base 3'
      DisplayWidth = 10
      FieldName = 'VALORBASE3'
      Visible = False
    end
    object qryDetCODPORTFORMA: TFloatField
      DisplayWidth = 10
      FieldName = 'CODPORTFORMA'
      Visible = False
    end
    object qryDetFLGFORMAPAGTO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGFORMAPAGTO'
      Visible = False
      Size = 1
    end
    object qryDetFLGRESGATE: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGRESGATE'
      Visible = False
    end
    object qryDetIDBENEFICIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBENEFICIO'
      Visible = False
    end
    object qryDetIDDEPENDENCIA: TStringField
      DisplayWidth = 3
      FieldName = 'IDDEPENDENCIA'
      Visible = False
      Size = 3
    end
    object qryDetIDPESSJUR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object qryDetIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryDetIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryDetIDSITBENEFICIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSITBENEFICIO'
      Visible = False
    end
    object qryDetIDTITULAR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTITULAR'
      Visible = False
    end
    object qryDetIDTPPAGTOBENEFIC: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTPPAGTOBENEFIC'
      Visible = False
    end
    object qryDetSEQPROPOSTA: TFloatField
      DisplayWidth = 10
      FieldName = 'SEQPROPOSTA'
      Visible = False
    end
    object qryDetVALORTOTAL: TFloatField
      FieldName = 'VALORTOTAL'
      Visible = False
    end
    object qryDetDATACONCESSAO: TDateTimeField
      FieldName = 'DATACONCESSAO'
      Visible = False
    end
    object qryDetFLGPROVISORIO: TFloatField
      FieldName = 'FLGPROVISORIO'
      Visible = False
    end
    object qryDetPERCPROVISORIO: TFloatField
      FieldName = 'PERCPROVISORIO'
      Visible = False
    end
    object qryDetPRAZOPROVISORIO: TFloatField
      FieldName = 'PRAZOPROVISORIO'
      Visible = False
    end
    object qryDetIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
      Visible = False
    end
    object qryDetULTMESREAJUSTE: TStringField
      FieldName = 'ULTMESREAJUSTE'
      Visible = False
      Size = 7
    end
    object qryDetULTVALORATUALREAJ: TFloatField
      FieldName = 'ULTVALORATUALREAJ'
      Visible = False
    end
    object qryDetIDAGENCIARESGATE: TFloatField
      FieldName = 'IDAGENCIARESGATE'
      Visible = False
    end
    object qryDetFLGTIPOINSS: TFloatField
      FieldName = 'FLGTIPOINSS'
      Visible = False
    end
    object qryDetDIBBENEFANT: TDateTimeField
      FieldName = 'DIBBENEFANT'
      Visible = False
    end
    object qryDetVALORBENEFANT: TFloatField
      FieldName = 'VALORBENEFANT'
      Visible = False
    end
    object qryDetVALORBINSSANT1: TFloatField
      FieldName = 'VALORBINSSANT1'
      Visible = False
    end
    object qryDetVALORBINSSANT2: TFloatField
      FieldName = 'VALORBINSSANT2'
      Visible = False
    end
    object qryDetVALORBINSSANT3: TFloatField
      FieldName = 'VALORBINSSANT3'
      Visible = False
    end
    object qryDetFLGPECULIO: TFloatField
      FieldName = 'FLGPECULIO'
      Visible = False
    end
    object qryDetFLGBENEFMIN: TFloatField
      FieldName = 'FLGBENEFMIN'
      Visible = False
    end
    object qryDetVALORSRB: TFloatField
      FieldName = 'VALORSRB'
      Visible = False
    end
    object qryDetIDPLANOORIGEM: TFloatField
      FieldName = 'IDPLANOORIGEM'
      Visible = False
    end
    object qryDetIDBENEFREFEREN: TFloatField
      FieldName = 'IDBENEFREFEREN'
      Visible = False
    end
    object qryDetVALORNADIB: TFloatField
      FieldName = 'VALORNADIB'
      Visible = False
    end
    object qryDetFLGDATAPREVISTA: TFloatField
      FieldName = 'FLGDATAPREVISTA'
      Visible = False
    end
    object qryDetIDTITBENEF: TFloatField
      FieldName = 'IDTITBENEF'
      Visible = False
    end
    object qryDetIDPLANPREVCONTAB: TFloatField
      FieldName = 'IDPLANPREVCONTAB'
      Visible = False
    end
    object qryDetFONTEPAGADORA: TFloatField
      FieldName = 'FONTEPAGADORA'
      Visible = False
    end
    object qryDetPLACONTAD: TStringField
      FieldName = 'PLACONTAD'
      Visible = False
      FixedChar = True
      Size = 18
    end
    object qryDetPLACONTAC: TStringField
      FieldName = 'PLACONTAC'
      Visible = False
      FixedChar = True
      Size = 18
    end
    object qryDetTIPOBENEFICIO: TFloatField
      FieldName = 'TIPOBENEFICIO'
      Visible = False
    end
    object qryDetTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object qryDetCAMPOTEXTO1: TStringField
      FieldName = 'CAMPOTEXTO1'
      Size = 200
    end
    object qryDetCAMPOTEXTO2: TStringField
      FieldName = 'CAMPOTEXTO2'
      Size = 200
    end
    object qryDetCAMPOTEXTO3: TStringField
      FieldName = 'CAMPOTEXTO3'
      Size = 200
    end
    object qryDetIDPERFILINVEST: TFloatField
      FieldName = 'IDPERFILINVEST'
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 681
    Top = 2
  end
  object MontaSelectPart: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Pensionista'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'DEPENTIT.MATRICULA'
      'PESSOA.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PARTPREVPLAN.INSCRICAODATA'
      'PLANPREV.NOME'
      'PATRO.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N'
      'D'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula do Participante'
      'Matrícula do Pensionista'
      'Participante'
      'N° de Inscrição'
      'Data de Inscrição'
      'Plano Previdenciário'
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
      'PESSOA'
      'ELEGPATRO'
      'PARTPREVPLAN'
      'PESSOA PATRO'
      'PLANPREV'
      'DEPENTIT')
    CamposChave.Strings = (
      'ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSJUR'
      'PLANPREV.IDPLANOPREV'
      'PESSOA.NOME'
      'PATRO.NOME AS PATRO'
      'PLANPREV.NOME AS PLANO'
      'ELEGPATRO.MATRICULA'
      'PARTPREVPLAN.SEQPROPOSTA'
      'DEPENTIT.IDTITULAR'
      'DEPENTIT.IDPESSOA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSOA = PARTPREVPLAN.IDPESSOA'
      'ELEGPATRO.IDPESSJUR = PARTPREVPLAN.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      'PATRO.IDPESSOA = ELEGPATRO.IDPESSJUR'
      'PARTPREVPLAN.FLGDESATIVADO = 0'
      'DEPENTIT.IDTITULAR = ELEGPATRO.IDPESSOA')
    Mascaras.Strings = (
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
      '60'
      '10'
      '10'
      '60'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 484
    Top = 394
  end
  object qryTitular: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME, P1.NOME AS NOMEPATRO, PL.NOME AS NOMEPLANO,'
      '       PF.DATANASC, PF.DATAMORTE,'
      
        '       EL.MATRICULA, EL.DATAADMISSAO, EL.DATADEMISSAO, EL.TEMPOS' +
        'ERVANTERIOR,'
      
        '       EL.TEMPONAOCREDITADO, EL.TEMPOSITESPECIAL, EL.NIVEL, EL.I' +
        'DSITFUNC,'
      
        '       EL.TEMPOSERVTOTAL,        EL.TEMPOSERVTOTMES,       EL.TE' +
        'MPOSERVTOTDIA,'
      
        '       PP.INSCRICAONUMERO, PP.INSCRICAODATA, PP.FLGDEVEEMPRESTIM' +
        'O, PP.FLGDEVEASSISTENC,'
      '       PP.FLGDEVEPREVIDENC, PP.IDSITPART, PP.IDSITPLANOPREV,'
      
        '       SPART.DESCRICAO AS NOMESITPART, SFUNC.DESCRICAO AS NOMESI' +
        'TFUNC,'
      
        '       SPLANO.DESCRICAO AS NOMESITPLANO, SPART.FLGINTERNO, SFUNC' +
        '.TIPOSIT,'
      
        '       PP.DATACANCELAMENTO, PL.FLGUSAEVOLFUNC, PL.FLGINCORPORAPE' +
        'NS'
      
        'FROM   PESSOA P, PESSOA P1, PLANPREV PL, PESSOAFISICA PF, ELEGPA' +
        'TRO EL,'
      
        '       PARTPREVPLAN PP, SITPART SPART, SITFUNC SFUNC, SITPLANOPR' +
        'EV SPLANO'
      'WHERE  PP.IDPESSOA    = :IDPESSOA'
      'AND    PP.SEQPROPOSTA = :SEQPROPOSTA'
      'AND    PP.IDPESSJUR   = :IDPESSJUR'
      'AND    PP.IDPLANOPREV = :IDPLANOPREV'
      'AND    EL.IDPESSOA    = :IDPESSOA'
      'AND    EL.IDPESSJUR   = :IDPESSJUR'
      'AND    P.IDPESSOA     = :IDPESSOA'
      'AND    PP.FLGDESATIVADO = 0'
      'AND    P1.IDPESSOA = EL.IDPESSJUR'
      'AND    PF.IDPESSOA = EL.IDPESSOA'
      'AND    PP.IDPLANOPREV = PL.IDPLANOPREV'
      'AND    SFUNC.IDSITFUNC = EL.IDSITFUNC'
      'AND    SPART.IDSITPART = PP.IDSITPART'
      'AND    SPLANO.IDSITPLANOPREV = PP.IDSITPLANOPREV'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 759
    Top = 175
    ParamData = <
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
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryBfciarioTitPlan: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPESSJUR,IDTITULAR,IDPLANOORIGEM, IDPLANOPREV,IDPESSOA,'
      
        '       IDBENEFICIO,SEQPROPOSTA, PRIORIDADE,PERCENTUAL, IDRESPONS' +
        'AVEL'
      'FROM   BFCIARIOTITPLAN'
      'WHERE  IDTITULAR   = :IDTITULAR'
      'AND    SEQPROPOSTA = :SEQPROPOSTA'
      'AND    IDPESSJUR   = :IDPESSJUR'
      'AND    IDPLANOORIGEM = :IDPLANOPREV'
      'ORDER BY IDBENEFICIO'
      ' '
      ''
      ' '
      ' ')
    UpdateObject = updBfciarioTitPlan
    ValidateWithMask = True
    Left = 689
    Top = 353
    ParamData = <
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
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object updBfciarioTitPlan: TUpdateSQL
    ModifySQL.Strings = (
      'update BFCIARIOTITPLAN'
      'set'
      '  PRIORIDADE = :PRIORIDADE,'
      '  PERCENTUAL = :PERCENTUAL,'
      '  IDRESPONSAVEL = :IDRESPONSAVEL'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPLANOORIGEM = :OLD_IDPLANOORIGEM and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    InsertSQL.Strings = (
      'insert into BFCIARIOTITPLAN'
      '  (IDPESSJUR, IDTITULAR, IDPLANOORIGEM, IDPLANOPREV, IDPESSOA, '
      'IDBENEFICIO, '
      '   SEQPROPOSTA, PRIORIDADE, PERCENTUAL, IDRESPONSAVEL)'
      'values'
      
        '  (:IDPESSJUR, :IDTITULAR, :IDPLANOORIGEM, :IDPLANOPREV, :IDPESS' +
        'OA, '
      ':IDBENEFICIO, '
      '   :SEQPROPOSTA, :PRIORIDADE, :PERCENTUAL, :IDRESPONSAVEL)')
    DeleteSQL.Strings = (
      'delete from BFCIARIOTITPLAN'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPLANOORIGEM = :OLD_IDPLANOORIGEM and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    Left = 676
    Top = 415
  end
  object qryFolha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  IDPESSOA, DIAFOLHA, FLGUTILFOLHA, FLGANTERIORFOLHA, FLGM' +
        'ESFOLHA'
      'FROM     FUNDACAO'
      'WHERE  IDPESSOA = :IDFUNDACAO')
    ValidateWithMask = True
    Left = 750
    Top = 356
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryContrib: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 751
    Top = 504
  end
  object qryPortForma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODPORTFORMA, DESCRICAO, CODPORTADOR'
      'FROM PORTADORFORMA'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 748
    Top = 453
  end
  object qryMovReservaTemp: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDMOVRESERVATMP, IDREGRACALCABATE, IDPLANOPREV,'
      '       IDTIPORESERVA,   IDPESSJUR,        NUMEROPROCESSO,'
      '       IDTITULAR,       IDPESSOA,         IDBENEFICIO,'
      '       SEQPROPOSTA,     VLRABATIDO,       DATAMOV,'
      '       IDHISTRESERVA,   VLRORIGINAL'
      'FROM   MOVRESERVATEMP'
      'WHERE  NUMEROPROCESSO = :NUMEROPROCESSO'
      'AND    IDTITULAR      = :IDTITULAR'
      'AND    IDPESSJUR      = :IDPESSJUR'
      'AND    IDPLANOPREV    = :IDPLANOPREV'
      'AND    SEQPROPOSTA    = :SEQPROPOSTA'
      'ORDER BY IDBENEFICIO')
    UpdateObject = updMovReservaTemp
    ValidateWithMask = True
    Left = 430
    Top = 266
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
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
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
  end
  object updMovReservaTemp: TUpdateSQL
    ModifySQL.Strings = (
      'update MOVRESERVATEMP'
      'set'
      '  IDMOVRESERVATMP = :IDMOVRESERVATMP,'
      '  IDREGRACALCABATE = :IDREGRACALCABATE,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDTIPORESERVA = :IDTIPORESERVA,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  NUMEROPROCESSO = :NUMEROPROCESSO,'
      '  IDTITULAR = :IDTITULAR,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDBENEFICIO = :IDBENEFICIO,'
      '  SEQPROPOSTA = :SEQPROPOSTA,'
      '  VLRABATIDO = :VLRABATIDO,'
      '  DATAMOV = :DATAMOV,'
      '  IDHISTRESERVA = :IDHISTRESERVA,'
      '  VLRORIGINAL = :VLRORIGINAL'
      'where'
      '  IDMOVRESERVATMP = :OLD_IDMOVRESERVATMP')
    InsertSQL.Strings = (
      'insert into MOVRESERVATEMP'
      
        '  (IDMOVRESERVATMP, IDREGRACALCABATE, IDPLANOPREV, IDTIPORESERVA' +
        ', IDPESSJUR, '
      
        '   NUMEROPROCESSO, IDTITULAR, IDPESSOA, IDBENEFICIO, SEQPROPOSTA' +
        ', VLRABATIDO, '
      '   DATAMOV, IDHISTRESERVA, VLRORIGINAL)'
      'values'
      
        '  (:IDMOVRESERVATMP, :IDREGRACALCABATE, :IDPLANOPREV, :IDTIPORES' +
        'ERVA, :IDPESSJUR, '
      
        '   :NUMEROPROCESSO, :IDTITULAR, :IDPESSOA, :IDBENEFICIO, :SEQPRO' +
        'POSTA, '
      '   :VLRABATIDO, :DATAMOV, :IDHISTRESERVA, :VLRORIGINAL)')
    DeleteSQL.Strings = (
      'delete from MOVRESERVATEMP'
      'where'
      '  IDMOVRESERVATMP = :OLD_IDMOVRESERVATMP')
    Left = 463
    Top = 174
  end
  object qryReservaPart: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT RP.IDTIPORESERVA,        RP.IDPLANOPREV,   RP.IDPESSJUR, ' +
        'RP.IDPESSOA,'
      
        '       RP.DATAREFERENCIASA,  RP.VALORRESERVA,  RP.PERCENTUALSAQU' +
        'E,'
      '       RP.SEQPROPOSTA,      R.FLGDESCIRRF,'
      '       R.NOME, R.CODHIERARQUIA, R.INDICEREAJUSTE, '
      '       PF.DATANASC, EL.DATAADMISSAO,'
      '       M.MOESIGLA,       R.FLGCONTROLE,'
      '       RP.IDPARTICIPANTE'
      
        'FROM   RESERVAPART RP, RESERVAXPLANO R, MOEDA M, ELEGPATRO EL, P' +
        'ESSOAFISICA PF'
      'WHERE  RP.IDPESSJUR         = :IDPESSJUR AND'
      '       RP.IDPLANOPREV       = :IDPLANOPREV AND'
      '       RP.IDPESSOA          = :IDTITULAR AND'
      '       RP.SEQPROPOSTA       = :SEQPROPOSTA AND'
      '       RP.FLGATIVO          = 1 AND'
      '       RP.IDTIPORESERVA     = R.IDTIPORESERVA AND'
      '       RP.IDPLANOPREV       = R.IDPLANOPREV AND'
      '       R.ANALITICOSINTETI   = '#39'A'#39' AND'
      '       R.INDICEREAJUSTE     = M.MOECODIGO(+) AND'
      '       RP.IDPESSJUR         = EL.IDPESSJUR AND'
      '       RP.IDPESSOA          = EL.IDPESSOA  AND'
      '       EL.IDPESSOA          = PF.IDPESSOA'
      'ORDER BY R.FLGCONTROLE')
    ValidateWithMask = True
    Left = 591
    Top = 174
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
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
  end
  object updReservaPart: TUpdateSQL
    ModifySQL.Strings = (
      'update RESERVAPART'
      'set'
      '  IDTIPORESERVA = :IDTIPORESERVA,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDPESSOA = :IDPESSOA,'
      '  VALORRESERVA = :VALORRESERVA,'
      '  SEQPROPOSTA = :SEQPROPOSTA'
      'where'
      '  IDTIPORESERVA = :OLD_IDTIPORESERVA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    InsertSQL.Strings = (
      'insert into RESERVAPART'
      
        '  (IDTIPORESERVA, IDPLANOPREV, IDPESSJUR, IDPESSOA, VALORRESERVA' +
        ', SEQPROPOSTA)'
      'values'
      
        '  (:IDTIPORESERVA, :IDPLANOPREV, :IDPESSJUR, :IDPESSOA, :VALORRE' +
        'SERVA, '
      '   :SEQPROPOSTA)')
    DeleteSQL.Strings = (
      'delete from RESERVAPART'
      'where'
      '  IDTIPORESERVA = :OLD_IDTIPORESERVA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    Left = 451
    Top = 141
  end
  object qryBenefAUX: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BF.NUMEROPROCESSO, BF.IDBENEFICIO,'
      '       BF.VALORATUAL, BF.IDPESSJUR, BF.IDPLANOPREV ,'
      '       BF.IDPESSOA , BF.IDTITULAR , BF.SEQPROPOSTA ,'
      '       BF.FLGFORMAPAGTO , BF.IDSITBENEFICIO,'
      '       BF.VLRCALCINSS,BF.VLRINFINSS,'
      '       BF.NUMPROCINSS, BF.VALORCOTAS,'
      '       BF.VALORTOTAL,'
      '       BPART.VALORBASE1, BPART.VALORBASE2, BPART.VALORBASE3,'
      '       BPART.CAMPOTEXTO1, BPART.CAMPOTEXTO2, BPART.CAMPOTEXTO3, '
      '       B.NUMORDEMEVENTO, BP.FLGCALCTODOMES, BF.IDPLANOORIGEM'
      'FROM   BENEFBFCIARIO BF, BENEFPLANOPART BPART, BENEFICIO B,'
      '       BENEFPLANPREV BP'
      'WHERE  BF.NUMEROPROCESSO = :NUMEROPROCESSO'
      'AND    B.IDBENEFICIO     = BF.IDBENEFICIO'
      'AND    BF.IDTITULAR      = BPART.IDPESSOA(+)'
      'AND    BF.SEQPROPOSTA    = BPART.SEQPROPOSTA(+)'
      'AND    BF.IDPESSJUR      = BPART.IDPESSJUR(+)'
      'AND    BF.IDPLANOPREV    = BPART.IDPLANOPREV(+)'
      'AND    BF.IDBENEFICIO    = BPART.IDBENEFICIO(+)'
      'AND    BF.IDPLANOPREV    = BP.IDPLANOPREV'
      'AND    BF.IDBENEFICIO    = BP.IDBENEFICIO'
      'ORDER BY B.NUMORDEMEVENTO DESC'
      ' ')
    UpdateObject = updBenefAUX
    ValidateWithMask = True
    Left = 697
    Top = 55
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end>
  end
  object updBenefAUX: TUpdateSQL
    ModifySQL.Strings = (
      ' update BENEFBFCIARIO'
      '           set NUMEROPROCESSO = :NUMEROPROCESSO,'
      '               IDBENEFICIO    = :IDBENEFICIO,'
      '               VALORATUAL     = :VALORATUAL,'
      '               IDPESSOA       = :IDPESSOA,'
      '               VLRCALCINSS    = :VLRCALCINSS,'
      '               VLRINFINSS     = :VLRINFINSS,'
      '               NUMPROCINSS    = :NUMPROCINSS,'
      '               VALORCOTAS     = :VALORCOTAS,'
      '               VALORTOTAL     = :VALORTOTAL,'
      '               VALORBASE1     = :VALORBASE1,'
      '               VALORBASE2     = :VALORBASE2,'
      '               VALORBASE3     = :VALORBASE3'
      '         where NUMEROPROCESSO = :OLD_NUMEROPROCESSO'
      '           and IDBENEFICIO = :OLD_IDBENEFICIO'
      '           and IDPESSJUR = :OLD_IDPESSJUR'
      '           and IDPLANOPREV = :OLD_IDPLANOPREV'
      '           and IDPESSOA = :OLD_IDPESSOA'
      '           and IDTITULAR = :OLD_IDTITULAR'
      '           and SEQPROPOSTA = :OLD_SEQPROPOSTA')
    InsertSQL.Strings = (
      'insert into BENEFBFCIARIO'
      
        '  (NUMEROPROCESSO, IDBENEFICIO, VALORATUAL, IDPESSOA, VLRCALCINS' +
        'S, VLRINFINSS,'
      
        '   NUMPROCINSS, VALORCOTAS, VALORTOTAL, VALORBASE1, VALORBASE2, ' +
        'VALORBASE3,'
      '   NUMORDEMEVENTO, IDPLANOORIGEM)'
      'values'
      
        '  (:NUMEROPROCESSO, :IDBENEFICIO, :VALORATUAL, :IDPESSOA, :VLRCA' +
        'LCINSS,'
      
        '   :VLRINFINSS, :NUMPROCINSS, :VALORCOTAS, :VALORTOTAL, :VALORBA' +
        'SE1, :VALORBASE2,'
      '   :VALORBASE3, :NUMORDEMEVENTO, :IDPLANOORIGEM)'
      ' ')
    DeleteSQL.Strings = (
      'delete from BENEFBFCIARIO'
      'where'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    Left = 699
    Top = 91
  end
  object qryBeneficiario: TwwQuery
    AfterOpen = qryBeneficiarioAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME,              D.DESCRICAO,        P.IDPESSOA,'
      '       P.NOME AS NOMERESPONSAVEL,'
      
        '       DT.NUMSEQUENCIA,     DT.IDDEPENDENCIA,   DT.FLGCONTAIMPOS' +
        'TOR,'
      '       DT.FLGCONTASALARIOF, DT.FLGBENEFICIARIO, DT.IDTITULAR,'
      '       DT.IDPESSOA,         PP.IDPESSJUR,       PP.IDPLANOPREV,'
      '       -1 AS IDRESPONSAVEL, -1 AS IDBENEFICIO,  0 AS PRIORIDADE,'
      '       0 AS PERCENTUAL,     '#39#39' AS NOMERESPONSAVEL,'
      '       PF.DATANASC, PF.SEXO, DT.MATRICULA'
      
        'FROM   PESSOA P, DEPEN D, DEPENTIT DT,  PESSOAFISICA PF, PARTPRE' +
        'VPLAN PP,'
      '       BFCIARIOTITPLAN BT'
      'WHERE  PP.IDPESSOA      = :IDTITULAR'
      'AND    DT.IDTITULAR = :IDTITULAR --WO17744 Leandro'
      'AND    PP.FLGDESATIVADO = 0'
      
        'AND    ((DT.IDTITULAR     = :IDPENSIONISTA) or (DT.IDPESSOA = :I' +
        'DPENSIONISTA) )'
      'AND    P.IDPESSOA       = DT.IDPESSOA'
      'AND    PF.IDPESSOA      = DT.IDPESSOA'
      'AND    D.IDDEPENDENCIA  = DT.IDDEPENDENCIA'
      'AND    DT.IDTITULAR = BT.IDTITULAR(+)'
      'AND    DT.IDPESSOA  = BT.IDPESSOA(+)'
      'AND    BT.IDBENEFICIO(+) = :IDBENEFICIO'
      'ORDER BY P.NOME'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 635
    Top = 219
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPENSIONISTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPENSIONISTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end>
  end
  object dsBeneficiario: TwwDataSource
    DataSet = qryBeneficiario
    Left = 646
    Top = 148
  end
  object qrybeneficio1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT B.IDBENEFICIO, B.NOME'
      'FROM BENEFICIO B '
      'WHERE B.IDBENEFICIO = :IDBENEFICIO')
    ValidateWithMask = True
    Left = 439
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end>
  end
  object dsBenefAux: TwwDataSource
    AutoEdit = False
    DataSet = qryBenefAUX
    Left = 756
    Top = 71
  end
  object qryReajINSS: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 499
    Top = 5
  end
  object qryContaBancaria: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT CB.IDCBANCARIA, CB.CONTACORRENTE, CB.IDAGENCIA, CB.FLGCON' +
        'TAPREF,'
      
        '       CB.IDPESSOA,    CB.TIPOCONTA, AGENCIA.NOME AS AGENCIA, BA' +
        'NCO.NOME AS BANCO,'
      
        '       AGENCIABANCARIA.NUMAGENCIA   , B.NUMBANCO  , CB.FLGCONTAC' +
        'ONJUNTA'
      'FROM CONTABANCARIA  CB, PESSOA AGENCIA,'
      '     PESSOA BANCO, AGENCIABANCARIA AGENCIABANCARIA  , BANCO B'
      'WHERE CB.IDPESSOA = :IDPESSOA AND'
      '       CB.IDAGENCIA = AGENCIA.IDPESSOA AND'
      '       CB.IDAGENCIA  = AGENCIABANCARIA.IDPESSOA AND'
      '       AGENCIABANCARIA.IDBANCO =  BANCO.IDPESSOA AND'
      '       AGENCIABANCARIA.IDBANCO = B.IDPESSOA      AND'
      '       CB.FLGCONTAPREF = 1'
      ''
      ' ')
    ValidateWithMask = True
    Left = 596
    Top = 3
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryBeneficio: TwwQuery
    AfterScroll = qryBeneficioAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  B.IDBENEFICIO,  B.NOME,   B.FLGDESTBENEF,   B.IDEVENTOGE' +
        'RADOR,'
      '        B.FLGRESGATE,   B.FLGBENEFOBRIGATO,   B.NUMORDEMEVENTO,'
      '        B.IDTPPAGTOBENEFIC,   BP.IDREGRACALCULO,'
      
        '        BP.IDREGRAPAGAMENTO,  BP.IDREGRAELEGIBILI,  BP.FLGACEITA' +
        'OPCAO,'
      
        '        BP.NOMEVALORBASE1,    BP.NOMEVALORBASE2,    BP.NOMEVALOR' +
        'BASE3, BP.NUMOPCOES,'
      '        BP.FLGEDITAOP1,             BP.FLGEDITAOP2,'
      
        '        BP.FLGEDITAOP3,  BP.FLGOBRIGAOP1, BP. FLGOBRIGAOP2, BP.F' +
        'LGOBRIGAOP3,'
      '       --sol160185'
      '       BP.FLGOPCAOTEXTO,'
      
        '        BP.NOMECAMPOTEXTO1,    BP.NOMECAMPOTEXTO2,    BP.NOMECAM' +
        'POTEXTO3,'
      
        '        BP.NUMOPCOESTEXTO,   BP.FLGEDITAOPTEXTO1,             BP' +
        '.FLGEDITAOPTEXTO2,'
      
        '        BP.FLGEDITAOPTEXTO3,  BP.FLGOBRIGAOPTEXTO1, BP. FLGOBRIG' +
        'AOPTEXTO2, BP.FLGOBRIGAOPTEXTO3,'
      '       --sol160185 '
      '       BP.IDREGRAINICIO,  BP.IDREGRAFIM,'
      
        '        BP.IDREGRACALCINSS,  BP.IDBENEFREF,  BP.FLGQUITAPREVIDEN' +
        ','
      
        '        BP.FLGQUITAEMPRESTI,  BP.FLGQUITAASSISTEN,          BP.I' +
        'NDICEREAJBENEF,   BP.FLGCALCTODOMES,    BP.IDREGRAREAJBENEF,'
      
        '        BP.IDREGRAPRIMPAGTO,  BP.IDREGRAULTPAGTO,   BP.CODPORTFO' +
        'RMA,'
      
        '        BP.FLGOBRIGAOP1,      BP.FLGOBRIGAOP2,      BP.FLGOBRIGA' +
        'OP3,'
      
        '        BP.FLGOBRIGANPROC,    BP.IDREGRABENEFICIA,  BP.IDRGVALOR' +
        'TOTAL,'
      
        '        BP.FLGBENEFINF,       B.PRAZOPROVISORIO,    BP.FLGDATAIN' +
        'DICERES,'
      
        '        BP.FLGREFERENCIA, BP.IDREGRASIMULA, BP.IDREGRABENEFMIN, ' +
        'BP.IDREGRASRB,'
      '        BP.FLGACEITAZERO, B.CODBENEFICIO, '
      
        '        BP.FLGACTVLRSRB, BP.FLGACTVLRATUAL, BP.FLGACTVLRTOTBEN, ' +
        'BP.FLGACEITAACERTO,'
      '        BP.IDRGPLANPREVCONT, BP.FLGPERMITEQUITAR, B.FLGPECULIO'
      'FROM    BENEFICIO B, BENEFPLANPREV BP'
      'WHERE   BP.IDPLANOPREV = :IDPLANOPREV'
      'AND     B.FLGDESTBENEF <> '#39'P'#39
      
        'AND    (( B.IDEVENTOGERADOR = :IDEVENTOGERADOR) OR ( :IDEVENTOGE' +
        'RADOR = -1)) '
      'AND     BP.IDBENEFICIO = B.IDBENEFICIO'
      'AND     BP.FLGREFERENCIA = 0'
      'ORDER BY B.NUMORDEMEVENTO'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 554
    Top = 1
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
      end>
  end
  object qryAgenciaResgate: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME, A.NUMAGENCIA'
      'FROM   PESSOA P, AGENCIABANCARIA A, PORTADORCONTA PC'
      'WHERE  (PC.CODPORTADOR = :CODPORTADOR)'
      'AND    (PC.IDBANCO = A.IDBANCO)'
      'AND    (PC.IDAGENCIA = A.IDPESSOA)'
      'AND    (A.IDPESSOA = P.IDPESSOA)'
      'ORDER BY P.NOME')
    ValidateWithMask = True
    Left = 333
    Top = 500
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODPORTADOR'
        ParamType = ptUnknown
      end>
  end
  object qryRelBenefPart: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT IDPLANOPREV, IDPESSJUR, IDTITULAR, NUMEROPROCESSO,'
      '       IDBENEFICIO, IDPESSOA,  IDCALCULO, SEQPROPOSTA,'
      '       IDTIPOCALCULO, DATACALCULO, FLGRECALCULO'
      'FROM   RELBENEFPART'
      'WHERE  NUMEROPROCESSO = :NUMEROPROCESSO'
      'AND    SEQPROPOSTA    = :SEQPROPOSTA'
      'AND    IDPESSJUR      = :IDPESSJUR'
      'AND    IDPLANOPREV    = :IDPLANOPREV'
      'AND    IDTITULAR      = :IDTITULAR'
      'AND    IDPESSOA       = :IDPESSOA')
    UpdateObject = updRelBenefPart
    ValidateWithMask = True
    Left = 671
    Top = 479
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
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
      end>
  end
  object updRelBenefPart: TUpdateSQL
    ModifySQL.Strings = (
      'update RELBENEFPART'
      'set'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDTITULAR = :IDTITULAR,'
      '  NUMEROPROCESSO = :NUMEROPROCESSO,'
      '  IDBENEFICIO = :IDBENEFICIO,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDCALCULO = :IDCALCULO,'
      '  SEQPROPOSTA = :SEQPROPOSTA,'
      '  IDTIPOCALCULO = :IDTIPOCALCULO,'
      '  DATACALCULO = :DATACALCULO,'
      '  FLGRECALCULO = :FLGRECALCULO'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDCALCULO = :OLD_IDCALCULO and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    InsertSQL.Strings = (
      'insert into RELBENEFPART'
      
        '  (IDPLANOPREV, IDPESSJUR, IDTITULAR, NUMEROPROCESSO, IDBENEFICI' +
        'O, IDPESSOA, '
      
        '   IDCALCULO, SEQPROPOSTA, IDTIPOCALCULO, DATACALCULO, FLGRECALC' +
        'ULO)'
      'values'
      
        '  (:IDPLANOPREV, :IDPESSJUR, :IDTITULAR, :NUMEROPROCESSO, :IDBEN' +
        'EFICIO, '
      
        '   :IDPESSOA, :IDCALCULO, :SEQPROPOSTA, :IDTIPOCALCULO, :DATACAL' +
        'CULO, :FLGRECALCULO)')
    DeleteSQL.Strings = (
      'delete from RELBENEFPART'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDCALCULO = :OLD_IDCALCULO and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    Left = 674
    Top = 464
  end
  object QryBuscaContrib: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CON.IDPLANOPREV,     CON.IDCONTRIBUICAO,'
      '  CON.IDEVENTOGERADOR, CON.IDREGRAVALIDAASS, CTB.FLGPAGADOR'
      'FROM'
      '  CONTPREVEVENTO CON, CONTPREV CTB'
      'WHERE'
      '  (CON.IDEVENTOGERADOR = :IDEVENTOGERADOR)   AND'
      '  (CTB.FLGPAGADOR      = '#39'R'#39')                AND'
      '  (CON.IDCONTRIBUICAO  = CTB.IDCONTRIBUICAO) AND'
      '  (CON.IDPLANOPREV     = CTB.IDPLANOPREV)    ')
    ValidateWithMask = True
    Left = 251
    Top = 491
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
      end>
  end
  object qryNucleoFamiliar: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 555
    Top = 38
  end
  object QryBenefProc: TwwQuery
    CachedUpdates = True
    BeforePost = qryDetBeforePost
    AfterScroll = qryDetAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BF.NUMEROPROCESSO,    BF.IDPESSJUR,       BF.IDPLANOPREV,'
      '       BF.IDTITULAR,'
      '       BF.IDPESSOA,          BF.SEQPROPOSTA,     BF.IDBENEFICIO,'
      
        '       BF.CODPORTFORMA,      BF.IDSITBENEFICIO,  BF.IDDEPENDENCI' +
        'A,'
      
        '       BF.IDTPPAGTOBENEFIC,  BF.VALORATUAL,      BF.DATAREQUERIM' +
        'ENTO,'
      
        '       BF.DATAINICIO,        BF.DATAFINAL,              BF.FLGFO' +
        'RMAPAGTO,     BF.VALORCALCULADO,  BF.DATAULTREAJUSTE,'
      
        '       BF.VLRCALCINSS,       BF.VLRINFINSS,      BF.DATAINICIOIN' +
        'SS,'
      '       BF.NUMPROCINSS,       BF.DATAINICIOFUND,  BF.VALORCOTAS,'
      
        '       BF.VALORTOTAL,        BF.DATACONCESSAO,   BF.FLGPROVISORI' +
        'O,'
      
        '       BF.PERCPROVISORIO,    BF.PRAZOPROVISORIO, BF.ULTMESREAJUS' +
        'TE,'
      
        '       BF.ULTVALORATUALREAJ, BF.IDAGENCIARESGATE,B.NUMORDEMEVENT' +
        'O,'
      '       B.NOME,               S.DESCRICAO,'
      
        '       B.FLGRESGATE,         BPART.VALORBASE1,   BPART.VALORBASE' +
        '2,'
      
        '       BPART.VALORBASE3,     P.NOME DEPEN,       BTIT.IDRESPONSA' +
        'VEL'
      
        'FROM   BENEFBFCIARIO BF, BENEFICIO B, BENEFPLANPREV BPL, SITBENE' +
        'FICIO S,'
      '       BENEFPLANOPART BPART, BFCIARIOTITPLAN BTIT, PESSOA P'
      'WHERE  BF.NUMEROPROCESSO = :NUMEROPROCESSO'
      'AND    BF.IDPESSOA       = P.IDPESSOA'
      'AND    B.IDBENEFICIO     = BF.IDBENEFICIO'
      'AND    BPL.IDBENEFICIO   = BF.IDBENEFICIO'
      'AND    BPL.IDPLANOPREV   = BF.IDPLANOPREV'
      'AND    BF.IDSITBENEFICIO = S.IDSITBENEFICIO(+)'
      'AND    BF.IDTITULAR      = BPART.IDPESSOA(+)'
      'AND    BF.SEQPROPOSTA    = BPART.SEQPROPOSTA(+)'
      'AND    BF.IDPESSJUR      = BPART.IDPESSJUR(+)'
      'AND    BF.IDPLANOPREV    = BPART.IDPLANOPREV(+)'
      'AND    BF.IDBENEFICIO    = BPART.IDBENEFICIO(+)'
      'AND    BF.IDTITULAR      = BTIT.IDTITULAR'
      'AND    BF.IDPESSJUR      = BTIT.IDPESSJUR'
      'AND    BF.IDPLANOPREV    = BTIT.IDPLANOPREV'
      'AND    BF.IDPLANOORIGEM  = BTIT.IDPLANOORIGEM'
      'AND    BF.IDPESSOA       = BTIT.IDPESSOA'
      'AND    BF.IDBENEFICIO    = BTIT.IDBENEFICIO'
      'AND    BF.SEQPROPOSTA    = BTIT.SEQPROPOSTA'
      'AND    BPL.FLGREFERENCIA = 0'
      '')
    ValidateWithMask = True
    Left = 193
    Top = 485
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
        Value = 6
      end>
    object StringField1: TStringField
      DisplayLabel = 'Beneficiário'
      DisplayWidth = 25
      FieldName = 'DEPEN'
      Size = 60
    end
    object StringField2: TStringField
      DisplayLabel = 'Benefício'
      DisplayWidth = 25
      FieldName = 'NOME'
      Size = 60
    end
    object StringField3: TStringField
      DisplayLabel = 'Situação do ~Benefício'
      DisplayWidth = 25
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Data de Inicio'
      DisplayWidth = 10
      FieldName = 'DATAINICIO'
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Valor do ~Benefício(R$)'
      DisplayWidth = 10
      FieldName = 'VALORATUAL'
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Número do ~Processo'
      DisplayWidth = 10
      FieldName = 'NUMEROPROCESSO'
    end
    object DateTimeField2: TDateTimeField
      DisplayLabel = 'Data Final'
      DisplayWidth = 10
      FieldName = 'DATAFINAL'
    end
    object DateTimeField3: TDateTimeField
      DisplayLabel = 'Data de Inicio ~na Fundação'
      DisplayWidth = 10
      FieldName = 'DATAINICIOFUND'
    end
    object DateTimeField4: TDateTimeField
      DisplayLabel = 'Data de Inicio ~no INSS'
      DisplayWidth = 10
      FieldName = 'DATAINICIOINSS'
    end
    object DateTimeField5: TDateTimeField
      DisplayLabel = 'Data de ~Requerimento'
      DisplayWidth = 10
      FieldName = 'DATAREQUERIMENTO'
    end
    object DateTimeField6: TDateTimeField
      DisplayLabel = 'Data do Último ~Reajuste'
      DisplayWidth = 10
      FieldName = 'DATAULTREAJUSTE'
    end
    object FloatField3: TFloatField
      DisplayLabel = 'Número de Ordem ~do Evento'
      DisplayWidth = 10
      FieldName = 'NUMORDEMEVENTO'
    end
    object StringField4: TStringField
      DisplayLabel = 'Número do Processo ~no INSS'
      DisplayWidth = 15
      FieldName = 'NUMPROCINSS'
      Size = 15
    end
    object FloatField5: TFloatField
      DisplayLabel = 'Valor Calculado'
      DisplayWidth = 10
      FieldName = 'VALORCALCULADO'
    end
    object FloatField6: TFloatField
      DisplayLabel = 'Valor calculado ~INSS'
      DisplayWidth = 10
      FieldName = 'VLRCALCINSS'
    end
    object FloatField7: TFloatField
      DisplayLabel = 'Valor Informado ~INSS'
      DisplayWidth = 10
      FieldName = 'VLRINFINSS'
    end
    object FloatField8: TFloatField
      DisplayLabel = 'Valor Base 1'
      DisplayWidth = 10
      FieldName = 'VALORBASE1'
      Visible = False
    end
    object FloatField9: TFloatField
      DisplayLabel = 'Valor Base 2'
      DisplayWidth = 10
      FieldName = 'VALORBASE2'
      Visible = False
    end
    object FloatField10: TFloatField
      DisplayLabel = 'Valor Base 3'
      DisplayWidth = 10
      FieldName = 'VALORBASE3'
      Visible = False
    end
    object FloatField11: TFloatField
      DisplayWidth = 10
      FieldName = 'CODPORTFORMA'
      Visible = False
    end
    object StringField5: TStringField
      DisplayWidth = 1
      FieldName = 'FLGFORMAPAGTO'
      Visible = False
      Size = 1
    end
    object FloatField12: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGRESGATE'
      Visible = False
    end
    object FloatField13: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBENEFICIO'
      Visible = False
    end
    object StringField6: TStringField
      DisplayWidth = 3
      FieldName = 'IDDEPENDENCIA'
      Visible = False
      Size = 3
    end
    object FloatField14: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object FloatField15: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object FloatField16: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object FloatField17: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSITBENEFICIO'
      Visible = False
    end
    object FloatField18: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTITULAR'
      Visible = False
    end
    object FloatField19: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTPPAGTOBENEFIC'
      Visible = False
    end
    object FloatField20: TFloatField
      DisplayWidth = 10
      FieldName = 'SEQPROPOSTA'
      Visible = False
    end
    object FloatField21: TFloatField
      FieldName = 'VALORTOTAL'
      Visible = False
    end
    object DateTimeField7: TDateTimeField
      FieldName = 'DATACONCESSAO'
      Visible = False
    end
    object FloatField22: TFloatField
      FieldName = 'FLGPROVISORIO'
      Visible = False
    end
    object FloatField23: TFloatField
      FieldName = 'PERCPROVISORIO'
      Visible = False
    end
    object FloatField24: TFloatField
      FieldName = 'PRAZOPROVISORIO'
      Visible = False
    end
    object FloatField25: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
    object StringField7: TStringField
      FieldName = 'ULTMESREAJUSTE'
      Size = 7
    end
    object FloatField26: TFloatField
      FieldName = 'ULTVALORATUALREAJ'
    end
    object FloatField27: TFloatField
      FieldName = 'IDAGENCIARESGATE'
    end
    object FloatField28: TFloatField
      FieldName = 'VALORCOTAS'
    end
  end
  object QryContribProc: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 504
    Top = 36
  end
  object qryTotalRecebedor: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPESSOA, NOME, 0 AS TOTAL'
      'FROM   PESSOA'
      'WHERE IDPESSOA = :IDPESSOA')
    UpdateObject = updTotalRecebedor
    ValidateWithMask = True
    Left = 575
    Top = 452
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object updTotalRecebedor: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  NOME = :NOME'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      '  (IDPESSOA, NOME)'
      'values'
      '  (:IDPESSOA, :NOME)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 572
    Top = 401
  end
  object qryPensionista: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT DP.IDTITULAR, DP.IDPESSOA, DP.NUMSEQUENCIA,'
      
        '               DP.MATRICULA, PF.DATAMORTE, P.NOME, bb.IDPLANOPRE' +
        'V'
      
        'FROM   PESSOA P, PESSOAFISICA PF, DEPENTIT DP, BFCIARIOTITPLAN B' +
        'B'
      'WHERE  DP.IDTITULAR = :IDTITULAR'
      'AND    DP.IDPESSOA <> DP.IDTITULAR'
      'AND    PF.IDPESSOA  = DP.IDPESSOA'
      'AND    P.IDPESSOA = DP.IDPESSOA'
      'AND    DP.IDTITULAR= BB.IDTITULAR'
      'AND    P.IDPESSOA = BB.IDPESSOA '
      ''
      ' ')
    ValidateWithMask = True
    Left = 198
    Top = 122
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object qryDepentit: TwwQuery
    CachedUpdates = True
    AfterOpen = qryBeneficiarioAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTITULAR, IDPESSOA, IDDEPENDENCIA, MATRICULA'
      'FROM DEPENTIT'
      'WHERE IDTITULAR = :IDTITULAR'
      '  AND IDPESSOA  = :IDPESSOA')
    UpdateObject = updDepentit
    ValidateWithMask = True
    Left = 190
    Top = 65532
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsDepentit: TwwDataSource
    DataSet = qryDepentit
    Left = 321
    Top = 12
  end
  object updDepentit: TUpdateSQL
    ModifySQL.Strings = (
      'update DEPENTIT'
      'set'
      '  IDDEPENDENCIA = :IDDEPENDENCIA,'
      '  MATRICULA = :MATRICULA'
      'where'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into DEPENTIT'
      '  (IDDEPENDENCIA, MATRICULA)'
      'values'
      '  (:IDDEPENDENCIA, :MATRICULA)')
    DeleteSQL.Strings = (
      'delete from DEPENTIT'
      'where'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 147
    Top = 65532
  end
  object qryBfciariotitPlanAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPESSJUR,IDTITULAR,IDPLANOPREV, IDPLANOORIGEM, IDPESSOA,'
      
        '       IDBENEFICIO,SEQPROPOSTA, PRIORIDADE,PERCENTUAL, IDRESPONS' +
        'AVEL, IDRESPONNAOREC'
      'FROM   BFCIARIOTITPLAN'
      'WHERE  IDPESSOA    = :IDPESSOA'
      'AND    IDTITULAR   = :IDPESSOA'
      'AND    SEQPROPOSTA = :SEQPROPOSTA'
      'AND    IDPESSJUR   = :IDPESSJUR'
      'AND    IDPLANOORIGEM = :IDPLANOPREV'
      'AND    IDBENEFICIO = :IDBENEFICIO'
      'ORDER BY IDBENEFICIO'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updBfciarioTitPlanAux
    ValidateWithMask = True
    Left = 37
    Top = 377
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
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
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end>
  end
  object updBfciarioTitPlanAux: TUpdateSQL
    ModifySQL.Strings = (
      'update BFCIARIOTITPLAN'
      'set'
      '  PRIORIDADE = :PRIORIDADE,'
      '  PERCENTUAL = :PERCENTUAL,'
      '  IDRESPONSAVEL = :IDRESPONSAVEL'
      '  IDRESPONNAOREC = :IDRESPONNAOREC'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPLANOORIGEM = :OLD_IDPLANOORIGEM and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA'
      ' '
      ' ')
    InsertSQL.Strings = (
      'insert into BFCIARIOTITPLAN'
      '  (IDPESSJUR, IDTITULAR, IDPLANOPREV, IDPLANOORIGEM, IDPESSOA, '
      'IDBENEFICIO, IDRESPONNAOREC,'
      '   SEQPROPOSTA, PRIORIDADE, PERCENTUAL, IDRESPONSAVEL)'
      'values'
      
        '  (:IDPESSJUR, :IDTITULAR, :IDPLANOPREV, :IDPLANOORIGEM, :IDPESS' +
        'OA, '
      ':IDBENEFICIO, :IDRESPONNAOREC,'
      '   :SEQPROPOSTA, :PRIORIDADE, :PERCENTUAL, :IDRESPONSAVEL)')
    DeleteSQL.Strings = (
      'delete from BFCIARIOTITPLAN'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPLANOORIGEM = :OLD_IDPLANOORIGEM and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    Left = 36
    Top = 430
  end
  object qryUser: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT  '#39'CM'#39'||to_char(IDUSUARIO) AS USUARIOCM,'
      '        IDUSUARIO AS USUARIO, NOMEUSUARIO'
      'FROM  USUARIOSISTEMA')
    ValidateWithMask = True
    Left = 377
    Top = 176
  end
  object QryAlteradorCorrecao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  T.CODALTERADOR, T.DESCRICAO'
      'FROM'
      '  TIPOALTERADOR T'
      'ORDER BY'
      'T.DESCRICAO')
    ValidateWithMask = True
    Left = 732
    Top = 9
  end
  object qryIncluiAlterador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#39'Não'#39' AS DESCRICAO, 0 AS FLGINCLUIALTERADOR  FROM DUAL UN' +
        'ION'
      'SELECT '#39'Sim'#39' AS DESCRICAO, 1 AS FLGINCLUIALTERADOR FROM DUAL'
      ''
      ' ')
    ValidateWithMask = True
    Left = 769
    Top = 6
  end
  object QryFatorAtualizacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select MESINDICE,'
      '       case when cotacao < 1 then'
      '         1'
      '       else'
      '       cotacao'
      '       end  cotacao'
      'from('
      ''
      
        'SELECT SUBSTR(CM.COTMESREF,3,4)||'#39'/'#39'||SUBSTR(CM.COTMESREF,1,2) M' +
        'ESINDICE,'
      
        '       ROUND((((SELECT (exp(sum(ln(((cm1.cotvalor/100)+1))))-1)*' +
        '100'
      '        FROM COTACAOMOEDA CM1'
      '        WHERE CM1.MOECODIGO = 7 AND'
      
        '              SUBSTR(CM1.COTMESREF,3,4)||'#39'/'#39'||SUBSTR(CM1.COTMESR' +
        'EF,1,2) BETWEEN SUBSTR(CM.COTMESREF,3,4)||'#39'/'#39'||SUBSTR(CM.COTMESR' +
        'EF,1,2)'
      
        '                                                                ' +
        '            AND (SELECT MAX(SUBSTR(CM2.COTMESREF,3,4)||'#39'/'#39'||SUBS' +
        'TR(CM2.COTMESREF,1,2))'
      
        '                                                                ' +
        '                 FROM cotacaomoeda cm2'
      
        '                                                                ' +
        '                 WHERE cm2.moecodigo = 7))/100)+1),6) cotacao'
      'FROM COTACAOMOEDA CM'
      'WHERE CM.MOECODIGO = 7 AND'
      
        '      SUBSTR(CM.COTMESREF,3,4)||'#39'/'#39'||SUBSTR(CM.COTMESREF,1,2) BE' +
        'TWEEN :COTMESREF'
      
        '                                                                ' +
        '  AND (SELECT MAX(SUBSTR(CM1.COTMESREF,3,4)||'#39'/'#39'||SUBSTR(CM1.COT' +
        'MESREF,1,2))'
      
        '                                                                ' +
        '       FROM cotacaomoeda cm1'
      
        '                                                                ' +
        '       WHERE cm1.moecodigo = 7))')
    ValidateWithMask = True
    Left = 807
    Top = 5
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COTMESREF'
        ParamType = ptUnknown
      end>
  end
  object qryAux2: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    UpdateObject = updReservaPart
    ValidateWithMask = True
    Left = 311
    Top = 150
  end
end
