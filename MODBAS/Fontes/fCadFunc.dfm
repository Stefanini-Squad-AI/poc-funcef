inherited frmCadFunc: TfrmCadFunc
  Left = -4
  Top = -4
  HelpContext = 690006
  Caption = 'Cadastro de Pessoal'
  ClientHeight = 581
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 495
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 58
      Height = 432
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos'
        'Dados Pessoais'
        'Situação Funcional'
        'Últimos Empregos')
      detdbGrids.Strings = (
        ''
        'dbGrdDet'
        'dbgTelefone'
        'dbgContato'
        ''
        ''
        'dbgrUltEmpr')
      inherited pgctrlDetalhe: TPageControl
        Height = 373
        ActivePage = tbsSitFunc
        inherited tbsDocumento: TTabSheet
          inherited PgCtrlPesFisica_Padrao: TPageControl
            Height = 345
          end
          inherited PnlDocumentos_Padrao: TPanel
            Height = 345
            inherited pnlItemsDoc: TPanel
              Height = 343
            end
            inherited pnlFoto: TPanel
              Height = 343
              inherited Bevel1: TBevel
                Height = 312
              end
              inherited PnlAssociaFoto_Padrao: TPanel
                Top = 312
              end
              inherited SbImagePessoa_Padrao: TScrollBox
                Height = 312
                inherited imgPessoa: TDBImage
                  Left = 34
                  Top = 35
                  Width = 190
                  Height = 213
                end
              end
            end
            inherited lstDocumentos: TListView
              Height = 343
            end
          end
        end
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel
            Height = 345
            inherited grpTipoEnd: TGroupBox
              Height = 345
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Height = 345
          end
        end
        inherited tbsTelefone: TTabSheet
          inherited dbgTelefone: TwwDBGrid
            Height = 345
          end
          inherited Panel1: TPanel
            Height = 345
          end
        end
        inherited tbsContato: TTabSheet
          inherited Panel2: TPanel
            Height = 345
          end
          inherited dbgContato: TwwDBGrid
            Height = 345
          end
        end
        object tbsDadosPess: TTabSheet
          Caption = 'Dados Pessoais'
          object Label21: TLabel
            Left = 275
            Top = 101
            Width = 92
            Height = 13
            Caption = 'Tipo Sanguíneo'
          end
          object Label2: TLabel
            Left = 408
            Top = 46
            Width = 98
            Height = 13
            Caption = 'Data Nascimento'
          end
          object Label15: TLabel
            Left = 408
            Top = 87
            Width = 64
            Height = 13
            Caption = 'Raça / Cor'
          end
          object Label14: TLabel
            Left = 83
            Top = 137
            Width = 82
            Height = 13
            Caption = 'Nacionalidade'
          end
          object Label18: TLabel
            Left = 408
            Top = 127
            Width = 103
            Height = 13
            Caption = 'Grau de Instrução'
          end
          object Label20: TLabel
            Left = 408
            Top = 165
            Width = 53
            Height = 13
            Caption = 'Profissão'
          end
          object Label34: TLabel
            Left = 408
            Top = 201
            Width = 54
            Height = 13
            Caption = 'Sindicato'
          end
          object dbrgEstCivil: TDBRadioGroup
            Left = 83
            Top = 6
            Width = 185
            Height = 130
            Caption = 'Estado Civil'
            DataField = 'ESTCIVIL'
            DataSource = dsPessoaFisica
            Items.Strings = (
              'Solteiro(a)'
              'Casado(a)'
              'Separado(a)'
              'Separado(a) Judicialmente'
              'Desquitado(a)'
              'Viúvo(a)'
              'Outro')
            TabOrder = 0
            TabStop = True
            Values.Strings = (
              'S'
              'C'
              'D'
              'J'
              'E'
              'V'
              'O')
          end
          object gbxDepend: TGroupBox
            Left = 275
            Top = 6
            Width = 126
            Height = 91
            Caption = 'Qtde.Dependentes'
            TabOrder = 1
            object Label40: TLabel
              Left = 6
              Top = 18
              Width = 30
              Height = 13
              Caption = 'Total'
            end
            object Label41: TLabel
              Left = 6
              Top = 41
              Width = 46
              Height = 13
              Caption = 'I.Renda'
            end
            object Label42: TLabel
              Left = 6
              Top = 65
              Width = 50
              Height = 13
              Caption = 'Sal.Fam.'
            end
            object dbedQtdIR: TwwDBEdit
              Left = 60
              Top = 39
              Width = 50
              Height = 21
              DataField = 'NUMDEPIRRF'
              DataSource = dsPessoaFisica
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedQtdSF: TwwDBEdit
              Left = 60
              Top = 63
              Width = 50
              Height = 21
              DataField = 'NUMDEPSALF'
              DataSource = dsPessoaFisica
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedQtdTot: TwwDBEdit
              Left = 60
              Top = 15
              Width = 50
              Height = 21
              DataField = 'NUMDEPTOT'
              DataSource = dsPessoaFisica
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
          object dbcmbTipoSang: TwwDBComboBox
            Left = 275
            Top = 115
            Width = 126
            Height = 21
            ShowButton = True
            Style = csDropDown
            MapList = False
            AllowClearKey = False
            DataField = 'TIPOSANG'
            DataSource = dsPessoaFisica
            DropDownCount = 8
            ItemHeight = 0
            Items.Strings = (
              'A+'
              'A-'
              'AB+'
              'AB-'
              'B+'
              'B-'
              'O+'
              'O-')
            Sorted = False
            TabOrder = 2
            UnboundDataType = wwDefault
          end
          object dbrgSexo: TDBRadioGroup
            Left = 408
            Top = 6
            Width = 249
            Height = 31
            Caption = 'Sexo'
            Columns = 2
            DataField = 'SEXO'
            DataSource = dsPessoaFisica
            Items.Strings = (
              'Masculino'
              'Feminino')
            TabOrder = 3
            TabStop = True
            Values.Strings = (
              'M'
              'F')
          end
          object dbedDatNasc: TCMDateTimePicker
            Left = 408
            Top = 59
            Width = 100
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATANASC'
            DataSource = dsPessoaFisica
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
          end
          object dbrgIsento: TDBRadioGroup
            Left = 521
            Top = 47
            Width = 136
            Height = 33
            Caption = 'Isento de I.Renda?'
            Columns = 2
            DataField = 'FLGISENTOIRRF'
            DataSource = dsPessoaFisica
            Items.Strings = (
              'Sim'
              'Não')
            TabOrder = 5
            TabStop = True
            Values.Strings = (
              '1'
              '0')
          end
          object cmbRaca: TComboBox
            Left = 408
            Top = 100
            Width = 100
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 6
            Items.Strings = (
              'Branca'
              'Negra'
              'Amarela'
              'Parda'
              'Indígena')
          end
          object dbrgDeficienteFis: TDBRadioGroup
            Left = 521
            Top = 88
            Width = 136
            Height = 33
            Caption = 'Deficiente Físico?'
            Columns = 2
            DataField = 'FLGDEFICIENTE'
            DataSource = dsPessoaFisica
            Items.Strings = (
              'Sim'
              'Não')
            TabOrder = 7
            TabStop = True
            Values.Strings = (
              '1'
              '2')
          end
          object dblcNacional: TwwDBLookupCombo
            Left = 83
            Top = 150
            Width = 319
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMENACIONALIDADE'#9'30'#9'NOMENACIONALIDADE')
            DataField = 'IDPAIS'
            DataSource = dsPessoaFisica
            LookupTable = qryPaises
            LookupField = 'IDPAIS'
            TabOrder = 8
            AutoDropDown = True
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            AllowClearKey = True
            OnChange = dblcNacionalChange
          end
          object gbxNaturalidade: TGroupBox
            Left = 83
            Top = 171
            Width = 319
            Height = 64
            Caption = 'Naturalidade'
            TabOrder = 9
            object Label17: TLabel
              Left = 4
              Top = 40
              Width = 40
              Height = 13
              Caption = 'Estado'
            end
            object Label65: TLabel
              Left = 4
              Top = 18
              Width = 40
              Height = 13
              Caption = 'Cidade'
            end
            object wwDBLookupCombo6: TwwDBLookupCombo
              Left = 48
              Top = 14
              Width = 263
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'50'#9'NOME'#9'F')
              DataField = 'IDCIDADES'
              DataSource = dsPessoaFisica
              LookupTable = qryCidadeNasc
              LookupField = 'IDCIDADES'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
            end
            object dblcNatural: TwwDBLookupCombo
              Left = 48
              Top = 36
              Width = 263
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODESTADO'#9'3'#9'Sigla'
                'NOMEESTADO'#9'30'#9'Estado'
                'NOMEPAIS'#9'30'#9'País')
              DataField = 'CODESTADO'
              DataSource = dsPessoaFisica
              LookupTable = qryEstadoNasc
              LookupField = 'CODESTADO'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
            end
          end
          object dblcGrauInstr: TwwDBLookupCombo
            Left = 408
            Top = 140
            Width = 250
            Height = 21
            DropDownAlignment = taRightJustify
            Selected.Strings = (
              'DESCRICAO'#9'30'#9'DESCRICAO')
            DataField = 'IDGRINSTR'
            DataSource = dsPessoaFisica
            LookupTable = qryGrauInstr
            LookupField = 'IDGRINSTR'
            TabOrder = 10
            AutoDropDown = True
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            AllowClearKey = True
          end
          object dblcProfissao: TwwDBLookupCombo
            Left = 408
            Top = 178
            Width = 250
            Height = 21
            DropDownAlignment = taRightJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'DESCRICAO')
            DataField = 'IDPROFISS'
            DataSource = dsPessoaFisica
            LookupTable = qryProfissao
            LookupField = 'IDPROFISS'
            TabOrder = 11
            AutoDropDown = True
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            AllowClearKey = True
          end
          object dblcSindi: TwwDBLookupCombo
            Left = 408
            Top = 214
            Width = 250
            Height = 21
            DropDownAlignment = taRightJustify
            Selected.Strings = (
              'NOME'#9'60'#9'NOME')
            DataField = 'IDSINDICATO'
            DataSource = dsPessoaFisica
            LookupTable = qrySindicato
            LookupField = 'IDPESSOA'
            TabOrder = 12
            AutoDropDown = True
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            AllowClearKey = True
          end
          object gbxFiliacao: TGroupBox
            Left = 83
            Top = 236
            Width = 576
            Height = 64
            Caption = 'Filiação'
            TabOrder = 13
            object Label38: TLabel
              Left = 12
              Top = 18
              Width = 19
              Height = 13
              Caption = 'Pai'
            end
            object Label39: TLabel
              Left = 9
              Top = 37
              Width = 25
              Height = 13
              Caption = 'Mãe'
            end
            object wwDBEdit2: TwwDBEdit
              Left = 36
              Top = 14
              Width = 528
              Height = 21
              DataField = 'NOMEPAI'
              DataSource = dsPessoaFisica
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object wwDBEdit3: TwwDBEdit
              Left = 36
              Top = 36
              Width = 528
              Height = 21
              DataField = 'NOMEMAE'
              DataSource = dsPessoaFisica
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
        end
        object tbsSitFunc: TTabSheet
          Caption = 'Situação Funcional'
          object gbxIdent: TGroupBox
            Left = 13
            Top = -1
            Width = 361
            Height = 194
            Caption = 'Identificação'
            TabOrder = 0
            object Label3: TLabel
              Left = 10
              Top = 21
              Width = 55
              Height = 13
              Caption = 'Matrícula'
            end
            object Label4: TLabel
              Left = 202
              Top = 21
              Width = 54
              Height = 13
              Caption = 'Admissão'
            end
            object Label5: TLabel
              Left = 9
              Top = 41
              Width = 51
              Height = 13
              Caption = 'Situação'
            end
            object Label6: TLabel
              Left = 9
              Top = 115
              Width = 114
              Height = 13
              Caption = 'Horário de Trabalho'
            end
            object Label7: TLabel
              Left = 9
              Top = 153
              Width = 134
              Height = 13
              Caption = 'Fonte de Recrutamento'
            end
            object Label55: TLabel
              Left = 250
              Top = 115
              Width = 101
              Height = 13
              Caption = 'Data Ref. Horário'
            end
            object Label8: TLabel
              Left = 9
              Top = 77
              Width = 119
              Height = 13
              Caption = 'Motivo Desligamento'
            end
            object Label13: TLabel
              Left = 184
              Top = 77
              Width = 113
              Height = 13
              Caption = 'Motivo Afastamento'
            end
            object dbedMatric: TwwDBEdit
              Left = 68
              Top = 18
              Width = 109
              Height = 21
              DataField = 'MATRICULA'
              DataSource = dsSubTipo
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedDatAdmis: TCMDateTimePicker
              Left = 259
              Top = 18
              Width = 93
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAADMISSAO'
              DataSource = dsSubTipo
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
            end
            object dblcSituacao: TwwDBLookupCombo
              Left = 9
              Top = 54
              Width = 343
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'30'#9'DESCRICAO')
              DataField = 'IDSITFUNC'
              DataSource = dsSubTipo
              LookupTable = qrySitFunc
              LookupField = 'IDSITFUNC'
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
            end
            object dblckHorario: TwwDBLookupCombo
              Left = 9
              Top = 128
              Width = 232
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEHORARIO'#9'40'#9'NOMEHORARIO')
              DataField = 'IDHORARIO'
              DataSource = dsSubTipo
              LookupTable = qryHorario
              LookupField = 'IDHORARIO'
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
            end
            object dblckcmbFonteRecrut: TwwDBLookupCombo
              Left = 9
              Top = 166
              Width = 343
              Height = 21
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'DESCRICAO'#9'30'#9'DESCRICAO')
              DataField = 'IDFONTRECR'
              DataSource = dsPessoaFisica
              LookupTable = qryFonte
              LookupField = 'IDFONTRECR'
              TabOrder = 7
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
            end
            object dbedDatRefHor: TCMDateTimePicker
              Left = 250
              Top = 128
              Width = 102
              Height = 21
              Hint = 'Importante Se For Horário de Escala'
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAREFHORARIO'
              DataSource = dsSubTipo
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
              ParentShowHint = False
              ShowHint = True
              ShowButton = True
              TabOrder = 6
            end
            object dblcMotivoDeslig: TwwDBLookupCombo
              Left = 9
              Top = 90
              Width = 167
              Height = 21
              Hint = 'Motivo da Alteração na Situação Funcional'
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'DESCRICAO')
              DataField = 'IDMOTIVODESLIGRAIS'
              DataSource = dsSubTipo
              LookupTable = qryMotivo
              LookupField = 'IDMOTIVO'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
            end
            object dblcMotivoAfast: TwwDBLookupCombo
              Left = 183
              Top = 90
              Width = 168
              Height = 21
              Hint = 'Motivo da Alteração na Situação Funcional'
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'DESCRICAO')
              DataField = 'IDMOTIVODESLIGGERENCIAL'
              DataSource = dsSubTipo
              LookupTable = qryMotivo
              LookupField = 'IDMOTIVO'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
            end
          end
          object gbxContr: TGroupBox
            Left = 381
            Top = -1
            Width = 335
            Height = 129
            Caption = 'Contrato de Trabalho'
            TabOrder = 1
            object dbrgTipContrato: TDBRadioGroup
              Left = 8
              Top = 11
              Width = 126
              Height = 110
              DataField = 'TIPOCONTRATO'
              DataSource = dsSubTipo
              Items.Strings = (
                'Efetivo'
                'Efetivo Especial'
                'Temporário'
                'Estagiário'
                'Terceiro'
                'Prop/Dir s/ Vinc'
                'Autônomo')
              TabOrder = 0
              Values.Strings = (
                'E'
                'S'
                'T'
                'G'
                '3'
                'P'
                'A')
            end
            object gbxContrato: TGroupBox
              Left = 140
              Top = 11
              Width = 187
              Height = 110
              Caption = 'Prazo Det. ou Experiência'
              TabOrder = 1
              object Label9: TLabel
                Left = 6
                Top = 22
                Width = 28
                Height = 13
                Caption = 'Final'
              end
              object Label43: TLabel
                Left = 6
                Top = 51
                Width = 49
                Height = 13
                Caption = 'Duração'
              end
              object Label47: TLabel
                Left = 6
                Top = 82
                Width = 70
                Height = 13
                Caption = 'Prorrogação'
              end
              object lblTipoDuracaoContr: TLabel
                Left = 6
                Top = 66
                Width = 70
                Height = 13
                AutoSize = False
                Caption = '(Duração)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object dbedFinalContr: TCMDateTimePicker
                Left = 78
                Top = 17
                Width = 100
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATAFIMCONTRATO'
                DataSource = dsSubTipo
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
                OnExit = dbedFinalContrExit
              end
              object dbedDuracaoContr: TwwDBEdit
                Left = 78
                Top = 48
                Width = 100
                Height = 21
                DataField = 'DURACAOCONTRATO'
                DataSource = dsSubTipo
                TabOrder = 1
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
                OnExit = dbedDuracaoContrExit
              end
              object dbedProrrogContr: TwwDBEdit
                Left = 78
                Top = 79
                Width = 100
                Height = 21
                AutoSize = False
                DataField = 'PRORROGCONTRATO'
                DataSource = dsSubTipo
                TabOrder = 2
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
            end
          end
          object gbxDeslig: TGroupBox
            Left = 13
            Top = 194
            Width = 361
            Height = 48
            Caption = 'Desligamento ou Afastamento'
            TabOrder = 2
            object Label10: TLabel
              Left = 7
              Top = 19
              Width = 59
              Height = 13
              Caption = 'Data Efet.'
            end
            object Label11: TLabel
              Left = 164
              Top = 20
              Width = 46
              Height = 13
              Caption = 'Retorno'
            end
            object dbedDatSaida: TCMDateTimePicker
              Left = 67
              Top = 17
              Width = 93
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATADESLIGAMENTO'
              DataSource = dsSubTipo
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
            end
            object dbedRetorno: TCMDateTimePicker
              Left = 214
              Top = 17
              Width = 93
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATARETORNO'
              DataSource = dsSubTipo
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
              OnExit = dbedRetornoExit
            end
            object spedDias: TSpinEdit
              Left = 312
              Top = 17
              Width = 41
              Height = 22
              Hint = 'Final do Período de Afastamento expresso em dias'
              MaxLength = 100
              MaxValue = 0
              MinValue = 0
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              Value = 0
              OnExit = spedDiasExit
            end
          end
          object gbxCargo: TGroupBox
            Left = 13
            Top = 243
            Width = 361
            Height = 71
            Caption = 'Cargo'
            TabOrder = 3
            object Label52: TLabel
              Left = 12
              Top = 45
              Width = 111
              Height = 13
              Caption = 'Data de Efetivação'
            end
            object dblckcmgCargo: TwwDBLookupCombo
              Left = 9
              Top = 15
              Width = 343
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'TITULO'#9'30'#9'TITULO')
              DataField = 'IDCARGO'
              DataSource = dsSubTipo
              LookupTable = qryCargo
              LookupField = 'IDCARGO'
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
              OnChange = dblckcmgCargoChange
            end
            object dbedDataCargo: TCMDateTimePicker
              Left = 132
              Top = 41
              Width = 93
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATACARGO'
              DataSource = dsSubTipo
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
            end
          end
          object gbxSalar: TGroupBox
            Left = 381
            Top = 130
            Width = 335
            Height = 73
            Caption = 'Salário'
            TabOrder = 4
            object Label50: TLabel
              Left = 6
              Top = 21
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object Label51: TLabel
              Left = 6
              Top = 46
              Width = 55
              Height = 13
              Caption = 'Data Efet'
            end
            object dbedSalario: TDBRealEdit
              Left = 65
              Top = 17
              Width = 93
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 0
              WordWrap = False
              IntDigits = 12
              DecDigits = 2
              NumberFormat = fFixed
              Signal = False
              DataField = 'SALARIOATUAL'
              DataSource = dsSubTipo
            end
            object dbedDatSalar: TCMDateTimePicker
              Left = 65
              Top = 42
              Width = 93
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATASALARIO'
              DataSource = dsSubTipo
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
            end
            object dbrgTipoSalar: TDBRadioGroup
              Left = 165
              Top = 8
              Width = 162
              Height = 57
              Caption = 'Base'
              Columns = 2
              DataField = 'TIPOPAGAMENTO'
              DataSource = dsSubTipo
              Items.Strings = (
                'Hora'
                'Dia'
                'Mês'
                'Tarefa')
              TabOrder = 2
              Values.Strings = (
                'H'
                'D'
                'M'
                'T')
            end
          end
          object gbxLotacao: TGroupBox
            Left = 381
            Top = 205
            Width = 335
            Height = 109
            Caption = 'Lotação'
            TabOrder = 5
            object Label29: TLabel
              Left = 6
              Top = 16
              Width = 37
              Height = 13
              Caption = 'Estab.'
            end
            object Label32: TLabel
              Left = 6
              Top = 37
              Width = 49
              Height = 13
              Caption = 'C. Custo'
            end
            object Label53: TLabel
              Left = 6
              Top = 63
              Width = 59
              Height = 13
              Caption = 'Data Efet.'
            end
            object Label54: TLabel
              Left = 6
              Top = 87
              Width = 56
              Height = 13
              Caption = 'Subord. a'
            end
            object dblcEstab: TwwDBLookupCombo
              Left = 65
              Top = 11
              Width = 262
              Height = 21
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'NOME'#9'40'#9'NOME')
              DataField = 'IDESTAB'
              DataSource = dsSubTipo
              LookupTable = qryEstab
              LookupField = 'IDPESSOA'
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
            end
            object dbedDatLotac: TCMDateTimePicker
              Left = 65
              Top = 59
              Width = 93
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATALOTACAO'
              DataSource = dsSubTipo
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
            end
            object dblcChefe: TwwDBLookupCombo
              Left = 65
              Top = 83
              Width = 263
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'Pessoa'#9'F'
                'TITULO'#9'30'#9'Cargo'#9'F')
              DataField = 'IDCHEFE'
              DataSource = dsSubTipo
              LookupTable = qryChefe
              LookupField = 'IDPESSOA'
              Options = [loColLines, loTitles]
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
            end
            object edNomeCCusto: TEdit
              Left = 166
              Top = 35
              Width = 161
              Height = 21
              TabStop = False
              Color = clGray
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object dblkcCCusto: TwwDBLookupCombo
              Left = 65
              Top = 35
              Width = 94
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODCENTROCUSTO'#9'10'#9'Código'
                'NOME'#9'30'#9'Nome')
              DataField = 'CODCENTROCUSTO'
              DataSource = dsSubTipo
              LookupTable = qryCCusto
              LookupField = 'CODCENTROCUSTO'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              OnChange = dblkcCCustoChange
            end
          end
        end
        object tbsUltEmpr: TTabSheet
          Caption = 'Ultimos Empregos'
          object dbgrUltEmpr: TwwDBGrid
            Left = 0
            Top = 0
            Width = 688
            Height = 345
            Selected.Strings = (
              'NUMSEQ'#9'10'#9'Num.Seq.'
              'EMPRESA'#9'40'#9'Empresa'
              'DAT_ADMIS'#9'10'#9'Admissão'
              'DATADEM'#9'10'#9'Demissão'
              'ULTSALARIO'#9'10'#9'Ult.Salário'
              'CARGO'#9'30'#9'Cargo'
              'IDMOTIVO'#9'10'#9'Mot.Saída')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsUltEmpr
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
          object pnlUltEmpr: TPanel
            Left = 0
            Top = 0
            Width = 688
            Height = 345
            Align = alClient
            TabOrder = 1
            object Label12: TLabel
              Left = 32
              Top = 34
              Width = 111
              Height = 13
              Caption = 'Número Sequencial'
            end
            object Label16: TLabel
              Left = 376
              Top = 34
              Width = 49
              Height = 13
              Caption = 'Empresa'
            end
            object Label19: TLabel
              Left = 32
              Top = 92
              Width = 136
              Height = 13
              Caption = 'Cargo (da nossa tabela)'
            end
            object Label22: TLabel
              Left = 376
              Top = 92
              Width = 90
              Height = 13
              Caption = 'Título do Cargo'
            end
            object Label61: TLabel
              Left = 32
              Top = 153
              Width = 66
              Height = 13
              Caption = 'Data Inicial'
            end
            object Label62: TLabel
              Left = 230
              Top = 153
              Width = 59
              Height = 13
              Caption = 'Data Final'
            end
            object Label63: TLabel
              Left = 376
              Top = 153
              Width = 79
              Height = 13
              Caption = 'Ültimo Salário'
            end
            object Label64: TLabel
              Left = 32
              Top = 209
              Width = 95
              Height = 13
              Caption = 'Motivo da Saída'
            end
            object dblcUltCargo: TwwDBLookupCombo
              Left = 32
              Top = 107
              Width = 300
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'TITULO'#9'30'#9'TITULO')
              DataField = 'IDCARGO'
              DataSource = dsUltEmpr
              LookupTable = qryCargo
              LookupField = 'IDCARGO'
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
            end
            object dbedUltAdm: TCMDateTimePicker
              Left = 32
              Top = 168
              Width = 100
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DAT_ADMIS'
              DataSource = dsUltEmpr
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
            end
            object dbedUltDem: TCMDateTimePicker
              Left = 229
              Top = 168
              Width = 100
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATADEM'
              DataSource = dsUltEmpr
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
            end
            object dbedUltSal: TDBRealEdit
              Left = 376
              Top = 168
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 6
              WordWrap = False
              IntDigits = 12
              DecDigits = 2
              NumberFormat = fFixed
              Signal = False
              DataField = 'ULTSALARIO'
              DataSource = dsUltEmpr
            end
            object dblcUltMotivo: TwwDBLookupCombo
              Left = 33
              Top = 224
              Width = 300
              Height = 21
              Hint = 'Motivo da Alteração na Situação Funcional'
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'DESCRICAO')
              DataField = 'IDMOTIVO'
              DataSource = dsUltEmpr
              LookupTable = qryMotivo
              LookupField = 'IDMOTIVO'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 7
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
            end
            object dbedUltCargo: TwwDBEdit
              Left = 376
              Top = 107
              Width = 300
              Height = 21
              DataField = 'CARGO'
              DataSource = dsUltEmpr
              TabOrder = 3
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedUltEmpresa: TwwDBEdit
              Left = 376
              Top = 50
              Width = 300
              Height = 21
              DataField = 'EMPRESA'
              DataSource = dsUltEmpr
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedNumSeq: TwwDBEdit
              Left = 32
              Top = 50
              Width = 300
              Height = 21
              DataField = 'NUMSEQ'
              DataSource = dsUltEmpr
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
        end
      end
      inherited Dock974: TDock97
        Height = 373
      end
    end
    inherited pnlMestre: TPanel
      Height = 53
      inherited lblNome: TLabel
        Width = 33
        Caption = 'Nome'
      end
      inherited lblDocumento: TLabel
        Width = 24
        Caption = 'CPF'
      end
    end
  end
  inherited Dock972: TDock97
    object Panel3: TPanel
      Left = 356
      Top = 8
      Width = 280
      Height = 28
      TabOrder = 1
      object chkGravaHstAltCad: TCheckBox
        Left = 8
        Top = 6
        Width = 268
        Height = 17
        Caption = 'Gravar alterações no Histórico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 542
    inherited tb97Fundo: TToolbar97
      Left = 634
      DockPos = 638
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 690006
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 467
      DockPos = 471
    end
  end
  inherited qry: TwwQuery
    Left = 384
    Top = 1
    inherited qryNUMDOCUMENTO: TStringField
      EditMask = '999\.999\.999\-99;0; '
    end
  end
  inherited dsDet: TwwDataSource
    Left = 440
    Top = 1
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 289
    Top = 14
  end
  inherited upd: TUpdateSQL
    Left = 356
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PESSOA.NOME'
      'FUNCIONARIO.MATRICULA'
      'SITFUNC.DESCRICAO'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO'
      'EMPRESAPROP.NOMEEMPRESA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'Matrícula'
      'Situação'
      'CPF (ou equivalente)'
      'Cargo'
      'Empresa')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'FUNCIONARIO'
      'EMPRESAPROP'
      'PESSOA '
      'CARGO'
      'SITFUNC')
    CamposChave.Strings = (
      'FUNCIONARIO.IDPESSOA')
    Filtro.Strings = (
      'FUNCIONARIO.IDEMPRESA = EMPRESAPROP.IDPESSOA(+)'
      'FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA'
      'FUNCIONARIO.IDCARGO = CARGO.IDCARGO(+)'
      'FUNCIONARIO.IDSITFUNC = SITFUNC.IDSITFUNC(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '12'
      '60'
      '22'
      '40'
      '60')
    Left = 155
    Top = 13
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 412
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 218
    Top = 14
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 28
    Top = 14
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 28
    Top = 1
  end
  inherited updSubTipo: TUpdateSQL
    ModifySQL.Strings = (
      'update FUNCIONARIO'
      'set'
      '  IDEMPRESA = :IDEMPRESA,'
      '  IDSITRISCO = :IDSITRISCO,'
      '  IDCATEMPRGRE = :IDCATEMPRGRE,'
      '  IDFAIXACARGO = :IDFAIXACARGO,'
      '  IDAFASTRAIS = :IDAFASTRAIS,'
      '  IDCARGO = :IDCARGO,'
      '  IDMOVCONTRCAGED = :IDMOVCONTRCAGED,'
      '  IDHORARIO = :IDHORARIO,'
      '  IDCHEFE = :IDCHEFE,'
      '  IDVINCEMPREG = :IDVINCEMPREG,'
      '  IDFORMARESC = :IDFORMARESC,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  IDSITFUNC = :IDSITFUNC,'
      '  IDTIPOTRAB = :IDTIPOTRAB,'
      '  MATRICULA = :MATRICULA,'
      '  DATAADMISSAO = :DATAADMISSAO,'
      '  TIPOCONTRATO = :TIPOCONTRATO,'
      '  TIPOPAGAMENTO = :TIPOPAGAMENTO,'
      '  SALARIOATUAL = :SALARIOATUAL,'
      '  SALARIOTIPO = :SALARIOTIPO,'
      '  DATAOPCAOFGTS = :DATAOPCAOFGTS,'
      '  DATASALARIO = :DATASALARIO,'
      '  DATACARGO = :DATACARGO,'
      '  DATALOTACAO = :DATALOTACAO,'
      '  DATADESLIGAMENTO = :DATADESLIGAMENTO,'
      '  IDMOTIVODESLIGRAIS = :IDMOTIVODESLIGRAIS,'
      '  IDMOTIVODESLIGGERENCIAL = :IDMOTIVODESLIGGERENCIAL,'
      '  HOMOLOGACAONUMERO = :HOMOLOGACAONUMERO,'
      '  HOMOLOGACAOORGAO = :HOMOLOGACAOORGAO,'
      '  DATARETORNO = :DATARETORNO,'
      '  TIPOMAODEOBRA = :TIPOMAODEOBRA,'
      '  IDESTAB = :IDESTAB,'
      '  DATAFIMCONTRATO = :DATAFIMCONTRATO,'
      '  IDAGENCIASALARIO = :IDAGENCIASALARIO,'
      '  NUMCONTASALARIO = :NUMCONTASALARIO,'
      '  IDAGENCIAFGTS = :IDAGENCIAFGTS,'
      '  NUMCONTAFGTS = :NUMCONTAFGTS,'
      '  DURACAOCONTRATO = :DURACAOCONTRATO,'
      '  PRORROGCONTRATO = :PRORROGCONTRATO,'
      '  FLGTIPOFGTS = :FLGTIPOFGTS,'
      '  QUANTIDADEFGTS = :QUANTIDADEFGTS,'
      '  VALORFGTS = :VALORFGTS,'
      '  DATAAVISO = :DATAAVISO,'
      '  NIVELINDIV1 = :NIVELINDIV1,'
      '  IDFUNCAO = :IDFUNCAO,'
      '  IDFAIXAFUNCAO = :IDFAIXAFUNCAO,'
      '  NIVELINDIV2 = :NIVELINDIV2,'
      '  DATACARGO2 = :DATACARGO2,'
      '  DATAREFHORARIO = :DATAREFHORARIO,'
      '  CODARRUMADEIRA = :CODARRUMADEIRA,'
      '  IDDEPOSGRE = :IDDEPOSGRE,'
      '  IDPROCESSODEM = :IDPROCESSODEM'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into FUNCIONARIO'
      '  (IDPESSOA, IDEMPRESA, IDSITRISCO, IDCATEMPRGRE, IDFAIXACARGO, '
      'IDAFASTRAIS, '
      '   IDCARGO, IDMOVCONTRCAGED, IDHORARIO, IDCHEFE, IDVINCEMPREG, '
      'IDFORMARESC, '
      
        '   CODCENTROCUSTO, IDSITFUNC, IDTIPOTRAB, MATRICULA, DATAADMISSA' +
        'O, '
      'TIPOCONTRATO, '
      '   TIPOPAGAMENTO, SALARIOATUAL, SALARIOTIPO, DATAOPCAOFGTS, '
      'DATASALARIO, '
      
        '   DATACARGO, DATALOTACAO, DATADESLIGAMENTO, IDMOTIVODESLIGRAIS,' +
        ' '
      'IDMOTIVODESLIGGERENCIAL, '
      '   HOMOLOGACAONUMERO, HOMOLOGACAOORGAO, DATARETORNO, '
      'TIPOMAODEOBRA, IDESTAB, '
      '   DATAFIMCONTRATO, IDAGENCIASALARIO, NUMCONTASALARIO, '
      'IDAGENCIAFGTS, NUMCONTAFGTS, '
      '   DURACAOCONTRATO, PRORROGCONTRATO, FLGTIPOFGTS, '
      'QUANTIDADEFGTS, VALORFGTS, '
      
        '   DATAAVISO, NIVELINDIV1, IDFUNCAO, IDFAIXAFUNCAO, NIVELINDIV2,' +
        ' '
      'DATACARGO2, '
      '   DATAREFHORARIO, CODARRUMADEIRA, IDDEPOSGRE, IDPROCESSODEM)'
      'values'
      
        '  (:IDPESSOA, :IDEMPRESA, :IDSITRISCO, :IDCATEMPRGRE, :IDFAIXACA' +
        'RGO, '
      ':IDAFASTRAIS, '
      
        '   :IDCARGO, :IDMOVCONTRCAGED, :IDHORARIO, :IDCHEFE, :IDVINCEMPR' +
        'EG, '
      ':IDFORMARESC, '
      '   :CODCENTROCUSTO, :IDSITFUNC, :IDTIPOTRAB, :MATRICULA, '
      ':DATAADMISSAO, '
      '   :TIPOCONTRATO, :TIPOPAGAMENTO, :SALARIOATUAL, :SALARIOTIPO, '
      ':DATAOPCAOFGTS, '
      '   :DATASALARIO, :DATACARGO, :DATALOTACAO, :DATADESLIGAMENTO, '
      ':IDMOTIVODESLIGRAIS, '
      '   :IDMOTIVODESLIGGERENCIAL, :HOMOLOGACAONUMERO, '
      ':HOMOLOGACAOORGAO, :DATARETORNO, '
      
        '   :TIPOMAODEOBRA, :IDESTAB, :DATAFIMCONTRATO, :IDAGENCIASALARIO' +
        ', '
      ':NUMCONTASALARIO, '
      '   :IDAGENCIAFGTS, :NUMCONTAFGTS, :DURACAOCONTRATO, '
      ':PRORROGCONTRATO, :FLGTIPOFGTS, '
      
        '   :QUANTIDADEFGTS, :VALORFGTS, :DATAAVISO, :NIVELINDIV1, :IDFUN' +
        'CAO, '
      ':IDFAIXAFUNCAO, '
      '   :NIVELINDIV2, :DATACARGO2, :DATAREFHORARIO, :CODARRUMADEIRA, '
      ':IDDEPOSGRE, '
      '   :IDPROCESSODEM)')
    DeleteSQL.Strings = (
      'delete from FUNCIONARIO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 20
    Top = 536
  end
  inherited qrySubTipo: TwwQuery
    BeforePost = qrySubTipoBeforePost
    AfterScroll = qrySubTipoAfterScroll
    SQL.Strings = (
      'SELECT FUNCIONARIO.*'
      'FROM FUNCIONARIO'
      'WHERE ( FUNCIONARIO.IDPESSOA =:IdPessoa )')
    Left = 20
    Top = 523
  end
  inherited dsSubTipo: TwwDataSource
    OnStateChange = dsSubTipoStateChange
    Left = 20
    Top = 510
  end
  inherited dsPessoaFisica: TwwDataSource
    Left = 304
    Top = 536
  end
  inherited qryPessoaFisica: TwwQuery
    AfterScroll = qryPessoaFisicaAfterScroll
  end
  inherited ImageList1: TImageList
    Left = 218
    Top = 1
    Bitmap = {
      494C010109000A00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001001000000000000018
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000186318631863186318631863
      1863186318631863186318630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000186300000000000000000000
      0000000000000000000018631863000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000018630000FF7FFF7FFF7F
      FF7FFF7FFF7F0000000000001863186300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF7F0000FF7F0000186300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F0000FF7F00000000186300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F00000000FF7F0000
      0000FF7FFF7FFF7F0000FF7F0000186300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F0000FF7F0000186300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000007C00000000FF7F00000000
      000000000000FF7F000000000000007C00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000007C0000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000007C00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000FF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7F000000000000
      FF7F00000000FF7FFF7F0000FF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000104210421042104210421042
      1042104210421042104210421042104200000000104210421042104210421042
      1042104210421042104210421042104200000000104210421042104210421042
      1042104210421042104210421042104200000000104210421042104210421042
      1042104210421042104210421042104200001863000000000000000000000000
      0000000000000000000000000000104200001863000000000000000000000000
      0000000000000000000000000000104200001863000000000000000000000000
      0000000000000000000000000000104200001863000000000000000000000000
      00000000000000000000000000001042000018630000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7F1000100010001000
      FF7F0000FF7F00000000FF7F00001042000018630000FF7F1000100010001000
      FF7F0000FF7F00000000FF7F00001042000018630000FF7F1000100010001000
      FF7F0000FF7F00000000FF7F00001042000018630000FF7F1000100010001000
      FF7F0000FF7F00000000FF7F00001042000018630000FF7FFF7F00000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7F00000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7F00000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7F00000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7F0000004000400000
      FF7F00000000FF7F0000FF7F00001042000018630000FF7F0000004000400000
      FF7FFF7FFF7FFF7FFF7FFF7F00000000000018630000FF7F0000004000400000
      FF7F00000000FF7F0000FF7F00001042000018630000FF7F0000004000400000
      FF7FFF7FFF7FFF7FFF7FFF7F00000000000018630000FF7F0000004000400000
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7F0000004000400000
      00000000000000000000000000000000104218630000FF7F0000004000400000
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7F0000004000400000
      00000000000000000000000000000000104218630000FF7F0000000000000000
      FF7F0000000000000000FF7F00001042000018630000FF7F0000000000001042
      00000000104210421042000000001042000018630000FF7F0000000000000000
      FF7F0000000000000000FF7F00001042000018630000FF7F0000000000001042
      00000000104210421042000000001042000018630000FF7FFF7F10421042FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7F104200001042
      00001042186310421042104200001042000018630000FF7FFF7F10421042FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7F104200001042
      0000104218631042104210420000104200001863000000000000000000000000
      0000000000000000000000000000104200001863000000000000000000001042
      00001042FF7F1042104210420000104200001863000000000000000000000000
      0000000000000000000000000000104200001863000000000000000000001042
      00001042FF7F1042104210420000104200001863186318631863186300000000
      000000000000104218631863186300000000186318631863186318630000FF7F
      0000000010421042104200000000FF7F00001863186318631863186300000000
      000000000000104218631863186300000000186318631863186318630000FF7F
      0000000010421042104200000000FF7F00000000000000000000186300000000
      000000000000104200000000000000000000000000000000000000000000FF7F
      FF7F00000000000000000000FF7FFF7F00000000000000000000186300000000
      000000000000104200000000000000000000000000000000000000000000FF7F
      FF7F00000000000000000000FF7FFF7F00000000000000000000186300000000
      0000000000001042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000186300000000
      0000000000001042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000186318631863
      1863186318630000000000000000000000000000000000000000000000000000
      000010420000FF7F000010420000000000000000000000000000186318631863
      1863186318630000000000000000000000000000000000000000000000000000
      000010420000FF7F000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000010420000104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000010420000104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000104210421042104210421042
      1042104210421042104210421042104200000000104210421042104210421042
      1042104210421042104210421042104200000000104210421042104210421042
      1042104210421042104210421042104200000000104210421042104210421042
      1042104210421042104210421042104200001863000000000000000000000000
      0000000000000000000000000000104200001863000000000000000000000000
      0000000000000000000000000000104200001863000000000000000000000000
      0000000000000000000000000000104200001863000000000000000000000000
      00000000000000000000000000001042000018630000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7F1000100010001000
      FF7F0000FF7F00000000FF7F00001042000018630000FF7F1000100010001000
      FF7F0000FF7F00000000FF7F00001042000018630000FF7F1000100010001000
      FF7F0000FF7F00000000FF7F00001042000018630000FF7F1000100010001000
      FF7F0000FF7F00000000FF7F00001042000018630000FF7FFF7F00000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7F00000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7F00000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7F00000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7F0000004000400000
      FF7F00000000FF7F0000FF7F00001042000018630000FF7F0000004000400000
      FF7FFF7FFF7FFF7FFF7FFF7F00000000000018630000FF7F0000004000400000
      FF7F00000000FF7F0000FF7F00001042000018630000FF7F0000004000400000
      FF7FFF7FFF7FFF7FFF7FFF7F00000000000018630000FF7F0000004000400000
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7F0000004000400000
      00000000000000000000000000000000104218630000FF7F0000004000400000
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7F0000004000400000
      00000000000000000000000000000000104218630000FF7F0000000000000000
      FF7F0000000000000000FF7F00001042000018630000FF7F0000000000001042
      00000000104210421042000000001042000018630000FF7F0000000000000000
      FF7F0000000000000000FF7F00001042000018630000FF7F0000000000001042
      00000000104210421042000000001042000018630000FF7FFF7F10421042FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7F104200001042
      00001042186310421042104200001042000018630000FF7FFF7F10421042FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7F104200001042
      0000104218631042104210420000104200001863000000000000000000000000
      0000000000000000000000000000104200001863000000000000000000001042
      00001042FF7F1042104210420000104200001863000000000000000000000000
      0000000000000000000000000000104200001863000000000000000000001042
      00001042FF7F1042104210420000104200001863186318631863186300000000
      000000000000104218631863186300000000186318631863186318630000FF7F
      0000000010421042104200000000FF7F00001863186318631863186300000000
      000000000000104218631863186300000000186318631863186318630000FF7F
      0000000010421042104200000000FF7F00000000000000000000186300000000
      000000000000104200000000000000000000000000000000000000000000FF7F
      FF7F00000000000000000000FF7FFF7F00000000000000000000186300000000
      000000000000104200000000000000000000000000000000000000000000FF7F
      FF7F00000000000000000000FF7FFF7F00000000000000000000186300000000
      0000000000001042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000186300000000
      0000000000001042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000186318631863
      1863186318630000000000000000000000000000000000000000000000000000
      000010420000FF7F000010420000000000000000000000000000186318631863
      1863186318630000000000000000000000000000000000000000000000000000
      000010420000FF7F000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000010420000104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000001042000010420000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0080070000000000000003000000000000
      0001000000000000801000000000000000000000000000000000000000000000
      8000000000000000800000000000000000000000000000000000000000000000
      00000000000000000000000000000000C001000000000000C001000000000000
      C007000000000000E3FF000000000000FFFFFFFFFFFFFFFF8001800180018001
      0001000100010001000100010001000100010001000100010001000100010001
      0001000300010003000100000001000000010000000100000001000000010000
      00010000000100000003000000030000F39FF800F39FF800F01FF800F01FF800
      F03FFD05F03FFD05FFFFFF8FFFFFFF8FFFFFFFFFFFFFFFFF8001800180018001
      0001000100010001000100010001000100010001000100010001000100010001
      0001000300010003000100000001000000010000000100000001000000010000
      00010000000100000003000000030000F39FF800F39FF800F01FF800F01FF800
      F03FFD05F03FFD05FFFFFF8FFFFFFF8F00000000000000000000000000000000
      000000000000}
  end
  inherited qryTelefone: TwwQuery
    Left = 438
    Top = 536
  end
  inherited updTelefone: TUpdateSQL
    InsertSQL.Strings = (
      'insert into TELENDPESS'
      '  (TELENDPESS."IDTELEFONE", TELENDPESS."IDENDERECO", '
      'TELENDPESS."DDI", '
      '   TELENDPESS."DDD", TELENDPESS."NUMERO", TELENDPESS."TIPO")'
      'values'
      
        '  (:"IDTELEFONE", :"IDENDERECO", :"DDI", :"DDD", :"NUMERO", :"TI' +
        'PO")')
    Top = 523
  end
  inherited dsTelefone: TwwDataSource
    Left = 438
    Top = 510
  end
  inherited dsEndereco: TwwDataSource
    Left = 144
    Top = 537
  end
  inherited updEndereco: TUpdateSQL
    Left = 144
    Top = 524
  end
  inherited qryEndereco: TwwQuery
    Left = 144
    Top = 511
  end
  inherited qryContato: TwwQuery
    Left = 684
    Top = 532
  end
  inherited updContato: TUpdateSQL
    Left = 684
    Top = 519
  end
  inherited dsContato: TwwDataSource
    Left = 684
    Top = 506
  end
  inherited qryRamal: TwwQuery
    Left = 376
    Top = 536
  end
  inherited updRamal: TUpdateSQL
    Left = 376
    Top = 524
  end
  inherited dsRamal: TwwDataSource
    Left = 376
    Top = 511
  end
  inherited qryDocumento: TwwQuery
    Left = 220
    Top = 536
  end
  inherited dsDocumento: TwwDataSource
    Left = 220
    Top = 523
  end
  inherited updDocumento: TUpdateSQL
    Left = 220
    Top = 511
  end
  inherited qryEscolhePessoa: TwwQuery
    Left = 523
    Top = 14
  end
  inherited dsEscolhePessoa: TwwDataSource
    Left = 523
    Top = 1
  end
  inherited Pessoa: TPessoa
    MudaCaption = False
    TipoPessoa = tpFisica
    SubTipo = stFuncionario
    FormCaption = 'Cadastro de Pessoal'
    OnChangeSubtipo = PessoaChangeSubtipo
    OnSaveSubtipo = PessoaSaveSubtipo
    Left = 93
    Top = 14
  end
  inherited OpenPictureDialog1: TOpenPictureDialog
    Left = 289
    Top = 1
  end
  inherited qryImagem: TwwQuery
    Left = 80
    Top = 536
  end
  inherited updImagem: TUpdateSQL
    Left = 80
    Top = 524
  end
  inherited updImagensDoc: TUpdateSQL
    Left = 614
    Top = 532
  end
  inherited qryImagensDoc: TwwQuery
    Left = 614
    Top = 519
  end
  inherited dsImagem: TwwDataSource
    Left = 80
    Top = 512
  end
  inherited dsImagensDoc: TwwDataSource
    Left = 614
    Top = 507
  end
  object qryProfissao: TwwQuery [44]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDPROFISS, DESCRICAO from PROFISS order by DESCRICAO')
    ValidateWithMask = True
    Left = 108
    Top = 289
  end
  object qryPaises: TwwQuery [45]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDPAIS, NOMENACIONALIDADE, NOMEPAIS'
      'FROM'
      '  PAIS '
      'ORDER BY'
      '  UPPER(NOMENACIONALIDADE)')
    ValidateWithMask = True
    Left = 216
    Top = 270
  end
  object qrySindicato: TwwQuery [46]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PJ.IDPESSOA, PJ.NOME, PJ.RAZAOSOCIAL'
      'FROM'
      '  PESSOA PJ, SINDICATO S'
      'WHERE'
      '  (S.IDPESSOA = PJ.IDPESSOA)'
      'ORDER BY'
      '  UPPER(NOME)')
    ValidateWithMask = True
    Left = 735
    Top = 307
  end
  object qryGrauInstr: TwwQuery [47]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDGRINSTR, DESCRICAO from GRINSTR order by DESCRICAO')
    ValidateWithMask = True
    Left = 89
    Top = 391
  end
  object qrySitFunc: TwwQuery [48]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDSITFUNC, DESCRICAO'
      'FROM'
      '  SITFUNC'
      'WHERE'
      '  (FLGUSO IN ('#39'R'#39','#39'G'#39'))  '
      'ORDER BY'
      '  DESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 216
    Top = 258
  end
  object qryMotivo: TwwQuery [49]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDMOTIVO, DESCRICAO '
      'from MOTIVO '
      'where GRUPOMOTIVO IN ('#39'D'#39' , '#39'A'#39')'
      'order by upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 738
    Top = 252
  end
  object qryCargo: TwwQuery [50]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDCARGO, RTRIM(TITULO) AS TITULO, CBO'
      'FROM'
      '  CARGO'
      'ORDER BY'
      '  UPPER(TITULO)')
    ValidateWithMask = True
    Left = 216
    Top = 245
  end
  object qryEstab: TwwQuery [51]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDPESSOA, NOME'
      'FROM'
      '  PESSOA'
      'WHERE'
      '  (IDGRUPO = :EmpresaProp) OR'
      '  (IDGRUPO IN (SELECT IDPESSOA FROM PESSOA'
      '               WHERE  IDGRUPO = :EmpresaProp)) OR'
      '  (IDGRUPO IN (SELECT IDPESSOA FROM PESSOA'
      '               WHERE  IDGRUPO IN (SELECT IDPESSOA FROM PESSOA'
      
        '                                  WHERE  IDGRUPO = :EmpresaProp)' +
        ')) OR'
      '  (IDGRUPO IN (SELECT IDPESSOA FROM PESSOA'
      '               WHERE  IDGRUPO IN (SELECT IDPESSOA FROM PESSOA'
      
        '                                 WHERE   IDGRUPO IN (SELECT IDPE' +
        'SSOA FROM PESSOA'
      
        '                                                     WHERE  IDGR' +
        'UPO = :EmpresaProp))))'
      'ORDER BY'
      '  UPPER(NOME)')
    ValidateWithMask = True
    Left = 48
    Top = 344
    ParamData = <
      item
        DataType = ftFloat
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'EmpresaProp'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'EmpresaProp'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'EmpresaProp'
        ParamType = ptUnknown
      end>
  end
  object qryLotacao: TwwQuery [52]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select CODCENTROCUSTO, NOME from CENTCUST '
      'where IDEMPRESA =:IdEmpresaProp '
      'order by NOME')
    ValidateWithMask = True
    Left = 733
    Top = 409
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdEmpresaProp'
        ParamType = ptUnknown
      end>
  end
  object opndArqBmp: TOpenPictureDialog [53]
    Filter = 
      'All (*.bmp;*.ico;*.emf;*.wmf)|*.bmp;*.ico;*.emf;*.wmf|Bitmaps (*' +
      '.bmp)|*.bmp|Icons (*.ico)|*.ico|Enhanced Metafiles (*.emf)|*.emf' +
      '|Metafiles (*.wmf)|*.wmf'
    Left = 93
    Top = 1
  end
  object qryUltEmpr: TwwQuery [54]
    CachedUpdates = True
    AfterInsert = qryUltEmprAfterInsert
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT * FROM ULTEMPR '
      'WHERE IDPESSOA =:IdPessoa'
      '')
    UpdateObject = updUltEmpr
    ValidateWithMask = True
    Left = 746
    Top = 531
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end>
    object qryUltEmprNUMSEQ: TFloatField
      DisplayLabel = 'Num.Seq.'
      DisplayWidth = 10
      FieldName = 'NUMSEQ'
      Origin = 'ULTEMPR.NUMSEQ'
    end
    object qryUltEmprEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      DisplayWidth = 40
      FieldName = 'EMPRESA'
      Origin = 'ULTEMPR.EMPRESA'
      Size = 40
    end
    object qryUltEmprDAT_ADMIS: TDateTimeField
      DisplayLabel = 'Admissão'
      DisplayWidth = 10
      FieldName = 'DAT_ADMIS'
      Origin = 'ULTEMPR.DAT_ADMIS'
    end
    object qryUltEmprDATADEM: TDateTimeField
      DisplayLabel = 'Demissão'
      DisplayWidth = 10
      FieldName = 'DATADEM'
      Origin = 'ULTEMPR.DATADEM'
    end
    object qryUltEmprULTSALARIO: TFloatField
      DisplayLabel = 'Ult.Salário'
      DisplayWidth = 10
      FieldName = 'ULTSALARIO'
      Origin = 'ULTEMPR.ULTSALARIO'
      DisplayFormat = '0.00'
    end
    object qryUltEmprCARGO: TStringField
      DisplayLabel = 'Cargo'
      DisplayWidth = 30
      FieldName = 'CARGO'
      Origin = 'ULTEMPR.CARGO'
      Size = 30
    end
    object qryUltEmprIDMOTIVO: TFloatField
      DisplayLabel = 'Mot.Saída'
      DisplayWidth = 10
      FieldName = 'IDMOTIVO'
      Origin = 'ULTEMPR.IDMOTIVO'
    end
    object qryUltEmprIDCARGO: TFloatField
      DisplayLabel = 'Cod.Cargo'
      DisplayWidth = 10
      FieldName = 'IDCARGO'
      Origin = 'ULTEMPR.IDCARGO'
      Visible = False
    end
    object qryUltEmprIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'ULTEMPR.IDPESSOA'
      Visible = False
    end
  end
  object updUltEmpr: TUpdateSQL [55]
    ModifySQL.Strings = (
      'update ULTEMPR'
      'set'
      '  IDCARGO = :IDCARGO,'
      '  DAT_ADMIS = :DAT_ADMIS,'
      '  DATADEM = :DATADEM,'
      '  ULTSALARIO = :ULTSALARIO,'
      '  CARGO = :CARGO,'
      '  EMPRESA = :EMPRESA,'
      '  IDMOTIVO = :IDMOTIVO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  NUMSEQ = :OLD_NUMSEQ')
    InsertSQL.Strings = (
      'insert into ULTEMPR'
      '  (IDPESSOA, NUMSEQ, IDCARGO, DAT_ADMIS, DATADEM, ULTSALARIO, '
      'CARGO, EMPRESA, '
      '   IDMOTIVO)'
      'values'
      
        '  (:IDPESSOA, :NUMSEQ, :IDCARGO, :DAT_ADMIS, :DATADEM, :ULTSALAR' +
        'IO, '
      ':CARGO, '
      '   :EMPRESA, :IDMOTIVO)')
    DeleteSQL.Strings = (
      'delete from ULTEMPR'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  NUMSEQ = :OLD_NUMSEQ')
    Left = 746
    Top = 518
  end
  object dsUltEmpr: TwwDataSource [56]
    DataSet = qryUltEmpr
    Left = 746
    Top = 505
  end
  object qryFonte: TwwQuery [57]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from FONTRECR order by DESCRICAO')
    ValidateWithMask = True
    Left = 216
    Top = 232
  end
  inherited qryTipoDoc: TwwQuery
    Left = 672
    Top = 241
  end
  inherited MSGrupo: TMontaSelect
    Left = 155
    Top = 1
  end
  inherited qryEstado: TwwQuery
    Left = 216
    Top = 219
  end
  inherited qryCidade: TwwQuery
    Left = 756
    Top = 15
  end
  inherited dsCidade: TwwDataSource
    Left = 756
    Top = 1
  end
  object qryParamRH: TwwQuery [63]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  INDDURACAOCONTR, FLGNUMERAMATRIC, TAMANHOMATRIC'
      'FROM'
      '  PARAMRH')
    ValidateWithMask = True
    Left = 616
    Top = 460
  end
  object qryCCusto: TwwQuery [64]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODCENTROCUSTO, NOME'
      'FROM'
      '  CENTCUST'
      'WHERE'
      '  (IDEMPRESA = 2)'
      'ORDER BY'
      '  UPPER(NOME)')
    ValidateWithMask = True
    Left = 722
    Top = 356
  end
  object qryHorario: TwwQuery [65]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDHORARIO, NOMEHORARIO'
      'FROM'
      '   HORATRAB'
      'ORDER BY'
      '   UPPER(NOMEHORARIO)')
    ValidateWithMask = True
    Left = 736
    Top = 170
  end
  object qryChefe: TwwQuery [66]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PF.NOME, PF.IDPESSOA, C.TITULO'
      'FROM'
      '  PESSOA PF, FUNCIONARIO F, CARGO C'
      'WHERE'
      '  (F.IDPESSOA = PF.IDPESSOA) AND'
      '  (F.IDCARGO  = C.IDCARGO(+))'
      'ORDER BY'
      '  UPPER(PF.NOME)')
    ValidateWithMask = True
    Left = 736
    Top = 115
  end
  object qryCidadeNasc: TwwQuery [67]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  C.IDCIDADES, C.NOME'
      'FROM'
      '  CIDADES C, ESTADO E, PAIS P'
      'WHERE'
      '  (C.IDESTADO = E.IDESTADO) AND'
      '  (E.IDPAIS   = P.IDPAIS)'
      'ORDER BY'
      '  UPPER(C.NOME)'
      ' ')
    ValidateWithMask = True
    Left = 641
    Top = 65
  end
  object qryEstadoNasc: TwwQuery [68]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  ES.CODESTADO, ES.NOMEESTADO, P.IDPAIS, P.NOMEPAIS'
      'FROM'
      '  ESTADO ES, PAIS P'
      'WHERE'
      '  (P.IDPAIS = ES.IDPAIS)'
      'ORDER BY'
      '  UPPER(ES.NOMEESTADO)')
    ValidateWithMask = True
    Left = 641
    Top = 51
  end
  inherited qryNaturalidade_Padrao: TwwQuery
    Left = 247
    Top = 337
  end
  inherited DsNaturalidade_Padrao: TwwDataSource
    Left = 247
    Top = 324
  end
  object qryAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  NUMCARTA, IDMOTIVO, DATACARTA, ASSUNTO, TEXTO'
      'FROM'
      '  CARTA'
      'WHERE'
      '  (NUMCARTA = :NUMCARTA)')
    ValidateWithMask = True
    Left = 310
    Top = 193
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMCARTA'
        ParamType = ptUnknown
      end>
  end
end
