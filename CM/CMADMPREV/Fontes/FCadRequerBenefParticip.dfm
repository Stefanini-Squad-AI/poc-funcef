inherited frmCadRequerBenefParticip: TfrmCadRequerBenefParticip
  Left = 302
  Top = 22
  Caption = 'Requerimento de Benefício para Participante'
  ClientHeight = 619
  ClientWidth = 801
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 801
    Height = 533
    inherited pnlMestre: TPanel
      Width = 799
      Height = 39
      BevelInner = bvRaised
      object Label12: TLabel
        Left = 6
        Top = 2
        Width = 90
        Height = 13
        Caption = 'Evento Gerador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 252
        Top = 2
        Width = 90
        Height = 13
        Caption = 'Data do Evento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblAlterador: TLabel
        Left = 479
        Top = 1
        Width = 104
        Height = 13
        Caption = 'Incluir Alteradores'
      end
      object bbtnProcurar: TBitBtn
        Left = 372
        Top = 3
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
        TabOrder = 0
        OnClick = bbtnProcurarClick
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
      object dblkpcmbEvento: TwwDBLookupCombo
        Left = 6
        Top = 15
        Width = 243
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'20'#9'Evento Gerador')
        DataField = 'IDEVENTOGERADOR'
        DataSource = ds
        LookupTable = qryEvento
        LookupField = 'IDEVENTOGERADOR'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnCloseUp = dblkpcmbEventoCloseUp
      end
      object dtDataEvento: TCMDateTimePicker
        Left = 252
        Top = 15
        Width = 112
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DTEVENTO'
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
        TabOrder = 2
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 40
      Width = 799
      Height = 492
      TabOrder = 3
      Tabs.Strings = (
        'Benefícios do Processo')
      inherited pgctrlDetalhe: TPageControl
        Top = 81
        Width = 701
        Height = 407
        TabOrder = 2
        inherited tbsDet: TTabSheet
          Caption = 'Benefícios do Processo'
          inherited dbgrdDet: TwwDBGrid
            Width = 693
            Height = 379
            Selected.Strings = (
              'IDBENEFICIO'#9'10'#9'Cód.'
              'DESCRICAO'#9'20'#9'Situação'
              'VALORTOTAL'#9'10'#9'Valor ~Total(R$)'
              'VALORATUAL'#9'10'#9'Valor do ~Benefício(R$)'
              'FLGPROVISORIO'#9'10'#9'Provisório'
              'PERCPROVISORIO'#9'10'#9'Perc.(%) ~Provisório'
              'VALORCOTAS'#9'10'#9'Valor do ~Benefício(Cotas)'
              'VLRINFINSS'#9'10'#9'RMI Informado'
              'VLRCALCINSS'#9'10'#9'RMI Calculado'
              'DATAINICIO'#9'10'#9'Data Início ~Pagto'
              'DATAFINALPREVISTA'#9'10'#9'Data Final ~Prevista'
              'DATAFINAL'#9'10'#9'Data Final ~Efetiva'
              'DATAREQUERIMENTO'#9'10'#9'Data de ~Requerimento'
              'DATAINICIOINSS'#9'10'#9'DIB INSS'
              'DATAINICIOFUND'#9'10'#9'Data de Início ~na Fundação'
              'FLGPOSSUIACOMPINSS'#9'10'#9'Possui Acomp. ~INSS'
              'NOME'#9'60'#9'Benefício'
              'FLGBENEFTEMP'#9'10'#9'Temporário'
              'FLGPAGAINSS'#9'10'#9'INSS pago'
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
            Width = 693
            Height = 379
            object Label21: TLabel
              Left = 10
              Top = 4
              Width = 60
              Height = 13
              Caption = 'Benefício '
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label15: TLabel
              Left = 329
              Top = 4
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
            object lblBenefReferencia: TLabel
              Left = 438
              Top = 4
              Width = 202
              Height = 13
              Caption = 'Benefício de Referência (Opcional)'
            end
            object lblCodFundacao: TLabel
              Left = 251
              Top = 4
              Width = 63
              Height = 13
              Caption = 'Cód. Fund.'
            end
            object dblkpcmbBeneficio: TwwDBLookupCombo
              Left = 10
              Top = 17
              Width = 233
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
              OnChange = dblkpcmbBeneficioChange
              OnCloseUp = dblkpcmbBeneficioCloseUp
              OnExit = dblkpcmbBeneficioExit
            end
            object grpInfINSS: TGroupBox
              Left = 10
              Top = 38
              Width = 675
              Height = 71
              Caption = ' Informações do Benefício no INSS '
              TabOrder = 4
              object Label4: TLabel
                Left = 9
                Top = 22
                Width = 107
                Height = 13
                Caption = 'Nº Benefício INSS'
              end
              object Label2: TLabel
                Left = 128
                Top = 22
                Width = 55
                Height = 13
                Caption = 'DIB INSS'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblValorCalcInss: TLabel
                Left = 232
                Top = 22
                Width = 84
                Height = 13
                Caption = 'RMI Calculado'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblValorInfINSS: TLabel
                Left = 352
                Top = 22
                Width = 84
                Height = 13
                Caption = 'RMI Informado'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Bevel1: TBevel
                Left = 469
                Top = 15
                Width = 3
                Height = 49
              end
              object dbedNumProcINSS: TwwDBEdit
                Left = 9
                Top = 35
                Width = 106
                Height = 21
                DataField = 'NUMPROCINSS'
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
                OnExit = dbedNumProcINSSExit
              end
              object dtInicioINSS: TCMDateTimePicker
                Left = 128
                Top = 35
                Width = 93
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATAINICIOINSS'
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
                TabOrder = 3
                OnExit = dtInicioINSSExit
              end
              object reValorCalcInss: TcmMaskEditDlg
                Left = 232
                Top = 35
                Width = 106
                Height = 21
                Hint = 
                  'Clique no botão à direita para calcular o valor do benefício de ' +
                  'referência (INSS)'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 4
                OnExit = reValorCalcInssExit
                OnBtnClick = reValorCalcInssBtnClick
                BtnGlyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000120B0000120B00001000000000000000000000000000
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
              object reValorInfINSS: TEditNum
                Left = 352
                Top = 35
                Width = 106
                Height = 21
                Hint = 'Informe o valor do INSS apresentado na carta de concessão'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 5
                Text = 'reValorInfINSS'
                OnEnter = reValorInfINSSEnter
                OnExit = reValorInfINSSExit
                IntDigits = 10
                Signal = False
                DecDigits = 2
                Numeric = True
              end
              object DbChbPossuiAcomp: TDBCheckBox
                Left = 476
                Top = 13
                Width = 148
                Height = 17
                Caption = 'Possui acompanhante'
                DataField = 'FLGPOSSUIACOMPINSS'
                DataSource = dsDet
                TabOrder = 0
                ValueChecked = '0'
                ValueUnchecked = '1'
                OnClick = DbChbPossuiAcompClick
              end
              object DbChbPossuiConvenio: TDBCheckBox
                Left = 476
                Top = 30
                Width = 148
                Height = 17
                Caption = 'Está no convênio'
                DataField = 'FLGPAGAINSS'
                DataSource = dsDet
                TabOrder = 1
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object dbrgrpPossuiAcompINSS: TDBRadioGroup
                Left = 490
                Top = 48
                Width = 140
                Height = 34
                Caption = 'Possui Acompanhante'
                Columns = 2
                DataField = 'FLGPOSSUIACOMPINSS'
                DataSource = dsDet
                Items.Strings = (
                  'Não'
                  'Sim')
                TabOrder = 6
                TabStop = True
                Values.Strings = (
                  '0'
                  '1')
                Visible = False
                OnChange = dbrgrpPossuiAcompINSSChange
              end
              object DbChbBenef142: TDBCheckBox
                Left = 476
                Top = 48
                Width = 140
                Height = 17
                Caption = 'Benefício Lei 142'
                DataField = 'BENEFLEI142'
                DataSource = dsDet
                TabOrder = 7
                ValueChecked = '1'
                ValueUnchecked = '0'
                Visible = False
              end
            end
            object dtDataRequerimento: TCMDateTimePicker
              Left = 329
              Top = 17
              Width = 99
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAREQUERIMENTO'
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
              TabOrder = 1
            end
            object dblkpcmbBenefReferencia: TwwDBLookupCombo
              Left = 438
              Top = 17
              Width = 247
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'Benefício de Referência'#9'F')
              LookupTable = qrySelecionaBenefRef
              LookupField = 'IDBENEFICIO'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object edCodFundacao: TStaticText
              Left = 252
              Top = 18
              Width = 67
              Height = 20
              AutoSize = False
              BorderStyle = sbsSunken
              TabOrder = 3
            end
            object grpInfSupl: TGroupBox
              Left = 10
              Top = 112
              Width = 675
              Height = 97
              Caption = ' Informações da Suplementação '
              TabOrder = 5
              object lblSRB: TLabel
                Left = 9
                Top = 54
                Width = 26
                Height = 13
                Hint = 'Salário Real de Benefício'
                Caption = 'SRB'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
              end
              object lblValorBenef: TLabel
                Left = 560
                Top = 54
                Width = 107
                Height = 13
                Caption = 'Valor do Benefício'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblDeficit: TLabel
                Left = 384
                Top = 54
                Width = 152
                Height = 13
                Hint = 'Salário Real de Benefício'
                Caption = 'Base de Cálculo do Déficit'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                Visible = False
              end
              object pnlNaoBenefProv: TPanel
                Left = 6
                Top = 13
                Width = 475
                Height = 40
                BevelOuter = bvNone
                TabOrder = 0
                object lblDIB: TLabel
                  Left = 3
                  Top = 4
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
                object Label8: TLabel
                  Left = 398
                  Top = 3
                  Width = 69
                  Height = 13
                  Caption = '% Retenção'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object dtInicioFund: TCMDateTimePicker
                  Left = 3
                  Top = 17
                  Width = 95
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATAINICIOFUND'
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
                  OnExit = dtInicioFundExit
                end
                object pnlBenefProv: TPanel
                  Left = 104
                  Top = 5
                  Width = 292
                  Height = 33
                  BevelOuter = bvNone
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  TabStop = True
                  object lblPercConc: TLabel
                    Left = 127
                    Top = -2
                    Width = 62
                    Height = 13
                    Caption = 'Percentual'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object lblPrazoProv: TLabel
                    Left = 204
                    Top = -2
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
                    Left = 248
                    Top = 19
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
                    Left = 189
                    Top = 19
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
                    Left = 1
                    Top = 2
                    Width = 114
                    Height = 31
                    Caption = ' Provisório '
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
                    Left = 127
                    Top = 11
                    Width = 61
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
                    Left = 205
                    Top = 11
                    Width = 42
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
                object dbedPercContrib: TRealEdit
                  Left = 398
                  Top = 16
                  Width = 70
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,00')
                  TabOrder = 1
                  WordWrap = False
                  IntDigits = 10
                  DecDigits = 4
                  NumberFormat = fNumber
                  Signal = False
                end
              end
              object reValorSRB: TcmMaskEditDlg
                Left = 9
                Top = 67
                Width = 106
                Height = 21
                Hint = 'Clique no botão à direita para calcular o valor do '
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
                OnKeyPress = reValorSRBKeyPress
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
              object reValorBeneficio: TcmMaskEditDlg
                Left = 560
                Top = 67
                Width = 106
                Height = 21
                Hint = 'Clique no botão à direita para calcular o valor do benefício'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 4
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
              object pnlBSFAB: TPanel
                Left = 127
                Top = 55
                Width = 243
                Height = 36
                TabOrder = 1
                TabStop = True
                Visible = False
                OnEnter = pnlBSFABEnter
                object lblFABTot: TLabel
                  Left = 4
                  Top = 1
                  Width = 57
                  Height = 13
                  Hint = 'Salário Real de Benefício'
                  Caption = 'Valor FAB'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ParentShowHint = False
                  ShowHint = True
                end
                object lblBSTot: TLabel
                  Left = 134
                  Top = 1
                  Width = 50
                  Height = 13
                  Hint = 'Salário Real de Benefício'
                  Caption = 'Valor BS'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ParentShowHint = False
                  ShowHint = True
                end
                object reValorFAB: TcmMaskEditDlg
                  Left = 4
                  Top = 13
                  Width = 106
                  Height = 21
                  Hint = 'Clique no botão à direita para calcular o valor do  FAB'
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 0
                  OnKeyPress = reValorFABKeyPress
                  OnBtnClick = reValorFABBtnClick
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
                object reValorBS: TcmMaskEditDlg
                  Left = 134
                  Top = 13
                  Width = 106
                  Height = 21
                  Hint = 'Clique no botão à direita para calcular o valor do  BS'
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 1
                  OnKeyPress = reValorBSKeyPress
                  OnBtnClick = reValorBSBtnClick
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
              end
              object reValorDeficit: TcmMaskEditDlg
                Left = 384
                Top = 67
                Width = 106
                Height = 21
                Hint = 'Clique no botão à direita para calcular o valor do déficit'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 3
                Visible = False
                OnKeyPress = reValorDeficitKeyPress
                OnBtnClick = reValorDeficitBtnClick
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
            end
            object PnlTempoContribuicao: TPanel
              Left = 10
              Top = 216
              Width = 675
              Height = 28
              BevelInner = bvRaised
              BevelOuter = bvLowered
              TabOrder = 7
              object Label7: TLabel
                Left = 5
                Top = 7
                Width = 204
                Height = 14
                AutoSize = False
                Caption = 'Tempo de Contribuição Informado:'
                WordWrap = True
              end
              object LbTempoContribuicao: TLabel
                Left = 210
                Top = 8
                Width = 5
                Height = 13
              end
              object lblQdeParcelas: TLabel
                Left = 216
                Top = 7
                Width = 137
                Height = 13
                Caption = 'Quantidade de Parcelas'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
            end
            object grpPagamento: TGroupBox
              Left = 10
              Top = 245
              Width = 675
              Height = 128
              Caption = ' Informações referentes ao Pagamento do Benefício '
              TabOrder = 9
              object Label16: TLabel
                Left = 193
                Top = 17
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
              object lblDataFinal: TLabel
                Left = 313
                Top = 17
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
                Left = 9
                Top = 15
                Width = 111
                Height = 13
                Caption = 'Tipo de Pagamento'
              end
              object Label1: TLabel
                Left = 9
                Top = 51
                Width = 120
                Height = 13
                Caption = 'Forma de Pagamento'
              end
              object lblAgencia: TLabel
                Left = 193
                Top = 51
                Width = 120
                Height = 13
                Caption = 'Agência para Crédito'
              end
              object lbEPP: TLabel
                Left = 9
                Top = 88
                Width = 183
                Height = 13
                Caption = 'Entidade Previdenciária Privada'
              end
              object spbEPP: TSpeedButton
                Left = 568
                Top = 101
                Width = 23
                Height = 22
                Glyph.Data = {
                  36040000424D3604000000000000360000002800000010000000100000000100
                  2000000000000004000000000000000000000000000000000000FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008484
                  840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FFFF
                  FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF000000000000000000FFFFFF00FFFFFF00FFFF
                  FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00
                  0000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF0000008400FF00
                  FF00FF00FF0084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFF
                  FF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00000084000000
                  8400FF00FF00FF00FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FF000000FFFFFF0000000000FF00FF00FF00FF00FF00FF00000084000000
                  840000008400FF00FF0084848400FFFFFF00FFFFFF00FF000000FF000000FF00
                  0000FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF000000
                  8400000084000000840000000000000000000000000000000000FFFFFF00FFFF
                  FF00FFFFFF00FF000000FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
                  FF000000840000000000FFFF0000FF00FF00FFFF0000FF00FF00000000008484
                  0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00
                  FF0000000000FFFF0000FF00FF00FFFF0000FF00FF00FFFF0000FF00FF000000
                  0000FFFFFF00FFFFFF00FFFFFF008484840084848400FF00FF00FF00FF00FF00
                  FF0000000000FF00FF00FFFF0000FF00FF00FFFF0000FF00FF00FFFF00000000
                  0000FFFFFF008484840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF0000000000FFFF0000FF00FF00FFFF0000FF00FF00FFFF0000FF00FF000000
                  000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF0000000000FF00FF00FFFF0000FF00FF00FFFF0000FF00FF00FFFF00000000
                  0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF0000000000FF00FF00FFFF0000FF00FF00FFFF000000000000FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF0000000000000000000000000000000000FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
                OnClick = spbEPPClick
              end
              object dbrgrpDataPrevista: TDBRadioGroup
                Left = 432
                Top = 7
                Width = 133
                Height = 43
                DataField = 'FLGDATAPREVISTA'
                DataSource = dsDet
                Items.Strings = (
                  'Data Prevista'
                  'Data Efetiva')
                TabOrder = 0
                Values.Strings = (
                  '1'
                  '0')
                OnClick = dbrgrpDataPrevistaClick
              end
              object dtDataInicio: TCMDateTimePicker
                Left = 193
                Top = 30
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
                ParentShowHint = False
                ShowHint = True
                ShowButton = True
                TabOrder = 2
                OnExit = dtDataInicioExit
              end
              object dtDataFinal: TCMDateTimePicker
                Left = 313
                Top = 30
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
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                ShowButton = True
                TabOrder = 3
              end
              object dblkcmbTpPgtoBenef: TwwDBLookupCombo
                Left = 9
                Top = 29
                Width = 180
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
                ParentFont = False
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
              end
              object dbrgFlgFormaPagto: TDBRadioGroup
                Left = 432
                Top = 50
                Width = 133
                Height = 43
                Caption = 'Pagto Via Folha:'
                DataField = 'FLGFORMAPAGTO'
                DataSource = dsDet
                Items.Strings = (
                  'de Benefícios'
                  'da Patrocinadora')
                TabOrder = 4
                Values.Strings = (
                  'F'
                  'R')
              end
              object dblkpcmbPortForma: TwwDBLookupCombo
                Left = 9
                Top = 65
                Width = 177
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
                ParentFont = False
                TabOrder = 5
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
              end
              object dblkpcmbAgencia: TwwDBLookupCombo
                Left = 193
                Top = 65
                Width = 233
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
                TabOrder = 6
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
              end
              object dblkcbEPP: TwwDBLookupCombo
                Left = 9
                Top = 102
                Width = 556
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'60'#9'Nome'#9'F')
                DataField = 'IDRESPONNAOREC'
                DataSource = dsDet
                LookupTable = qryEPP
                LookupField = 'IDPESSOA'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 7
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
              end
            end
            object dbedQtdeParcelas: TwwDBEdit
              Left = 369
              Top = 221
              Width = 160
              Height = 21
              DataField = 'QTDEPARCELAS'
              DataSource = dsDet
              MaxLength = 3
              TabOrder = 8
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbrgrpResgateParcelado: TDBRadioGroup
              Left = 10
              Top = 214
              Width = 207
              Height = 30
              Caption = 'Resgate Parcelado'
              Columns = 2
              DataField = 'RESGATEPARCELADO'
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
              TabOrder = 6
              TabStop = True
              Values.Strings = (
                '0'
                '1')
              OnChange = dbrgrpResgateParceladoChange
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 791
        object lblNomeBenef: TLabel [0]
          Left = 108
          Top = 6
          Width = 99
          Height = 16
          Caption = 'lblNomeBenef'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
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
            ImageIndex = 2
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnConcedeUmClick
          end
        end
      end
      inherited Dock974: TDock97
        Left = 705
        Top = 81
        Height = 407
        inherited tb97Detalhe: TToolbar97
          inherited bbtnVoltarDet: TBitBtn
            Height = 28
          end
          object bbtnElegibilidade: TBitBtn
            Left = 0
            Top = 82
            Width = 85
            Height = 28
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
            Top = 110
            Width = 85
            Height = 28
            Hint = 'Visualizar ou Informar Opções do Benefício'
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
            Top = 138
            Width = 85
            Height = 28
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
      object Panel1: TPanel
        Left = 4
        Top = 55
        Width = 791
        Height = 26
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object lblDescNome: TLabel
          Left = 145
          Top = 6
          Width = 37
          Height = 13
          Caption = 'Nome:'
        end
        object lblNome: TLabel
          Left = 225
          Top = 6
          Width = 5
          Height = 13
        end
        object lblDescMatricula: TLabel
          Left = 8
          Top = 6
          Width = 59
          Height = 13
          Caption = 'Matrícula:'
        end
        object lblMatricula: TLabel
          Left = 69
          Top = 6
          Width = 5
          Height = 13
        end
      end
    end
    object DbLAlterador: TwwDBLookupCombo
      Left = 481
      Top = 15
      Width = 67
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'4'#9'Descição'#9'F')
      LookupTable = qryIncluiAlterador
      LookupField = 'FLGINCLUIALTERADOR'
      Options = [loColLines, loRowLines, loTitles]
      ImeName = '268'
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      OnKeyPress = DbLAlteradorKeyPress
    end
    object DBGrid1: TDBGrid
      Left = 108
      Top = 40
      Width = 396
      Height = 74
      DataSource = DSTESTE
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Visible = False
    end
  end
  inherited Dock972: TDock97
    Width = 801
    object lblNumProcesso: TLabel [0]
      Left = 435
      Top = 2
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
      Left = 435
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
      inherited sbtnInserir: TToolbarButton97
        Left = 240
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 0
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 120
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 60
      end
      object sbtnConceder: TToolbarButton97
        Left = 180
        Top = 0
        Width = 60
        Height = 41
        Hint = 'Conceder todos os benefícios do processo'
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
        ParentShowHint = False
        ShowHint = True
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
    Top = 580
    Width = 801
    inherited tb97Fundo: TToolbar97
      Left = 259
      DockPos = 259
    end
    inherited TB97oKCancelar: TToolbar97
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
    Left = 513
    Top = 65522
    TargetsData = (
      1
      3
      (
        'TRealEdit'
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
    OnStateChange = dsDetStateChange
    Left = 485
    Top = 65533
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 455
    Top = 8
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
    Left = 526
    Top = 77
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'EL.MATRICULA'
      'PP.INSCRICAONUMERO'
      'PES.NOME'
      'BF.NOME '
      'P.DTEVENTO'
      'P.NUMEROPROCESSO'
      'EL.IDPESSOA'
      'EL.DATAADMISSAO')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'C'
      'D'
      'N'
      'N'
      'D')
    Descricao.Strings = (
      'Matrícula'
      'Nº de Inscrição'
      'Participante Titular'
      'Benefício Requerido'
      'Data do Evento'
      'Nº do Processo'
      ''
      '')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'S'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROCESSOBENEF P'
      'BENEFBFCIARIO B'
      'ELEGPATRO EL'
      'PARTPREVPLAN PP'
      'PESSOA PES'
      'BENEFPLANPREV BPL'
      'BENEFICIO BF')
    CamposChave.Strings = (
      'P.NUMEROPROCESSO'
      'B.IDTITULAR'
      'B.SEQPROPOSTA'
      'B.IDPESSJUR'
      'B.IDPLANOPREV')
    Filtro.Strings = (
      'P.NUMEROPROCESSO = B.NUMEROPROCESSO'
      'EL.IDPESSOA = B.IDTITULAR'
      'EL.IDPESSJUR = B.IDPESSJUR'
      'B.IDPESSJUR = PP.IDPESSJUR'
      'B.IDPLANOPREV = PP.IDPLANOPREV'
      'B.IDTITULAR = PP.IDPESSOA'
      'B.SEQPROPOSTA = PP.SEQPROPOSTA'
      'B.IDTITULAR = PES.IDPESSOA'
      'BPL.IDPLANOPREV = B.IDPLANOPREV'
      'BPL.IDBENEFICIO = B.IDBENEFICIO'
      'BF.IDBENEFICIO = B.IDBENEFICIO'
      
        '((BPL.FLGREFERENCIA = 0) OR ((BPL.FLGREFERENCIA = 1) AND (BPL.FL' +
        'GPAGAINSS = 1) ) ) '
      'B.IDPESSOA = B.IDTITULAR')
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
      '13'
      '13'
      '30'
      '30'
      '10'
      '17'
      '10'
      '18')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    UsaDistinct = True
    LookupSQL.Strings = (
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
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 468
    Top = 67
  end
  inherited ImlPadrao: TImageList
    Left = 782
    Top = 65534
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    OnFind = CmeCadastroFind
    Left = 195
    Top = 84
  end
  inherited qry: TwwQuery
    BeforePost = qryBeforePost
    SQL.Strings = (
      'SELECT P.NUMEROPROCESSO, P.IDEVENTOGERADOR, '
      
        '       P.DTEVENTO, P.DTDIREITO, P.DTREGISTRO,        P.IDSITPROC' +
        'ESSO, S.DESCRICAO'
      'FROM   PROCESSOBENEF P, SITBENEFICIO S'
      'WHERE  P.NUMEROPROCESSO = :NUMEROPROCESSO'
      'AND    P.IDSITPROCESSO = S.IDSITBENEFICIO')
    Left = 554
    Top = 29
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 379
    Top = 67
  end
  object qryEvento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDEVENTOGERADOR, NOME, FLGRISCO, FLGINTERNO'
      'FROM   EVENTOGERADOR'
      'WHERE  IDEVENTOGERADOR = :IDEVENTOGERADOR'
      'ORDER BY NOME'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 889
    Top = 456
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
      end>
  end
  object qryBeneficio: TwwQuery
    AfterScroll = qryBeneficioAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  B.IDBENEFICIO, B.TIPOBENEFICIO,'
      
        '        DECODE(BG.IDBENEFICIO, NULL, B.NOME, '#39'Grupo '#39'||G.DESCRIC' +
        'AO) AS NOME ,'
      '        B.NOME AS NOMEBENEFICIO,'
      
        '        DECODE(BG.IDGRUPOBENEF, NULL, -1, BG.IDGRUPOBENEF) AS ID' +
        'GRUPOBENEF,'
      '        B.FLGDESTBENEF, B.IDEVENTOGERADOR,'
      '        B.FLGRESGATE, B.FLGBENEFOBRIGATO, B.NUMORDEMEVENTO,'
      '        B.IDTPPAGTOBENEFIC, B.PRAZOPROVISORIO,'
      '        --sol160185'
      '        BP.FLGOPCAOTEXTO,'
      
        '        BP.NOMECAMPOTEXTO1,    BP.NOMECAMPOTEXTO2,    BP.NOMECAM' +
        'POTEXTO3,        BP.NUMOPCOESTEXTO,   BP.FLGEDITAOPTEXTO1,      ' +
        '       BP.FLGEDITAOPTEXTO2,'
      
        '        BP.FLGEDITAOPTEXTO3, BP.FLGOBRIGAOPTEXTO1, BP. FLGOBRIGA' +
        'OPTEXTO2, BP.FLGOBRIGAOPTEXTO3,'
      '        --sol160185 '
      '        BP.IDREGRACALCULO,  BP.IDREGRASIMULA, BP.FLGPAGAINSS,'
      
        '        BP.IDREGRAPAGAMENTO, BP.IDREGRAELEGIBILI, BP.FLGACEITAOP' +
        'CAO,        BP.NOMEVALORBASE1, BP.NOMEVALORBASE2, BP.NOMEVALORBA' +
        'SE3,'
      
        '        BP.NUMOPCOES,BP.FLGEDITAOP1, BP.FLGEDITAOP2, BP.FLGEDITA' +
        'OP3,'
      
        '        BP.IDREGRAINICIO, BP.IDREGRAFIM, BP.IDREGRACALCINSS, BP.' +
        'IDBENEFREF,'
      
        '        BP.FLGQUITAPREVIDEN, BP.FLGQUITAEMPRESTI, BP.FLGQUITAASS' +
        'ISTEN,'
      '        BP.INDICEREAJBENEF, BP.FLGCALCTODOMES,'
      '        BP.IDREGRAPRIMPAGTO, BP.IDREGRAULTPAGTO,'
      
        '        BP.CODPORTFORMA,    BP.FLGOBRIGANPROC, B.FLGUSADTPREVISA' +
        'O,'
      
        '        BP.FLGREFERENCIA,  BP.FLGOBRIGAOP1, BP.FLGOBRIGAOP2, BP.' +
        'FLGOBRIGAOP3,'
      
        '        BP.FLGACEITAZERO, B.CODBENEFICIO, PL.FLGTIPOGRAVAINSS, B' +
        'P.IDRGPLANPREVCONT,'
      '        BP.FLGPERMITEQUITAR, '
      
        '        DECODE(B.IDEVENTOGERADOR,11,1,2,1,7,1,8,1,370,1,0) AS FL' +
        'GHABDATAFIM  /* SIG 132064 */'
      
        'FROM   PLANPREV PL, BENEFICIO B, BENEFPLANPREV BP, BENEFXGRUPO B' +
        'G, GRUPOBENEF G'
      'WHERE  B.IDEVENTOGERADOR = :IDEVENTOGERADOR'
      'AND    BP.IDPLANOPREV    = :IDPLANOPREV'
      'AND    B.FLGDESTBENEF    <> '#39'B'#39
      'AND    BP.FLGREFERENCIA = 0'
      'AND    BP.IDBENEFICIO   = B.IDBENEFICIO'
      'AND    BP.IDPLANOPREV   = BG.IDPLANOPREV(+)'
      'AND    BP.IDBENEFICIO   = BG.IDBENEFICIO(+)'
      'AND    BG.IDGRUPOBENEF  =  G.IDGRUPOBENEF(+)'
      'AND    ((1 = BG.FLGPRINCIPAL)  OR (BG.FLGPRINCIPAL IS NULL ))'
      'AND    PL.IDPLANOPREV   = BP.IDPLANOPREV'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ControlType.Strings = (
      'FLGBENEFOBRIGATO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 600
    Top = 437
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryTpPgtoBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTPPAGTOBENEFIC, NOME'
      'FROM TPPAGTOBENEFICIO')
    ValidateWithMask = True
    Left = 614
    Top = 475
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update BENEFBFCIARIO'
      'set'
      '  IDBENEFREFEREN = :IDBENEFREFEREN,'
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
      '  DATACONCESSAO = :DATACONCESSAO,'
      '  FLGPROVISORIO = :FLGPROVISORIO,'
      '  PERCPROVISORIO = :PERCPROVISORIO,'
      '  PRAZOPROVISORIO = :PRAZOPROVISORIO,'
      '  ULTMESREAJUSTE = :ULTMESREAJUSTE,'
      '  ULTVALORATUALREAJ = :ULTVALORATUALREAJ,'
      '  IDAGENCIARESGATE = :IDAGENCIARESGATE,'
      '  DATAFINALPREVISTA = :DATAFINALPREVISTA,'
      '  FLGDATAPREVISTA = :FLGDATAPREVISTA,'
      '  FLGTIPOINSS = :FLGTIPOINSS,'
      '  DIBBENEFANT = :DIBBENEFANT,'
      '  VALORBENEFANT = :VALORBENEFANT,'
      '  VALORBINSSANT1 = :VALORBINSSANT1,'
      '  VALORBINSSANT2 = :VALORBINSSANT2,'
      '  VALORBINSSANT3 = :VALORBINSSANT3,'
      '  VALORTOTAL = :VALORTOTAL,'
      '  FLGPOSSUIACOMPINSS = :FLGPOSSUIACOMPINSS,'
      '  FLGBENEFMIN = :FLGBENEFMIN,'
      '  VALORSRB = :VALORSRB,'
      '  FLGMOVEURESERVA = :FLGMOVEURESERVA,'
      '  IDPLANPREVCONTAB = :IDPLANPREVCONTAB,'
      '  FONTEPAGADORA = :FONTEPAGADORA,'
      '  PLACONTAD = :PLACONTAD,'
      '  PLACONTAC = :PLACONTAC,'
      '  VALORNADIB = :VALORNADIB,'
      '  FLGPAGAINSS = :FLGPAGAINSS,'
      '  PERCRETENCAO = :PERCRETENCAO,'
      '  SALDOCONTADIB =:SALDOCONTADIB,'
      '  RESERVADIB=:RESERVADIB,'
      '  INDICEDIB=:INDICEDIB,'
      '  IDBENEFICIO = :IDBENEFICIO,'
      '  RESGATEPARCELADO = :RESGATEPARCELADO,'
      '  QTDEPARCELAS    = :QTDEPARCELAS,'
      '  VALORBASE1 = :VALORBASE1,'
      '  VALORBASE2 = :VALORBASE2, '
      '  VALORBASE3 = :VALORBASE3, '
      '  CAMPOTEXTO1 = :CAMPOTEXTO1, '
      '  CAMPOTEXTO2 = :CAMPOTEXTO2, '
      '  CAMPOTEXTO3 = :CAMPOTEXTO3,'
      '  BSDIB = :BSDIB,'
      '  FABDIB = :FABDIB,'
      '  BENEFLEI142  =  :BENEFLEI142,'
      '  IDPERFILINVEST = :IDPERFILINVEST'
      'where'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPLANOORIGEM = :OLD_IDPLANOORIGEM and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO'
      ' '
      ' '
      ' '
      ' ')
    InsertSQL.Strings = (
      'insert into BENEFBFCIARIO'
      '  (NUMEROPROCESSO, IDPESSJUR, IDPLANOPREV, IDPLANOORIGEM,'
      'IDTITULAR, IDPESSOA,'
      '   SEQPROPOSTA, IDBENEFICIO, IDBENEFREFEREN, CODPORTFORMA,'
      'IDSITBENEFICIO,'
      '   IDDEPENDENCIA, IDTPPAGTOBENEFIC, VALORATUAL,'
      'DATAREQUERIMENTO, DATAINICIO,'
      '   DATAFINAL, FLGFORMAPAGTO, VALORCALCULADO, DATAULTREAJUSTE,'
      'VLRCALCINSS,'
      '   VLRINFINSS, DATAINICIOINSS, NUMPROCINSS, DATAINICIOFUND,'
      'VALORCOTAS,'
      '   DATACONCESSAO, FLGPROVISORIO, PERCPROVISORIO,'
      'PRAZOPROVISORIO, ULTMESREAJUSTE,'
      '   ULTVALORATUALREAJ, IDAGENCIARESGATE, DATAFINALPREVISTA,'
      'FLGDATAPREVISTA,'
      '   FLGTIPOINSS, DIBBENEFANT, VALORBENEFANT, VALORBINSSANT1,'
      'VALORBINSSANT2,'
      '   VALORBINSSANT3, VALORTOTAL, FLGPOSSUIACOMPINSS, FLGBENEFMIN,'
      'VALORSRB, FLGMOVEURESERVA, IDPLANPREVCONTAB, FONTEPAGADORA,  '
      'PLACONTAD,PLACONTAC,'
      'VALORNADIB, FLGPAGAINSS, PERCRETENCAO, '
      'SALDOCONTADIB,RESERVADIB,INDICEDIB, RESGATEPARCELADO,  '
      'QTDEPARCELAS'
      ''
      ',VALORBASE1, VALORBASE2, VALORBASE3, CAMPOTEXTO1, CAMPOTEXTO2, '
      'CAMPOTEXTO3,'
      
        'VLRBSTOTAL, VLRBSATUAL, VLRFABTOTAL, VLRFABATUAL, VLRBASEDEFICIT' +
        ', '
      'BSDIB, FABDIB, BENEFLEI142'
      ')'
      'values'
      '  (:NUMEROPROCESSO, :IDPESSJUR, :IDPLANOPREV, :IDPLANOORIGEM,'
      ':IDTITULAR,'
      '   :IDPESSOA, :SEQPROPOSTA, :IDBENEFICIO, :IDBENEFREFEREN,'
      ':CODPORTFORMA,'
      
        '   :IDSITBENEFICIO, :IDDEPENDENCIA, :IDTPPAGTOBENEFIC, :VALORATU' +
        'AL,'
      ':DATAREQUERIMENTO,'
      '   :DATAINICIO, :DATAFINAL, :FLGFORMAPAGTO, :VALORCALCULADO,'
      ':DATAULTREAJUSTE,'
      '   :VLRCALCINSS, :VLRINFINSS, :DATAINICIOINSS, :NUMPROCINSS,'
      ':DATAINICIOFUND,'
      '   :VALORCOTAS, :DATACONCESSAO, :FLGPROVISORIO, :PERCPROVISORIO,'
      ':PRAZOPROVISORIO,'
      '   :ULTMESREAJUSTE, :ULTVALORATUALREAJ, :IDAGENCIARESGATE,'
      ':DATAFINALPREVISTA,'
      '   :FLGDATAPREVISTA, :FLGTIPOINSS, :DIBBENEFANT, :VALORBENEFANT,'
      ':VALORBINSSANT1,'
      '   :VALORBINSSANT2, :VALORBINSSANT3, :VALORTOTAL,'
      ':FLGPOSSUIACOMPINSS,'
      '   :FLGBENEFMIN, :VALORSRB, :FLGMOVEURESERVA, :IDPLANPREVCONTAB,'
      ':FONTEPAGADORA   , :PLACONTAD, :PLACONTAC, :VALORNADIB, '
      ':FLGPAGAINSS, :PERCRETENCAO, '
      ':SALDOCONTADIB,:RESERVADIB,:INDICEDIB, :RESGATEPARCELADO,   '
      ':QTDEPARCELAS'
      ', :VALORBASE1, :VALORBASE2, :VALORBASE3, :CAMPOTEXTO1, '
      ':CAMPOTEXTO2, :CAMPOTEXTO3,'
      ':VLRBSTOTAL, :VLRBSATUAL, :VLRFABTOTAL, :VLRFABATUAL, '
      ':VLRBASEDEFICIT, :BSDIB, :FABDIB, :BENEFLEI142 '
      ')'
      ' '
      ' '
      ' '
      ' ')
    DeleteSQL.Strings = (
      'delete from BENEFBFCIARIO'
      'where'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPLANOORIGEM = :OLD_IDPLANOORIGEM and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO')
    Left = 17
    Top = 269
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    AfterInsert = qryDetAfterInsert
    AfterEdit = qryDetAfterEdit
    BeforePost = qryDetBeforePost
    AfterScroll = qryDetAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '--CONSULTA AJSUTADA'
      
        'SELECT BF.NUMEROPROCESSO,   BF.IDPESSJUR,      BF.IDPLANOPREV, B' +
        'F.IDPLANOORIGEM,'
      '       BF.IDTITULAR,        BF.IDPESSOA,       BF.SEQPROPOSTA,'
      '       BF.IDBENEFICIO,      BF.IDBENEFREFEREN, BF.FLGPAGAINSS,'
      '       BF.CODPORTFORMA,     BF.IDSITBENEFICIO, BF.IDDEPENDENCIA,'
      
        '       BF.IDTPPAGTOBENEFIC, BF.VALORATUAL,     BF.DATAREQUERIMEN' +
        'TO,'
      '       BF.DATAINICIO,       BF.DATAFINAL,      BF.FLGFORMAPAGTO,'
      '       BF.VALORCALCULADO,   BF.DATAULTREAJUSTE,'
      
        '       BF.VLRCALCINSS,      BF.VLRINFINSS,     BF.DATAINICIOINSS' +
        ','
      '       BF.NUMPROCINSS,      BF.DATAINICIOFUND, BF.VALORCOTAS,'
      
        '       BF.DATACONCESSAO,    BF.FLGPROVISORIO,  BF.PERCPROVISORIO' +
        ','
      
        '       BF.PRAZOPROVISORIO,  BF.ULTMESREAJUSTE, BF.ULTVALORATUALR' +
        'EAJ,'
      '       BF.IDAGENCIARESGATE, BF.DATAFINALPREVISTA,'
      '       BF.FLGDATAPREVISTA,  BF.FLGTIPOINSS,    BF.DIBBENEFANT,'
      
        '       BF.VALORBENEFANT,    BF.VALORBINSSANT1, BF.VALORBINSSANT2' +
        ', BF.VALORBINSSANT3,'
      
        '       BF.VALORTOTAL,       BF.FLGPOSSUIACOMPINSS, BF.FLGBENEFMI' +
        'N,'
      '       BF.VALORSRB,         BF.FONTEPAGADORA,  BF.VALORNADIB,'
      '       BPL.FLGREFERENCIA,   B.Flgpeculio,'
      '       B.NUMORDEMEVENTO,    B.NOME,            S.DESCRICAO,'
      '       -- Thiago Melo'
      '       B.FLGRESGATE,'
      '       --BPART.VALORBASE1,  BPART.VALORBASE2,'
      '       --BPART.VALORBASE3,'
      ''
      '       BF.VALORBASE1,  BF.VALORBASE2, BF.VALORBASE3,'
      '       -- Thiago Melo'
      '      --160185'
      '      -- Thiago Melo'
      '      --BPART.CAMPOTEXTO1, BPART.CAMPOTEXTO2, BPART.CAMPOTEXTO3,'
      '      BF.CAMPOTEXTO1, BF.CAMPOTEXTO2, BF.CAMPOTEXTO3,'
      '      -- Thiago Melo'
      '      --160185'
      '       PT.IDRUBSALAUXDOENCA, BPL.FLGACEITAZERO,'
      
        '       BPL.FLGMOVRESAPOSCONC, BF.FLGMOVEURESERVA, BF.IDPLANPREVC' +
        'ONTAB, BF.PLACONTAD, BF.PLACONTAC ,'
      '       -1 AS USUARIOALT, B.FLGBENEFTEMP,'
      '       BTP.IDRESPONNAOREC,'
      '       0 AS IDCALCULO,'
      '      BF.PERCRETENCAO,'
      '      B.TIPOBENEFICIO,  BF.TRGUSERINCLUSAO,'
      
        '      BPL.IDREGRAPAGAMENTO,BF.SALDOCONTADIB,BF.RESERVADIB,BF.IND' +
        'ICEDIB,'
      '      BPL.FLGISENTOIRRF, BF.FLGISENTOIRRFANT,'
      '      BF.QTDEPARCELAS,'
      '      BF.RESGATEPARCELADO,'
      '      BPL.IDRUBRICA,'
      '      --253577'
      '      BF.VLRBSTOTAL,'
      '      BF.VLRBSATUAL,'
      '      BF.VLRFABTOTAL,'
      '      BF.VLRFABATUAL,'
      '      BF.VLRBASEDEFICIT,'
      '      BF.BSDIB,'
      '      BF.FABDIB'
      '      --253577'
      '     ,BF.BENEFLEI142  -- SIG23985'
      '     ,BF.IDPERFILINVEST      --SIG55933'
      '  FROM BENEFBFCIARIO   BF,'
      '       BENEFICIO       B,'
      '       BENEFPLANPREV   BPL,'
      '       SITBENEFICIO    S,'
      '       BENEFPLANOPART  BPART,'
      '       PATRO           PT,'
      '       BFCIARIOTITPLAN BTP'
      ' WHERE BF.NUMEROPROCESSO = :NUMEROPROCESSO'
      '   AND B.IDBENEFICIO = BF.IDBENEFICIO'
      '   AND BPL.IDBENEFICIO = BF.IDBENEFICIO'
      '   AND BPL.IDPLANOPREV = BF.IDPLANOPREV'
      '   AND BF.IDPESSJUR = PT.IDPESSOA'
      '   AND ((BPL.FLGREFERENCIA = 0) OR'
      '       ((BPL.FLGREFERENCIA = 1) AND (BPL.FLGPAGAINSS = 1)))'
      '   AND BF.IDSITBENEFICIO = S.IDSITBENEFICIO'
      '   AND BF.IDTITULAR = BPART.IDPESSOA(+)'
      '   AND BF.SEQPROPOSTA = BPART.SEQPROPOSTA(+)'
      '   AND BF.IDPESSJUR = BPART.IDPESSJUR(+)'
      '   AND BF.IDPLANOPREV = BPART.IDPLANOPREV(+)'
      '   AND BF.IDBENEFICIO = BPART.IDBENEFICIO(+)'
      '   AND BTP.IDBENEFICIO = BF.IDBENEFICIO'
      '   AND BTP.IDPLANOPREV = BF.IDPLANOPREV'
      '   AND BTP.IDPESSJUR = BF.IDPESSJUR'
      '   AND BTP.IDPESSOA = BF.IDPESSOA'
      '   AND BTP.IDTITULAR = BF.IDTITULAR'
      '   AND BTP.IDPLANOORIGEM = BF.IDPLANOORIGEM'
      '   AND BTP.SEQPROPOSTA = BF.SEQPROPOSTA'
      '   AND BTP.IDRESPONSAVEL = BF.IDTITULAR'
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
    UpdateObject = updDet
    ControlType.Strings = (
      'FLGPROVISORIO;CheckBox;1;0'
      'FLGPOSSUIACOMPINSS;CheckBox;1;0'
      'FLGBENEFTEMP;CheckBox;1;0'
      'FLGPAGAINSS;CheckBox;1;0')
    PictureMasks.Strings = (
      
        'PERCPROVISORIO'#9'{{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-' +
        ']#[#][#]]],({{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#' +
        '][#]]]),[-]{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#]' +
        '[#]]]}'#9'T'#9'F')
    ValidateWithMask = True
    Left = 64
    Top = 269
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end>
    object qryDetIDBENEFICIO: TFloatField
      DisplayLabel = 'Cód.'
      DisplayWidth = 10
      FieldName = 'IDBENEFICIO'
    end
    object qryDetDESCRICAO: TStringField
      DisplayLabel = 'Situação'
      DisplayWidth = 20
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object qryDetVALORTOTAL: TFloatField
      DisplayLabel = 'Valor ~Total(R$)'
      DisplayWidth = 10
      FieldName = 'VALORTOTAL'
    end
    object qryDetVALORATUAL: TFloatField
      DisplayLabel = 'Valor do ~Benefício(R$)'
      DisplayWidth = 10
      FieldName = 'VALORATUAL'
    end
    object qryDetFLGPROVISORIO: TFloatField
      DisplayLabel = 'Provisório'
      DisplayWidth = 10
      FieldName = 'FLGPROVISORIO'
    end
    object qryDetPERCPROVISORIO: TFloatField
      DisplayLabel = 'Perc.(%) ~Provisório'
      DisplayWidth = 10
      FieldName = 'PERCPROVISORIO'
    end
    object qryDetVALORCOTAS: TFloatField
      DisplayLabel = 'Valor do ~Benefício(Cotas)'
      DisplayWidth = 10
      FieldName = 'VALORCOTAS'
    end
    object qryDetVLRINFINSS: TFloatField
      DisplayLabel = 'RMI Informado'
      DisplayWidth = 10
      FieldName = 'VLRINFINSS'
    end
    object i: TFloatField
      DisplayLabel = 'RMI Calculado'
      DisplayWidth = 10
      FieldName = 'VLRCALCINSS'
    end
    object qryDetDATAINICIO: TDateTimeField
      DisplayLabel = 'Data Início ~Pagto'
      DisplayWidth = 10
      FieldName = 'DATAINICIO'
    end
    object qryDetDATAFINALPREVISTA: TDateTimeField
      DisplayLabel = 'Data Final ~Prevista'
      DisplayWidth = 10
      FieldName = 'DATAFINALPREVISTA'
    end
    object qryDetDATAFINAL: TDateTimeField
      DisplayLabel = 'Data Final ~Efetiva'
      DisplayWidth = 10
      FieldName = 'DATAFINAL'
    end
    object qryDetDATAREQUERIMENTO: TDateTimeField
      DisplayLabel = 'Data de ~Requerimento'
      DisplayWidth = 10
      FieldName = 'DATAREQUERIMENTO'
    end
    object qryDetDATAINICIOINSS: TDateTimeField
      DisplayLabel = 'DIB INSS'
      DisplayWidth = 10
      FieldName = 'DATAINICIOINSS'
    end
    object qryDetDATAINICIOFUND: TDateTimeField
      DisplayLabel = 'Data de Início ~na Fundação'
      DisplayWidth = 10
      FieldName = 'DATAINICIOFUND'
    end
    object qryDetFLGPOSSUIACOMPINSS: TFloatField
      DisplayLabel = 'Possui Acomp. ~INSS'
      DisplayWidth = 10
      FieldName = 'FLGPOSSUIACOMPINSS'
    end
    object qryDetNOME: TStringField
      DisplayLabel = 'Benefício'
      DisplayWidth = 60
      FieldName = 'NOME'
      Size = 60
    end
    object qryDetFLGBENEFTEMP: TFloatField
      DisplayLabel = 'Temporário'
      DisplayWidth = 10
      FieldName = 'FLGBENEFTEMP'
    end
    object qryDetFLGPAGAINSS: TFloatField
      DisplayLabel = 'INSS pago'
      DisplayWidth = 10
      FieldName = 'FLGPAGAINSS'
    end
    object qryDetFLGACEITAZERO: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGACEITAZERO'
      Visible = False
    end
    object qryDetNUMEROPROCESSO: TFloatField
      FieldName = 'NUMEROPROCESSO'
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
    object qryDetIDPLANOORIGEM: TFloatField
      FieldName = 'IDPLANOORIGEM'
      Visible = False
    end
    object qryDetIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Visible = False
    end
    object qryDetIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryDetSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
      Visible = False
    end
    object qryDetIDBENEFREFEREN: TFloatField
      FieldName = 'IDBENEFREFEREN'
      Visible = False
    end
    object qryDetCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Visible = False
    end
    object qryDetIDSITBENEFICIO: TFloatField
      FieldName = 'IDSITBENEFICIO'
      Visible = False
    end
    object qryDetIDDEPENDENCIA: TStringField
      FieldName = 'IDDEPENDENCIA'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object qryDetIDTPPAGTOBENEFIC: TFloatField
      FieldName = 'IDTPPAGTOBENEFIC'
      Visible = False
    end
    object qryDetFLGFORMAPAGTO: TStringField
      FieldName = 'FLGFORMAPAGTO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryDetVALORCALCULADO: TFloatField
      FieldName = 'VALORCALCULADO'
      Visible = False
    end
    object qryDetDATAULTREAJUSTE: TDateTimeField
      FieldName = 'DATAULTREAJUSTE'
      Visible = False
    end
    object qryDetNUMPROCINSS: TStringField
      FieldName = 'NUMPROCINSS'
      Visible = False
      EditMask = '#########/#;0;_'
      Size = 15
    end
    object qryDetDATACONCESSAO: TDateTimeField
      FieldName = 'DATACONCESSAO'
      Visible = False
    end
    object qryDetPRAZOPROVISORIO: TFloatField
      FieldName = 'PRAZOPROVISORIO'
      Visible = False
    end
    object qryDetULTMESREAJUSTE: TStringField
      FieldName = 'ULTMESREAJUSTE'
      Visible = False
      FixedChar = True
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
    object qryDetFLGDATAPREVISTA: TFloatField
      FieldName = 'FLGDATAPREVISTA'
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
    object qryDetFLGBENEFMIN: TFloatField
      FieldName = 'FLGBENEFMIN'
      Visible = False
    end
    object qryDetVALORSRB: TFloatField
      FieldName = 'VALORSRB'
      Visible = False
    end
    object qryDetFLGREFERENCIA: TFloatField
      FieldName = 'FLGREFERENCIA'
      Visible = False
    end
    object qryDetNUMORDEMEVENTO: TFloatField
      FieldName = 'NUMORDEMEVENTO'
      Visible = False
    end
    object qryDetFLGRESGATE: TFloatField
      FieldName = 'FLGRESGATE'
      Visible = False
    end
    object qryDetIDRUBSALAUXDOENCA: TFloatField
      FieldName = 'IDRUBSALAUXDOENCA'
      Visible = False
    end
    object qryDetFLGMOVRESAPOSCONC: TFloatField
      FieldName = 'FLGMOVRESAPOSCONC'
      Visible = False
    end
    object qryDetFLGMOVEURESERVA: TFloatField
      FieldName = 'FLGMOVEURESERVA'
      Visible = False
    end
    object qryDetIDPLANPREVCONTAB: TFloatField
      FieldName = 'IDPLANPREVCONTAB'
      Visible = False
    end
    object qryDetUSUARIOALT: TFloatField
      FieldName = 'USUARIOALT'
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
    object qryDetVALORNADIB: TFloatField
      FieldName = 'VALORNADIB'
      Visible = False
    end
    object qryDetIDRESPONNAOREC: TFloatField
      FieldName = 'IDRESPONNAOREC'
      Visible = False
    end
    object qryDetIDCALCULO: TFloatField
      FieldName = 'IDCALCULO'
      Visible = False
    end
    object qryDetIDREGRAPAGAMENTO: TFloatField
      FieldName = 'IDREGRAPAGAMENTO'
      Visible = False
    end
    object qryDetSALDOCONTADIB: TFloatField
      FieldName = 'SALDOCONTADIB'
      Visible = False
    end
    object qryDetRESERVADIB: TFloatField
      FieldName = 'RESERVADIB'
      Visible = False
    end
    object qryDetINDICEDIB: TFloatField
      FieldName = 'INDICEDIB'
      Visible = False
    end
    object qryDetPERCRETENCAO: TFloatField
      FieldName = 'PERCRETENCAO'
      Visible = False
    end
    object qryDetFLGPECULIO: TFloatField
      FieldName = 'FLGPECULIO'
      Visible = False
    end
    object qryDetQTDEPARCELAS: TFloatField
      FieldName = 'QTDEPARCELAS'
      Visible = False
      OnValidate = qryDetQTDEPARCELASValidate
    end
    object qryDetRESGATEPARCELADO: TFloatField
      FieldName = 'RESGATEPARCELADO'
      Visible = False
      OnValidate = qryDetRESGATEPARCELADOValidate
    end
    object qryDetIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
      Visible = False
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
    object qryDetFLGISENTOIRRF: TFloatField
      FieldName = 'FLGISENTOIRRF'
      Visible = False
    end
    object qryDetFLGISENTOIRRFANT: TFloatField
      FieldName = 'FLGISENTOIRRFANT'
      Visible = False
    end
    object qryDetVALORBASE1: TFloatField
      FieldName = 'VALORBASE1'
    end
    object qryDetVALORBASE2: TFloatField
      FieldName = 'VALORBASE2'
    end
    object qryDetVALORBASE3: TFloatField
      FieldName = 'VALORBASE3'
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
    object qryDetVLRBSTOTAL: TFloatField
      FieldName = 'VLRBSTOTAL'
    end
    object qryDetVLRBSATUAL: TFloatField
      FieldName = 'VLRBSATUAL'
    end
    object qryDetVLRFABTOTAL: TFloatField
      FieldName = 'VLRFABTOTAL'
    end
    object qryDetVLRFABATUAL: TFloatField
      FieldName = 'VLRFABATUAL'
    end
    object qryDetVLRBASEDEFICIT: TFloatField
      FieldName = 'VLRBASEDEFICIT'
    end
    object qryDetBSDIB: TFloatField
      FieldName = 'BSDIB'
    end
    object qryDetFABDIB: TFloatField
      FieldName = 'FABDIB'
    end
    object qryDetBENEFLEI142: TFloatField
      FieldName = 'BENEFLEI142'
    end
    object qryDetIDPERFILINVEST: TFloatField
      FieldName = 'IDPERFILINVEST'
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 665
    Top = 100
  end
  object MontaSelectPart: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PARTPREVPLAN.INSCRICAODATA'
      'PLANPREV.NOME'
      'PATRO.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'D'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'N° de Inscrição'
      'Data de Inscrição'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
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
      'PLANPREV')
    CamposChave.Strings = (
      'ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSJUR'
      'PLANPREV.IDPLANOPREV'
      'PESSOA.NOME'
      'PATRO.NOME AS PATRO'
      'PLANPREV.NOME AS PLANO'
      'ELEGPATRO.MATRICULA'
      'PARTPREVPLAN.SEQPROPOSTA'
      'ELEGPATRO.DATAADMISSAO')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSOA = PARTPREVPLAN.IDPESSOA'
      'ELEGPATRO.IDPESSJUR = PARTPREVPLAN.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      'PATRO.IDPESSOA = ELEGPATRO.IDPESSJUR')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '10'
      '10'
      '60'
      '60')
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
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
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
    Left = 465
    Top = 35
  end
  object qryTitular: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME, P1.NOME AS NOMEPATRO, PL.NOME AS NOMEPLANO,'
      '       PF.FLGISENTOIRRF,'
      '       PF.DATANASC, PF.DATAMORTE,'
      
        '       EL.MATRICULA, EL.DATAADMISSAO, EL.DATADEMISSAO, EL.TEMPOS' +
        'ERVANTERIOR,'
      
        '       EL.TEMPONAOCREDITADO, EL.TEMPOSITESPECIAL, EL.NIVEL, EL.I' +
        'DSITFUNC,'
      
        '       EL.TEMPOSERVTOTAL,   EL.TEMPOSERVTOTMES, EL.TEMPOSERVTOTD' +
        'IA,'
      
        '       PP.INSCRICAONUMERO, PP.INSCRICAODATA, PP.DATACANCELAMENTO' +
        ', PP.FLGDEVEEMPRESTIMO,'
      '       PP.FLGDEVEASSISTENC,'
      '       PP.FLGDEVEPREVIDENC, PP.IDSITPART, PP.IDSITPLANOPREV,'
      
        '       SPART.DESCRICAO AS NOMESITPART, SFUNC.DESCRICAO AS NOMESI' +
        'TFUNC,'
      '       SPLANO.DESCRICAO AS NOMESITPLANO, SPART.FLGINTERNO,'
      '       PP.SALPARTICIPACAO, PP.DTINICIOINSC, PF.FLGISENTOIRRF'
      
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
      ''
      'AND    P1.IDPESSOA = EL.IDPESSJUR'
      'AND    PF.IDPESSOA = EL.IDPESSOA'
      'AND    PP.IDPLANOPREV = PL.IDPLANOPREV'
      'AND    SFUNC.IDSITFUNC = EL.IDSITFUNC'
      'AND    SPART.IDSITPART = PP.IDSITPART'
      'AND    SPLANO.IDSITPLANOPREV = PP.IDSITPLANOPREV'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 347
    Top = 120
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
  object qrySalarios: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      'H.MES, H.MESCOBRANCA, H.VALORPROVENTO, H.IDRUBRICA, PR.DESCRICAO'
      'FROM   HISTRUBSAL H ,PROVDESC PR'
      'WHERE  H.IDPESSOA  = :IDPESSOA'
      'AND    H.IDPESSJUR = :IDPESSJUR'
      'AND    H.IDRUBRICA = :IDRUBRICASALPART'
      'AND    H.VALORPROVENTO IS NOT NULL'
      'AND    H.IDRUBRICA = PR.IDPROVENTO'
      'UNION'
      'SELECT'
      'H.MES, H.MESCOBRANCA, H.VALORPROVENTO, H.IDRUBRICA, PR.DESCRICAO'
      'FROM   HISTRUBSAL H ,PROVDESC PR'
      'WHERE  H.IDPESSOA  =:IDPESSOA'
      'AND    H.IDPESSJUR = :IDPESSJUR'
      'AND    H.IDRUBRICA = :IDRUBRICAMANUT'
      'AND    H.VALORPROVENTO IS NOT NULL'
      'AND    H.IDRUBRICA = PR.IDPROVENTO'
      'UNION'
      'SELECT'
      'H.MES, H.MESCOBRANCA, H.VALORPROVENTO, H.IDRUBRICA, PR.DESCRICAO'
      'FROM   HISTRUBSAL H ,PROVDESC PR'
      'WHERE  H.IDPESSOA  = :IDPESSOA'
      'AND    H.IDPESSJUR = :IDPESSJUR'
      'AND    H.IDRUBRICA = :IDRUBRICAMANUTPARC'
      'AND    H.VALORPROVENTO IS NOT NULL'
      'AND    H.IDRUBRICA = PR.IDPROVENTO'
      'UNION'
      'SELECT'
      'H.MES, H.MESCOBRANCA, H.VALORPROVENTO, H.IDRUBRICA, PR.DESCRICAO'
      'FROM   HISTRUBSAL H , PROVDESC PR'
      'WHERE  H.IDPESSOA  =:IDPESSOA'
      'AND    H.IDPESSJUR = :IDPESSJUR'
      'AND    H.IDRUBRICA = :IDRUBRICAAUXDOENCA'
      'AND    H.VALORPROVENTO IS NOT NULL'
      'AND    H.IDRUBRICA = PR.IDPROVENTO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 755
    Top = 170
    ParamData = <
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
        Name = 'IDRUBRICASALPART'
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
        Name = 'IDRUBRICAMANUT'
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
        Name = 'IDRUBRICAMANUTPARC'
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
        Name = 'IDRUBRICAAUXDOENCA'
        ParamType = ptUnknown
      end>
  end
  object qryContribuicoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT H.MESREFERENCIA, H.MESCOBRANCA, H.VALORESPERADO, H.VALORR' +
        'ECEBIDO, C.NOME'
      'FROM   CONTRIBUICAO C, HSTCONTRIBPREV H'
      'WHERE  H.IDPESSOA = :IDPESSOA'
      'AND    H.SEQPROPOSTA = :SEQPROPOSTA'
      'AND    H.IDPESSJUR = :IDPESSJUR'
      'AND    H.IDPLANOPREV = :IDPLANOPREV'
      'AND    H.IDCONTRIBUICAO = C.IDCONTRIBUICAO'
      'AND    H.VALORRECEBIDO IS NOT NULL'
      'ORDER BY MESREFERENCIA DESC')
    ValidateWithMask = True
    Left = 755
    Top = 233
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
      end>
  end
  object dsSalarios: TwwDataSource
    AutoEdit = False
    DataSet = qrySalarios
    Left = 755
    Top = 185
  end
  object dsContribuicoes: TwwDataSource
    DataSet = qryContribuicoes
    Left = 755
    Top = 248
  end
  object qryBfciarioTitPlan: TwwQuery
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
      'ORDER BY IDBENEFICIO'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updBfciarioTitPlan
    ValidateWithMask = True
    Left = 517
    Top = 137
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
      end>
  end
  object updBfciarioTitPlan: TUpdateSQL
    ModifySQL.Strings = (
      'update BFCIARIOTITPLAN'
      'set'
      '  PRIORIDADE = :PRIORIDADE,'
      '  PERCENTUAL = :PERCENTUAL,'
      '  IDRESPONSAVEL = :IDRESPONSAVEL,'
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
      '   :SEQPROPOSTA, :PRIORIDADE, :PERCENTUAL, :IDRESPONSAVEL)'
      ' ')
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
    Left = 556
    Top = 198
  end
  object qryBenefReferencia: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT BF.NUMEROPROCESSO, BF.IDPESSJUR,BF.IDPLANOPREV, BF.IDPLAN' +
        'OORIGEM ,BF.IDTITULAR,'
      '       BF.IDPESSOA, BF.SEQPROPOSTA,BF.IDBENEFICIO,'
      '       BF.IDSITBENEFICIO,BF.IDDEPENDENCIA,'
      
        '       BF.IDTPPAGTOBENEFIC,BF.VALORATUAL, BF.VALORTOTAL, BF.DATA' +
        'REQUERIMENTO,'
      '       BF.DATAINICIO,BF.DATAFINAL, BF.DATACONCESSAO,'
      
        '       BF.FLGFORMAPAGTO,BF.VALORCALCULADO, BF.VLRCALCINSS, BF.VL' +
        'RINFINSS,'
      
        '       BF.ULTMESREAJUSTE, BF.ULTVALORATUALREAJ, BF.DATAFINALPREV' +
        'ISTA,'
      '       B.NOME, BPL.IDREGRAPRIMPAGTO, BPL.IDREGRAULTPAGTO,'
      
        '       BPL.FLGCALCTODOMES, BPL.IDREGRACALCULO, BPL.IDREGRASIMULA' +
        ','
      '       BPL.FLGREFERENCIA, BPL.FLGPAGAINSS, BF.FLGPROVISORIO,'
      '       DATAINICIOINSS, DATAINICIOFUND, DIBBENEFANT,'
      
        '       BF.FONTEPAGADORA,BF.SALDOCONTADIB ,  BF.RESERVADIB, BF.IN' +
        'DICEDIB,'
      '       --253577'
      
        '       BF.VLRBSTOTAL, BF.VLRBSATUAL, BF.VLRFABTOTAL, BF.VLRFABAT' +
        'UAL'
      '       --253577'
      'FROM   BENEFBFCIARIO BF, BENEFICIO B, BENEFPLANPREV BPL'
      'WHERE  BF.NUMEROPROCESSO = :NUMEROPROCESSO'
      'AND    BF.IDPESSOA       = :IDPESSOA'
      'AND    BF.IDTITULAR      = :IDPESSOA'
      'AND    BF.SEQPROPOSTA    = :SEQPROPOSTA'
      'AND    BF.IDPESSJUR      = :IDPESSJUR'
      'AND    BF.IDPLANOORIGEM  = :IDPLANOPREV'
      'AND    B.IDBENEFICIO     = BF.IDBENEFICIO'
      'AND    BPL.IDBENEFICIO   = BF.IDBENEFICIO'
      'AND    BPL.IDPLANOPREV   = BF.IDPLANOPREV'
      'AND    BPL.FLGREFERENCIA = 1'
      'AND    BPL.FLGPAGAINSS   = 0'
      'ORDER BY BF.IDBENEFICIO'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updBenefReferencia
    ValidateWithMask = True
    Left = 179
    Top = 162
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end
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
      end>
  end
  object updBenefReferencia: TUpdateSQL
    ModifySQL.Strings = (
      'update BENEFBFCIARIO'
      'set'
      '  NUMEROPROCESSO = :NUMEROPROCESSO,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDPLANOORIGEM = :IDPLANOORIGEM,'
      '  IDTITULAR = :IDTITULAR,'
      '  IDPESSOA = :IDPESSOA,'
      '  SEQPROPOSTA = :SEQPROPOSTA,'
      '  IDBENEFICIO = :IDBENEFICIO,'
      '  IDSITBENEFICIO = :IDSITBENEFICIO,'
      '  IDDEPENDENCIA = :IDDEPENDENCIA,'
      '  IDTPPAGTOBENEFIC = :IDTPPAGTOBENEFIC,'
      '  VALORATUAL = :VALORATUAL,'
      '  VALORTOTAL = :VALORTOTAL,'
      '  DATAREQUERIMENTO = :DATAREQUERIMENTO,'
      '  DATAINICIO = :DATAINICIO,'
      '  DATAFINAL = :DATAFINAL,'
      '  DATACONCESSAO = :DATACONCESSAO,'
      '  FLGFORMAPAGTO = :FLGFORMAPAGTO,'
      '  VALORCALCULADO = :VALORCALCULADO,'
      '  VLRCALCINSS = :VLRCALCINSS,'
      '  VLRINFINSS = :VLRINFINSS,'
      '  ULTMESREAJUSTE = :ULTMESREAJUSTE,'
      '  ULTVALORATUALREAJ = :ULTVALORATUALREAJ,'
      '  DATAFINALPREVISTA = :DATAFINALPREVISTA,'
      '  FLGPROVISORIO = :FLGPROVISORIO,'
      '  SALDOCONTADIB= :SALDOCONTADIB, '
      '  RESERVADIB= :RESERVADIB, '
      '  INDICEDIB= :INDICEDIB'
      ''
      'where'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPLANOORIGEM = :OLD_IDPLANOORIGEM and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO ')
    InsertSQL.Strings = (
      'insert into BENEFBFCIARIO'
      '  (NUMEROPROCESSO, IDPESSJUR, IDPLANOPREV, IDPLANOORIGEM,'
      'IDTITULAR, IDPESSOA,'
      '   SEQPROPOSTA, IDBENEFICIO, IDSITBENEFICIO, IDDEPENDENCIA,'
      'IDTPPAGTOBENEFIC,'
      '   VALORATUAL, VALORTOTAL, DATAREQUERIMENTO, DATAINICIO,'
      'DATAFINAL, DATACONCESSAO,'
      '   FLGFORMAPAGTO, VALORCALCULADO, VLRCALCINSS, VLRINFINSS,'
      'ULTMESREAJUSTE,'
      '   ULTVALORATUALREAJ, DATAFINALPREVISTA, FLGPROVISORIO,'
      '  DATAINICIOINSS, DATAINICIOFUND, DIBBENEFANT,'
      '   SALDOCONTADIB ,  RESERVADIB, INDICEDIB)'
      'values'
      '  (:NUMEROPROCESSO, :IDPESSJUR, :IDPLANOPREV, :IDPLANOORIGEM,'
      ':IDTITULAR,'
      '   :IDPESSOA, :SEQPROPOSTA, :IDBENEFICIO, :IDSITBENEFICIO,'
      ':IDDEPENDENCIA,'
      
        '   :IDTPPAGTOBENEFIC, :VALORATUAL, :VALORTOTAL, :DATAREQUERIMENT' +
        'O,'
      ':DATAINICIO,'
      '   :DATAFINAL, :DATACONCESSAO, :FLGFORMAPAGTO, :VALORCALCULADO,'
      ':VLRCALCINSS,'
      '   :VLRINFINSS, :ULTMESREAJUSTE, :ULTVALORATUALREAJ,'
      ':DATAFINALPREVISTA, :FLGPROVISORIO,'
      ':DATAINICIOINSS, :DATAINICIOFUND, :DIBBENEFANT, '
      ':SALDOCONTADIB ,  :RESERVADIB, :INDICEDIB)'
      '')
    DeleteSQL.Strings = (
      'delete from BENEFBFCIARIO'
      'where'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPLANOORIGEM = :OLD_IDPLANOORIGEM and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO')
    Left = 209
    Top = 161
  end
  object qryFolha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  IDPESSOA, DIAFOLHA, FLGUTILFOLHA, FLGANTERIORFOLHA, FLGM' +
        'ESFOLHA'
      'FROM     FUNDACAO'
      'WHERE  IDPESSOA = :IDFUNDACAO')
    ValidateWithMask = True
    Left = 531
    Top = 458
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
    Left = 748
    Top = 482
  end
  object qryPortForma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODPORTFORMA, DESCRICAO, CODPORTADOR'
      'FROM PORTADORFORMA'
      'WHERE RECPAG = '#39'P'#39
      'AND NVL(FLGATIVO, '#39'S'#39') = '#39'S'#39
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 675
    Top = 486
  end
  object qryMovReservaTemp: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDMOVRESERVATMP, IDREGRACALCABATE, IDPLANOPREV,'
      '       IDTIPORESERVA,   IDPESSJUR,        NUMEROPROCESSO,'
      '       IDTITULAR,       IDPESSOA,         IDBENEFICIO,'
      '       SEQPROPOSTA,     VLRABATIDO,       DATAMOV,'
      '       IDHISTRESERVA,   VLRORIGINAL '
      'FROM   MOVRESERVATEMP'
      'WHERE  NUMEROPROCESSO = :NUMEROPROCESSO'
      'AND    IDTITULAR      = :IDTITULAR'
      'AND    IDPESSJUR      = :IDPESSJUR'
      'AND    IDPLANOPREV    = :IDPLANOPREV'
      'AND    SEQPROPOSTA    = :SEQPROPOSTA'
      'ORDER BY IDBENEFICIO')
    UpdateObject = updMovReservaTemp
    ValidateWithMask = True
    Left = 530
    Top = 401
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
    Left = 528
    Top = 423
  end
  object qryReservaPart: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT RP.IDTIPORESERVA,        RP.IDPLANOPREV,   RP.IDPESSJUR, ' +
        '       RP.IDPESSOA,'
      
        '       RP.DATAREFERENCIASA,     RP.VALORRESERVA,  RP.PERCENTUALS' +
        'AQUE,  RP.SEQPROPOSTA,'
      
        '       PF.DATANASC,             EL.DATAADMISSAO,  R.NOME,       ' +
        '       R.CODHIERARQUIA,'
      '       R.INDICEREAJUSTE,        R.FLGDESCIRRF,       M.MOESIGLA,'
      '       R.FLGCONTROLE'
      
        'FROM   RESERVAPART RP, RESERVAXPLANO R, MOEDA M, PESSOAFISICA PF' +
        ', ELEGPATRO EL'
      'WHERE  RP.IDPESSJUR         = :IDPESSJUR AND'
      '       RP.IDPLANOPREV       = :IDPLANOPREV AND'
      '       RP.IDPESSOA          = :IDTITULAR AND'
      '       PF.IDPESSOA          = :IDTITULAR AND'
      '       EL.IDPESSOA          = :IDTITULAR AND'
      '       EL.IDPESSJUR         = :IDPESSJUR AND'
      '       RP.SEQPROPOSTA       = :SEQPROPOSTA AND'
      '       RP.FLGATIVO          = 1 AND'
      '       RP.IDTIPORESERVA     = R.IDTIPORESERVA AND'
      '       RP.IDPLANOPREV       = R.IDPLANOPREV AND'
      '       R.ANALITICOSINTETI   = '#39'A'#39' AND'
      '       R.FLGTIPORESERVA     = 0   AND '
      '       R.INDICEREAJUSTE     = M.MOECODIGO(+)'
      'ORDER BY R.FLGCONTROLE , R.CODHIERARQUIA'
      ' '
      ' '
      ' ')
    UpdateObject = updReservaPart
    ValidateWithMask = True
    Left = 752
    Top = 293
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
        Name = 'IDPESSJUR'
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
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDTIPORESERVA = :IDTIPORESERVA,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  SEQPROPOSTA = :SEQPROPOSTA,'
      '  VALORRESERVA = :VALORRESERVA'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDTIPORESERVA = :OLD_IDTIPORESERVA and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    InsertSQL.Strings = (
      'insert into RESERVAPART'
      
        '  (IDPLANOPREV, IDTIPORESERVA, IDPESSOA, IDPESSJUR, SEQPROPOSTA,' +
        ' '
      'VALORRESERVA)'
      'values'
      
        '  (:IDPLANOPREV, :IDTIPORESERVA, :IDPESSOA, :IDPESSJUR, :SEQPROP' +
        'OSTA, '
      ':VALORRESERVA)')
    DeleteSQL.Strings = (
      'delete from RESERVAPART'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDTIPORESERVA = :OLD_IDTIPORESERVA and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    Left = 755
    Top = 305
  end
  object qryBenefAUX: TwwQuery
    CachedUpdates = True
    AfterInsert = qryBenefAUXAfterInsert
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT BF.NUMEROPROCESSO,   BF.IDPESSJUR,      BF.IDPLANOPREV, B' +
        'F.IDPLANOORIGEM,'
      '       BF.IDTITULAR,        BF.IDPESSOA,       BF.SEQPROPOSTA,'
      '       BF.IDBENEFICIO,'
      '       BF.CODPORTFORMA,     BF.IDSITBENEFICIO, BF.IDDEPENDENCIA,'
      
        '       BF.IDTPPAGTOBENEFIC, BF.VALORATUAL,     BF.DATAREQUERIMEN' +
        'TO,'
      '       BF.DATAINICIO,       BF.DATAFINAL,      '
      
        '       BF.FLGFORMAPAGTO,    BF.VALORCALCULADO, BF.DATAULTREAJUST' +
        'E,'
      
        '       BF.VLRCALCINSS,      BF.VLRINFINSS,     BF.DATAINICIOINSS' +
        ','
      '       BF.NUMPROCINSS,      BF.DATAINICIOFUND, BF.VALORCOTAS,'
      
        '       BF.DATACONCESSAO,    BF.FLGPROVISORIO,  BF.PERCPROVISORIO' +
        ','
      
        '       BF.PRAZOPROVISORIO,  BF.ULTMESREAJUSTE, BF.ULTVALORATUALR' +
        'EAJ,'
      '       BF.VALORTOTAL,       BF.FLGPOSSUIACOMPINSS, '
      '       BF.IDAGENCIARESGATE, BF.DATAFINALPREVISTA,'
      '       BPART.VALORBASE1, BPART.VALORBASE2, BPART.VALORBASE3,'
      '       BPART.CAMPOTEXTO1, BPART.CAMPOTEXTO2, BPART.CAMPOTEXTO3,'
      '       B.NUMORDEMEVENTO, BPL.FLGCALCTODOMES, BF.PERCRETENCAO,'
      
        '       BF.FONTEPAGADORA,BF.SALDOCONTADIB,BF.RESERVADIB,BF.INDICE' +
        'DIB,'
      '       --253577'
      '       BF.VLRBSTOTAL, BF.VLRBSATUAL,'
      '       BF.VLRFABTOTAL, BF.VLRFABATUAL,'
      '       BF.VLRBASEDEFICIT,'
      '       BF.BSDIB,'
      '       BF.FABDIB'
      '       --253577'
      '      , BF.BENEFLEI142'
      ''
      'FROM   BENEFBFCIARIO BF, BENEFPLANOPART BPART, BENEFICIO B,'
      '       BENEFPLANPREV BPL'
      'WHERE  BF.NUMEROPROCESSO = :NUMEROPROCESSO'
      'AND    B.IDBENEFICIO     = BF.IDBENEFICIO'
      'AND    BF.IDTITULAR      = BPART.IDPESSOA(+)'
      'AND    BF.SEQPROPOSTA    = BPART.SEQPROPOSTA(+)'
      'AND    BF.IDPESSJUR      = BPART.IDPESSJUR(+)'
      'AND    BF.IDPLANOPREV    = BPART.IDPLANOPREV(+)'
      'AND    BF.IDBENEFICIO    = BPART.IDBENEFICIO(+)'
      'AND    BPL.IDPLANOPREV   = BF.IDPLANOPREV'
      'AND    BPL.IDBENEFICIO   = BF.IDBENEFICIO'
      'ORDER BY B.NUMORDEMEVENTO DESC'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updBenefAUX
    ValidateWithMask = True
    Left = 751
    Top = 357
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end>
  end
  object updBenefAUX: TUpdateSQL
    ModifySQL.Strings = (
      'update BENEFBFCIARIO'
      'set'
      '  NUMEROPROCESSO = :NUMEROPROCESSO,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDPLANOORIGEM = :IDPLANOORIGEM,'
      '  IDTITULAR = :IDTITULAR,'
      '  IDPESSOA = :IDPESSOA,'
      '  SEQPROPOSTA = :SEQPROPOSTA,'
      '  IDBENEFICIO = :IDBENEFICIO,'
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
      '  DATACONCESSAO = :DATACONCESSAO,'
      '  FLGPROVISORIO = :FLGPROVISORIO,'
      '  PERCPROVISORIO = :PERCPROVISORIO,'
      '  PRAZOPROVISORIO = :PRAZOPROVISORIO,'
      '  ULTMESREAJUSTE = :ULTMESREAJUSTE,'
      '  ULTVALORATUALREAJ = :ULTVALORATUALREAJ,'
      '  VALORTOTAL = :VALORTOTAL,'
      '  IDAGENCIARESGATE = :IDAGENCIARESGATE,'
      '  DATAFINALPREVISTA = :DATAFINALPREVISTA,'
      '  PERCRETENCAO      = :PERCRETENCAO, '
      '  SALDOCONTADIB= :SALDOCONTADIB, '
      '  RESERVADIB= :RESERVADIB, '
      '  INDICEDIB= :INDICEDIB,'
      '  VLRBSTOTAL = :VLRBSTOTAL,'
      '  VLRBSATUAL = :VLRBSATUAL,'
      '  VLRFABATUAL = :VLRFABATUAL, '
      '  VLRFABTOTAL = :VLRFABTOTAL,'
      '  VLRBASEDEFICIT = :VLRBASEDEFICIT,'
      '  BSDIB = :BSDIB,'
      '  FABDIB = :FABDIB'
      ',BENEFLEI142 = :BENEFLEI142 '
      'where'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPLANOORIGEM = :OLD_IDPLANOORIGEM and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO'
      ' '
      ' '
      ' ')
    InsertSQL.Strings = (
      'insert into BENEFBFCIARIO'
      
        '  (NUMEROPROCESSO, IDPESSJUR, IDPLANOPREV, IDPLANOORIGEM, IDTITU' +
        'LAR, IDPESSOA, '
      
        '   SEQPROPOSTA, IDBENEFICIO, CODPORTFORMA, IDSITBENEFICIO, IDDEP' +
        'ENDENCIA, '
      
        '   IDTPPAGTOBENEFIC, VALORATUAL, DATAREQUERIMENTO, DATAINICIO, D' +
        'ATAFINAL, '
      
        '   FLGFORMAPAGTO, VALORCALCULADO, DATAULTREAJUSTE, VLRCALCINSS, ' +
        'VLRINFINSS, '
      
        '   DATAINICIOINSS, NUMPROCINSS, DATAINICIOFUND, VALORCOTAS, DATA' +
        'CONCESSAO, '
      
        '   FLGPROVISORIO, PERCPROVISORIO, PRAZOPROVISORIO, ULTMESREAJUST' +
        'E, ULTVALORATUALREAJ, '
      
        '   VALORTOTAL, IDAGENCIARESGATE, DATAFINALPREVISTA, PERCRETENCAO' +
        ', '
      '   SALDOCONTADIB ,  RESERVADIB, INDICEDIB,'
      
        '   VLRBSTOTAL, VLRBSATUAL, VLRFABTOTAL, VLRFABATUAL, VLRBASEDEFI' +
        'CIT, BSDIB, FABDIB ,BENEFLEI142)'
      'values'
      
        '  (:NUMEROPROCESSO, :IDPESSJUR, :IDPLANOPREV, :IDPLANOORIGEM, :I' +
        'DTITULAR,'
      
        '   :IDPESSOA, :SEQPROPOSTA, :IDBENEFICIO, :CODPORTFORMA, :IDSITB' +
        'ENEFICIO,'
      
        '   :IDDEPENDENCIA, :IDTPPAGTOBENEFIC, :VALORATUAL, :DATAREQUERIM' +
        'ENTO, :DATAINICIO,'
      
        '   :DATAFINAL, :FLGFORMAPAGTO, :VALORCALCULADO, :DATAULTREAJUSTE' +
        ', :VLRCALCINSS,'
      
        '   :VLRINFINSS, :DATAINICIOINSS, :NUMPROCINSS, :DATAINICIOFUND, ' +
        ':VALORCOTAS,'
      
        '   :DATACONCESSAO, :FLGPROVISORIO, :PERCPROVISORIO, :PRAZOPROVIS' +
        'ORIO, :ULTMESREAJUSTE,'
      
        '   :ULTVALORATUALREAJ, :VALORTOTAL, :IDAGENCIARESGATE, :DATAFINA' +
        'LPREVISTA, :PERCRETENCAO,'
      '   :SALDOCONTADIB ,  :RESERVADIB, :INDICEDIB,'
      
        '   :VLRBSTOTAL, :VLRBSATUAL, :VLRFABTOTAL, :VLRFABATUAL, :VLRBAS' +
        'EDEFICIT, :BSDIB, :FABDIB,:BENEFLEI142)'
      ' '
      ' ')
    DeleteSQL.Strings = (
      'delete from BENEFBFCIARIO'
      'where'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPLANOORIGEM = :OLD_IDPLANOORIGEM and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO')
    Left = 752
    Top = 369
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
      '       CB.FLGCONTAPREF = 1')
    ValidateWithMask = True
    Left = 472
    Top = 106
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryReajINSS: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 698
    Top = 275
  end
  object qryTemporaria: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT B.IDBENEFICIO, B.NOME, B.FLGDESTBENEF, B.IDEVENTOGERADOR,'
      '       B.FLGRESGATE, B.FLGBENEFOBRIGATO, B.NUMORDEMEVENTO,'
      '       B.IDTPPAGTOBENEFIC, B.PRAZOPROVISORIO,'
      '       BP.IDREGRACALCULO,  BP.IDREGRASIMULA, '
      
        '       BP.IDREGRAPAGAMENTO, BP.IDREGRAELEGIBILI, BP.FLGACEITAOPC' +
        'AO,'
      '       BP.NOMEVALORBASE1, BP.NOMEVALORBASE2, BP.NOMEVALORBASE3,'
      
        '       BP.NUMOPCOES,BP.FLGEDITAOP1, BP.FLGEDITAOP2, BP.FLGEDITAO' +
        'P3,'
      
        '       BP.IDREGRAINICIO, BP.IDREGRAFIM, BP.IDREGRACALCINSS, BP.I' +
        'DBENEFREF,'
      
        '       BP.FLGQUITAPREVIDEN, BP.FLGQUITAEMPRESTI, BP.FLGQUITAASSI' +
        'STEN,'
      '       BP.INDICEREAJBENEF, BP.FLGCALCTODOMES,'
      '       BP.IDREGRAPRIMPAGTO, BP.IDREGRAULTPAGTO,'
      
        '       BP.CODPORTFORMA, BP.FLGOBRIGAOP1, BP.FLGOBRIGAOP2, BP.FLG' +
        'OBRIGAOP3,'
      '       BP.FLGOBRIGANPROC, BP.FLGDATAINDICERES '
      'FROM   BENEFICIO B, BENEFPLANPREV BP'
      'WHERE  BP.IDBENEFICIO  = :IDBENEFICIO'
      'AND    BP.IDPLANOPREV = :IDPLANOPREV'
      'AND    BP.IDBENEFICIO = B.IDBENEFICIO'
      'ORDER BY B.NUMORDEMEVENTO'
      ' ')
    ValidateWithMask = True
    Left = 581
    Top = 71
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryAgenciaResgate: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsPortForma
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME, A.NUMAGENCIA'
      'FROM   PESSOA P, AGENCIABANCARIA A, PORTADORCONTA PC'
      'WHERE  (PC.CODPORTADOR = :CODPORTADOR)'
      'AND    (PC.IDBANCO = A.IDBANCO)'
      'AND    (A.IDPESSOA = P.IDPESSOA)'
      'ORDER BY P.NOME')
    ValidateWithMask = True
    Left = 735
    Top = 341
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODPORTADOR'
        ParamType = ptUnknown
      end>
  end
  object dsPortForma: TwwDataSource
    DataSet = qryPortForma
    Left = 675
    Top = 472
  end
  object qryContribuicao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 0 AS FLGSELECIONADO,'
      
        '       D.NODOCUMENTO,        D.NOSSONUMERO,          C.NOMERESUM' +
        ','
      
        '       C.NOME,               HST.MESREFERENCIA,      HST.MESCOBR' +
        'ANCA,'
      '       HST.DATAPREVISAORECE,'
      
        '       HST.VALORESPERADO,    HST.VALORRECEBIDO,      HST.SITRECE' +
        'BIMENTO,'
      '       HST.IDLOTE,           HST.NUMRECEBIMENTO,'
      
        '       HST.IDMOTIVO,         HST.DATARECEBIMENTO,    HST.CODPORT' +
        'FORMA,'
      '       HST.VALOROP1,'
      
        '       HST.VALOROP2,         HST.VALOROP3,           HST.CODDOCU' +
        'MENTOPREV,'
      '       HST.VALORCALCULADO,     HST.FLGDESCFOLHA,'
      
        '       HST.IDCONTRIBUICAO,   HST.IDPESSJUR,          HST.IDPLANO' +
        'PREV,'
      
        '       HST.IDPESSOA,         HST.SEQPROPOSTA,        HST.DATAINI' +
        'CIO,'
      
        '       HST.DATAFINAL,        HST.FLGSITFUNDACAO,     HST.FLGEVEN' +
        'TO,'
      '       HST.DATACANCELAMENTO, HST.DATAEMISSCOB,'
      '       EL.MATRICULA,'
      '       PP.INSCRICAONUMERO,     PT.IDFUNDACAO,'
      
        '       CPP.FLGDESCFOLHA,     C.NOME AS NOMECONTRIB,  CPP.DIAVENC' +
        'IMENTO,'
      
        '       CPP.PLANO,            CPP.PLACONTAC,          CPP.PLACONT' +
        'AD,'
      
        '       CPP.CODCENTROCUSTOC,  CPP.CODCENTROCUSTOD,    CPP.IDEMPRE' +
        'SA,'
      
        '       CPP.UNIDNEGOC,        CPP.IDEMPRESAPROP,      CPP.CODCENT' +
        'RORESPON,'
      
        '       CPP.CODSUBCONTA,      CPP.RECPAG,             CPP.CODTIPR' +
        'ECDES,'
      '       CPP.RECPAGDEVOL,      CPP.CODTIPDESEMBDEVOL,'
      
        '       CPP.TIPCODIGO,        CPP.CODTIPDOC,          CPP.CODPORT' +
        'FORMA,'
      
        '       CPP.PLANO13,          CPP.PLACONTAC13,        CPP.PLACONT' +
        'AD13,'
      
        '       CPP.CODCENTROCUSTOC13,CPP.IDEMPRESA13,        CPP.CODCENT' +
        'ROCUSTOD13,'
      
        '       CPP.UNIDNEGOC13,      CPP.IDEMPRESAPROP13,    CPP.CODCENT' +
        'RORESPON13,'
      
        '       CPP.CODSUBCONTA13,    CPP.RECPAG13,           CPP.CODTIPR' +
        'ECDES13,'
      
        '       CPP.TIPCODIGO13,      CPP.CODTIPDOC13,          CPP.CODPO' +
        'RTFORMA13,'
      
        '       PP.SALMANTIDO,        HST.FLGDEVOLUCAO,       CPP.DATAINI' +
        'CIO,'
      
        '       CPP.IDPLANPREVCONTAB, CPP.PLACONTADBANCO,     CPP.PLACONT' +
        'ADBANCO13        '
      'FROM   CONTRIBUICAO C,       CONTPREV CP, PATRO PT,'
      
        '       ELEGPATRO EL,         PARTPREVPLAN PP, CONTRIBPREVPARTP C' +
        'PP,'
      '       HSTCONTRIBPREV HST,   DOCUMENTO D'
      'WHERE  (HST.IDPESSOA    = :IDPESSOA )'
      'AND    (HST.IDPESSJUR   = :IDPESSJUR )'
      'AND    (HST.IDPLANOPREV = :IDPLANOPREV )'
      'AND    (HST.CODDOCUMENTOPREV = D.CODDOCUMENTO(+) )'
      'AND    (HST.IDCONTRIBUICAO = C.IDCONTRIBUICAO)'
      'AND    (CPP.IDPESSJUR      = HST.IDPESSJUR)'
      'AND    (CPP.IDPLANOPREV    = HST.IDPLANOPREV)'
      'AND    (CPP.IDPESSOA       = HST.IDPESSOA)'
      'AND    (CPP.SEQPROPOSTA    = HST.SEQPROPOSTA)'
      'AND    (CPP.IDCONTRIBUICAO = HST.IDCONTRIBUICAO)'
      'AND    (PP.IDPESSJUR       = CPP.IDPESSJUR)'
      'AND    (PP.IDPLANOPREV     = CPP.IDPLANOPREV)'
      'AND    (PP.IDPESSOA        = CPP.IDPESSOA)'
      'AND    (PP.SEQPROPOSTA     = CPP.SEQPROPOSTA)'
      'AND    (PT.IDPESSOA        = PP.IDPESSJUR)'
      'AND    (EL.IDPESSOA        = PP.IDPESSOA)'
      'AND    (EL.IDPESSJUR       = PP.IDPESSJUR)'
      'AND    (CP.IDCONTRIBUICAO  = CPP.IDCONTRIBUICAO)'
      'AND    (CP.IDPLANOPREV     = CPP.IDPLANOPREV)'
      'AND    (C.IDCONTRIBUICAO   = CP.IDCONTRIBUICAO)'
      
        'AND    ((HST.VALORRECEBIDO  IS NULL ) OR (HST.VALORRECEBIDO = 0)' +
        ')'
      'ORDER BY HST.MESCOBRANCA DESC, HST.MESREFERENCIA'
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    ControlType.Strings = (
      'FLGSELECIONADO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 673
    Top = 420
    ParamData = <
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
        Name = 'IDPLANOPREV'
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
    Left = 755
    Top = 422
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
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
    Left = 755
    Top = 434
  end
  object qryBenefGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 611
    Top = 71
  end
  object DataSource1: TDataSource
    DataSet = qryMovReservaTemp
    Left = 447
    Top = 266
  end
  object qryResMatematica: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDHISTRESERVA,'
      'IDREGRACALCULO,'
      'IDPLANOPREV,'
      'IDTIPORESERVA,'
      'IDPESSOA,'
      'SEQPROPOSTA,'
      'IDEVENTOGERADOR,'
      'IDCONTRIBUICAO,'
      'IDBENEFICIO,'
      'DATAMOV,'
      'VLRREAL,'
      'VLRCOTAS,'
      'SALDOREAL,'
      'SALDOCOTAS,'
      'FLGENTRADA,'
      'PERCENTUAL,'
      'IDPARTICIPANTE,'
      'SALDOREALCONT,'
      'VALORINDICE,'
      'DATAALIMENTACAO,'
      'MESREFERENCIA,'
      'IDPESSJUR,'
      'FLGPROCEDENCIA,'
      'PLNCODIGO,'
      'SALDOCORRIGIDO,'
      'INDICECORRECAO'
      'FROM HISTMOVRESERVA'
      'WHERE IDHISTRESERVA = -1')
    UpdateObject = updResMatematica
    ValidateWithMask = True
    Left = 632
    Top = 202
  end
  object updResMatematica: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTMOVRESERVA'
      'set'
      '  IDREGRACALCULO = :IDREGRACALCULO,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDTIPORESERVA = :IDTIPORESERVA,'
      '  IDPESSOA = :IDPESSOA,'
      '  SEQPROPOSTA = :SEQPROPOSTA,'
      '  IDEVENTOGERADOR = :IDEVENTOGERADOR,'
      '  IDCONTRIBUICAO = :IDCONTRIBUICAO,'
      '  IDBENEFICIO = :IDBENEFICIO,'
      '  DATAMOV = :DATAMOV,'
      '  VLRREAL = :VLRREAL,'
      '  VLRCOTAS = :VLRCOTAS,'
      '  SALDOREAL = :SALDOREAL,'
      '  SALDOCOTAS = :SALDOCOTAS,'
      '  FLGENTRADA = :FLGENTRADA,'
      '  PERCENTUAL = :PERCENTUAL,'
      '  IDPARTICIPANTE = :IDPARTICIPANTE,'
      '  SALDOREALCONT = :SALDOREALCONT,'
      '  VALORINDICE = :VALORINDICE,'
      '  DATAALIMENTACAO = :DATAALIMENTACAO,'
      '  MESREFERENCIA = :MESREFERENCIA,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  FLGPROCEDENCIA = :FLGPROCEDENCIA,'
      '  SALDOCORRIGIDO = :SALDOCORRIGIDO,'
      '  INDICECORRECAO = :INDICECORRECAO'
      'where'
      '  IDHISTRESERVA = :OLD_IDHISTRESERVA')
    InsertSQL.Strings = (
      'insert into HISTMOVRESERVA'
      
        '  (IDHISTRESERVA, IDREGRACALCULO, IDPLANOPREV, IDTIPORESERVA, ID' +
        'PESSOA, '
      
        '   SEQPROPOSTA, IDEVENTOGERADOR, IDCONTRIBUICAO, IDBENEFICIO, DA' +
        'TAMOV, '
      
        '   VLRREAL, VLRCOTAS, SALDOREAL, SALDOCOTAS, FLGENTRADA, PERCENT' +
        'UAL, IDPARTICIPANTE, '
      
        '   SALDOREALCONT, VALORINDICE, DATAALIMENTACAO, MESREFERENCIA, I' +
        'DPESSJUR, '
      '   FLGPROCEDENCIA, SALDOCORRIGIDO, INDICECORRECAO)'
      'values'
      
        '  (:IDHISTRESERVA, :IDREGRACALCULO, :IDPLANOPREV, :IDTIPORESERVA' +
        ', :IDPESSOA, '
      
        '   :SEQPROPOSTA, :IDEVENTOGERADOR, :IDCONTRIBUICAO, :IDBENEFICIO' +
        ', :DATAMOV, '
      
        '   :VLRREAL, :VLRCOTAS, :SALDOREAL, :SALDOCOTAS, :FLGENTRADA, :P' +
        'ERCENTUAL, '
      
        '   :IDPARTICIPANTE, :SALDOREALCONT, :VALORINDICE, :DATAALIMENTAC' +
        'AO, :MESREFERENCIA, '
      
        '   :IDPESSJUR, :FLGPROCEDENCIA, :SALDOCORRIGIDO, :INDICECORRECAO' +
        ')'
      ' ')
    DeleteSQL.Strings = (
      'delete from HISTMOVRESERVA'
      'where'
      '  IDHISTRESERVA = :OLD_IDHISTRESERVA')
    Left = 632
    Top = 256
  end
  object qrySelecionaBenefRef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT B.IDBENEFICIO, B.NOME, B.CODBENEFICIO'
      'FROM   BENEFICIO B, BENEFPLANPREV BP'
      'WHERE  BP.IDPLANOPREV   = :IDPLANOPREV'
      'AND    B.IDBENEFICIO    = BP.IDBENEFICIO'
      'AND    BP.FLGREFERENCIA = 1'
      'AND    BP.FLGPAGAINSS   = 0'
      'ORDER BY B.NOME')
    ValidateWithMask = True
    Left = 693
    Top = 36
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
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
    Left = 591
    Top = 324
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
    Left = 657
    Top = 331
  end
  object dsSelecionaBenefRef: TwwDataSource
    DataSet = qrySelecionaBenefRef
    Left = 317
    Top = 300
  end
  object dsBeneficio: TwwDataSource
    DataSet = qryBeneficio
    Left = 591
    Top = 409
  end
  object DSTESTE: TDataSource
    DataSet = qryMovReservaTemp
    Left = 270
    Top = 166
  end
  object qryEPP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PES.IDPESSOA, PES.NOME,'
      '       NVL(( SELECT DISTINCT 1 '
      #9'     FROM CONTABANCARIA CBC'
      #9'     WHERE (CBC.IDPESSOA = FOS.IDPESSOA)), 0) TEM_CONTA'
      'FROM FORNSERV FOS,'
      '     PESSOA   PES'
      'WHERE FOS.IDPESSOA = PES.IDPESSOA'
      '  AND PES.TIPO = '#39'J'#39'  ')
    ValidateWithMask = True
    Left = 345
    Top = 496
  end
  object dsBfciarioTitPlan: TwwDataSource
    AutoEdit = False
    DataSet = qryBfciarioTitPlan
    Left = 617
    Top = 137
  end
  object MontaSelectEPP: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'FORNSERV'
      'PESSOA')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA'
      'PESSOA.NOME')
    Filtro.Strings = (
      'FORNSERV.IDPESSOA = PESSOA.IDPESSOA'
      'PESSOA.TIPO = '#39'J'#39)
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    OperComparador.Strings = (
      '0')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      '')
    LookupCampoChave.Strings = (
      '')
    LookupCampoExibe.Strings = (
      '')
    Left = 385
    Top = 496
  end
  object QryBuscaIndice: TQuery
    DatabaseName = 'BaseDados'
    Left = 248
    Top = 255
  end
  object QryPlanoContabInss: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select idplanprevcontab,idplanoPrev from benefbfciario bb'
      'where idpessoa = :idpessoa'
      '  AND idtitular = :idtitular '
      'and idsitbeneficio = 1'
      'and fontepagadora=2'
      'AND NOT EXISTS (SELECT 1 FROM benefbfciario b'
      '                 WHERE b.idpessoa = bb.idpessoa '
      '                   AND b.idtitular = bb.idtitular'
      '                   AND b.idplanoprev = bb.idplanoprev'
      '                   AND b.idplanprevcontab = bb.idplanprevcontab'
      '                   AND b.fontepagadora = 1 '
      '                   AND b.idsitbeneficio <> 3'
      '                   AND b.idtppagtobenefic = 1)'
      'AND NOT EXISTS (SELECT 1 FROM benefbfciario bbb'
      '                 WHERE bbb.idpessoa = bb.idpessoa '
      '                   AND bbb.idtitular = bb.idtitular'
      '                   AND bbb.fontepagadora = 1'
      '                   AND bbb.idtppagtobenefic = 2)')
    ValidateWithMask = True
    Left = 1064
    Top = 343
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idpessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idtitular'
        ParamType = ptUnknown
      end>
  end
  object qryUpdPlanoContab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE BENEFBFCIARIO SET IDPLANPREVCONTAB =:IDPLANPREVCONTAB'
      'WHERE IDPESSOA =:IDPESSOA'
      'AND IDPLANOPREV =:IDPLANOPREV'
      'AND IDSITBENEFICIO = 1'
      'AND FONTEPAGADORA=2')
    ValidateWithMask = True
    Left = 1072
    Top = 407
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryUpdAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 201
    Top = 271
  end
  object qryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 416
    Top = 106
  end
  object qryDetAux: TwwQuery
    CachedUpdates = True
    AfterInsert = qryDetAfterInsert
    AfterEdit = qryDetAfterEdit
    BeforePost = qryDetBeforePost
    AfterScroll = qryDetAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT BF.NUMEROPROCESSO,   BF.IDPESSJUR,      BF.IDPLANOPREV, B' +
        'F.IDPLANOORIGEM,'
      '       BF.IDTITULAR,        BF.IDPESSOA,       BF.SEQPROPOSTA,'
      '       BF.IDBENEFICIO,      BF.IDBENEFREFEREN, BF.FLGPAGAINSS,'
      '       BF.CODPORTFORMA,     BF.IDSITBENEFICIO, BF.IDDEPENDENCIA,'
      
        '       BF.IDTPPAGTOBENEFIC, BF.VALORATUAL,     BF.DATAREQUERIMEN' +
        'TO,'
      '       BF.DATAINICIO,       BF.DATAFINAL,      BF.FLGFORMAPAGTO,'
      '       BF.VALORCALCULADO,   BF.DATAULTREAJUSTE,'
      
        '       BF.VLRCALCINSS,      BF.VLRINFINSS,     BF.DATAINICIOINSS' +
        ','
      '       BF.NUMPROCINSS,      BF.DATAINICIOFUND, BF.VALORCOTAS,'
      
        '       BF.DATACONCESSAO,    BF.FLGPROVISORIO,  BF.PERCPROVISORIO' +
        ','
      
        '       BF.PRAZOPROVISORIO,  BF.ULTMESREAJUSTE, BF.ULTVALORATUALR' +
        'EAJ,'
      '       BF.IDAGENCIARESGATE, BF.DATAFINALPREVISTA,'
      '       BF.FLGDATAPREVISTA,  BF.FLGTIPOINSS,    BF.DIBBENEFANT,'
      
        '       BF.VALORBENEFANT,    BF.VALORBINSSANT1, BF.VALORBINSSANT2' +
        ', BF.VALORBINSSANT3,'
      
        '       BF.VALORTOTAL,       BF.FLGPOSSUIACOMPINSS, BF.FLGBENEFMI' +
        'N,'
      '       BF.VALORSRB,         BF.FONTEPAGADORA,  BF.VALORNADIB,'
      '       BPL.FLGREFERENCIA,   B.Flgpeculio,'
      '       B.NUMORDEMEVENTO,    B.NOME,            S.DESCRICAO,'
      '       B.FLGRESGATE,        BPART.VALORBASE1,  BPART.VALORBASE2,'
      
        '       BPART.VALORBASE3,    PT.IDRUBSALAUXDOENCA, BPL.FLGACEITAZ' +
        'ERO,'
      
        '       BPL.FLGMOVRESAPOSCONC, BF.FLGMOVEURESERVA, BF.IDPLANPREVC' +
        'ONTAB, BF.PLACONTAD, BF.PLACONTAC ,'
      '       -1 AS USUARIOALT, B.FLGBENEFTEMP,'
      '       BTP.IDRESPONNAOREC,'
      '       0 AS IDCALCULO,'
      '      BF.PERCRETENCAO'
      'FROM   BENEFBFCIARIO BF, BENEFICIO B, BENEFPLANPREV BPL,'
      '       SITBENEFICIO S, BENEFPLANOPART BPART, PATRO PT,'
      '       BFCIARIOTITPLAN BTP, EVENTOGERADOR EG'
      'WHERE  BF.NUMEROPROCESSO = :NUMEROPROCESSO'
      'AND    B.IDBENEFICIO     = BF.IDBENEFICIO'
      'AND    BPL.IDBENEFICIO   = BF.IDBENEFICIO'
      'AND    BPL.IDPLANOPREV   = BF.IDPLANOPREV'
      'AND    BF.IDPESSJUR      = PT.IDPESSOA'
      
        'AND    ((BPL.FLGREFERENCIA = 0) OR ((BPL.FLGREFERENCIA = 1) AND ' +
        '(BPL.FLGPAGAINSS = 1) ) )'
      'AND    BF.IDSITBENEFICIO = S.IDSITBENEFICIO'
      'AND    BF.IDTITULAR      = BPART.IDPESSOA(+)'
      'AND    BF.SEQPROPOSTA    = BPART.SEQPROPOSTA(+)'
      'AND    BF.IDPESSJUR      = BPART.IDPESSJUR(+)'
      'AND    BF.IDPLANOPREV    = BPART.IDPLANOPREV(+)'
      'AND    BF.IDBENEFICIO    = BPART.IDBENEFICIO(+)'
      'AND    BTP.IDBENEFICIO   = BF.IDBENEFICIO'
      'AND    BTP.IDPLANOPREV   = BF.IDPLANOPREV'
      'AND    BTP.IDPESSJUR     = BF.IDPESSJUR '
      'AND    BTP.IDRESPONSAVEL = BF.IDTITULAR'
      'AND    B.IDEVENTOGERADOR = EG.IDEVENTOGERADOR'
      'AND    EG.FLGINTERNO IN ('#39'DC'#39')'
      '')
    ControlType.Strings = (
      'FLGPROVISORIO;CheckBox;1;0'
      'FLGPOSSUIACOMPINSS;CheckBox;1;0'
      'FLGBENEFTEMP;CheckBox;1;0'
      'FLGPAGAINSS;CheckBox;1;0')
    PictureMasks.Strings = (
      
        'PERCPROVISORIO'#9'{{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-' +
        ']#[#][#]]],({{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#' +
        '][#]]]),[-]{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#]' +
        '[#]]]}'#9'T'#9'F')
    ValidateWithMask = True
    Left = 160
    Top = 269
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end>
    object FloatField1: TFloatField
      DisplayLabel = 'Cód.'
      DisplayWidth = 10
      FieldName = 'IDBENEFICIO'
    end
    object StringField1: TStringField
      DisplayLabel = 'Situação'
      DisplayWidth = 20
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Valor ~Total(R$)'
      DisplayWidth = 10
      FieldName = 'VALORTOTAL'
    end
    object FloatField3: TFloatField
      DisplayLabel = 'Valor do ~Benefício(R$)'
      DisplayWidth = 10
      FieldName = 'VALORATUAL'
    end
    object FloatField4: TFloatField
      DisplayLabel = 'Provisório'
      DisplayWidth = 10
      FieldName = 'FLGPROVISORIO'
    end
    object FloatField5: TFloatField
      DisplayLabel = 'Perc.(%) ~Provisório'
      DisplayWidth = 10
      FieldName = 'PERCPROVISORIO'
    end
    object FloatField6: TFloatField
      DisplayLabel = 'Valor do ~Benefício(Cotas)'
      DisplayWidth = 10
      FieldName = 'VALORCOTAS'
    end
    object FloatField7: TFloatField
      DisplayLabel = 'RMI Informado'
      DisplayWidth = 10
      FieldName = 'VLRINFINSS'
    end
    object FloatField8: TFloatField
      DisplayLabel = 'RMI Calculado'
      DisplayWidth = 10
      FieldName = 'VLRCALCINSS'
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Data Início ~Pagto'
      DisplayWidth = 10
      FieldName = 'DATAINICIO'
    end
    object DateTimeField2: TDateTimeField
      DisplayLabel = 'Data Final ~Prevista'
      DisplayWidth = 10
      FieldName = 'DATAFINALPREVISTA'
    end
    object DateTimeField3: TDateTimeField
      DisplayLabel = 'Data Final ~Efetiva'
      DisplayWidth = 10
      FieldName = 'DATAFINAL'
    end
    object DateTimeField4: TDateTimeField
      DisplayLabel = 'Data de ~Requerimento'
      DisplayWidth = 10
      FieldName = 'DATAREQUERIMENTO'
    end
    object DateTimeField5: TDateTimeField
      DisplayLabel = 'DIB INSS'
      DisplayWidth = 10
      FieldName = 'DATAINICIOINSS'
    end
    object DateTimeField6: TDateTimeField
      DisplayLabel = 'Data de Início ~na Fundação'
      DisplayWidth = 10
      FieldName = 'DATAINICIOFUND'
    end
    object FloatField9: TFloatField
      DisplayLabel = 'Possui Acomp. ~INSS'
      DisplayWidth = 10
      FieldName = 'FLGPOSSUIACOMPINSS'
    end
    object StringField2: TStringField
      DisplayLabel = 'Benefício'
      DisplayWidth = 60
      FieldName = 'NOME'
      Size = 60
    end
    object FloatField10: TFloatField
      DisplayLabel = 'Temporário'
      DisplayWidth = 10
      FieldName = 'FLGBENEFTEMP'
    end
    object FloatField11: TFloatField
      DisplayLabel = 'INSS pago'
      DisplayWidth = 10
      FieldName = 'FLGPAGAINSS'
    end
    object FloatField12: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGACEITAZERO'
      Visible = False
    end
    object FloatField13: TFloatField
      FieldName = 'NUMEROPROCESSO'
      Visible = False
    end
    object FloatField14: TFloatField
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object FloatField15: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object FloatField16: TFloatField
      FieldName = 'IDPLANOORIGEM'
      Visible = False
    end
    object FloatField17: TFloatField
      FieldName = 'IDTITULAR'
      Visible = False
    end
    object FloatField18: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object FloatField19: TFloatField
      FieldName = 'SEQPROPOSTA'
      Visible = False
    end
    object FloatField20: TFloatField
      FieldName = 'IDBENEFREFEREN'
      Visible = False
    end
    object FloatField21: TFloatField
      FieldName = 'CODPORTFORMA'
      Visible = False
    end
    object FloatField22: TFloatField
      FieldName = 'IDSITBENEFICIO'
      Visible = False
    end
    object StringField3: TStringField
      FieldName = 'IDDEPENDENCIA'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object FloatField23: TFloatField
      FieldName = 'IDTPPAGTOBENEFIC'
      Visible = False
    end
    object StringField4: TStringField
      FieldName = 'FLGFORMAPAGTO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object FloatField24: TFloatField
      FieldName = 'VALORCALCULADO'
      Visible = False
    end
    object DateTimeField7: TDateTimeField
      FieldName = 'DATAULTREAJUSTE'
      Visible = False
    end
    object StringField5: TStringField
      FieldName = 'NUMPROCINSS'
      Visible = False
      EditMask = '#########/#;0;_'
      Size = 15
    end
    object DateTimeField8: TDateTimeField
      FieldName = 'DATACONCESSAO'
      Visible = False
    end
    object FloatField25: TFloatField
      FieldName = 'PRAZOPROVISORIO'
      Visible = False
    end
    object StringField6: TStringField
      FieldName = 'ULTMESREAJUSTE'
      Visible = False
      FixedChar = True
      Size = 7
    end
    object FloatField26: TFloatField
      FieldName = 'ULTVALORATUALREAJ'
      Visible = False
    end
    object FloatField27: TFloatField
      FieldName = 'IDAGENCIARESGATE'
      Visible = False
    end
    object FloatField28: TFloatField
      FieldName = 'FLGDATAPREVISTA'
      Visible = False
    end
    object FloatField29: TFloatField
      FieldName = 'FLGTIPOINSS'
      Visible = False
    end
    object DateTimeField9: TDateTimeField
      FieldName = 'DIBBENEFANT'
      Visible = False
    end
    object FloatField30: TFloatField
      FieldName = 'VALORBENEFANT'
      Visible = False
    end
    object FloatField31: TFloatField
      FieldName = 'VALORBINSSANT1'
      Visible = False
    end
    object FloatField32: TFloatField
      FieldName = 'VALORBINSSANT2'
      Visible = False
    end
    object FloatField33: TFloatField
      FieldName = 'VALORBINSSANT3'
      Visible = False
    end
    object FloatField34: TFloatField
      FieldName = 'FLGBENEFMIN'
      Visible = False
    end
    object FloatField35: TFloatField
      FieldName = 'VALORSRB'
      Visible = False
    end
    object FloatField36: TFloatField
      FieldName = 'FLGREFERENCIA'
      Visible = False
    end
    object FloatField37: TFloatField
      FieldName = 'NUMORDEMEVENTO'
      Visible = False
    end
    object FloatField38: TFloatField
      FieldName = 'FLGRESGATE'
      Visible = False
    end
    object FloatField39: TFloatField
      FieldName = 'VALORBASE1'
      Visible = False
    end
    object FloatField40: TFloatField
      FieldName = 'VALORBASE2'
      Visible = False
    end
    object FloatField41: TFloatField
      FieldName = 'VALORBASE3'
      Visible = False
    end
    object FloatField42: TFloatField
      FieldName = 'IDRUBSALAUXDOENCA'
      Visible = False
    end
    object FloatField43: TFloatField
      FieldName = 'FLGMOVRESAPOSCONC'
      Visible = False
    end
    object FloatField44: TFloatField
      FieldName = 'FLGMOVEURESERVA'
      Visible = False
    end
    object FloatField45: TFloatField
      FieldName = 'IDPLANPREVCONTAB'
      Visible = False
    end
    object FloatField46: TFloatField
      FieldName = 'USUARIOALT'
      Visible = False
    end
    object FloatField47: TFloatField
      FieldName = 'FONTEPAGADORA'
      Visible = False
    end
    object StringField7: TStringField
      FieldName = 'PLACONTAD'
      Visible = False
      FixedChar = True
      Size = 18
    end
    object StringField8: TStringField
      FieldName = 'PLACONTAC'
      Visible = False
      FixedChar = True
      Size = 18
    end
    object FloatField48: TFloatField
      FieldName = 'VALORNADIB'
      Visible = False
    end
    object FloatField49: TFloatField
      FieldName = 'IDRESPONNAOREC'
    end
    object FloatField50: TFloatField
      FieldName = 'IDCALCULO'
    end
    object FloatField51: TFloatField
      FieldName = 'PERCRETENCAO'
    end
    object FloatField52: TFloatField
      FieldName = 'FLGPECULIO'
    end
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
    Left = 320
    Top = 159
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
    Left = 649
    Top = 14
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
    Left = 612
    Top = 17
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
    Left = 695
    Top = 65525
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COTMESREF'
        ParamType = ptUnknown
      end>
  end
end
