inherited frmCadDepenBenef: TfrmCadDepenBenef
  Left = 4
  Top = 82
  Caption = 'Cadastro de Dependentes'
  ClientHeight = 466
  ClientWidth = 762
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 762
    Height = 380
    inherited pnlMestre: TPanel
      Width = 760
      Height = 46
      object lblParticipante: TLabel
        Left = 8
        Top = 1
        Width = 69
        Height = 13
        Caption = 'Participante'
      end
      object lblMatricula: TLabel
        Left = 304
        Top = 29
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object lblPatro: TLabel
        Left = 8
        Top = 29
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object lblInscricao: TLabel
        Left = 514
        Top = 29
        Width = 71
        Height = 13
        Caption = 'Inscrição Nº'
      end
      object lblPlanoPrev: TLabel
        Left = 304
        Top = 1
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object dbTNome: TDBText
        Left = 88
        Top = 1
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
      object dbTPatro: TDBText
        Left = 104
        Top = 29
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
      object dbTPlano: TDBText
        Left = 432
        Top = 1
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
      object dbTMatricula: TDBText
        Left = 368
        Top = 29
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
      object dbTInscricao: TDBText
        Left = 594
        Top = 29
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
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 47
      Width = 760
      Height = 332
      Tabs.Strings = (
        'Dependentes'
        'Endereços do Dependente'
        'Conta Bancária do Dependente'
        'Benefícios do Dependente'
        'Nucleo Familiar')
      detdbGrids.Strings = (
        'dbgrdDet'
        'dbgrdEndPess'
        'dbgrdContaBanco'
        'dbgrdBeneficiario'
        'DbGrdNucleoFamiliar')
      object TLabel [0]
        Left = 280
        Top = 72
        Width = 5
        Height = 13
      end
      object lblPdCEP: TLabel [1]
        Left = 408
        Top = 191
        Width = 37
        Height = 13
        Caption = 'C.E.P.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      inherited pgctrlDetalhe: TPageControl
        Width = 662
        Height = 273
        ActivePage = tbsEndereco
        inherited tbsDet: TTabSheet
          Caption = 'Dependentes'
          inherited pnlControlesDet: TPanel [0]
            Width = 654
            Height = 245
            object lblNome: TLabel
              Left = 2
              Top = -1
              Width = 33
              Height = 13
              Caption = 'Nome'
            end
            object Label1: TLabel
              Left = 449
              Top = -1
              Width = 55
              Height = 13
              Caption = 'Matrícula'
            end
            object grpFiliacao: TGroupBox
              Left = 0
              Top = 76
              Width = 641
              Height = 44
              TabOrder = 5
              object lblNomePai: TLabel
                Left = 6
                Top = 7
                Width = 73
                Height = 13
                Caption = 'Nome do Pai'
              end
              object lblNomeMae: TLabel
                Left = 335
                Top = 7
                Width = 79
                Height = 13
                Caption = 'Nome da Mãe'
              end
              object dbeNomePai: TDBEdit
                Left = 6
                Top = 20
                Width = 307
                Height = 21
                DataField = 'NOMEPAI'
                DataSource = dsPF
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object dbeNomeMae: TDBEdit
                Left = 334
                Top = 20
                Width = 291
                Height = 21
                DataField = 'NOMEMAE'
                DataSource = dsPF
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
            end
            object dbeNome: TDBEdit
              Left = 1
              Top = 12
              Width = 432
              Height = 21
              DataField = 'NOME'
              DataSource = dsPessoa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object dbrgrpEstCivil: TDBRadioGroup
              Left = 1
              Top = 120
              Width = 203
              Height = 117
              Caption = 'Estado Civil'
              DataField = 'ESTCIVIL'
              DataSource = dsPF
              Items.Strings = (
                'Solteiro(a)'
                'Casado(a) ou Equiparado(a)'
                'Divorciado(a)'
                'Desquitado(a)'
                'Separado(a) Judicial'
                'Viúvo(a)'
                'Outros')
              TabOrder = 3
              TabStop = True
              Values.Strings = (
                'S'
                'C'
                'D'
                'E'
                'J'
                'V'
                'O')
            end
            object grpDataNasc: TGroupBox
              Left = 0
              Top = 33
              Width = 433
              Height = 45
              TabOrder = 2
              object lblDtNascimento: TLabel
                Left = 7
                Top = 7
                Width = 116
                Height = 13
                Caption = 'Data de Nascimento'
              end
              object lblTpSang: TLabel
                Left = 303
                Top = 7
                Width = 92
                Height = 13
                Caption = 'Tipo Sanguíneo'
              end
              object lblDataMorte: TLabel
                Left = 157
                Top = 7
                Width = 82
                Height = 13
                Caption = 'Data de Morte'
              end
              object dbdeDataNasc: TCMDateTimePicker
                Left = 7
                Top = 20
                Width = 122
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATANASC'
                DataSource = dsPF
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
              object dbdeDataMorte: TCMDateTimePicker
                Left = 156
                Top = 20
                Width = 123
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATAMORTE'
                DataSource = dsPF
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
              object dbeTipoSang: TDBEdit
                Left = 304
                Top = 20
                Width = 108
                Height = 21
                DataField = 'TIPOSANG'
                DataSource = dsPF
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
              end
            end
            object dbrdgrpSexo: TDBRadioGroup
              Left = 448
              Top = 38
              Width = 193
              Height = 40
              Caption = 'Sexo'
              Columns = 2
              DataField = 'SEXO'
              DataSource = dsPF
              Items.Strings = (
                'Masculino'
                'Feminino')
              TabOrder = 1
              TabStop = True
              Values.Strings = (
                'M'
                'F')
            end
            object GroupBox4: TGroupBox
              Left = 342
              Top = 120
              Width = 148
              Height = 117
              TabOrder = 6
              object lblSitDependente: TLabel
                Left = 9
                Top = 8
                Width = 124
                Height = 13
                Caption = 'Situação Dependente'
              end
              object lblNumSequencia: TLabel
                Left = 9
                Top = 80
                Width = 79
                Height = 13
                Caption = 'Nº Sequência'
              end
              object lblTipoDepen: TLabel
                Left = 9
                Top = 44
                Width = 105
                Height = 13
                Caption = 'Tipo Dependência'
              end
              object dblkpcmbSitDependente: TwwDBLookupCombo
                Left = 9
                Top = 22
                Width = 122
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'40'#9'dESCRIÇÃO')
                DataField = 'IDSITDEPENDENTE'
                DataSource = dsDepen
                LookupTable = qrySitDependente
                LookupField = 'IDSITDEPENDENTE'
                ParentFont = False
                TabOrder = 0
                AutoDropDown = False
                ShowButton = True
                AllowClearKey = True
              end
              object dbeNumSequencia: TDBEdit
                Left = 9
                Top = 93
                Width = 76
                Height = 21
                Color = clScrollBar
                DataField = 'NUMSEQUENCIA'
                DataSource = dsDet
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
              end
              object dblkpcmbTipoDependencia: TCMDBLookupCombo
                Left = 9
                Top = 58
                Width = 118
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'15'#9'Descrição')
                DataField = 'IDDEPENDENCIA'
                DataSource = dsDet
                LookupTable = qryDependencia
                LookupField = 'IDDEPENDENCIA'
                Options = [loTitles]
                Style = csDropDownList
                ParentFont = False
                TabOrder = 2
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
            end
            object GroupBox5: TGroupBox
              Left = 496
              Top = 120
              Width = 145
              Height = 117
              TabOrder = 7
              object dbchkbxDesignado: TDBCheckBox
                Left = 7
                Top = 10
                Width = 128
                Height = 17
                Caption = 'Designado'
                DataField = 'FLGDESIGNADO'
                DataSource = dsDet
                TabOrder = 0
                ValueChecked = '1'
                ValueUnchecked = '0'
                OnClick = dbchkbxDesignadoClick
              end
              object dbchkbxFlgDepLegal: TDBCheckBox
                Left = 7
                Top = 27
                Width = 128
                Height = 17
                Caption = 'Dependente Legal'
                DataField = 'FLGDEPLEGAL'
                DataSource = dsDet
                TabOrder = 1
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object dbchkbxFlgContaImpostoR: TDBCheckBox
                Left = 7
                Top = 79
                Width = 128
                Height = 17
                Hint = 'Indica se o dependente conta para o cálculo do IR'
                Caption = 'Imposto de Renda'
                DataField = 'FLGCONTAIMPOSTOR'
                DataSource = dsDet
                ParentShowHint = False
                ShowHint = True
                TabOrder = 4
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object dbchkbxContaSalarioF: TDBCheckBox
                Left = 7
                Top = 62
                Width = 128
                Height = 17
                Hint = 'Indica se o dependente conta para o cálculo do Salário Família'
                Caption = 'Salário Família'
                DataField = 'FLGCONTASALARIOF'
                DataSource = dsDet
                TabOrder = 3
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object dbchkbxBeneficiario: TDBCheckBox
                Left = 7
                Top = 96
                Width = 128
                Height = 17
                Caption = 'Beneficiário'
                DataField = 'FLGBENEFICIARIO'
                DataSource = dsDet
                TabOrder = 5
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBCheckBox1: TDBCheckBox
                Left = 7
                Top = 44
                Width = 128
                Height = 17
                Hint = 'Indica se o dependente é isento de IR ou não'
                Caption = 'Isento de IR'
                DataField = 'FLGISENTOIRRF'
                DataSource = dsPF
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
            end
            object grpDependentes: TGroupBox
              Left = 211
              Top = 120
              Width = 125
              Height = 117
              TabOrder = 4
              object lblnDepIRRF: TLabel
                Left = 9
                Top = 8
                Width = 79
                Height = 13
                Caption = 'Nº Dep. IRRF'
              end
              object lblNDepSalFam: TLabel
                Left = 9
                Top = 44
                Width = 103
                Height = 13
                Caption = 'Nº Dep. Sal. Fam.'
              end
              object lblNTotalDep: TLabel
                Left = 9
                Top = 80
                Width = 79
                Height = 13
                Caption = 'Nº Total Dep.'
              end
              object dbseNumDepIRRF: TwwDBSpinEdit
                Left = 9
                Top = 22
                Width = 76
                Height = 21
                Increment = 1
                MaxValue = 100
                DataField = 'NUMDEPIRRF'
                DataSource = dsPF
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                UnboundDataType = wwDefault
              end
              object dbseNumDepSalF: TwwDBSpinEdit
                Left = 9
                Top = 58
                Width = 104
                Height = 21
                Increment = 1
                MaxValue = 100
                DataField = 'NUMDEPSALF'
                DataSource = dsPF
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                UnboundDataType = wwDefault
              end
              object dbseNumDepTot: TwwDBSpinEdit
                Left = 9
                Top = 93
                Width = 78
                Height = 21
                Increment = 1
                MaxValue = 100
                DataField = 'NUMDEPTOT'
                DataSource = dsPF
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
                UnboundDataType = wwDefault
              end
            end
            object dbeMatricula: TDBEdit
              Left = 448
              Top = 12
              Width = 193
              Height = 21
              DataField = 'MATRICULA'
              DataSource = dsDet
              TabOrder = 8
            end
          end
          inherited dbgrdDet: TwwDBGrid [1]
            Width = 654
            Height = 245
            Selected.Strings = (
              'NUMSEQUENCIA'#9'4'#9'Seq.'#9'No'
              'NOME'#9'40'#9'Dependente'#9'No'
              'TIPODEPENDENCIA'#9'15'#9'Depen.'#9'No'
              'FLGCONTAIMPOSTOR'#9'7'#9'Conta IR?'#9'No'
              'FLGCONTASALARIOF'#9'10'#9'Conta Salário ~Família ?'#9'No'
              'FLGBENEFICIARIO'#9'10'#9'Beneficiário ?'#9'No'
              'FLGDESIGNADO'#9'9'#9'Designado ?'#9'No'
              'FLGDEPLEGAL'#9'9'#9'Dependente ~Legal ?'#9'No')
            TitleLines = 2
          end
        end
        object tbsEndereco: TTabSheet
          Caption = 'Endereços do Dependente'
          object dbgrdEndPess: TwwDBGrid
            Left = 0
            Top = 0
            Width = 654
            Height = 245
            Selected.Strings = (
              'NOME'#9'40'#9'Nome'#9'F'
              'LOGRADOURO'#9'60'#9'Logradouro'
              'NUMERO'#9'8'#9'Número'
              'COMPLEMENTO'#9'20'#9'Complemento'
              'BAIRRO'#9'20'#9'Bairro'
              'CEP'#9'8'#9'Cep')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsEndPess
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
          object pnlControlesEndPess: TPanel
            Left = 0
            Top = 0
            Width = 654
            Height = 245
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object lblNumero: TLabel
              Left = 420
              Top = 47
              Width = 44
              Height = 13
              Caption = 'Número'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblCEP: TLabel
              Left = 420
              Top = 97
              Width = 37
              Height = 13
              Caption = 'C.E.P.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblPais: TLabel
              Left = 421
              Top = 152
              Width = 25
              Height = 13
              Caption = 'Pais'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblEstado: TLabel
              Left = 241
              Top = 152
              Width = 40
              Height = 13
              Caption = 'Estado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblBairro: TLabel
              Left = 240
              Top = 97
              Width = 34
              Height = 13
              Caption = 'Bairro'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblCidade: TLabel
              Left = 15
              Top = 152
              Width = 40
              Height = 13
              Caption = 'Cidade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblComplemento: TLabel
              Left = 15
              Top = 97
              Width = 76
              Height = 13
              Caption = 'Complemento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblLogradouro: TLabel
              Left = 14
              Top = 47
              Width = 65
              Height = 13
              Caption = 'Logradouro'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblPdLocal: TLabel
              Left = 14
              Top = 6
              Width = 32
              Height = 13
              Caption = 'Local'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object GroupBox1: TGroupBox
              Left = 506
              Top = 51
              Width = 129
              Height = 135
              Caption = 'Tipo'
              TabOrder = 9
              object chkbxComercial: TCheckBox
                Left = 8
                Top = 16
                Width = 97
                Height = 17
                Caption = 'Comercial'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object chkbxEntrega: TCheckBox
                Left = 8
                Top = 64
                Width = 97
                Height = 17
                Caption = 'Entrega'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
              end
              object chkbxCobranca: TCheckBox
                Left = 8
                Top = 88
                Width = 97
                Height = 17
                Caption = 'Cobrança'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
              end
              object chkbxCorrespondencia: TCheckBox
                Left = 8
                Top = 112
                Width = 105
                Height = 17
                Caption = 'Correspondência'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
              end
              object chkbxResidencial: TCheckBox
                Left = 8
                Top = 40
                Width = 97
                Height = 17
                Caption = 'Residencial'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
            end
            object dbeNumero: TDBEdit
              Left = 420
              Top = 61
              Width = 70
              Height = 21
              DataField = 'NUMERO'
              DataSource = dsEndPess
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object cmbCidade: TCMDBLookupCombo
              Left = 15
              Top = 165
              Width = 211
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMECIDADE'#9'40'#9'Cidade')
              DataField = 'IDCIDADES'
              DataSource = dsEndPess
              LookupTable = qryCidade
              LookupField = 'IDCIDADES'
              Options = [loTitles]
              Style = csDropDownList
              ParentFont = False
              TabOrder = 6
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dbeLogradouro: TDBEdit
              Left = 14
              Top = 61
              Width = 387
              Height = 21
              DataField = 'LOGRADOURO'
              DataSource = dsEndPess
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object dbeComplemento: TDBEdit
              Left = 15
              Top = 114
              Width = 211
              Height = 21
              DataField = 'COMPLEMENTO'
              DataSource = dsEndPess
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object dbeBairro: TDBEdit
              Left = 239
              Top = 114
              Width = 162
              Height = 21
              DataField = 'BAIRRO'
              DataSource = dsEndPess
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
            end
            object dbeCEP: TDBEdit
              Left = 420
              Top = 114
              Width = 70
              Height = 21
              DataField = 'CEP'
              DataSource = dsEndPess
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
            end
            object dbeEstado: TDBEdit
              Left = 239
              Top = 165
              Width = 162
              Height = 21
              Color = clBtnFace
              DataField = 'NOMEESTADO'
              DataSource = dsCidade
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 7
            end
            object dbePais: TDBEdit
              Left = 421
              Top = 165
              Width = 69
              Height = 21
              Color = clBtnFace
              DataField = 'NOMEPAIS'
              DataSource = dsCidade
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 8
            end
            object dbedNomeEndereco: TDBEdit
              Left = 14
              Top = 19
              Width = 386
              Height = 21
              DataField = 'NOME'
              DataSource = dsEndPess
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
          end
        end
        object tbsContaBanco: TTabSheet
          Caption = 'Conta Bancária do Dependente'
          object dbgrdContaBanco: TwwDBGrid
            Left = 0
            Top = 0
            Width = 654
            Height = 245
            Selected.Strings = (
              'BANCO'#9'60'#9'Banco'
              'AGENCIA'#9'60'#9'Agência'
              'CONTACORRENTE'#9'15'#9'Conta Corrente'
              'FLGCONTAPREF'#9'10'#9'Conta Preferencial ?'
              'TIPOCONTA'#9'1'#9'Tipo de Conta'
              'FLGCONTACONJUNTA'#9'1'#9'Conta Conjunta ?')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsCBanco
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
          object pnlControlesContaBanco: TPanel
            Left = 0
            Top = 0
            Width = 654
            Height = 245
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object GroupBox3: TGroupBox
              Left = 1
              Top = 7
              Width = 496
              Height = 173
              TabOrder = 0
              object Label6: TLabel
                Left = 93
                Top = 18
                Width = 37
                Height = 13
                Caption = 'Banco'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label7: TLabel
                Left = 93
                Top = 69
                Width = 47
                Height = 13
                Caption = 'Agência'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label8: TLabel
                Left = 93
                Top = 116
                Width = 88
                Height = 13
                Caption = 'Conta Bancária'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label4: TLabel
                Left = 10
                Top = 18
                Width = 55
                Height = 13
                Caption = 'Banco Nº'
              end
              object Label5: TLabel
                Left = 10
                Top = 69
                Width = 65
                Height = 13
                Caption = 'Agência Nº'
              end
              object dbeContaCorrente: TDBEdit
                Left = 93
                Top = 130
                Width = 121
                Height = 21
                DataField = 'CONTACORRENTE'
                DataSource = dsCBanco
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
              end
              object lkpcmbbxBanco: TwwDBLookupCombo
                Left = 93
                Top = 32
                Width = 394
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'BANCO'#9'60'#9'Banco'
                  'NUMBANCO'#9'10'#9'Nº')
                DataField = 'IDBANCO'
                DataSource = dsCBanco
                LookupTable = qryBanco
                LookupField = 'IDPESSOA'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                OnCloseUp = lkpcmbbxBancoCloseUp
              end
              object lkpcmbbxAgencia: TwwDBLookupCombo
                Left = 93
                Top = 84
                Width = 394
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'AGENCIA'#9'60'#9'AGENCIA'
                  'NUMAGENCIA'#9'15'#9'NUMAGENCIA')
                DataField = 'IDAGENCIA'
                DataSource = dsCBanco
                LookupTable = qryAgencia
                LookupField = 'IDPESSOA'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 3
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                OnCloseUp = lkpcmbbxAgenciaCloseUp
              end
              object edDigBanco: TEditNum
                Left = 10
                Top = 32
                Width = 74
                Height = 21
                Hint = 'Digite este campo caso deseje procurar o banco por número'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnExit = edDigBancoExit
                IntDigits = 0
                Signal = False
                DecDigits = 0
                Numeric = False
              end
              object edDigAgencia: TEditNum
                Left = 10
                Top = 84
                Width = 74
                Height = 21
                Hint = 'Digite este campo caso deseje procurar a agência por número'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
                OnExit = edDigAgenciaExit
                IntDigits = 0
                Signal = False
                DecDigits = 0
                Numeric = False
              end
            end
            object rgrpTipoConta: TDBRadioGroup
              Left = 504
              Top = 7
              Width = 142
              Height = 73
              Caption = 'Tipo'
              DataField = 'TIPOCONTA'
              DataSource = dsCBanco
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Items.Strings = (
                'Conta Corrente'
                'Poupança'
                'Conta Salário')
              ParentFont = False
              TabOrder = 1
              TabStop = True
              Values.Strings = (
                '1'
                '2'
                '3')
            end
            object dbgrpContaPref: TDBRadioGroup
              Left = 504
              Top = 84
              Width = 142
              Height = 44
              Caption = 'Conta Preferencial'
              Columns = 2
              DataField = 'FLGCONTAPREF'
              DataSource = dsCBanco
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Items.Strings = (
                'Não'
                'Sim')
              ParentFont = False
              TabOrder = 2
              TabStop = True
              Values.Strings = (
                '0'
                '1')
            end
            object dbgrpContaConj: TDBRadioGroup
              Left = 504
              Top = 136
              Width = 142
              Height = 44
              Caption = 'Conta Conjunta'
              Columns = 2
              DataField = 'FLGCONTACONJUNTA'
              DataSource = dsCBanco
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Items.Strings = (
                'Não'
                'Sim')
              ParentFont = False
              TabOrder = 3
              TabStop = True
              Values.Strings = (
                'N'
                'S')
            end
          end
        end
        object tbsBeneficiario: TTabSheet
          Caption = 'Benefícios do Dependente'
          object dbgrdBeneficiario: TwwDBGrid
            Left = 0
            Top = 0
            Width = 654
            Height = 245
            Selected.Strings = (
              'BENEFICIO'#9'40'#9'Beneficio'
              'RESPONSAVEL'#9'60'#9'Responsável'
              'DESCRICAO'#9'15'#9'Tipo')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsBenef
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
          object pnlBeneficiario: TPanel
            Left = 0
            Top = 0
            Width = 654
            Height = 245
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object grpbxResp: TGroupBox
              Left = 16
              Top = 10
              Width = 585
              Height = 57
              Caption = 'Responsável'
              TabOrder = 0
              object sbResponsavel: TSpeedButton
                Left = 521
                Top = 21
                Width = 25
                Height = 25
                Hint = 'Seleciona Responsável'
                Enabled = False
                Flat = True
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
                ParentShowHint = False
                ShowHint = True
                OnClick = sbResponsavelClick
              end
              object sbNovoResponsavel: TSpeedButton
                Left = 549
                Top = 21
                Width = 25
                Height = 25
                Hint = 'Cadastra Novo Responsável'
                Enabled = False
                Flat = True
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
                  333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
                  0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
                  07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
                  07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
                  0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
                  33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
                  B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
                  3BB33773333773333773B333333B3333333B7333333733333337}
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                OnClick = sbNovoResponsavelClick
              end
              object dbeResponsavel: TDBEdit
                Left = 140
                Top = 23
                Width = 377
                Height = 21
                Color = clBtnFace
                DataField = 'RESPONSAVEL'
                DataSource = dsBenef
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
              object rdbProprio: TRadioButton
                Left = 24
                Top = 19
                Width = 113
                Height = 17
                Caption = 'É o próprio'
                TabOrder = 1
                OnClick = rdbProprioClick
              end
              object rdbOutro: TRadioButton
                Left = 24
                Top = 37
                Width = 113
                Height = 17
                Caption = 'Outra pessoa'
                TabOrder = 2
                OnClick = rdbProprioClick
              end
            end
            object grpbxRespDepen: TGroupBox
              Left = 374
              Top = 71
              Width = 225
              Height = 57
              Caption = 'Tipo de Responsável'
              TabOrder = 1
              object lkpcmbRespDepen: TCMDBLookupCombo
                Left = 8
                Top = 20
                Width = 209
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'15'#9'Descrição')
                DataField = 'IDDEPENRESPON'
                DataSource = dsBenef
                LookupTable = qryDependencia
                LookupField = 'IDDEPENDENCIA'
                Options = [loTitles]
                Style = csDropDownList
                ParentFont = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
            end
            object grpbxBeneficio: TGroupBox
              Left = 16
              Top = 71
              Width = 337
              Height = 57
              Caption = 'Benefício'
              TabOrder = 2
              object lkpcmbBeneficio: TCMDBLookupCombo
                Left = 10
                Top = 20
                Width = 313
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'60'#9'Nome')
                DataField = 'IDBENEFICIO'
                DataSource = dsBenef
                LookupTable = qryBeneficio
                LookupField = 'IDBENEFICIO'
                Options = [loTitles]
                Style = csDropDownList
                ParentFont = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
            end
            object grpbxPrioridade: TGroupBox
              Left = 376
              Top = 131
              Width = 113
              Height = 50
              Caption = 'Prioridade'
              TabOrder = 3
              object dbePrioridade: TDBEdit
                Left = 8
                Top = 20
                Width = 97
                Height = 21
                DataField = 'PRIORIDADE'
                DataSource = dsBenef
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
            end
            object grpbxPercentual: TGroupBox
              Left = 495
              Top = 131
              Width = 106
              Height = 50
              Caption = 'Percentual'
              TabOrder = 4
              object dbePercentual: TDBEdit
                Left = 8
                Top = 20
                Width = 89
                Height = 21
                DataField = 'PERCENTUAL'
                DataSource = dsBenef
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
            end
            object GroupBox2: TGroupBox
              Left = 16
              Top = 131
              Width = 337
              Height = 50
              Caption = 'Núcleo Familiar'
              TabOrder = 5
              object DbLkcBuscaNucleo: TCMDBLookupCombo
                Left = 10
                Top = 20
                Width = 313
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'60'#9'Núcleo Familiar')
                DataField = 'IDNUCLEOFAMILIAR'
                DataSource = dsBenef
                LookupTable = QryBuscaNucleo
                LookupField = 'IDNUCLEOFAMILIAR'
                Options = [loTitles]
                Style = csDropDownList
                ParentFont = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
            end
          end
        end
        object TbNucleoFamiliar: TTabSheet
          Caption = 'Nucleo Familiar'
          object DbGrdNucleoFamiliar: TwwDBGrid
            Left = 0
            Top = 0
            Width = 654
            Height = 245
            Selected.Strings = (
              'Responsavel'#9'60'#9'Responsável pelo Núcleo Familiar')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = DsNucleoFam
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
          object PnlNucleoFamiliar: TPanel
            Left = 0
            Top = 0
            Width = 654
            Height = 245
            Align = alClient
            BevelOuter = bvLowered
            TabOrder = 0
            object Lable1: TLabel
              Left = 16
              Top = 16
              Width = 146
              Height = 13
              Caption = 'Responsável pelo Núcleo'
            end
            object DbLkcRespNucleo: TwwDBLookupCombo
              Left = 16
              Top = 32
              Width = 385
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'40'#9'Responsável')
              DataField = 'IDRESPNUCLEO'
              DataSource = DsNucleoFam
              LookupTable = QryResponsavel
              LookupField = 'IDRESPONSAVEL'
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 752
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
          ReadOnly = True
          TabOrder = 1
        end
      end
      inherited Dock974: TDock97
        Left = 666
        Height = 273
      end
    end
  end
  inherited Dock972: TDock97
    Width = 762
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Width = 61
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 427
    Width = 762
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 9
    Top = 460
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 428
    Top = 6
  end
  inherited ds: TwwDataSource
    Left = 252
    Top = 5
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
    Left = 280
    Top = 5
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'EL.MATRICULA'
      'P.NOME'
      'PD.NOME'
      'PP.INSCRICAONUMERO'
      'PL.NOME'
      'PT.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Titular'
      'Dependente'
      'Inscrição Nº'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'S'
      'S'
      'S'
      'S')
    Tabelas.Strings = (
      'PESSOA P'
      'PESSOA PT'
      'PESSOA PD'
      'ELEGPATRO EL'
      'PLANPREV PL'
      'PARTPREVPLAN PP'
      'DEPENTIT DT'
      'PLANPREVPATRO PPP')
    CamposChave.Strings = (
      'PP.IDPESSOA'
      'PP.IDPESSJUR'
      'PP.IDPLANOPREV'
      'PP.SEQPROPOSTA'
      'DT.IDPESSOA')
    Filtro.Strings = (
      'EL.IDPESSOA = PP.IDPESSOA    '
      'EL.IDPESSJUR = PP.IDPESSJUR'
      'PP.SEQPROPOSTA = 1'
      'PP.IDPESSJUR = PPP.IDPESSJUR'
      'PP.IDPLANOPREV = PPP.IDPLANOPREV'
      'PPP.IDPLANOPREV = PL.IDPLANOPREV'
      'EL.IDPESSOA = P.IDPESSOA'
      'EL.IDPESSJUR = PT.IDPESSOA'
      'EL.IDPESSOA = DT.IDTITULAR(+)'
      'DT.IDPESSOA = PD.IDPESSOA'
      'PP.FLGDESATIVADO = 0')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '60'
      '60'
      '15'
      '60'
      '60')
    Left = 369
    Top = 5
  end
  inherited ImlPadrao: TImageList
    Left = 590
    Top = 31
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 823
  end
  inherited qry: TwwQuery
    Tag = 5
    SQL.Strings = (
      'SELECT P.NOME, '
      '              PT.NOME AS NOMEPATRO, '
      '              PL.NOME AS NOMEPLANO, '
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
        'ARTICIPACAO) AS SALARIO'
      'FROM    PESSOA P, '
      '              PESSOA PT, '
      '              PESSOAFISICA PF, '
      '              PLANPREV PL, '
      '              PARTPREVPLAN PP,'
      '              ELEGPATRO EL, '
      '              SITPART SP'
      'WHERE (PP.IDPESSJUR         = :IDPESSJUR)'
      'AND       (PP.IDPLANOPREV    = :IDPLANOPREV)'
      'AND       (PP.IDPESSOA           = :IDPESSOA)'
      'AND       (PP.SEQPROPOSTA  = :SEQPROPOSTA)'
      'AND       (PP.IDPLANOPREV    = PL.IDPLANOPREV)'
      'AND       (PP.IDPESSOA           = P.IDPESSOA)'
      'AND       (PP.IDPESSJUR         = PT.IDPESSOA)'
      'AND       (PP.IDPESSJUR         = EL.IDPESSJUR)'
      'AND       (PP.IDPESSOA           = EL.IDPESSOA)'
      'AND       (PP.IDSITPART          = SP.IDSITPART)'
      'AND       (EL.IDPESSOA            = PF.IDPESSOA)')
    Left = 307
    Top = 5
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
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 873
    Top = 108
  end
  object qryDet: TwwQuery
    Tag = 5
    CachedUpdates = True
    BeforePost = qryDetBeforePost
    AfterScroll = qryDetAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME,'
      '       P.IDPESSOA, '
      '       D.IDTITULAR, '
      '       DP.DESCRICAO AS TIPODEPENDENCIA,'
      '       D.NUMSEQUENCIA,     '
      '       D.FLGCONTAIMPOSTOR, '
      '       D.FLGCONTASALARIOF,'
      '       D.FLGBENEFICIARIO,  '
      '       D.FLGDESIGNADO,     '
      '       D.FLGDEPLEGAL,'
      '       D.IDDEPENDENCIA,'
      '       D.MATRICULA'
      'FROM   PESSOA P, DEPEN DP, DEPENTIT D'
      'WHERE  D.IDTITULAR = :IDTITULAR'
      'AND    D.IDDEPENDENCIA <> '#39'PRP'#39' '
      'AND    D.IDPESSOA = P.IDPESSOA'
      'AND    D.IDDEPENDENCIA = DP.IDDEPENDENCIA'
      'ORDER BY D.NUMSEQUENCIA'
      ''
      ''
      ''
      ''
      ''
      ''
      ' ')
    UpdateObject = updDet
    ControlType.Strings = (
      'FLGCONTAIMPOSTOR;CheckBox;1;0'
      'FLGCONTASALARIOF;CheckBox;1;0'
      'FLGBENEFICIARIO;CheckBox;1;0'
      'FLGDESIGNADO;CheckBox;1;0'
      'FLGDEPLEGAL;CheckBox;1;0')
    ValidateWithMask = True
    Left = 456
    Top = 6
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update DEPENTIT'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDTITULAR = :IDTITULAR,'
      '  NUMSEQUENCIA = :NUMSEQUENCIA,'
      '  FLGCONTAIMPOSTOR = :FLGCONTAIMPOSTOR,'
      '  FLGCONTASALARIOF = :FLGCONTASALARIOF,'
      '  FLGBENEFICIARIO = :FLGBENEFICIARIO,'
      '  FLGDESIGNADO = :FLGDESIGNADO,'
      '  FLGDEPLEGAL = :FLGDEPLEGAL,'
      '  IDDEPENDENCIA = :IDDEPENDENCIA,'
      '  MATRICULA = :MATRICULA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDTITULAR = :OLD_IDTITULAR')
    InsertSQL.Strings = (
      'insert into DEPENTIT'
      
        '  (IDPESSOA, IDTITULAR, NUMSEQUENCIA, FLGCONTAIMPOSTOR, FLGCONTA' +
        'SALARIOF, '
      
        '   FLGBENEFICIARIO, FLGDESIGNADO, FLGDEPLEGAL, IDDEPENDENCIA, MA' +
        'TRICULA)'
      'values'
      
        '  (:IDPESSOA, :IDTITULAR, :NUMSEQUENCIA, :FLGCONTAIMPOSTOR, :FLG' +
        'CONTASALARIOF, '
      
        '   :FLGBENEFICIARIO, :FLGDESIGNADO, :FLGDEPLEGAL, :IDDEPENDENCIA' +
        ', :MATRICULA)')
    DeleteSQL.Strings = (
      'delete from DEPENTIT'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDTITULAR = :OLD_IDTITULAR')
    Left = 484
    Top = 6
  end
  object dsDepen: TwwDataSource
    AutoEdit = False
    DataSet = qryDepen
    Left = 456
    Top = 53
  end
  object qryDepen: TwwQuery
    Tag = 5
    CachedUpdates = True
    BeforePost = qryDepenBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  D.IDPESSOA, '
      '                D.IDSITDEPENDENTE, '
      '                D.FLGDESIGNADO'#13
      'FROM      DEPENDENTE D,'
      '                DEPENTIT DP'
      'WHERE  (DP.IDTITULAR = :IDPESSOA)'
      'AND        (DP.IDPESSOA = D.IDPESSOA) '
      ''
      '')
    UpdateObject = updDepen
    ValidateWithMask = True
    Left = 522
    Top = 50
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object updDepen: TUpdateSQL
    ModifySQL.Strings = (
      'update DEPENDENTE'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDSITDEPENDENTE = :IDSITDEPENDENTE,'
      '  FLGDESIGNADO = :FLGDESIGNADO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into DEPENDENTE'
      '  (IDPESSOA, IDSITDEPENDENTE, FLGDESIGNADO)'
      'values'
      '  (:IDPESSOA, :IDSITDEPENDENTE, :FLGDESIGNADO)')
    DeleteSQL.Strings = (
      'delete from DEPENDENTE'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 606
    Top = 50
  end
  object dsPF: TwwDataSource
    AutoEdit = False
    DataSet = qryPF
    Left = 494
    Top = 52
  end
  object qryPF: TwwQuery
    Tag = 5
    CachedUpdates = True
    BeforePost = qryPFBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  PF.IDPESSOA, '
      '                PF.IDPAIS, '
      #9'PF.NOMEPAI, '
      '                PF.NOMEMAE, '
      '                PF.DATAMORTE, '
      '                PF.DATANASC, '
      '                PF.SEXO, '
      #9'PF.TIPOSANG, '
      '                PF.ESTCIVIL, '
      '                PF.NUMDEPIRRF, '
      '                PF.NUMDEPSALF, '
      '                PF.NUMDEPTOT, '
      '                PF.FLGISENTOIRRF '
      'FROM      PESSOAFISICA PF,'
      '                DEPENTIT DP'
      'WHERE  (DP.IDTITULAR = :IDPESSOA)'
      'AND        (PF.IDPESSOA = DP.IDPESSOA)'
      ''
      '')
    UpdateObject = updPF
    ValidateWithMask = True
    Left = 522
    Top = 84
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object updPF: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOAFISICA'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDPAIS = :IDPAIS,'
      '  NOMEPAI = :NOMEPAI,'
      '  NOMEMAE = :NOMEMAE,'
      '  DATAMORTE = :DATAMORTE,'
      '  DATANASC = :DATANASC,'
      '  SEXO = :SEXO,'
      '  TIPOSANG = :TIPOSANG,'
      '  ESTCIVIL = :ESTCIVIL,'
      '  NUMDEPIRRF = :NUMDEPIRRF,'
      '  NUMDEPSALF = :NUMDEPSALF,'
      '  NUMDEPTOT = :NUMDEPTOT,'
      '  FLGISENTOIRRF = :FLGISENTOIRRF'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOAFISICA'
      
        '  (IDPESSOA, IDPAIS, NOMEPAI, NOMEMAE, DATAMORTE, DATANASC, SEXO' +
        ', '
      'TIPOSANG, '
      '   ESTCIVIL, NUMDEPIRRF, NUMDEPSALF, NUMDEPTOT, FLGISENTOIRRF)'
      'values'
      
        '  (:IDPESSOA, :IDPAIS, :NOMEPAI, :NOMEMAE, :DATAMORTE, :DATANASC' +
        ', '
      ':SEXO, '
      '   :TIPOSANG, :ESTCIVIL, :NUMDEPIRRF, :NUMDEPSALF, :NUMDEPTOT, '
      ':FLGISENTOIRRF)')
    DeleteSQL.Strings = (
      'delete from PESSOAFISICA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 606
    Top = 92
  end
  object dsPessoa: TwwDataSource
    AutoEdit = False
    DataSet = qryPessoa
    Left = 373
    Top = 118
  end
  object qryPessoa: TwwQuery
    Tag = 5
    CachedUpdates = True
    BeforePost = qryPessoaBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  PES.IDPESSOA,  '
      '                PES.NOME, '
      '                PES.TIPO, '
      '                PES.RAZAOSOCIAL,'
      '                PES.IDENDCORRESP,'
      '                PES.IDENDCOMERCIAL,'
      '                PES.IDENDENTREGA,'
      '                PES.IDENDRESIDENCIAL,'
      '                PES.IDENDCOBRANCA'
      'FROM      PESSOA PES,'
      '                 DEPENTIT D'
      'WHERE   (D.IDTITULAR = :IDPESSOA)'
      'AND         (PES.IDPESSOA = D.IDPESSOA)'
      '')
    UpdateObject = updPessoa
    ValidateWithMask = True
    Left = 337
    Top = 206
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object updPessoa: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  NOME = :NOME,'
      '  TIPO = :TIPO,'
      '  RAZAOSOCIAL = :RAZAOSOCIAL,'
      '  IDENDCORRESP = :IDENDCORRESP,'
      '  IDENDCOMERCIAL = :IDENDCOMERCIAL,'
      '  IDENDENTREGA = :IDENDENTREGA,'
      '  IDENDRESIDENCIAL = :IDENDRESIDENCIAL,'
      '  IDENDCOBRANCA = :IDENDCOBRANCA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      
        '  (IDPESSOA, NOME, TIPO, RAZAOSOCIAL, IDENDCORRESP, IDENDCOMERCI' +
        'AL, '
      'IDENDENTREGA, '
      '   IDENDRESIDENCIAL, IDENDCOBRANCA)'
      'values'
      '  (:IDPESSOA, :NOME, :TIPO, :RAZAOSOCIAL, :IDENDCORRESP, '
      ':IDENDCOMERCIAL, '
      '   :IDENDENTREGA, :IDENDRESIDENCIAL, :IDENDCOBRANCA)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 605
    Top = 6
  end
  object dsEndPess: TwwDataSource
    DataSet = qryEndPess
    Left = 893
    Top = 92
  end
  object qryEndPess: TwwQuery
    Tag = 5
    CachedUpdates = True
    BeforePost = qryEndPessBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  EP.IDPESSOA ,'
      '  EP.IDENDERECO ,'
      '  EP.IDCIDADES ,'
      '  EP.LOGRADOURO ,'
      '  EP.NUMERO ,'
      '  EP.COMPLEMENTO ,'
      '  EP.NOME,'
      '  EP.BAIRRO , '
      '  EP.CEP ,'
      '  EP.IDPAIS,'
      '  C.NOME AS NOMECIDADE,'
      '  E.NOMEESTADO,'
      '  P.NOMEPAIS'
      'FROM '
      '  ENDPESS EP,'
      '  CIDADES C,'
      '  ESTADO E,'
      '  PAIS P,'
      '  DEPENTIT D'
      'WHERE'
      '         (D.IDTITULAR = :IDTITULAR)'
      'AND (EP.IDPESSOA = D.IDPESSOA)'
      'AND (EP.IDCIDADES = C.IDCIDADES(+))'
      'AND (C.IDESTADO = E.IDESTADO(+))'
      'AND (E.IDPAIS = P.IDPAIS(+))'
      ''
      '')
    UpdateObject = updEndPess
    ValidateWithMask = True
    Left = 921
    Top = 92
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object updEndPess: TUpdateSQL
    ModifySQL.Strings = (
      'update ENDPESS'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDENDERECO = :IDENDERECO,'
      '  IDCIDADES = :IDCIDADES,'
      '  LOGRADOURO = :LOGRADOURO,'
      '  NUMERO = :NUMERO,'
      '  COMPLEMENTO = :COMPLEMENTO,'
      '  NOME = :NOME,'
      '  BAIRRO = :BAIRRO,'
      '  CEP = :CEP,'
      '  IDPAIS = :IDPAIS'
      'where'
      '  IDENDERECO = :OLD_IDENDERECO')
    InsertSQL.Strings = (
      'insert into ENDPESS'
      '  (IDPESSOA, IDENDERECO, IDCIDADES, LOGRADOURO, NUMERO, '
      'COMPLEMENTO, NOME,BAIRRO, '
      '   CEP, IDPAIS)'
      'values'
      '  (:IDPESSOA, :IDENDERECO, :IDCIDADES, :LOGRADOURO, :NUMERO, '
      ':COMPLEMENTO, :NOME,'
      '   :BAIRRO, :CEP, :IDPAIS)')
    DeleteSQL.Strings = (
      'delete from ENDPESS'
      'where'
      '  IDENDERECO = :OLD_IDENDERECO')
    Left = 949
    Top = 92
  end
  object qryDependencia: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDDEPENDENCIA, DESCRICAO'
      'FROM DEPEN'
      'WHERE IDDEPENDENCIA <> '#39'PRP'#39
      'ORDER BY DESCRICAO'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 661
    Top = 103
  end
  object qrySeq: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MAX(NUMSEQUENCIA) AS PROXNUMSEQ'
      'FROM   DEPENTIT '
      'WHERE  IDTITULAR = :IDTITULAR ')
    ValidateWithMask = True
    Left = 533
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object qryCidade: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  C.IDCIDADES,'
      '  C.NOME AS NOMECIDADE,'
      '  E.CODESTADO , '
      '  E.NOMEESTADO , '
      '  P.IDPAIS , '
      '  P.NOMEPAIS,'
      '  P.MASCARACPOSTAL,'
      '  E.IDESTADO'
      'FROM '
      '  CIDADES C,'
      '  ESTADO E, '
      '  PAIS P'
      'WHERE '
      '  ( C.IDESTADO = E.IDESTADO) AND'
      '  ( E.IDPAIS = P.IDPAIS )'
      'ORDER BY C.NOME'
      '')
    ValidateWithMask = True
    Left = 666
    Top = 4
    object qryCidadeNOMECIDADE: TStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 40
      FieldName = 'NOMECIDADE'
      Origin = '"CM.CIDADES".NOME'
      Size = 50
    end
    object qryCidadeCODESTADO: TStringField
      DisplayLabel = 'Estado'
      DisplayWidth = 3
      FieldName = 'CODESTADO'
      Origin = 'ESTADO.CODESTADO'
      Visible = False
      Size = 3
    end
    object qryCidadeIDCIDADES: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCIDADES'
      Origin = '"CM.CIDADES".IDCIDADES'
      Visible = False
    end
    object qryCidadeNOMEESTADO: TStringField
      DisplayWidth = 30
      FieldName = 'NOMEESTADO'
      Origin = 'ESTADO.NOMEESTADO'
      Visible = False
      Size = 30
    end
    object qryCidadeIDPAIS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPAIS'
      Origin = '"CM.PAIS".IDPAIS'
      Visible = False
    end
    object qryCidadeNOMEPAIS: TStringField
      DisplayWidth = 30
      FieldName = 'NOMEPAIS'
      Origin = '"CM.PAIS".NOMEPAIS'
      Visible = False
      Size = 30
    end
  end
  object dsCidade: TDataSource
    DataSet = qryCidade
    Left = 704
    Top = 7
  end
  object dsCBanco: TwwDataSource
    DataSet = qryCBanco
    Left = 893
    Top = 60
  end
  object qryCBanco: TwwQuery
    Tag = 5
    CachedUpdates = True
    AfterEdit = qryCBancoAfterEdit
    BeforePost = qryCBancoBeforePost
    AfterScroll = qryCBancoAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CB.IDCBANCARIA,'
      '               CB.CONTACORRENTE,'
      '               CB.IDAGENCIA,'
      '               CB.FLGCONTAPREF,'
      '               CB.IDPESSOA,'
      '               CB.TIPOCONTA,'
      '               CB.FLGCONTACONJUNTA,'
      '               PA.NOME AS AGENCIA,'
      '               PB.NOME AS BANCO,'
      '               AB.NUMAGENCIA,'
      '               AB.IDBANCO,'
      '               B.NUMBANCO'
      ''
      'FROM    CONTABANCARIA CB,'
      '               PESSOA PA,'
      '               PESSOA PB,'
      '               AGENCIABANCARIA AB,'
      '               BANCO B,'
      '               DEPENTIT D'
      ''
      ''
      'WHERE D.IDTITULAR   = :IDTITULAR'
      'AND       D.IDPESSOA    = CB.IDPESSOA      '
      'AND       CB.IDAGENCIA = AB.IDPESSOA '
      'AND       AB.IDPESSOA  = PA.IDPESSOA  '
      'AND       AB.IDBANCO    = PB.IDPESSOA'
      'AND       AB.IDBANCO    = B.IDPESSOA'
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
    UpdateObject = updCBanco
    ControlType.Strings = (
      'FLGCONTAPREF;CheckBox;1;0'
      'FLGCONTACONJUNTA;CheckBox;S;N')
    ValidateWithMask = True
    Left = 921
    Top = 60
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object updCBanco: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTABANCARIA'
      'set'
      '  IDCBANCARIA = :IDCBANCARIA,'
      '  CONTACORRENTE = :CONTACORRENTE,'
      '  IDAGENCIA = :IDAGENCIA,'
      '  FLGCONTAPREF = :FLGCONTAPREF,'
      '  IDPESSOA = :IDPESSOA,'
      '  TIPOCONTA = :TIPOCONTA,'
      '  FLGCONTACONJUNTA = :FLGCONTACONJUNTA'
      'where'
      '  IDCBANCARIA = :OLD_IDCBANCARIA')
    InsertSQL.Strings = (
      'insert into CONTABANCARIA'
      
        '  (IDCBANCARIA, CONTACORRENTE, IDAGENCIA, FLGCONTAPREF, IDPESSOA' +
        ', '
      'TIPOCONTA, '
      '   FLGCONTACONJUNTA)'
      'values'
      '  (:IDCBANCARIA, :CONTACORRENTE, :IDAGENCIA, :FLGCONTAPREF, '
      ':IDPESSOA, '
      '   :TIPOCONTA, :FLGCONTACONJUNTA)')
    DeleteSQL.Strings = (
      'delete from CONTABANCARIA'
      'where'
      '  IDCBANCARIA = :OLD_IDCBANCARIA')
    Left = 949
    Top = 60
  end
  object dsBenef: TwwDataSource
    DataSet = qryBenef
    Left = 549
    Top = 52
  end
  object qryBenef: TwwQuery
    Tag = 5
    CachedUpdates = True
    BeforePost = qryBenefBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  BTP.IDPESSJUR,'
      '        D.IDTITULAR,'
      '        BTP.IDPLANOPREV,'
      '        D.IDPESSOA,'
      '        BTP.IDBENEFICIO,'
      '        BTP.SEQPROPOSTA,'
      '        BTP.IDDEPENRESPON,'
      '        BTP.IDRESPONSAVEL,'
      '        BTP.IDNUCLEOFAMILIAR,'
      '        BTP.PRIORIDADE,'
      '        BTP.PERCENTUAL,'
      '        B.NOME AS BENEFICIO,'
      '        PRES.NOME AS RESPONSAVEL,'
      '        DP.DESCRICAO'
      ''
      'FROM    PESSOA PRES,'
      '        BFCIARIOTITPLAN BTP,'
      '        PARTPREVPLAN PPP,'
      '        BENEFICIO B,'
      '        DEPENTIT D,'
      '        DEPEN DP'
      'WHERE   BTP.IDTITULAR     = :IDTITULAR'
      'AND     BTP.SEQPROPOSTA   = 1'
      'AND     BTP.IDPESSJUR     = PPP.IDPESSJUR'
      'AND     BTP.IDPLANOPREV   = PPP.IDPLANOPREV'
      'AND     BTP.IDTITULAR     = PPP.IDPESSOA'
      'AND     BTP.SEQPROPOSTA   = PPP.SEQPROPOSTA'
      'AND     BTP.IDPESSOA      = D.IDPESSOA'
      'AND     BTP.IDTITULAR     = D.IDTITULAR'
      'AND     BTP.IDBENEFICIO   = B.IDBENEFICIO'
      'AND     BTP.IDDEPENRESPON = DP.IDDEPENDENCIA(+)'
      'AND     BTP.IDRESPONSAVEL = PRES.IDPESSOA(+)'
      '')
    UpdateObject = updBenef
    ValidateWithMask = True
    Left = 649
    Top = 52
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object updBenef: TUpdateSQL
    ModifySQL.Strings = (
      'update BFCIARIOTITPLAN'
      'set'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDTITULAR = :IDTITULAR,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDBENEFICIO = :IDBENEFICIO,'
      '  SEQPROPOSTA = :SEQPROPOSTA,'
      '  IDDEPENRESPON = :IDDEPENRESPON,'
      '  IDRESPONSAVEL = :IDRESPONSAVEL,'
      '  IDNUCLEOFAMILIAR = :IDNUCLEOFAMILIAR,'
      '  PRIORIDADE = :PRIORIDADE,'
      '  PERCENTUAL = :PERCENTUAL'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    InsertSQL.Strings = (
      'insert into BFCIARIOTITPLAN'
      
        '  (IDPESSJUR, IDTITULAR, IDPLANOPREV, IDPESSOA, IDBENEFICIO, SEQ' +
        'PROPOSTA, '
      
        '   IDDEPENRESPON, IDRESPONSAVEL, IDNUCLEOFAMILIAR, PRIORIDADE, P' +
        'ERCENTUAL)'
      'values'
      
        '  (:IDPESSJUR, :IDTITULAR, :IDPLANOPREV, :IDPESSOA, :IDBENEFICIO' +
        ', :SEQPROPOSTA, '
      
        '   :IDDEPENRESPON, :IDRESPONSAVEL, :IDNUCLEOFAMILIAR, :PRIORIDAD' +
        'E, :PERCENTUAL)')
    DeleteSQL.Strings = (
      'delete from BFCIARIOTITPLAN'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    Left = 677
    Top = 52
  end
  object MSResp: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome')
    SensivelACaixa.Strings = (
      'S')
    Tabelas.Strings = (
      'PESSOA'
      'RESPONSAVEL')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA'
      'RESPONSAVEL.IDRESPONSAVEL'
      'PESSOA.NOME')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = RESPONSAVEL.IDRESPONSAVEL'
      'RESPONSAVEL.FLGADMPREV = 1')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 242
    Top = 119
  end
  object qryBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  B.IDBENEFICIO,'
      '  B.NOME'
      ''
      'FROM'
      '  BENEFICIO B,'
      '  BENEFPLANPREV BPP'
      '  '
      'WHERE'
      '  BPP.IDPLANOPREV = :IDPLANOPREV   AND'
      '  BPP.IDBENEFICIO = B.IDBENEFICIO  AND'
      '  B.FLGDESTBENEF <> '#39'P'#39
      ''
      'ORDER BY '
      '   B.NOME'
      '')
    ValidateWithMask = True
    Left = 661
    Top = 60
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryBanco: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  B.IDPESSOA,'
      '  P.NOME AS BANCO,'
      '  B.NUMBANCO'
      'FROM'
      '  PESSOA P,  BANCO B'
      'WHERE'
      '  P.IDPESSOA = B.IDPESSOA'
      'ORDER BY '
      '  P.NOME ')
    ValidateWithMask = True
    Left = 389
    Top = 208
  end
  object qryAgencia: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  AGENCIABANCARIA.IDPESSOA,'
      '               AGENCIA.NOME AS AGENCIA, '
      '               AGENCIABANCARIA.NUMAGENCIA'
      'FROM AGENCIABANCARIA, PESSOA AGENCIA'
      'WHERE AGENCIABANCARIA.IDPESSOA  = AGENCIA.IDPESSOA AND'
      '               AGENCIABANCARIA.IDBANCO=:pIdBanco'
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 715
    Top = 314
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdBanco'
        ParamType = ptUnknown
      end>
  end
  object qrySitDependente: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDSITDEPENDENTE, '
      '       DESCRICAO'
      'FROM SITDEPENDENTE'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 718
    Top = 335
  end
  object DsNucleoFam: TwwDataSource
    AutoEdit = False
    DataSet = QryNucleoFam
    Left = 503
    Top = 452
  end
  object QryNucleoFam: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  NF.IDNUCLEOFAMILIAR, '
      '  NF.IDRESPNUCLEO,'
      '  NF.IDTITULAR'
      'FROM'
      '  CM.NUCLEOFAMILIAR NF'
      'WHERE'
      '  (NF.IDTITULAR = :IDTITULAR)'
      '')
    UpdateObject = UpdNucleoFam
    ValidateWithMask = True
    Left = 536
    Top = 455
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
    object QryNucleoFamResponsavel: TStringField
      DisplayLabel = 'Responsável pelo Núcleo Familiar'
      DisplayWidth = 60
      FieldKind = fkLookup
      FieldName = 'Responsavel'
      LookupDataSet = QryResponsavel
      LookupKeyFields = 'IDRESPONSAVEL'
      LookupResultField = 'NOME'
      KeyFields = 'IDRESPNUCLEO'
      Size = 60
      Lookup = True
    end
    object QryNucleoFamIDNUCLEOFAMILIAR: TFloatField
      DisplayWidth = 15
      FieldName = 'IDNUCLEOFAMILIAR'
      Visible = False
    end
    object QryNucleoFamIDRESPNUCLEO: TFloatField
      DisplayWidth = 12
      FieldName = 'IDRESPNUCLEO'
      Visible = False
    end
    object QryNucleoFamIDTITULAR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTITULAR'
      Origin = 'NUCLEOFAMILIAR.IDTITULAR'
      Visible = False
    end
  end
  object UpdNucleoFam: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.NUCLEOFAMILIAR'
      'set'
      '  IDNUCLEOFAMILIAR = :IDNUCLEOFAMILIAR,'
      '  IDRESPNUCLEO = :IDRESPNUCLEO,'
      '  IDTITULAR = :IDTITULAR'
      'where'
      '  IDNUCLEOFAMILIAR = :OLD_IDNUCLEOFAMILIAR')
    InsertSQL.Strings = (
      'insert into CM.NUCLEOFAMILIAR'
      '  (IDNUCLEOFAMILIAR, IDRESPNUCLEO, IDTITULAR)'
      'values'
      '  (:IDNUCLEOFAMILIAR, :IDRESPNUCLEO, :IDTITULAR)')
    DeleteSQL.Strings = (
      'delete from CM.NUCLEOFAMILIAR'
      'where'
      '  IDNUCLEOFAMILIAR = :OLD_IDNUCLEOFAMILIAR')
    Left = 580
    Top = 454
  end
  object QryResponsavel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT RE.IDRESPONSAVEL, PS.NOME'
      'FROM   PESSOA PS,'
      '       RESPONSAVEL RE'
      'WHERE  RE.IDRESPONSAVEL = PS.IDPESSOA'
      'AND    RE.FLGADMPREV    = 1    ')
    ValidateWithMask = True
    Left = 740
    Top = 307
  end
  object QryBuscaNucleo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  NF.IDNUCLEOFAMILIAR, '
      '  NF.IDRESPNUCLEO, PS.NOME, '
      '  NF.IDTITULAR'
      'FROM'
      '  CM.PESSOA PS,'
      '  CM.NUCLEOFAMILIAR NF'
      'WHERE'
      '  (NF.IDTITULAR    = :IDTITULAR) AND'
      '  (NF.IDRESPNUCLEO = PS.IDPESSOA)'
      '')
    ValidateWithMask = True
    Left = 665
    Top = 388
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 457
    Top = 456
  end
  object qryInsResponsavel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    UpdateObject = UpdInsResp
    ValidateWithMask = True
    Left = 675
    Top = 77
  end
  object UpdInsResp: TUpdateSQL
    Left = 704
    Top = 77
  end
  object UpdateSQL1: TUpdateSQL
    Left = 768
    Top = 77
  end
  object wwQuery1: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    UpdateObject = UpdateSQL1
    ValidateWithMask = True
    Left = 739
    Top = 77
  end
  object UpdateSQL2: TUpdateSQL
    Left = 832
    Top = 77
  end
  object wwQuery2: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    UpdateObject = UpdateSQL2
    ValidateWithMask = True
    Left = 803
    Top = 77
  end
  object UpdateSQL3: TUpdateSQL
    Left = 624
    Top = 141
  end
  object wwQuery3: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    UpdateObject = UpdateSQL3
    ValidateWithMask = True
    Left = 555
    Top = 69
  end
end
