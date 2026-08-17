inherited frmAlteraBeneficio: TfrmAlteraBeneficio
  Left = 893
  Top = 207
  HelpContext = 4540002
  Caption = 'Alteração de Dados de Benefícios Concedidos'
  ClientHeight = 504
  ClientWidth = 1045
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 1045
    Height = 418
    inherited pnlMestre: TPanel
      Width = 1043
      Height = 65
      object lblParticipante: TLabel
        Left = 8
        Top = 9
        Width = 69
        Height = 13
        Caption = 'Participante'
      end
      object dbTNome: TDBText
        Left = 88
        Top = 9
        Width = 47
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
      object lblPatro: TLabel
        Left = 387
        Top = 40
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object dbTPatro: TDBText
        Left = 475
        Top = 40
        Width = 44
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
      object lblPlanoPrev: TLabel
        Left = 637
        Top = 40
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object dbTPlano: TDBText
        Left = 764
        Top = 40
        Width = 46
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
      object lblMatricula: TLabel
        Left = 387
        Top = 9
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object dbTMatricula: TDBText
        Left = 451
        Top = 9
        Width = 62
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
      object lblInscricao: TLabel
        Left = 637
        Top = 9
        Width = 71
        Height = 13
        Caption = 'Inscrição Nº'
      end
      object dbTInscricao: TDBText
        Left = 717
        Top = 9
        Width = 62
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
      object Label1: TLabel
        Left = 8
        Top = 40
        Width = 71
        Height = 13
        Caption = 'Processo Nº'
      end
      object DBText1: TDBText
        Left = 88
        Top = 40
        Width = 42
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
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 66
      Width = 1043
      Height = 351
      Tabs.Strings = (
        'Benefícios')
      inherited pgctrlDetalhe: TPageControl
        Width = 945
        Height = 292
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Width = 937
            Height = 264
            Selected.Strings = (
              'BENEFICIO'#9'30'#9'Benefício'
              'NOMEDEPENDENTE'#9'35'#9'Beneficiário'
              'NUMPROCINSS'#9'15'#9'Número Benefício~no INSS'
              'DESCFORMA'#9'20'#9'Forma de Pagamento'
              'AGENCIACREDITO'#9'20'#9'Agência para ~Crédito'
              'DATAINICIOFUND'#9'12'#9'Dib'
              'DATAFINAL'#9'12'#9'Data~Final'
              'RESPONSAVEL'#9'30'#9'Recebedor'
              'TIPORECEBEDOR'#9'20'#9'Tipo de Recebedor'
              'DATAFIMRECEB'#9'12'#9'Data Limite ~do Recebedor'
              'MATRICULA'#9'15'#9'Mátricula')
            TitleLines = 2
          end
          inherited pnlControlesDet: TPanel
            Width = 937
            Height = 264
            object Bevel2: TBevel
              Left = 13
              Top = 9
              Width = 514
              Height = 242
            end
            object Label2: TLabel
              Left = 30
              Top = 20
              Width = 27
              Height = 13
              Caption = 'DER'
            end
            object Label3: TLabel
              Left = 30
              Top = 60
              Width = 22
              Height = 13
              Caption = 'DIB'
            end
            object Label4: TLabel
              Left = 191
              Top = 20
              Width = 22
              Height = 13
              Caption = 'DIP'
            end
            object Label5: TLabel
              Left = 191
              Top = 60
              Width = 70
              Height = 13
              Caption = 'DIB Anterior'
            end
            object Label6: TLabel
              Left = 191
              Top = 120
              Width = 115
              Height = 13
              Caption = 'Valor Benef Anterior'
            end
            object Label7: TLabel
              Left = 191
              Top = 159
              Width = 105
              Height = 13
              Caption = 'Valor Benef Inicial'
            end
            object lblValBase1: TLabel
              Left = 30
              Top = 120
              Width = 69
              Height = 13
              Caption = 'Valo Base 1'
              FocusControl = dbValBase1
            end
            object lblValBase2: TLabel
              Left = 30
              Top = 159
              Width = 69
              Height = 13
              Caption = 'Valo Base 2'
              FocusControl = dbValBase2
            end
            object lblValBase3: TLabel
              Left = 30
              Top = 199
              Width = 73
              Height = 13
              Caption = 'Valor Base 3'
              FocusControl = dbValBase3
            end
            object Label11: TLabel
              Left = 351
              Top = 20
              Width = 59
              Height = 13
              Caption = 'Data Final'
            end
            object Label12: TLabel
              Left = 351
              Top = 60
              Width = 110
              Height = 13
              Caption = 'Data Encerramento'
            end
            object Label13: TLabel
              Left = 550
              Top = 17
              Width = 83
              Height = 13
              Caption = 'Plano Contabil'
            end
            object Label14: TLabel
              Left = 550
              Top = 57
              Width = 124
              Height = 13
              Caption = 'Perfil de Investimento'
            end
            object Label21: TLabel
              Left = 351
              Top = 120
              Width = 51
              Height = 13
              Caption = 'NB INSS'
              FocusControl = dbNBInss
            end
            object Bevel1: TBevel
              Left = 536
              Top = 9
              Width = 313
              Height = 93
            end
            object lblSRB: TLabel
              Left = 191
              Top = 199
              Width = 59
              Height = 13
              Caption = 'Valor SRB'
            end
            object Label8: TLabel
              Left = 351
              Top = 159
              Width = 27
              Height = 13
              Caption = 'NUP'
              FocusControl = dbNBInss
            end
            object dbValBase1: TDBEdit
              Left = 30
              Top = 135
              Width = 124
              Height = 21
              DataField = 'VALORBASE1'
              DataSource = dsDet
              TabOrder = 6
            end
            object dbValBase2: TDBEdit
              Left = 30
              Top = 175
              Width = 124
              Height = 21
              DataField = 'VALORBASE2'
              DataSource = dsDet
              TabOrder = 7
            end
            object dbValBase3: TDBEdit
              Left = 30
              Top = 215
              Width = 124
              Height = 21
              DataField = 'VALORBASE3'
              DataSource = dsDet
              TabOrder = 8
            end
            object DBLookupComboBox1: TDBLookupComboBox
              Left = 550
              Top = 33
              Width = 289
              Height = 21
              DataField = 'IDPLANPREVCONTAB'
              DataSource = dsDet
              KeyField = 'IDPLANOPREV'
              ListField = 'NOME'
              ListSource = DsPlanoContabil
              TabOrder = 14
            end
            object DBLookupComboBox2: TDBLookupComboBox
              Left = 550
              Top = 73
              Width = 289
              Height = 21
              DataField = 'IDPERFILINVEST'
              DataSource = dsDet
              KeyField = 'IDPERFILINVEST'
              ListField = 'NOME'
              ListSource = DsPerfilInvestimento
              TabOrder = 15
            end
            object dbNBInss: TDBEdit
              Left = 351
              Top = 135
              Width = 120
              Height = 21
              DataField = 'NUMPROCINSS'
              DataSource = dsDet
              TabOrder = 12
            end
            object pnlINSS: TPanel
              Left = 536
              Top = 113
              Width = 313
              Height = 139
              BevelInner = bvLowered
              BevelOuter = bvNone
              TabOrder = 13
              object Label15: TLabel
                Left = 14
                Top = 62
                Width = 124
                Height = 13
                Caption = 'Data Início Benefício'
              end
              object Label16: TLabel
                Left = 156
                Top = 62
                Width = 130
                Height = 13
                Caption = 'Valor Informativo INSS'
              end
              object Label17: TLabel
                Left = 112
                Top = 8
                Width = 86
                Height = 13
                Caption = 'Tempo Serviço'
                FocusControl = DBEdit16
              end
              object Label18: TLabel
                Left = 121
                Top = 28
                Width = 24
                Height = 13
                Caption = 'Mês'
                FocusControl = DBEdit17
              end
              object Label19: TLabel
                Left = 212
                Top = 28
                Width = 26
                Height = 13
                Caption = 'Dias'
                FocusControl = DBEdit18
              end
              object Label20: TLabel
                Left = 22
                Top = 28
                Width = 29
                Height = 13
                Caption = 'Anos'
                FocusControl = DBEdit16
              end
              object Shape1: TShape
                Left = 202
                Top = 15
                Width = 97
                Height = 1
              end
              object Shape2: TShape
                Left = 16
                Top = 16
                Width = 94
                Height = 1
              end
              object DBEdit16: TDBEdit
                Left = 54
                Top = 25
                Width = 61
                Height = 21
                DataField = 'TEMPOSERVICOANOS'
                DataSource = dsDet
                TabOrder = 0
              end
              object DBEdit17: TDBEdit
                Left = 148
                Top = 25
                Width = 59
                Height = 21
                DataField = 'TEMPOSERVICOMES'
                DataSource = dsDet
                TabOrder = 1
              end
              object DBEdit18: TDBEdit
                Left = 241
                Top = 25
                Width = 60
                Height = 21
                DataField = 'TEMPOSERVICODIAS'
                DataSource = dsDet
                TabOrder = 2
              end
              object DBCheckBox1: TDBCheckBox
                Left = 14
                Top = 113
                Width = 143
                Height = 17
                Caption = 'Dentro do Convênio'
                DataField = 'FLGPAGAINSS'
                DataSource = dsDet
                TabOrder = 5
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBCheckBox2: TDBCheckBox
                Left = 166
                Top = 113
                Width = 132
                Height = 17
                Caption = 'Benefício Lei 142'
                DataField = 'BENEFLEI142'
                DataSource = dsDet
                TabOrder = 6
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object cmdtIniINSS: TCMDateTimePicker
                Left = 15
                Top = 78
                Width = 120
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
                ShowButton = True
                TabOrder = 3
                UnboundDataType = wwDTEdtDate
              end
              object reVlrInfoINSS: TcmMaskEditDlg
                Left = 156
                Top = 78
                Width = 120
                Height = 21
                ParentShowHint = False
                ShowHint = True
                TabOrder = 4
                OnKeyPress = reVlrInfoINSSKeyPress
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
            object cmdtpDER: TCMDateTimePicker
              Left = 30
              Top = 33
              Width = 120
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
              ShowButton = True
              TabOrder = 0
              UnboundDataType = wwDTEdtDate
            end
            object cmdtpDIB: TCMDateTimePicker
              Left = 30
              Top = 74
              Width = 120
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
              ShowButton = True
              TabOrder = 3
              UnboundDataType = wwDTEdtDate
            end
            object cmdtpDIBAnt: TCMDateTimePicker
              Left = 191
              Top = 74
              Width = 120
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DIBBENEFANT'
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
              TabOrder = 4
              UnboundDataType = wwDTEdtDate
            end
            object cmdtpDIP: TCMDateTimePicker
              Left = 191
              Top = 33
              Width = 120
              Height = 21
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
              ShowButton = True
              TabOrder = 1
              UnboundDataType = wwDTEdtDate
            end
            object cmdtpDtFim: TCMDateTimePicker
              Left = 351
              Top = 33
              Width = 120
              Height = 21
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
              ShowButton = True
              TabOrder = 2
              UnboundDataType = wwDTEdtDate
            end
            object cmdtpDtEncerra: TCMDateTimePicker
              Left = 351
              Top = 74
              Width = 120
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAENCERRAMENTO'
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
              TabOrder = 5
              UnboundDataType = wwDTEdtDate
            end
            object reVlrBenefAnt: TcmMaskEditDlg
              Left = 191
              Top = 135
              Width = 120
              Height = 21
              ParentShowHint = False
              ShowHint = True
              TabOrder = 9
              OnKeyPress = reVlrBenefAntKeyPress
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
            object reVlrBenefIni: TcmMaskEditDlg
              Left = 191
              Top = 175
              Width = 120
              Height = 21
              ParentShowHint = False
              ShowHint = True
              TabOrder = 10
              OnKeyPress = reVlrBenefIniKeyPress
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
            object reVlrSRB: TcmMaskEditDlg
              Left = 191
              Top = 215
              Width = 120
              Height = 21
              ParentShowHint = False
              ShowHint = True
              TabOrder = 11
              OnKeyPress = reVlrSRBKeyPress
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
            object DbeCAMPOTEXTO1: TDBEdit
              Left = 351
              Top = 175
              Width = 166
              Height = 21
              DataField = 'CAMPOTEXTO1'
              DataSource = dsDet
              TabOrder = 16
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 1035
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnInsDet: TToolbarButton97
            Visible = False
          end
          inherited sbtnExcluiDet: TToolbarButton97
            Visible = False
          end
        end
        object edPaiDetalhe: TEdit
          Left = 85
          Top = 4
          Width = 860
          Height = 21
          BorderStyle = bsNone
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
      end
      inherited Dock974: TDock97
        Left = 949
        Height = 292
      end
    end
  end
  inherited Dock972: TDock97
    Width = 1045
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
    Top = 465
    Width = 1045
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 264
    Top = 10
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
    Left = 592
    Top = 4
  end
  inherited ds: TwwDataSource
    Left = 409
    Top = 1
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
      '  (IDPESSOA, NOME)'
      'values'
      '  (:IDPESSOA, :NOME)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 362
    Top = 65534
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Beneficiário/Benefício'
    Colunas.Strings = (
      'EL.MATRICULA'
      'DT.MATRICULA'
      'PES.NOME'
      'PD.NOME'
      'P.NUMEROPROCESSO'
      'BF.NOME'
      'PP.INSCRICAONUMERO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'N'
      'C'
      'N')
    Descricao.Strings = (
      'Matrícula do Titular'
      'Matrícula Beneficiário'
      'Nome do Titular'
      'Nome Beneficiário'
      'Nº do Processo'
      'Nome do Benefício'
      'Nº Inscrição Titular')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROCESSOBENEF P'
      'BENEFBFCIARIO B'
      'BENEFPLANPREV BPL'
      'BENEFICIO BF'
      'PESSOA PES'
      'ELEGPATRO EL'
      'PARTPREVPLAN PP'
      'DEPENTIT DT'
      'PESSOA PD')
    CamposChave.Strings = (
      'P.NUMEROPROCESSO  '
      'B.IDTITULAR       '
      'B.SEQPROPOSTA     '
      'B.IDPESSJUR       '
      'B.IDPLANOPREV     '
      'EL.MATRICULA      '
      'B.IDPLANOORIGEM   '
      'B.IDPESSOA       ')
    Filtro.Strings = (
      'P.NUMEROPROCESSO = B.NUMEROPROCESSO'
      'B.IDTITULAR = PES.IDPESSOA'
      'BF.IDBENEFICIO = B.IDBENEFICIO'
      'BPL.IDBENEFICIO = B.IDBENEFICIO'
      'BPL.IDPLANOPREV = B.IDPLANOPREV'
      
        '((BPL.FLGREFERENCIA = 0) OR ((BPL.FLGREFERENCIA = 1) AND (BPL.FL' +
        'GPAGAINSS = 1)))'
      'EL.IDPESSOA = B.IDTITULAR'
      'EL.IDPESSJUR = B.IDPESSJUR'
      'PP.IDPESSJUR = EL.IDPESSJUR'
      'PP.IDPESSOA = EL.IDPESSOA'
      'PP.FLGDESATIVADO = 0'
      'DT.IDTITULAR = B.IDTITULAR'
      'DT.IDPESSOA  = B.IDPESSOA'
      'DT.IDPESSOA = PD.IDPESSOA'
      'B.IDSITBENEFICIO <> 4')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '15'
      '30'
      '30'
      '15'
      '20'
      '15')
    Left = 652
    Top = 65534
  end
  inherited ImlPadrao: TImageList
    Left = 297
    Top = 10
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 869
    Top = 50
  end
  inherited qry: TwwQuery
    Tag = 5
    SQL.Strings = (
      'SELECT P.NOME,P.NUMDOCUMENTO,'
      '              PT.NOME AS NOMEPATRO, '
      '              PL.NOME AS NOMEPLANO,'
      '              EL.MATRICULA,       '
      '              PP.INSCRICAONUMERO,   '
      '              PP.IDPESSJUR,         '
      '              PP.IDPLANOPREV,'
      '              PP.IDPESSOA,        '
      '              PP.SEQPROPOSTA,       '
      '              SP.FLGINTERNO,      '
      '              PP.INSCRICAODATA,    '
      '              PP.IDSITPART,         '
      '              PF.DATANASC,'
      
        '              DECODE(SP.FLGINTERNO, '#39'MA'#39', PP.SALMANTIDO, PP.SALP' +
        'ARTICIPACAO) AS SALARIO,'
      '              BF.NUMEROPROCESSO'
      'FROM    PESSOA P,'
      '        PESSOA PT,'
      '        PESSOAFISICA PF,'
      '        PLANPREV PL,'
      '        PARTPREVPLAN PP,'
      '        ELEGPATRO EL,'
      '        SITPART SP,'
      '        BENEFBFCIARIO BF'
      '        /*PROCESSOBENEF PROC*/'
      'WHERE     (PP.IDPESSJUR     = :IDPESSJUR)'
      'AND       (PP.IDPESSOA      = :IDTITULAR)'
      'AND       (PP.SEQPROPOSTA   = :SEQPROPOSTA)'
      'AND       (PP.IDPLANOPREV   = PL.IDPLANOPREV)'
      'AND       (PP.IDPESSOA      = P.IDPESSOA)'
      'AND       (PP.IDPESSJUR     = PT.IDPESSOA)'
      'AND       (PP.IDPESSJUR     = EL.IDPESSJUR)'
      'AND       (PP.IDPESSOA      = EL.IDPESSOA)'
      'AND       (PP.IDSITPART     = SP.IDSITPART)'
      'AND       (EL.IDPESSOA      = PF.IDPESSOA)'
      'AND       (PP.IDPESSOA      = BF.IDTITULAR)'
      'AND       (PP.IDPESSJUR     = BF.IDPESSJUR)'
      'AND       (PP.IDPLANOPREV   = BF.IDPLANOORIGEM)'
      'AND       (BF.NUMEROPROCESSO = :NUMEROPROCESSO)'
      ' ')
    Left = 455
    Top = 0
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = '2002'
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
        Value = '29603'
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
        Value = '78817'
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 874
    Top = 84
  end
  object qryPortForma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODPORTFORMA, DESCRICAO, CODPORTADOR'
      'FROM PORTADORFORMA'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 396
    Top = 126
  end
  object dsPortForma: TwwDataSource
    DataSet = qryPortForma
    Left = 363
    Top = 127
  end
  object qryAgenciaResgate: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsPortForma
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME, A.NUMAGENCIA, B.NUMBANCO'
      'FROM   PESSOA P, AGENCIABANCARIA A, BANCO B, PORTADORCONTA PC'
      'WHERE  (PC.CODPORTADOR = :CODPORTADOR)'
      'AND    (PC.IDBANCO = A.IDBANCO)'
      'AND    (A.IDPESSOA = P.IDPESSOA)'
      'AND    (B.IDPESSOA = A.IDBANCO)'
      'ORDER BY P.NOME'
      ' ')
    ValidateWithMask = True
    Left = 444
    Top = 125
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODPORTADOR'
        ParamType = ptUnknown
      end>
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsPortForma
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME, A.NUMAGENCIA, B.NUMBANCO'
      'FROM   PESSOA P, AGENCIABANCARIA A, BANCO B, PORTADORCONTA PC'
      'WHERE  (PC.CODPORTADOR = :CODPORTADOR)'
      'AND    (PC.IDBANCO = A.IDBANCO)'
      'AND    (A.IDPESSOA = P.IDPESSOA)'
      'AND    (B.IDPESSOA = A.IDBANCO)'
      'ORDER BY P.NOME'
      ' ')
    ValidateWithMask = True
    Left = 508
    Top = 125
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODPORTADOR'
        ParamType = ptUnknown
      end>
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update BENEFBFCIARIO'
      'set'
      '  DATAFINAL = :DATAFINAL,'
      '  DATAREQUERIMENTO = :DATAREQUERIMENTO,'
      '  DATAINICIOFUND = :DATAINICIOFUND,'
      '  DATAINICIO = :DATAINICIO,'
      '  DIBBENEFANT = :DIBBENEFANT,'
      '  VALORBENEFANT = :VALORBENEFANT,'
      '  VALORNADIB = :VALORNADIB,'
      '  TEMPOSERVICOANOS = :TEMPOSERVICOANOS,'
      '  TEMPOSERVICOMES = :TEMPOSERVICOMES,'
      '  TEMPOSERVICODIAS = :TEMPOSERVICODIAS,'
      '  FLGPAGAINSS = :FLGPAGAINSS,'
      '  BENEFLEI142 = :BENEFLEI142,'
      '  VALORBASE1 = :VALORBASE1,'
      '  VALORBASE2 = :VALORBASE2,'
      '  VALORBASE3 = :VALORBASE3,'
      '  DATAENCERRAMENTO = :DATAENCERRAMENTO,'
      '  IDPLANPREVCONTAB = :IDPLANPREVCONTAB,'
      '  IDPERFILINVEST = :IDPERFILINVEST,'
      '  DATAINICIOINSS = :DATAINICIOINSS,'
      '  VLRINFINSS = :VLRINFINSS,'
      '  NUMPROCINSS = :NUMPROCINSS,'
      '  VALORSRB = :VALORSRB,'
      '  CAMPOTEXTO1 = :CAMPOTEXTO1'
      'where'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA'
      ' ')
    InsertSQL.Strings = (
      'insert into BENEFBFCIARIO'
      '  (DATAFINAL, NUMPROCINSS, NUMPROCINSS_ANTES, '
      'CODPORTFORMA_ANTES, IDAGENCIARESGATE_ANTES, '
      '   NUMEROPROCESSO, IDPESSJUR, IDPLANOPREV, IDTITULAR, IDPESSOA, '
      'IDBENEFICIO, '
      '   SEQPROPOSTA, FONTEPAGADORA, DATAREQUERIMENTO, '
      'DATAINICIOFUND, DATAINICIO, '
      '   DIBBENEFANT, VALORBENEFANT, VALORNADIB, TEMPOSERVICOANOS, '
      'TEMPOSERVICOMES, '
      '   TEMPOSERVICODIAS, FLGPAGAINSS, BENEFLEI142, VALORBASE1, '
      'VALORBASE2, '
      '   VALORBASE3, DATAFINAL_1, DATAENCERRAMENTO, IDPLANPREVCONTAB, '
      'IDPERFILINVEST, '
      '   DATAINICIOINSS, VLRINFINSS, VALORSRB, CAMPOTEXTO1)'
      'values'
      '  (:DATAFINAL, :NUMPROCINSS, :NUMPROCINSS_ANTES, '
      ':CODPORTFORMA_ANTES, :IDAGENCIARESGATE_ANTES, '
      
        '   :NUMEROPROCESSO, :IDPESSJUR, :IDPLANOPREV, :IDTITULAR, :IDPES' +
        'SOA, '
      ':IDBENEFICIO, '
      '   :SEQPROPOSTA, :FONTEPAGADORA, :DATAREQUERIMENTO, '
      ':DATAINICIOFUND, :DATAINICIO, '
      
        '   :DIBBENEFANT, :VALORBENEFANT, :VALORNADIB, :TEMPOSERVICOANOS,' +
        ' '
      ':TEMPOSERVICOMES, '
      '   :TEMPOSERVICODIAS, :FLGPAGAINSS, :BENEFLEI142, :VALORBASE1, '
      ':VALORBASE2, '
      '   :VALORBASE3, :DATAFINAL_1, :DATAENCERRAMENTO, '
      ':IDPLANPREVCONTAB, :IDPERFILINVEST, '
      '   :DATAINICIOINSS, :VLRINFINSS, :VALORSRB, :CAMPOTEXTO1)'
      ' ')
    DeleteSQL.Strings = (
      'delete from BENEFBFCIARIO'
      'where'
      '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    Left = 552
    Top = 1
  end
  object QryPlanoContabil: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    DataSource = dsDet
    SQL.Strings = (
      'SELECT IDPLANOPREV,NOME FROM PLANPREVCONTABIL WHERE ATIVO  = '#39'S'#39)
    ValidateWithMask = True
    Left = 941
    Top = 22
    object QryPlanoContabilIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'RPROD.PLANPREVCONTABIL.IDPLANOPREV'
    end
    object QryPlanoContabilNOME: TStringField
      FieldName = 'NOME'
      Origin = 'RPROD.PLANPREVCONTABIL.NOME'
      Size = 50
    end
  end
  object DsPlanoContabil: TwwDataSource
    AutoEdit = False
    DataSet = QryPlanoContabil
    Left = 972
    Top = 24
  end
  object QryPerfilInvestimento: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    DataSource = dsDet
    SQL.Strings = (
      'SELECT IDPERFILINVEST, NOME FROM PERFILINVEST')
    ValidateWithMask = True
    Left = 941
    Top = 54
  end
  object DsPerfilInvestimento: TwwDataSource
    AutoEdit = False
    DataSet = QryPerfilInvestimento
    Left = 972
    Top = 56
  end
  object qryDet: TwwQuery
    Tag = 5
    CachedUpdates = True
    BeforePost = qryDetBeforePost
    AfterScroll = qryDetAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DECODE(BTP.IDRESPONSAVEL, BTP.IDTITULAR, PTIT.NOME, PRES.' +
        'NOME) AS NOMERECEBEDOR,'
      '       PTIT.NOME AS NOMETITULAR,'
      '       PDEP.NOME AS NOMEDEPENDENTE,'
      '       PDEP.IDPESSOA AS IDDEPENDENTE,'
      '       B.NOME AS BENEFICIO,'
      '       PRES.NOME AS RESPONSAVEL,'
      '       BF.NUMPROCINSS,'
      '       BF.NUMPROCINSS AS NUMPROCINSS_ANTES,'
      '       BF.NUMEROPROCESSO,'
      '       BF.IDPESSJUR,'
      '       BF.IDPLANOPREV,'
      '       BF.IDTITULAR,'
      '       BF.IDPESSOA,'
      '       BF.IDBENEFICIO,'
      '       BF.SEQPROPOSTA,'
      '       D.MATRICULA,'
      '       BF.FONTEPAGADORA, '
      '       BF.DATAREQUERIMENTO,'
      '       BF.DATAINICIOFUND,'
      '       BF.DATAINICIO,'
      '       BF.DIBBENEFANT,'
      '       BF.VALORBENEFANT,'
      '       BF.VALORNADIB,'
      '       BF.VALORSRB,'
      '       BF.TEMPOSERVICOANOS,'
      '       BF.TEMPOSERVICOMES,'
      '       BF.TEMPOSERVICODIAS,'
      '        nvl(BF.FLGPAGAINSS,0) as FLGPAGAINSS,                   '
      '        nvl(BF.BENEFLEI142,0) as BENEFLEI142,'
      '       BF.VALORBASE1,'
      '       BF.VALORBASE2,'
      '       BF.VALORBASE3,'
      '       BF.DATAFINAL,'
      '       BF.DATAENCERRAMENTO,'
      '       BF.IDPLANPREVCONTAB,'
      '       BF.IDPERFILINVEST,'
      '       BF.DATAINICIOINSS,'
      '       BF.VLRINFINSS,'
      
        '       NVL(BPP.NOMEVALORBASE1, '#39'VALOR OPÇÃO 1'#39') AS NOMEVALORBASE' +
        '1,'
      
        '       NVL(BPP.NOMEVALORBASE2, '#39'VALOR OPÇÃO 2'#39') AS NOMEVALORBASE' +
        '2,'
      
        '       NVL(BPP.NOMEVALORBASE3, '#39'VALOR OPÇÃO 3'#39') AS NOMEVALORBASE' +
        '3, BF.CAMPOTEXTO1'
      '       '
      '  FROM PESSOA PRES,'
      '       PESSOA PTIT,'
      '       PESSOA PDEP,'
      '       BFCIARIOTITPLAN BTP,'
      '       PARTPREVPLAN PPP,'
      '       BENEFICIO B,'
      '       DEPENTIT D,'
      '       BENEFBFCIARIO BF,'
      '       BENEFPLANPREV BPP'
      '       '
      ' WHERE BTP.IDTITULAR = :IDTITULAR'
      '   AND PTIT.IDPESSOA = BTP.IDTITULAR'
      '   AND BTP.SEQPROPOSTA = 1'
      '   AND BTP.IDPESSJUR = PPP.IDPESSJUR'
      '   AND BTP.IDPLANOORIGEM = PPP.IDPLANOPREV'
      '   AND BTP.IDTITULAR = PPP.IDPESSOA'
      '   AND BTP.SEQPROPOSTA = PPP.SEQPROPOSTA'
      '   AND BTP.IDPESSOA = D.IDPESSOA'
      '   AND BTP.IDPESSOA = PDEP.IDPESSOA'
      '   AND BTP.IDTITULAR = D.IDTITULAR'
      '   AND BTP.IDBENEFICIO = B.IDBENEFICIO'
      '   AND BTP.IDRESPONSAVEL = PRES.IDPESSOA(+)'
      '   AND BF.NUMEROPROCESSO = :NUMEROPROCESSO'
      '   AND BF.IDPLANOPREV = BTP.IDPLANOPREV'
      '   AND BF.IDPESSJUR = BTP.IDPESSJUR'
      '   AND BF.IDTITULAR = BTP.IDTITULAR'
      '   AND BF.IDBENEFICIO = BTP.IDBENEFICIO'
      '   AND BF.IDPESSOA = BTP.IDPESSOA'
      '   AND BF.SEQPROPOSTA = BTP.SEQPROPOSTA'
      '   AND BF.IDPLANOPREV = BPP.IDPLANOPREV'
      '   AND BF.IDBENEFICIO = BPP.IDBENEFICIO'
      ' ')
    UpdateMode = upWhereChanged
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 513
    Top = 10
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
        Value = '29603'
      end
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
        Value = '78817'
      end>
  end
  object QryUpAux: TQuery
    DatabaseName = 'BaseDados'
    Left = 941
    Top = 92
  end
end
