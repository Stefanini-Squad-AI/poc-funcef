inherited frmUsoPessoal: TfrmUsoPessoal
  Left = 84
  Top = 70
  HelpContext = 230046
  Caption = 'Cadastro de Pessoal'
  ClientHeight = 581
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 495
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 54
      Height = 440
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos'
        'Dados Pessoais'
        'Dependentes'
        'Situação Funcional'
        'Consulta Históricos'
        'Cursos Externos'
        'Programação de Férias'
        'Outros Dados'
        'Últimos Empregos'
        'Opção Cargo')
      detdbGrids.Strings = (
        ''
        'dbGrdDet'
        'dbgTelefone'
        'dbgContato'
        ''
        ''
        ''
        ''
        'dbgrCursosExternos'
        'dbgrProgFerias'
        ''
        'dbgrUltEmpr'
        '')
      inherited pgctrlDetalhe: TPageControl
        Height = 381
        inherited tbsDocumento: TTabSheet
          inherited PgCtrlPesFisica_Padrao: TPageControl
            Height = 353
          end
          inherited PnlDocumentos_Padrao: TPanel
            Height = 353
            inherited pnlItemsDoc: TPanel
              Height = 351
              inherited pnlOrgao: TPanel
                inherited wwDBEdit1: TwwDBEdit
                  TabStop = False
                  ReadOnly = True
                end
              end
              inherited pnlUF: TPanel
                inherited dbcmbEstadoDoc: TCMDBLookupCombo
                  TabStop = False
                  Enabled = False
                  ReadOnly = True
                end
              end
              inherited pnlNumDoc: TPanel
                inherited edDocNumDocumento: TwwDBEdit
                  TabStop = False
                  ReadOnly = True
                end
              end
            end
            inherited pnlFoto: TPanel
              Height = 351
              inherited Bevel1: TBevel
                Height = 320
              end
              inherited PnlAssociaFoto_Padrao: TPanel
                Top = 320
              end
              inherited SbImagePessoa_Padrao: TScrollBox
                Height = 320
              end
            end
            inherited lstDocumentos: TListView
              Height = 351
              Enabled = False
            end
          end
        end
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel
            Height = 353
            inherited grpTipoEnd: TGroupBox
              Height = 353
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Height = 353
          end
        end
        inherited tbsTelefone: TTabSheet
          inherited dbgTelefone: TwwDBGrid
            Height = 353
          end
          inherited Panel1: TPanel
            Height = 353
          end
        end
        inherited tbsContato: TTabSheet
          inherited Panel2: TPanel
            Height = 353
          end
          inherited dbgContato: TwwDBGrid
            Height = 353
          end
        end
        object tbsDadosPess: TTabSheet
          Caption = 'Dados Pessoais'
          object Label14: TLabel
            Left = 35
            Top = 142
            Width = 82
            Height = 13
            Caption = 'Nacionalidade'
          end
          object Label34: TLabel
            Left = 35
            Top = 179
            Width = 54
            Height = 13
            Caption = 'Sindicato'
          end
          object Label15: TLabel
            Left = 362
            Top = 142
            Width = 60
            Height = 13
            Caption = 'Natural de'
          end
          object Label20: TLabel
            Left = 362
            Top = 179
            Width = 53
            Height = 13
            Caption = 'Profissão'
          end
          object Label18: TLabel
            Left = 362
            Top = 96
            Width = 85
            Height = 13
            Caption = 'Grau Instrução'
          end
          object Label2: TLabel
            Left = 362
            Top = 45
            Width = 98
            Height = 13
            Caption = 'Data Nascimento'
          end
          object dblcNacional: TwwDBLookupCombo
            Left = 35
            Top = 155
            Width = 250
            Height = 21
            TabStop = False
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMENACIONALIDADE'#9'30'#9'NOMENACIONALIDADE')
            DataField = 'IDPAIS'
            DataSource = dsPessoaFisica
            LookupTable = qryPaises
            LookupField = 'IDPAIS'
            Enabled = False
            ReadOnly = True
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            AllowClearKey = True
          end
          object dblcSindi: TwwDBLookupCombo
            Left = 35
            Top = 192
            Width = 250
            Height = 21
            TabStop = False
            DropDownAlignment = taRightJustify
            Selected.Strings = (
              'NOME'#9'60'#9'NOME')
            DataField = 'IDSINDICATO'
            DataSource = dsPessoaFisica
            LookupTable = qrySindicato
            LookupField = 'IDPESSOA'
            Enabled = False
            ReadOnly = True
            TabOrder = 5
            AutoDropDown = True
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            AllowClearKey = True
          end
          object dblcNatural: TwwDBLookupCombo
            Left = 362
            Top = 155
            Width = 250
            Height = 21
            TabStop = False
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'CODESTADO'#9'3'#9'Sigla'
              'NOMEESTADO'#9'30'#9'Estado'
              'NOMEPAIS'#9'30'#9'País')
            DataField = 'CODESTADO'
            DataSource = dsPessoaFisica
            LookupTable = qryUf
            LookupField = 'CODESTADO'
            Options = [loColLines, loTitles]
            Enabled = False
            ReadOnly = True
            TabOrder = 4
            AutoDropDown = True
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            AllowClearKey = True
          end
          object dblcProfissao: TwwDBLookupCombo
            Left = 362
            Top = 192
            Width = 250
            Height = 21
            TabStop = False
            DropDownAlignment = taRightJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'DESCRICAO')
            DataField = 'IDPROFISS'
            DataSource = dsPessoaFisica
            LookupTable = qryProfissao
            LookupField = 'IDPROFISS'
            Enabled = False
            ReadOnly = True
            TabOrder = 6
            AutoDropDown = True
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            AllowClearKey = True
          end
          object dblcGrauInstr: TwwDBLookupCombo
            Left = 362
            Top = 110
            Width = 250
            Height = 21
            TabStop = False
            DropDownAlignment = taRightJustify
            Selected.Strings = (
              'DESCRICAO'#9'30'#9'DESCRICAO')
            DataField = 'IDGRINSTR'
            DataSource = dsPessoaFisica
            LookupTable = qryGrauInstr
            LookupField = 'IDGRINSTR'
            Enabled = False
            ReadOnly = True
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            AllowClearKey = True
          end
          object dbrgSexo: TDBRadioGroup
            Left = 362
            Top = 1
            Width = 250
            Height = 33
            Caption = 'Sexo'
            Columns = 2
            DataField = 'SEXO'
            DataSource = dsPessoaFisica
            Items.Strings = (
              'Masculino'
              'Feminino')
            ReadOnly = True
            TabOrder = 0
            Values.Strings = (
              'M'
              'F')
          end
          object dbedDatNasc: TCMDateTimePicker
            Left = 362
            Top = 60
            Width = 100
            Height = 21
            TabStop = False
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
            Enabled = False
            ReadOnly = True
            ShowButton = True
            TabOrder = 1
          end
          object gbxFiliacao: TGroupBox
            Left = 35
            Top = 216
            Width = 576
            Height = 73
            Caption = 'Filiação'
            TabOrder = 7
            object Label38: TLabel
              Left = 6
              Top = 18
              Width = 19
              Height = 13
              Caption = 'Pai'
            end
            object Label39: TLabel
              Left = 3
              Top = 45
              Width = 25
              Height = 13
              Caption = 'Mãe'
            end
            object wwDBEdit2: TwwDBEdit
              Left = 30
              Top = 14
              Width = 536
              Height = 21
              TabStop = False
              DataField = 'NOMEPAI'
              DataSource = dsPessoaFisica
              Enabled = False
              ReadOnly = True
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object wwDBEdit3: TwwDBEdit
              Left = 30
              Top = 44
              Width = 536
              Height = 21
              TabStop = False
              DataField = 'NOMEMAE'
              DataSource = dsPessoaFisica
              Enabled = False
              ReadOnly = True
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
          object dbrgIsento: TDBRadioGroup
            Left = 476
            Top = 50
            Width = 136
            Height = 33
            Caption = 'Isento de I.Renda ?'
            Columns = 2
            DataField = 'FLGISENTOIRRF'
            DataSource = dsPessoaFisica
            Items.Strings = (
              'Sim'
              'Não')
            ReadOnly = True
            TabOrder = 8
            Values.Strings = (
              '1'
              '0')
          end
          object dbrgEstCivil: TDBRadioGroup
            Left = 35
            Top = 1
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
            ReadOnly = True
            TabOrder = 9
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
            Left = 228
            Top = 1
            Width = 126
            Height = 130
            Caption = 'Qtde.Dependentes'
            TabOrder = 10
            object Label40: TLabel
              Left = 6
              Top = 28
              Width = 30
              Height = 13
              Caption = 'Total'
            end
            object Label41: TLabel
              Left = 6
              Top = 61
              Width = 46
              Height = 13
              Caption = 'I.Renda'
            end
            object Label42: TLabel
              Left = 6
              Top = 94
              Width = 50
              Height = 13
              Caption = 'Sal.Fam.'
            end
            object dbedQtdIR: TwwDBEdit
              Left = 60
              Top = 59
              Width = 50
              Height = 21
              TabStop = False
              DataField = 'NUMDEPIRRF'
              DataSource = dsPessoaFisica
              Enabled = False
              ReadOnly = True
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedQtdSF: TwwDBEdit
              Left = 60
              Top = 92
              Width = 50
              Height = 21
              TabStop = False
              DataField = 'NUMDEPSALF'
              DataSource = dsPessoaFisica
              Enabled = False
              ReadOnly = True
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedQtdTot: TwwDBEdit
              Left = 60
              Top = 25
              Width = 50
              Height = 21
              TabStop = False
              DataField = 'NUMDEPTOT'
              DataSource = dsPessoaFisica
              Enabled = False
              ReadOnly = True
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
        end
        object tbshDependentes: TTabSheet
          Caption = 'Dependentes'
          object dbgrdDepen: TwwDBGrid
            Left = 0
            Top = 0
            Width = 689
            Height = 345
            Selected.Strings = (
              'NOME'#9'40'#9'Nome'
              'DESCRICAO'#9'15'#9'Dependência'
              'DATANASC'#9'10'#9'Nascimento'
              'FLGCONTAIMPOSTOR'#9'10'#9'Imp.Renda ?'
              'FLGCONTASALARIOF'#9'10'#9'Sal.Família ?')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsDep
            ReadOnly = True
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
        end
        object tbsFuncional: TTabSheet
          Caption = 'Situação Funcional'
          object gbxIdent: TGroupBox
            Left = 37
            Top = -1
            Width = 330
            Height = 194
            Caption = 'Identificação'
            TabOrder = 0
            object Label35: TLabel
              Left = 9
              Top = 16
              Width = 55
              Height = 13
              Caption = 'Matrícula'
            end
            object Label21: TLabel
              Left = 170
              Top = 17
              Width = 54
              Height = 13
              Caption = 'Admissão'
            end
            object Label36: TLabel
              Left = 9
              Top = 35
              Width = 110
              Height = 13
              Caption = 'Situação Funcional'
            end
            object Label31: TLabel
              Left = 9
              Top = 116
              Width = 114
              Height = 13
              Caption = 'Horário de Trabalho'
            end
            object Label37: TLabel
              Left = 9
              Top = 153
              Width = 134
              Height = 13
              Caption = 'Fonte de Recrutamento'
            end
            object Label55: TLabel
              Left = 225
              Top = 116
              Width = 101
              Height = 13
              Caption = 'Data Ref. Horário'
            end
            object Label25: TLabel
              Left = 9
              Top = 71
              Width = 83
              Height = 13
              Caption = 'Motivo Oficial '
            end
            object Label13: TLabel
              Left = 177
              Top = 74
              Width = 97
              Height = 13
              Caption = 'Motivo Gerencial'
            end
            object dbedMatric: TwwDBEdit
              Left = 68
              Top = 14
              Width = 92
              Height = 21
              TabStop = False
              DataField = 'MATRICULA'
              DataSource = dsSubTipo
              ReadOnly = True
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedDatAdmis: TCMDateTimePicker
              Left = 224
              Top = 14
              Width = 100
              Height = 21
              TabStop = False
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
              Enabled = False
              ReadOnly = True
              ShowButton = True
              TabOrder = 1
            end
            object dblcSitFunc: TwwDBLookupCombo
              Left = 9
              Top = 47
              Width = 312
              Height = 21
              TabStop = False
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'30'#9'DESCRICAO')
              DataField = 'IDSITFUNC'
              DataSource = dsSubTipo
              LookupTable = qrySitFunc
              LookupField = 'IDSITFUNC'
              Enabled = False
              ReadOnly = True
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
              OnChange = dblcSitFuncChange
            end
            object wwDBLookupCombo2: TwwDBLookupCombo
              Left = 9
              Top = 129
              Width = 208
              Height = 21
              TabStop = False
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEHORARIO'#9'40'#9'NOMEHORARIO')
              DataField = 'IDHORARIO'
              DataSource = dsSubTipo
              LookupTable = tblHorario
              LookupField = 'IDHORARIO'
              Enabled = False
              ReadOnly = True
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
            end
            object dblcFonte: TwwDBLookupCombo
              Left = 9
              Top = 166
              Width = 312
              Height = 21
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'DESCRICAO'#9'30'#9'DESCRICAO')
              DataField = 'IDFONTRECR'
              DataSource = dsPessoaFisica
              LookupTable = qryFonte
              LookupField = 'IDFONTRECR'
              Enabled = False
              ReadOnly = True
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
            end
            object dbedDatRefHor: TCMDateTimePicker
              Left = 224
              Top = 128
              Width = 100
              Height = 21
              Hint = 'Importante Se For Horário de Escala'
              TabStop = False
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
              Enabled = False
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              ShowButton = True
              TabOrder = 5
            end
            object dblcMotivo1: TwwDBLookupCombo
              Left = 9
              Top = 86
              Width = 160
              Height = 21
              Hint = 'Motivo da Alteração na Situação Funcional'
              TabStop = False
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'DESCRICAO')
              DataField = 'IDMOTIVODESLIGRAIS'
              DataSource = dsSubTipo
              LookupTable = qryMotivo
              LookupField = 'IDMOTIVO'
              Enabled = False
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 6
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
            end
            object dblcMotivo2: TwwDBLookupCombo
              Left = 176
              Top = 87
              Width = 145
              Height = 21
              Hint = 'Motivo da Alteração na Situação Funcional'
              TabStop = False
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'DESCRICAO')
              DataField = 'IDMOTIVODESLIGGERENCIAL'
              DataSource = dsSubTipo
              LookupTable = qryMotivo
              LookupField = 'IDMOTIVO'
              Enabled = False
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 7
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
            end
          end
          object gbxContr: TGroupBox
            Left = 382
            Top = -1
            Width = 330
            Height = 118
            Caption = 'Contrato de Trabalho'
            TabOrder = 1
            object dbrgTipContra: TDBRadioGroup
              Left = 8
              Top = 12
              Width = 120
              Height = 97
              DataField = 'TIPOCONTRATO'
              DataSource = dsSubTipo
              Items.Strings = (
                'Efetivo'
                'Temporário'
                'Estagiário'
                'Terceiro'
                'Proprietário'
                'Autônomo')
              ReadOnly = True
              TabOrder = 0
              Values.Strings = (
                'E'
                'T'
                'G'
                '3'
                'P'
                'A')
              OnClick = dbrgTipContraClick
            end
            object gbxContrato: TGroupBox
              Left = 135
              Top = 12
              Width = 187
              Height = 97
              TabOrder = 1
              object lblFinal: TLabel
                Left = 6
                Top = 16
                Width = 28
                Height = 13
                Caption = 'Final'
              end
              object Label43: TLabel
                Left = 6
                Top = 43
                Width = 49
                Height = 13
                Caption = 'Duração'
              end
              object Label47: TLabel
                Left = 6
                Top = 70
                Width = 70
                Height = 13
                Caption = 'Prorrogação'
              end
              object dbedFinal: TCMDateTimePicker
                Left = 78
                Top = 11
                Width = 100
                Height = 21
                TabStop = False
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
                Enabled = False
                ReadOnly = True
                ShowButton = True
                TabOrder = 0
              end
              object dbedDura: TwwDBEdit
                Left = 78
                Top = 40
                Width = 100
                Height = 21
                TabStop = False
                DataField = 'DURACAOCONTRATO'
                DataSource = dsSubTipo
                ReadOnly = True
                TabOrder = 1
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dbedProrr: TwwDBEdit
                Left = 78
                Top = 67
                Width = 100
                Height = 21
                TabStop = False
                DataField = 'PRORROGCONTRATO'
                DataSource = dsSubTipo
                ReadOnly = True
                TabOrder = 2
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
            end
          end
          object gbxDeslig: TGroupBox
            Left = 37
            Top = 195
            Width = 330
            Height = 43
            Caption = 'Desligamento ou Afastamento'
            TabOrder = 2
            object Label23: TLabel
              Left = 9
              Top = 19
              Width = 59
              Height = 13
              Caption = 'Data Efet.'
            end
            object Label24: TLabel
              Left = 174
              Top = 20
              Width = 46
              Height = 13
              Caption = 'Retorno'
            end
            object dbedDatSaida: TCMDateTimePicker
              Left = 69
              Top = 17
              Width = 100
              Height = 21
              TabStop = False
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
              Enabled = False
              ReadOnly = True
              ShowButton = True
              TabOrder = 0
            end
            object dbedRetorno: TCMDateTimePicker
              Left = 224
              Top = 17
              Width = 100
              Height = 21
              TabStop = False
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
              ReadOnly = True
              ShowButton = True
              TabOrder = 1
            end
          end
          object gbxSalar: TGroupBox
            Left = 382
            Top = 119
            Width = 330
            Height = 80
            Caption = 'Salário'
            TabOrder = 3
            object Label50: TLabel
              Left = 6
              Top = 19
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object Label51: TLabel
              Left = 6
              Top = 52
              Width = 55
              Height = 13
              Caption = 'Data Efet'
            end
            object dbedSalario: TDBRealEdit
              Left = 65
              Top = 15
              Width = 121
              Height = 21
              TabStop = False
              Alignment = taRightJustify
              Enabled = False
              Lines.Strings = (
                '0,00')
              ReadOnly = True
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
              Top = 48
              Width = 121
              Height = 21
              TabStop = False
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
              Enabled = False
              ReadOnly = True
              ShowButton = True
              TabOrder = 1
            end
            object dbrgTipoSalar: TDBRadioGroup
              Left = 193
              Top = 11
              Width = 130
              Height = 59
              Caption = 'Base'
              Columns = 2
              DataField = 'TIPOPAGAMENTO'
              DataSource = dsSubTipo
              Items.Strings = (
                'Hora'
                'Dia'
                'Mês'
                'Tarefa')
              ReadOnly = True
              TabOrder = 2
              Values.Strings = (
                'H'
                'D'
                'M'
                'T')
            end
          end
          object gbxLotacao: TGroupBox
            Left = 382
            Top = 199
            Width = 330
            Height = 109
            Caption = 'Lotação'
            TabOrder = 4
            object Label29: TLabel
              Left = 6
              Top = 14
              Width = 37
              Height = 13
              Caption = 'Estab.'
            end
            object Label32: TLabel
              Left = 6
              Top = 35
              Width = 49
              Height = 13
              Caption = 'C. Custo'
            end
            object Label53: TLabel
              Left = 6
              Top = 61
              Width = 59
              Height = 13
              Caption = 'Data Efet.'
            end
            object Label54: TLabel
              Left = 6
              Top = 85
              Width = 56
              Height = 13
              Caption = 'Subord. a'
            end
            object dblcEstab: TwwDBLookupCombo
              Left = 65
              Top = 9
              Width = 260
              Height = 21
              TabStop = False
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'NOME'#9'40'#9'NOME')
              DataField = 'IDESTAB'
              DataSource = dsSubTipo
              LookupTable = qryEstab
              LookupField = 'IDPESSOA'
              Enabled = False
              ReadOnly = True
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = False
            end
            object dblcLotacao: TwwDBLookupCombo
              Left = 65
              Top = 33
              Width = 94
              Height = 21
              TabStop = False
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODCENTROCUSTO'#9'10'#9'Código'
                'NOME'#9'30'#9'Nome')
              DataField = 'CODCENTROCUSTO'
              DataSource = dsSubTipo
              LookupTable = qryLotacao
              LookupField = 'CODCENTROCUSTO'
              Options = [loTitles]
              Enabled = False
              ReadOnly = True
              TabOrder = 1
              AutoDropDown = False
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = False
            end
            object dbedNomeCC: TwwDBEdit
              Left = 166
              Top = 33
              Width = 156
              Height = 21
              TabStop = False
              Color = clGray
              DataField = 'NOME'
              DataSource = dsLot
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedDatLotac: TCMDateTimePicker
              Left = 65
              Top = 57
              Width = 121
              Height = 21
              TabStop = False
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
              Enabled = False
              ReadOnly = True
              ShowButton = True
              TabOrder = 3
            end
            object dblcChefe: TwwDBLookupCombo
              Left = 65
              Top = 81
              Width = 260
              Height = 21
              TabStop = False
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'NOME'
                'TITULO'#9'30'#9'TITULO')
              DataField = 'IDCHEFE'
              DataSource = dsSubTipo
              LookupTable = qryChefe
              LookupField = 'IDPESSOA'
              Options = [loColLines, loTitles]
              Enabled = False
              ReadOnly = True
              TabOrder = 4
              AutoDropDown = False
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = False
            end
          end
          object gbxCargo: TGroupBox
            Left = 37
            Top = 237
            Width = 330
            Height = 70
            Caption = 'Cargo'
            TabOrder = 5
            object Label52: TLabel
              Left = 12
              Top = 46
              Width = 111
              Height = 13
              Caption = 'Data de Efetivação'
            end
            object dblcCargo: TwwDBLookupCombo
              Left = 9
              Top = 14
              Width = 312
              Height = 21
              TabStop = False
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'TITULO'#9'30'#9'TITULO')
              DataField = 'IDCARGO'
              DataSource = dsSubTipo
              LookupTable = qryCargo
              LookupField = 'IDCARGO'
              Enabled = False
              ReadOnly = True
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
            end
            object dbedDatCargo: TCMDateTimePicker
              Left = 132
              Top = 42
              Width = 121
              Height = 21
              TabStop = False
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
              Enabled = False
              ReadOnly = True
              ShowButton = True
              TabOrder = 1
            end
          end
        end
        object tbshHistoricos: TTabSheet
          Caption = 'Consulta Históricos'
          object pnlDataHist: TPanel
            Left = 0
            Top = 0
            Width = 696
            Height = 41
            Align = alTop
            TabOrder = 0
            object Label60: TLabel
              Left = 247
              Top = 12
              Width = 67
              Height = 13
              Caption = 'A Partir De:'
            end
            object dtedHist: TCMDateTimePicker
              Left = 320
              Top = 9
              Width = 100
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
              ShowButton = True
              TabOrder = 0
              OnChange = dtedHistChange
            end
          end
          object pgctrlHistoricos: TPageControl
            Left = 0
            Top = 41
            Width = 696
            Height = 312
            ActivePage = tbshCursos
            Align = alClient
            TabOrder = 1
            object tbshCursos: TTabSheet
              Caption = 'Cursos'
              object dbgrCursos: TwwDBGrid
                Left = 0
                Top = 0
                Width = 676
                Height = 276
                Selected.Strings = (
                  'DESCRICAO'#9'30'#9'Nome do Curso'
                  'DATPLINI'#9'10'#9'Início Plan.'
                  'DATREINI'#9'10'#9'Início Real'
                  'DATREFIM'#9'10'#9'Término'
                  'DUR_TOT'#9'10'#9'Carga Horária'
                  'AVTEOR'#9'10'#9'Aval. Teórica'
                  'AVPRAT'#9'10'#9'Aval. Prática')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                DataSource = dsCursos
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
            end
            object tbshAvaliacoes: TTabSheet
              Caption = 'Avaliações'
              object dbgrAval: TwwDBGrid
                Left = 0
                Top = 0
                Width = 531
                Height = 105
                Selected.Strings = (
                  'DESCRTIPOAVAL'#9'40'#9'Tipo de Avaliação, Teste, Entrevista'
                  'DATAPLAN'#9'10'#9'Data Planejada'
                  'DATAREAL'#9'10'#9'Data Efetiva'
                  'AVALIACAO'#9'10'#9'Pontuação')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                DataSource = dsAval
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
            end
            object tbshEvolucao: TTabSheet
              Caption = 'Evolução'
              object dbgrEvol: TwwDBGrid
                Left = 0
                Top = 0
                Width = 531
                Height = 105
                Selected.Strings = (
                  'DATAALTERFUNC'#9'10'#9'Data Efet.'
                  'DESCRICAO'#9'30'#9'Tipo de Ação'
                  'TITULO'#9'30'#9'Cargo'
                  'CCUSTO'#9'10'#9'Centro de Custo'
                  'SALARIO'#9'10'#9'Salário'
                  'TIPOPAGAMENTO'#9'4'#9'Base'
                  'PERC_REAJ'#9'10'#9'Percentual')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                DataSource = dsEvol
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
            end
            object tbshBeneficios: TTabSheet
              Caption = 'Benefícios'
              object dbgrBenef: TwwDBGrid
                Left = 0
                Top = 0
                Width = 531
                Height = 105
                Selected.Strings = (
                  'DESCRICAO'#9'30'#9'Descrição'
                  'DESCRBENEFSALAR'#9'30'#9'Tipo de Benefício'
                  'ANOMESINICIO'#9'7'#9'A Partir De'
                  'FLGPERMANENTE'#9'10'#9'Permanente?'
                  'PARCELAS'#9'10'#9'Parcelas'
                  'NUMOCORRENCIAS'#9'10'#9'Ocorrências'
                  'VALORRUBRICA'#9'10'#9'Valor Base')
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
            end
            object tbshProntuario: TTabSheet
              Caption = 'Prontuário'
              object dbgrMedic: TwwDBGrid
                Left = 0
                Top = 0
                Width = 531
                Height = 105
                Selected.Strings = (
                  'DESCRTIPOOCMED'#9'40'#9'Tipo de Ocorrência'
                  'DATAPLAN'#9'10'#9'Data Prevista'
                  'DATAREAL'#9'10'#9'Data Real'
                  'EXAMINADOR'#9'40'#9'Médico ou Entidade'
                  'AVALIACAO'#9'10'#9'Avaliação')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                DataSource = dsMedic
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
            end
            object tbshFerias: TTabSheet
              Caption = 'Férias'
              object dbgrFerais: TwwDBGrid
                Left = 0
                Top = 0
                Width = 681
                Height = 276
                Selected.Strings = (
                  'INIPERIODOFERIAS'#9'10'#9'Início Período Aquis.'
                  'INIGOZOFERIAS'#9'10'#9'Em Férias de'
                  'FIMGOZOFERIAS'#9'10'#9'         a'
                  'FLGABONO'#9'10'#9'Com Abono?'
                  'FLGOCORRIDA'#9'10'#9'Processada?')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                DataSource = dsFerias
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
            end
            object tbshContraCheque: TTabSheet
              Caption = 'Contra Cheque'
              object Panel3: TPanel
                Left = 0
                Top = 0
                Width = 688
                Height = 55
                Align = alTop
                TabOrder = 0
                object Label10: TLabel
                  Left = 543
                  Top = 10
                  Width = 61
                  Height = 13
                  Caption = 'Descontos'
                end
                object Label11: TLabel
                  Left = 641
                  Top = 10
                  Width = 44
                  Height = 13
                  Caption = 'Líquido'
                end
                object grpMesRef: TGroupBox
                  Left = 255
                  Top = 5
                  Width = 175
                  Height = 45
                  Caption = ' Mês e Ano de Referência '
                  TabOrder = 0
                  object cmbMes: TComboBox
                    Left = 7
                    Top = 16
                    Width = 100
                    Height = 21
                    Style = csDropDownList
                    ItemHeight = 13
                    TabOrder = 0
                    OnChange = cmbMesChange
                    Items.Strings = (
                      'Janeiro'
                      'Fevereiro'
                      'Março'
                      'Abril'
                      'Maio'
                      'Junho'
                      'Julho'
                      'Agosto'
                      'Setembro'
                      'Outubro'
                      'Novembro'
                      'Dezembro')
                  end
                  object spnedAno: TSpinEdit
                    Left = 114
                    Top = 16
                    Width = 55
                    Height = 22
                    MaxValue = 0
                    MinValue = 0
                    TabOrder = 1
                    Value = 0
                    OnChange = cmbMesChange
                  end
                end
                object dblcMotivo: TwwDBLookupCombo
                  Left = 9
                  Top = 19
                  Width = 232
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'50'#9'DESCRICAO')
                  LookupTable = qryMotivoFolha
                  LookupField = 'IDMOTIVO'
                  TabOrder = 1
                  AutoDropDown = True
                  ShowButton = True
                  SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
                  AllowClearKey = True
                  OnCloseUp = dblcMotivoCloseUp
                end
                object redProvento: TRealEdit
                  Left = 445
                  Top = 24
                  Width = 90
                  Height = 21
                  Alignment = taRightJustify
                  Color = clGray
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWhite
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  Lines.Strings = (
                    '      0,00')
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 2
                  WordWrap = False
                  IntDigits = 10
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                end
                object redDesconto: TRealEdit
                  Left = 543
                  Top = 24
                  Width = 90
                  Height = 21
                  Alignment = taRightJustify
                  Color = clGray
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWhite
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  Lines.Strings = (
                    '      0,00')
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 3
                  WordWrap = False
                  IntDigits = 10
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                end
                object redLiquido: TRealEdit
                  Left = 641
                  Top = 24
                  Width = 90
                  Height = 21
                  Alignment = taRightJustify
                  Color = clGray
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWhite
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  Lines.Strings = (
                    '      0,00')
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 4
                  WordWrap = False
                  IntDigits = 10
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                end
              end
              object dbgrHistRub: TwwDBGrid
                Left = 0
                Top = 55
                Width = 688
                Height = 229
                Selected.Strings = (
                  'DESCRICAO'#9'50'#9'Nome da Rubrica'#9'No'
                  'REFERENCIA'#9'10'#9'Referência'#9'No'
                  'VALORPROVENTO'#9'13'#9'Valor'#9'No'
                  'TIPO'#9'8'#9'Tipo'#9'No')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                DataSource = dsHistRub
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
          end
        end
        object tbshCursosExternos: TTabSheet
          Caption = 'Cursos Externos'
          object dbgrCursosExternos: TwwDBGrid
            Left = 0
            Top = 0
            Width = 696
            Height = 353
            Selected.Strings = (
              'DESCRICAO'#9'49'#9'Curso'
              'DATREINI'#9'10'#9'Data Inicial'
              'DATREFIM'#9'10'#9'Data Final'
              'DUR_TOT'#9'10'#9'Carga Horária')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsCursosExternos
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
          object pnlCursosExternos: TPanel
            Left = 0
            Top = 0
            Width = 696
            Height = 353
            Align = alClient
            TabOrder = 1
            object gbxCurso: TGroupBox
              Left = 181
              Top = 16
              Width = 328
              Height = 112
              Caption = 'Curso'
              TabOrder = 0
              object Label3: TLabel
                Left = 9
                Top = 60
                Width = 158
                Height = 13
                Caption = 'Empresa/Entidade/Instrutor'
              end
              object dblcCurso: TwwDBLookupCombo
                Left = 9
                Top = 24
                Width = 310
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'60'#9'Nome do Curso'#9'F'
                  'TIPOCURSO'#9'30'#9'Tipo do Curso'#9'F')
                DataField = 'IDCURSO'
                DataSource = dsCursosExternos
                LookupTable = tblCurso
                LookupField = 'IDCURSO'
                Options = [loColLines, loTitles]
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
                AllowClearKey = True
                OnCloseUp = dblcCursoCloseUp
              end
              object dblcEntid: TwwDBLookupCombo
                Left = 9
                Top = 73
                Width = 310
                Height = 21
                DropDownAlignment = taRightJustify
                Selected.Strings = (
                  'NOME'#9'60'#9'NOME')
                DataField = 'IDENTIDINSTR'
                DataSource = dsCursosExternos
                LookupTable = qryEntid
                LookupField = 'IDPESSOA'
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
                AllowClearKey = True
              end
            end
            object gbxDatas: TGroupBox
              Left = 181
              Top = 131
              Width = 160
              Height = 118
              Caption = 'Datas'
              TabOrder = 1
              object Label8: TLabel
                Left = 8
                Top = 13
                Width = 78
                Height = 13
                Caption = 'Início Efetivo'
              end
              object Label9: TLabel
                Left = 8
                Top = 62
                Width = 72
                Height = 13
                Caption = 'Final Efetivo'
              end
              object cmDatReIni: TCMDateTimePicker
                Left = 19
                Top = 28
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATREINI'
                DataSource = dsCursosExternos
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
              object cmDatReFim: TCMDateTimePicker
                Left = 19
                Top = 77
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATREFIM'
                DataSource = dsCursosExternos
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
            object gbxCarga: TGroupBox
              Left = 349
              Top = 131
              Width = 160
              Height = 118
              Caption = 'Carga Horária'
              TabOrder = 2
              object dbedDurTot: TDBEdit
                Left = 38
                Top = 49
                Width = 84
                Height = 21
                DataField = 'DUR_TOT'
                DataSource = dsCursosExternos
                TabOrder = 0
              end
            end
          end
        end
        object tbshProgramacaoFerias: TTabSheet
          Caption = 'Programação de Férias'
          object dbgrProgFerias: TwwDBGrid
            Left = 0
            Top = 0
            Width = 696
            Height = 353
            Selected.Strings = (
              'INIPERIODOFERIAS'#9'10'#9'Início Período Aquisitivo'
              'INIGOZOFERIAS'#9'10'#9'Início Período Gozo'
              'FIMGOZOFERIAS'#9'10'#9'Final Período Gozo'
              'FLGABONO'#9'10'#9'Com Abono ?'
              'QTDPARCDEVOL'#9'10'#9'Qtde. Parcelas Devol.')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsProgFerias
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
          object pnlProgFerias: TPanel
            Left = 0
            Top = 0
            Width = 696
            Height = 353
            Align = alClient
            TabOrder = 1
            object Label4: TLabel
              Left = 76
              Top = 40
              Width = 222
              Height = 13
              Caption = 'Início do Período Aquisitivo das Férias'
            end
            object Label5: TLabel
              Left = 76
              Top = 125
              Width = 214
              Height = 13
              Caption = 'Início do Período de Gozo das Férias'
            end
            object Label6: TLabel
              Left = 76
              Top = 170
              Width = 208
              Height = 13
              Caption = 'Final do Período de Gozo das Férias'
            end
            object Label7: TLabel
              Left = 76
              Top = 220
              Width = 177
              Height = 13
              Caption = 'Parcelas Dev. Adto. das Férias'
            end
            object Label65: TLabel
              Left = 76
              Top = 80
              Width = 216
              Height = 13
              Caption = 'Final do Período Aquisitivo das Férias'
            end
            object dbedIniPeriodo: TCMDateTimePicker
              Left = 307
              Top = 37
              Width = 121
              Height = 21
              TabStop = False
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'INIPERIODOFERIAS'
              DataSource = dsProgFerias
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
              ReadOnly = True
              ShowButton = True
              TabOrder = 0
            end
            object dbedIniGozo: TCMDateTimePicker
              Left = 307
              Top = 123
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'INIGOZOFERIAS'
              DataSource = dsProgFerias
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
            end
            object dbedFimGozo: TCMDateTimePicker
              Left = 307
              Top = 167
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'FIMGOZOFERIAS'
              DataSource = dsProgFerias
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
              OnExit = dbedFimGozoExit
            end
            object spedDias: TSpinEdit
              Left = 449
              Top = 167
              Width = 49
              Height = 22
              Hint = 'Final do Período de Gozo das Férias expresso em dias'
              MaxLength = 100
              MaxValue = 0
              MinValue = 0
              ParentShowHint = False
              ShowHint = True
              TabOrder = 5
              Value = 0
              OnExit = spedDiasExit
            end
            object dbspeParcFer: TwwDBSpinEdit
              Left = 307
              Top = 218
              Width = 121
              Height = 21
              Increment = 1
              DataField = 'QTDPARCDEVOL'
              DataSource = dsProgFerias
              TabOrder = 6
              UnboundDataType = wwDefault
            end
            object dbrgAbono: TDBRadioGroup
              Left = 449
              Top = 111
              Width = 163
              Height = 42
              Caption = 'Com Abono Pecuniário ?'
              Columns = 2
              DataField = 'FLGABONO'
              DataSource = dsProgFerias
              Items.Strings = (
                'Sim'
                'Não')
              TabOrder = 3
              Values.Strings = (
                '1'
                '0')
            end
            object dtFinalPerAquis: TCMDateTimePicker
              Left = 307
              Top = 74
              Width = 121
              Height = 21
              TabStop = False
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
              Enabled = False
              ReadOnly = True
              ShowButton = True
              TabOrder = 1
              OnChange = dtedHistChange
            end
          end
        end
        object tbshOutros: TTabSheet
          Caption = 'Outros Dados'
          object Label44: TLabel
            Left = 115
            Top = 5
            Width = 165
            Height = 13
            Caption = 'Vínculo Empregatício (RAIS)'
          end
          object Label45: TLabel
            Left = 115
            Top = 29
            Width = 178
            Height = 13
            Caption = 'Movimento Contratual (CAGED)'
          end
          object Label46: TLabel
            Left = 115
            Top = 53
            Width = 116
            Height = 13
            Caption = 'Tipo de Trabalhador'
          end
          object wwDBLookupCombo3: TwwDBLookupCombo
            Left = 307
            Top = 3
            Width = 350
            Height = 21
            TabStop = False
            DropDownAlignment = taRightJustify
            Selected.Strings = (
              'DESCRICAO'#9'50'#9'DESCRICAO')
            DataField = 'IDVINCEMPREG'
            DataSource = dsSubTipo
            LookupTable = tblVinculo
            LookupField = 'IDVINCEMPREG'
            Enabled = False
            ReadOnly = True
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            UseTFields = False
            AllowClearKey = False
          end
          object wwDBLookupCombo4: TwwDBLookupCombo
            Left = 307
            Top = 27
            Width = 350
            Height = 21
            TabStop = False
            DropDownAlignment = taRightJustify
            Selected.Strings = (
              'DESCRICAO'#9'50'#9'DESCRICAO')
            DataField = 'IDMOVCONTRCAGED'
            DataSource = dsSubTipo
            LookupTable = tblMovContr
            LookupField = 'IDMOVCONTRCAGED'
            Enabled = False
            ReadOnly = True
            TabOrder = 1
            AutoDropDown = False
            ShowButton = True
            UseTFields = False
            AllowClearKey = False
          end
          object wwDBLookupCombo5: TwwDBLookupCombo
            Left = 307
            Top = 51
            Width = 350
            Height = 21
            TabStop = False
            DropDownAlignment = taRightJustify
            Selected.Strings = (
              'DESCRICAO'#9'50'#9'DESCRICAO')
            DataField = 'IDTIPOTRAB'
            DataSource = dsSubTipo
            LookupTable = tblTipoTrab
            LookupField = 'IDTIPOTRAB'
            Enabled = False
            ReadOnly = True
            TabOrder = 2
            AutoDropDown = False
            ShowButton = True
            UseTFields = False
            AllowClearKey = False
          end
          object gbxFGTS: TGroupBox
            Left = 115
            Top = 75
            Width = 541
            Height = 187
            Caption = 'FGTS - Fundo de Garantia por Tempo de Serviço'
            TabOrder = 3
            object lblDatOpc: TLabel
              Left = 390
              Top = 18
              Width = 87
              Height = 13
              Caption = 'Data de Opção'
            end
            object Label48: TLabel
              Left = 36
              Top = 60
              Width = 127
              Height = 13
              Caption = 'Quantidade de Contas'
            end
            object Label49: TLabel
              Left = 282
              Top = 60
              Width = 98
              Height = 13
              Caption = 'Valor Depositado'
            end
            object Label30: TLabel
              Left = 36
              Top = 89
              Width = 97
              Height = 13
              Caption = 'Banco / Agência'
            end
            object Label33: TLabel
              Left = 36
              Top = 114
              Width = 99
              Height = 13
              Caption = 'Número da Conta'
            end
            object Label56: TLabel
              Left = 36
              Top = 138
              Width = 122
              Height = 13
              Caption = 'Categoria Empregado'
            end
            object Label57: TLabel
              Left = 36
              Top = 162
              Width = 105
              Height = 13
              Caption = 'Situação de Risco'
            end
            object rgFGTSopcao: TDBRadioGroup
              Left = 36
              Top = 15
              Width = 325
              Height = 37
              Columns = 3
              DataField = 'FLGTIPOFGTS'
              DataSource = dsSubTipo
              Items.Strings = (
                'Optante'
                'Não Optante'
                'Retratação')
              ReadOnly = True
              TabOrder = 0
              Values.Strings = (
                '1'
                '2'
                '3')
              OnClick = rgFGTSopcaoClick
            end
            object dbedDatOpc: TCMDateTimePicker
              Left = 390
              Top = 30
              Width = 121
              Height = 21
              TabStop = False
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAOPCAOFGTS'
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
              Enabled = False
              ReadOnly = True
              ShowButton = True
              TabOrder = 1
            end
            object dbedValFG: TDBRealEdit
              Left = 390
              Top = 57
              Width = 121
              Height = 21
              TabStop = False
              Alignment = taRightJustify
              Enabled = False
              Lines.Strings = (
                '0,00')
              ReadOnly = True
              TabOrder = 2
              WordWrap = False
              IntDigits = 17
              DecDigits = 2
              NumberFormat = fFixed
              Signal = False
              DataField = 'VALORFGTS'
              DataSource = dsSubTipo
            end
            object dbedContas: TwwDBEdit
              Left = 168
              Top = 57
              Width = 60
              Height = 21
              TabStop = False
              DataField = 'QUANTIDADEFGTS'
              DataSource = dsSubTipo
              Enabled = False
              ReadOnly = True
              TabOrder = 3
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object wwDBLookupCombo6: TwwDBLookupCombo
              Left = 168
              Top = 84
              Width = 346
              Height = 21
              TabStop = False
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'AGENCIA'#9'30'#9'Agência'
                'NUMAGENCIA'#9'10'#9'Num.'
                'NOME'#9'25'#9'Banco'
                'NUMBANCO'#9'10'#9'Num.')
              DataField = 'IDAGENCIAFGTS'
              DataSource = dsSubTipo
              LookupTable = qryAgBan
              LookupField = 'IDPESSOA'
              Options = [loColLines, loTitles]
              Enabled = False
              ReadOnly = True
              TabOrder = 4
              AutoDropDown = False
              ShowButton = True
              UseTFields = False
              AllowClearKey = False
            end
            object wwDBEdit4: TwwDBEdit
              Left = 168
              Top = 111
              Width = 163
              Height = 21
              TabStop = False
              DataField = 'NUMCONTAFGTS'
              DataSource = dsSubTipo
              Enabled = False
              ReadOnly = True
              TabOrder = 5
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object wwDBLookupCombo8: TwwDBLookupCombo
              Left = 168
              Top = 135
              Width = 346
              Height = 21
              TabStop = False
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'DESCRICAO')
              DataField = 'IDCATEMPRGRE'
              DataSource = dsSubTipo
              LookupTable = tblCatEmpr
              LookupField = 'IDCATEMPRGRE'
              Enabled = False
              ReadOnly = True
              TabOrder = 6
              AutoDropDown = False
              ShowButton = True
              UseTFields = False
              AllowClearKey = False
            end
            object wwDBLookupCombo9: TwwDBLookupCombo
              Left = 168
              Top = 159
              Width = 346
              Height = 21
              TabStop = False
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'DESCRICAO'#9'80'#9'DESCRICAO')
              DataField = 'IDSITRISCO'
              DataSource = dsSubTipo
              LookupTable = tblSitRisco
              LookupField = 'IDSITRISCO'
              Enabled = False
              ReadOnly = True
              TabOrder = 7
              AutoDropDown = False
              ShowButton = True
              UseTFields = False
              AllowClearKey = False
            end
          end
          object gbxContaSal: TGroupBox
            Left = 115
            Top = 264
            Width = 541
            Height = 46
            Caption = 'Conta Salário'
            TabOrder = 4
            object Label58: TLabel
              Left = 2
              Top = 23
              Width = 48
              Height = 13
              Caption = 'Bco/Ag.'
            end
            object Label59: TLabel
              Left = 336
              Top = 21
              Width = 34
              Height = 13
              Caption = 'Conta'
            end
            object dblcAgenciaSal: TwwDBLookupCombo
              Left = 50
              Top = 18
              Width = 280
              Height = 21
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'AGENCIA'#9'30'#9'Agência'
                'NUMAGENCIA'#9'10'#9'Num.'
                'NOME'#9'25'#9'Banco'
                'NUMBANCO'#9'10'#9'Num.')
              DataField = 'IDAGENCIASALARIO'
              DataSource = dsSubTipo
              LookupTable = qryAgBan
              LookupField = 'IDPESSOA'
              Options = [loColLines, loTitles]
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              UseTFields = False
              AllowClearKey = False
            end
            object edContaSal: TwwDBEdit
              Left = 373
              Top = 18
              Width = 163
              Height = 21
              DataField = 'NUMCONTASALARIO'
              DataSource = dsSubTipo
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
        end
        object tbsUltEmpr: TTabSheet
          Caption = 'Ultimos Empregos'
          object dbgrUltEmpr: TwwDBGrid
            Left = 0
            Top = 0
            Width = 696
            Height = 353
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
            DataSource = dsUlt
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
            Width = 696
            Height = 353
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
              DataSource = dsUlt
              LookupTable = qryCargo
              LookupField = 'IDCARGO'
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
              OnCloseUp = dblcUltCargoCloseUp
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
              DataSource = dsUlt
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
              DataSource = dsUlt
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
              DataSource = dsUlt
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
              DataSource = dsUlt
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
              DataSource = dsUlt
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
              DataSource = dsUlt
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
              DataSource = dsUlt
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
        end
        object tbshOpcaoCargo: TTabSheet
          Caption = 'Opção Cargo'
          object gbxCargo1: TGroupBox
            Left = 119
            Top = 52
            Width = 330
            Height = 76
            Caption = 'Cargo Oficial (ou Básico)'
            TabOrder = 0
            object Label17: TLabel
              Left = 12
              Top = 49
              Width = 111
              Height = 13
              Caption = 'Data de Efetivação'
            end
            object dblcCargo1: TwwDBLookupCombo
              Left = 9
              Top = 17
              Width = 312
              Height = 21
              TabStop = False
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'TITULO'#9'30'#9'TITULO')
              DataField = 'IDCARGO'
              DataSource = dsSubTipo
              LookupTable = qryCargo
              LookupField = 'IDCARGO'
              Enabled = False
              ReadOnly = True
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = False
            end
            object dbedCargo1: TCMDateTimePicker
              Left = 132
              Top = 45
              Width = 121
              Height = 21
              TabStop = False
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
              Enabled = False
              ReadOnly = True
              ShowButton = True
              TabOrder = 1
            end
          end
          object gbxCargo2: TGroupBox
            Left = 119
            Top = 163
            Width = 330
            Height = 76
            Caption = 'Cargo Alternativo (Função ou  Equivalente)'
            TabOrder = 1
            object Label26: TLabel
              Left = 12
              Top = 49
              Width = 111
              Height = 13
              Caption = 'Data de Efetivação'
            end
            object dblcCargo2: TwwDBLookupCombo
              Left = 9
              Top = 17
              Width = 312
              Height = 21
              TabStop = False
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'TITULO'#9'30'#9'TITULO')
              DataField = 'IDFUNCAO'
              DataSource = dsSubTipo
              LookupTable = qryCargo
              LookupField = 'IDCARGO'
              Enabled = False
              ReadOnly = True
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = False
            end
            object dbedCargo2: TCMDateTimePicker
              Left = 132
              Top = 45
              Width = 121
              Height = 21
              TabStop = False
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATACARGO2'
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
              Enabled = False
              ReadOnly = True
              ShowButton = True
              TabOrder = 1
            end
          end
          object gbxFaixa1: TGroupBox
            Left = 476
            Top = 52
            Width = 220
            Height = 76
            Caption = 'Faixa Salarial no Cargo Oficial'
            TabOrder = 2
            object Label27: TLabel
              Left = 44
              Top = 49
              Width = 81
              Height = 13
              Caption = 'Step Na Faixa'
            end
            object dbspeStep1: TwwDBSpinEdit
              Left = 132
              Top = 46
              Width = 43
              Height = 21
              TabStop = False
              Increment = 1
              MaxValue = 9
              MinValue = 1
              DataField = 'NIVELINDIV1'
              DataSource = dsSubTipo
              Enabled = False
              ReadOnly = True
              TabOrder = 0
              UnboundDataType = wwDefault
            end
            object dblcFaixa1: TwwDBLookupCombo
              Left = 47
              Top = 19
              Width = 127
              Height = 21
              TabStop = False
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'IDFAIXASALARIAL'#9'10'#9'Código'
                'STEP1'#9'10'#9'STEP 1'
                'STEP2'#9'10'#9'STEP 2'
                'STEP3'#9'10'#9'STEP 3'
                'STEP4'#9'10'#9'STEP 4'
                'STEP5'#9'10'#9'STEP 5'
                'STEP6'#9'10'#9'STEP 6'
                'STEP7'#9'10'#9'STEP 7'
                'STEP8'#9'10'#9'STEP 8'
                'STEP9'#9'10'#9'STEP 9'
                'DATAEFETIV'#9'10'#9'Data Efetiv.')
              DataField = 'IDFAIXACARGO'
              DataSource = dsSubTipo
              LookupTable = qryFaixa
              LookupField = 'IDFAIXASALARIAL'
              Options = [loColLines, loTitles]
              Enabled = False
              ReadOnly = True
              TabOrder = 1
              AutoDropDown = False
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = False
            end
          end
          object gbxFaixa2: TGroupBox
            Left = 476
            Top = 163
            Width = 220
            Height = 76
            Caption = 'Faixa Salarial no Cargo Alternativo'
            TabOrder = 3
            object Label28: TLabel
              Left = 44
              Top = 49
              Width = 81
              Height = 13
              Caption = 'Step Na Faixa'
            end
            object dbspeStep2: TwwDBSpinEdit
              Left = 132
              Top = 46
              Width = 43
              Height = 21
              TabStop = False
              Increment = 1
              MaxValue = 9
              MinValue = 1
              DataField = 'NIVELINDIV2'
              DataSource = dsSubTipo
              Enabled = False
              ReadOnly = True
              TabOrder = 0
              UnboundDataType = wwDefault
            end
            object dblcFaixa2: TwwDBLookupCombo
              Left = 47
              Top = 19
              Width = 127
              Height = 21
              TabStop = False
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'IDFAIXASALARIAL'#9'10'#9'Código'
                'STEP1'#9'10'#9'STEP 1'
                'STEP2'#9'10'#9'STEP 2'
                'STEP3'#9'10'#9'STEP 3'
                'STEP4'#9'10'#9'STEP 4'
                'STEP5'#9'10'#9'STEP 5'
                'STEP6'#9'10'#9'STEP 6'
                'STEP7'#9'10'#9'STEP 7'
                'STEP8'#9'10'#9'STEP 8'
                'STEP9'#9'10'#9'STEP 9'
                'DATAEFETIV'#9'10'#9'Data Efetiv.')
              DataField = 'IDFAIXAFUNCAO'
              DataSource = dsSubTipo
              LookupTable = qryFaixa
              LookupField = 'IDFAIXASALARIAL'
              Options = [loColLines, loTitles]
              Enabled = False
              ReadOnly = True
              TabOrder = 1
              AutoDropDown = False
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = False
            end
          end
        end
      end
      inherited Dock974: TDock97
        Height = 381
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
      inherited dbedNomeFantasia: TDBEdit
        TabStop = False
        ReadOnly = True
      end
      inherited dbedDocumento: TwwDBEdit
        TabStop = False
        Enabled = False
        ReadOnly = True
      end
      inherited dbedemail: TwwDBEdit
        TabStop = False
        ReadOnly = True
      end
      inherited DbeHomePage_Padrao: TwwDBEdit
        TabStop = False
        ReadOnly = True
      end
    end
  end
  inherited Dock972: TDock97
    Visible = False
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Enabled = False
      end
      inherited sbtnFisJur: TToolbarButton97
        Enabled = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 542
    inherited tb97Fundo: TToolbar97
      Left = 169
      DockPos = 169
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 230046
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Filter'
        0))
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PESSOA.NOME'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'PESSOAFISICA.DATANASC'
      'PESSOAFISICA.ESTCIVIL')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'D'
      'C')
    Descricao.Strings = (
      'Seu Nome'
      'Matrícula'
      'CPF (ou equivalente)'
      'Data de Nascimento'
      'Estado Civil (S,C,D,V,O)')
    Tabelas.Strings = (
      'FUNCIONARIO'
      'PESSOA'
      'PESSOAFISICA ')
    CamposChave.Strings = (
      'FUNCIONARIO.IDPESSOA')
    Filtro.Strings = (
      'FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA'
      'FUNCIONARIO.IDPESSOA = PESSOAFISICA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22'
      '22'
      '22'
      '22')
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 430
  end
  inherited qry: TwwQuery
    inherited qryNUMDOCUMENTO: TStringField
      EditMask = '999\.999\.999\-99;0; '
    end
  end
  inherited updSubTipo: TUpdateSQL
    ModifySQL.Strings = (
      'update FUNCIONARIO'
      'set'
      '  IDAGENCIASALARIO = :IDAGENCIASALARIO,'
      '  IDHORARIO = :IDHORARIO,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  IDCARGO = :IDCARGO,'
      '  IDSITFUNC = :IDSITFUNC,'
      '  IDESTAB = :IDESTAB,'
      '  MATRICULA = :MATRICULA,'
      '  DATAADMISSAO = :DATAADMISSAO,'
      '  TIPOCONTRATO = :TIPOCONTRATO,'
      '  TIPOPAGAMENTO = :TIPOPAGAMENTO,'
      '  SALARIOATUAL = :SALARIOATUAL,'
      '  SALARIOTIPO = :SALARIOTIPO,'
      '  DATAOPCAOFGTS = :DATAOPCAOFGTS,'
      '  DATADESLIGAMENTO = :DATADESLIGAMENTO,'
      '  IDMOTIVODESLIGRAIS = :IDMOTIVODESLIGRAIS,'
      '  IDMOTIVODESLIGGERENCIAL = :IDMOTIVODESLIGGERENCIAL,'
      '  HOMOLOGACAONUMERO = :HOMOLOGACAONUMERO,'
      '  HOMOLOGACAOORGAO = :HOMOLOGACAOORGAO,'
      '  DATARETORNO = :DATARETORNO,'
      '  TIPOMAODEOBRA = :TIPOMAODEOBRA,'
      '  DATAFIMCONTRATO = :DATAFIMCONTRATO,'
      '  DATASALARIO = :DATASALARIO,'
      '  DATACARGO = :DATACARGO,'
      '  DATALOTACAO = :DATALOTACAO,'
      '  IDAGENCIAFGTS = :IDAGENCIAFGTS,'
      '  NUMCONTASALARIO = :NUMCONTASALARIO,'
      '  NUMCONTAFGTS = :NUMCONTAFGTS,'
      '  DURACAOCONTRATO = :DURACAOCONTRATO,'
      '  PRORROGCONTRATO = :PRORROGCONTRATO,'
      '  FLGTIPOFGTS = :FLGTIPOFGTS,'
      '  QUANTIDADEFGTS = :QUANTIDADEFGTS,'
      '  VALORFGTS = :VALORFGTS,'
      '  IDTIPOTRAB = :IDTIPOTRAB,'
      '  DATAAVISO = :DATAAVISO,'
      '  IDFORMARESC = :IDFORMARESC,'
      '  IDVINCEMPREG = :IDVINCEMPREG,'
      '  IDMOVCONTRCAGED = :IDMOVCONTRCAGED,'
      '  IDAFASTRAIS = :IDAFASTRAIS,'
      '  IDCHEFE = :IDCHEFE,'
      '  IDFUNCAO = :IDFUNCAO,'
      '  IDFAIXACARGO = :IDFAIXACARGO,'
      '  IDFAIXAFUNCAO = :IDFAIXAFUNCAO,'
      '  NIVELINDIV1 = :NIVELINDIV1,'
      '  NIVELINDIV2 = :NIVELINDIV2,'
      '  DATACARGO2 = :DATACARGO2,'
      '  DATAREFHORARIO = :DATAREFHORARIO,'
      '  IDCATEMPRGRE = :IDCATEMPRGRE,'
      '  IDSITRISCO = :IDSITRISCO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into FUNCIONARIO'
      '  (IDPESSOA, IDAGENCIASALARIO, IDHORARIO, IDEMPRESA, '
      'CODCENTROCUSTO, IDCARGO, '
      '   IDSITFUNC, IDESTAB, MATRICULA, DATAADMISSAO, TIPOCONTRATO, '
      'TIPOPAGAMENTO, '
      '   SALARIOATUAL, SALARIOTIPO, DATAOPCAOFGTS, DATADESLIGAMENTO, '
      'IDMOTIVODESLIGRAIS, '
      '   IDMOTIVODESLIGGERENCIAL, HOMOLOGACAONUMERO, '
      'HOMOLOGACAOORGAO, DATARETORNO, '
      '   TIPOMAODEOBRA, DATAFIMCONTRATO, DATASALARIO, DATACARGO, '
      'DATALOTACAO, '
      '   IDAGENCIAFGTS, NUMCONTASALARIO, NUMCONTAFGTS, '
      'DURACAOCONTRATO, PRORROGCONTRATO, '
      
        '   FLGTIPOFGTS, QUANTIDADEFGTS, VALORFGTS, IDTIPOTRAB, DATAAVISO' +
        ', '
      'IDFORMARESC, '
      
        '   IDVINCEMPREG, IDMOVCONTRCAGED, IDAFASTRAIS, IDCHEFE, IDFUNCAO' +
        ', '
      'IDFAIXACARGO, '
      '   IDFAIXAFUNCAO, NIVELINDIV1, NIVELINDIV2, DATACARGO2, '
      'DATAREFHORARIO, '
      '   IDCATEMPRGRE, IDSITRISCO)'
      'values'
      '  (:IDPESSOA, :IDAGENCIASALARIO, :IDHORARIO, :IDEMPRESA, '
      ':CODCENTROCUSTO, '
      '   :IDCARGO, :IDSITFUNC, :IDESTAB, :MATRICULA, :DATAADMISSAO, '
      ':TIPOCONTRATO, '
      '   :TIPOPAGAMENTO, :SALARIOATUAL, :SALARIOTIPO, :DATAOPCAOFGTS, '
      ':DATADESLIGAMENTO, '
      '   :IDMOTIVODESLIGRAIS, :IDMOTIVODESLIGGERENCIAL, '
      ':HOMOLOGACAONUMERO, :HOMOLOGACAOORGAO, '
      
        '   :DATARETORNO, :TIPOMAODEOBRA, :DATAFIMCONTRATO, :DATASALARIO,' +
        ' '
      ':DATACARGO, '
      
        '   :DATALOTACAO, :IDAGENCIAFGTS, :NUMCONTASALARIO, :NUMCONTAFGTS' +
        ', '
      ':DURACAOCONTRATO, '
      '   :PRORROGCONTRATO, :FLGTIPOFGTS, :QUANTIDADEFGTS, :VALORFGTS, '
      ':IDTIPOTRAB, '
      '   :DATAAVISO, :IDFORMARESC, :IDVINCEMPREG, :IDMOVCONTRCAGED, '
      ':IDAFASTRAIS, '
      
        '   :IDCHEFE, :IDFUNCAO, :IDFAIXACARGO, :IDFAIXAFUNCAO, :NIVELIND' +
        'IV1, '
      ':NIVELINDIV2, '
      '   :DATACARGO2, :DATAREFHORARIO, :IDCATEMPRGRE, :IDSITRISCO)')
    DeleteSQL.Strings = (
      'delete from FUNCIONARIO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
  end
  inherited qrySubTipo: TwwQuery
    BeforePost = qrySubTipoBeforePost
    AfterScroll = qrySubTipoAfterScroll
    SQL.Strings = (
      'SELECT FUNCIONARIO.*'
      'FROM FUNCIONARIO'
      'WHERE ( FUNCIONARIO.IDPESSOA =:IdPessoa )')
  end
  inherited dsPessoaFisica: TwwDataSource
    Left = 577
  end
  inherited ImageList1: TImageList
    Left = 486
    Top = 544
    Bitmap = {
      494C010113001400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      84008484840084848400848484000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000848484000000000000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000084848400000000000000000000000000C6C6C6000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF0000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000848484000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF000000000000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      000000000000FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF0000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF0000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000000000000000FF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000000000000000FF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF0000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      FF00000000000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      000084848400000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      840000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF800700008001800100030000
      0001000100010000000100018010000000010001000000000001000100000000
      0001000380000000000100008000000000010000000000000001000000000000
      00010000000000000003000000000000F39FF800C0010000F01FF800C0010000
      F03FFD05C0070000FFFFFF8FE3FF0000FFFFFFFFFFFFFFFF8001800180018001
      0001000100010001000100010001000100010001000100010001000100010001
      0001000300010003000100000001000000010000000100000001000000010000
      00010000000100000003000000030000F39FF800F39FF800F01FF800F01FF800
      F03FFD05F03FFD05FFFFFF8FFFFFFF8FFFFFFFFFFFFFFFFF8001800180018001
      0001000100010001000100010001000100010001000100010001000100010001
      0001000300010003000100000001000000010000000100000001000000010000
      00010000000100000003000000030000F39FF800F39FF800F01FF800F01FF800
      F03FFD05F03FFD05FFFFFF8FFFFFFF8FFFFFFFFFFFFFFFFF8001800180018001
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
  inherited updTelefone: TUpdateSQL
    InsertSQL.Strings = (
      'insert into TELENDPESS'
      '  (TELENDPESS."IDTELEFONE", TELENDPESS."IDENDERECO", '
      'TELENDPESS."DDI", '
      '   TELENDPESS."DDD", TELENDPESS."NUMERO", TELENDPESS."TIPO")'
      'values'
      
        '  (:"IDTELEFONE", :"IDENDERECO", :"DDI", :"DDD", :"NUMERO", :"TI' +
        'PO")')
  end
  inherited dsEndereco: TwwDataSource
    Left = 631
    Top = 196
  end
  inherited updEndereco: TUpdateSQL
    Left = 602
    Top = 199
  end
  inherited qryEndereco: TwwQuery
    Left = 551
    Top = 202
  end
  inherited qryContato: TwwQuery
    Left = 683
    Top = 227
  end
  inherited updContato: TUpdateSQL
    Left = 731
    Top = 215
  end
  inherited qryDocumento: TwwQuery
    Left = 27
    Top = 417
  end
  inherited dsDocumento: TwwDataSource
    Left = 81
    Top = 489
  end
  inherited updDocumento: TUpdateSQL
    Left = 18
    Top = 465
  end
  inherited qryEscolhePessoa: TwwQuery
    Left = 388
    Top = 125
  end
  inherited dsEscolhePessoa: TwwDataSource
    Left = 491
    Top = 128
  end
  inherited Pessoa: TPessoa
    MudaCaption = False
    TipoPessoa = tpFisica
    SubTipo = stFuncionario
    FormCaption = 'Cadastro de Pessoal'
    OnChangeSubtipo = PessoaChangeSubtipo
    OnSaveSubtipo = PessoaSaveSubtipo
    Left = 300
    Top = 8
  end
  inherited OpenPictureDialog1: TOpenPictureDialog
    Left = 223
    Top = 510
  end
  inherited updImagensDoc: TUpdateSQL
    Left = 711
  end
  inherited qryImagensDoc: TwwQuery
    Left = 684
    Top = 418
  end
  inherited dsImagensDoc: TwwDataSource
    Left = 751
    Top = 464
  end
  object qryProfissao: TwwQuery [44]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDPROFISS, DESCRICAO from PROFISS order by DESCRICAO')
    ValidateWithMask = True
    Left = 162
    Top = 420
  end
  object qryPaises: TwwQuery [45]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDPAIS, NOMENACIONALIDADE from PAIS '
      'order by NOMENACIONALIDADE')
    ValidateWithMask = True
    Left = 90
    Top = 408
  end
  object qrySindicato: TwwQuery [46]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select P.IDPESSOA, P.NOME '
      'from PESSOA P, SINDICATO S'
      'where P.IDPESSOA = S.IDPESSOA'
      'order by upper(NOME)')
    ValidateWithMask = True
    Left = 714
    Top = 363
  end
  object qryUf: TwwQuery [47]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT ESTADO.CODESTADO , '
      ' ESTADO.NOMEESTADO , PAIS.IDPAIS , '
      ' PAIS.NOMEPAIS'
      'FROM ESTADO , PAIS'
      'WHERE ( ESTADO.IDPAIS = PAIS.IDPAIS )'
      'ORDER BY'
      ' ESTADO.NOMEESTADO')
    ValidateWithMask = True
    Left = 260
    Top = 445
  end
  object qryGrauInstr: TwwQuery [48]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDGRINSTR, DESCRICAO from GRINSTR order by DESCRICAO')
    ValidateWithMask = True
    Left = 209
    Top = 460
  end
  object qrySitFunc: TwwQuery [49]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDSITFUNC, TIPOSIT, DESCRICAO from SITFUNC '
      'order by DESCRICAO')
    ValidateWithMask = True
    Left = 353
    Top = 55
  end
  object qryMotivo: TwwQuery [50]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDMOTIVO, DESCRICAO '
      'from MOTIVO '
      'where GRUPOMOTIVO = '#39'D'#39' '
      'order by upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 536
    Top = 523
  end
  object tblHorario: TwwTable [51]
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDHORARIO'
    ReadOnly = True
    TableName = 'CM.HORATRAB'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 635
    Top = 357
  end
  object qryCargo: TwwQuery [52]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDCARGO, TITULO from CARGO order by TITULO')
    ValidateWithMask = True
    Left = 689
    Top = 362
  end
  object qryEstab: TwwQuery [53]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDPESSOA, NOME from PESSOA '
      'where IDGRUPO =:IdEmpresaProp '
      'order by NOME')
    ValidateWithMask = True
    Left = 140
    Top = 388
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdEmpresaProp'
        ParamType = ptUnknown
      end>
  end
  object qryLotacao: TwwQuery [54]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select CODCENTROCUSTO, NOME from CENTCUST '
      'where IDEMPRESA =:IdEmpresaProp '
      'order by NOME')
    ValidateWithMask = True
    Left = 749
    Top = 361
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdEmpresaProp'
        ParamType = ptUnknown
      end>
  end
  object opndArqBmp: TOpenPictureDialog [55]
    Filter = 
      'All (*.bmp;*.ico;*.emf;*.wmf)|*.bmp;*.ico;*.emf;*.wmf|Bitmaps (*' +
      '.bmp)|*.bmp|Icons (*.ico)|*.ico|Enhanced Metafiles (*.emf)|*.emf' +
      '|Metafiles (*.wmf)|*.wmf'
    Left = 552
    Top = 4
  end
  object qryUltEmpr: TwwQuery [56]
    CachedUpdates = True
    AfterInsert = qryUltEmprAfterInsert
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT * FROM ULTEMPR '
      'WHERE IDPESSOA =:IdPessoa'
      'ORDER BY NUMSEQ')
    UpdateObject = updUltEmpr
    ValidateWithMask = True
    Left = 217
    Top = 2
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
      DisplayFormat = '##,###,##0.00'
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
  object updUltEmpr: TUpdateSQL [57]
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
    Left = 317
    Top = 8
  end
  object dsUlt: TwwDataSource [58]
    DataSet = qryUltEmpr
    Left = 266
    Top = 49
  end
  object qryFonte: TwwQuery [59]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from FONTRECR order by DESCRICAO')
    ValidateWithMask = True
    Left = 288
    Top = 16
  end
  object dsLot: TwwDataSource [60]
    DataSet = tblLotacao
    Left = 744
    Top = 266
  end
  object tblLotacao: TwwTable [61]
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDEMPRESA;CODCENTROCUSTO'
    MasterFields = 'IDEMPRESA;CODCENTROCUSTO'
    MasterSource = dsSubTipo
    TableName = 'CM.CENTCUST'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 747
    Top = 311
  end
  object qryChefe: TwwQuery [62]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select P.NOME,P.IDPESSOA,CARGO.TITULO from PESSOA P, '
      '           FUNCIONARIO, CARGO'
      'where P.FLGFUNCIONARIO = 1 and '
      '           P.IDPESSOA = FUNCIONARIO.IDPESSOA and '
      '           CARGO.IDCARGO = FUNCIONARIO.IDCARGO '
      'order by upper(P.NOME)')
    ValidateWithMask = True
    Left = 137
    Top = 454
  end
  object tblVinculo: TwwTable [63]
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDVINCEMPREG'
    TableName = 'CM.VINCEMPREGRAIS'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 162
    Top = 520
  end
  object tblMovContr: TwwTable [64]
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDMOVCONTRCAGED'
    TableName = 'CM.MOVCONTRCAGED'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 213
    Top = 520
  end
  object tblTipoTrab: TwwTable [65]
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDTIPOTRAB'
    TableName = 'CM.TIPOTRABALHADOR'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 276
    Top = 520
  end
  object dsDep: TwwDataSource [66]
    DataSet = qryDepen
    Left = 251
    Top = 405
  end
  object qryDepen: TwwQuery [67]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select PESSOA.NOME, DEPEN.DESCRICAO, '
      '  PESSOAFISICA.DATANASC, DEPENTIT.FLGCONTAIMPOSTOR, '
      ' DEPENTIT.FLGCONTASALARIOF  '
      'from PESSOA, DEPEN, DEPENTIT, PESSOAFISICA '
      'where DEPENTIT.IDDEPENDENCIA <> '#39'PRP'#39' and'
      '   PESSOA.IDPESSOA = PESSOAFISICA.IDPESSOA and '
      '   DEPEN.IDDEPENDENCIA = DEPENTIT.IDDEPENDENCIA and '
      '   DEPENTIT.IDPESSOA = PESSOA.IDPESSOA and '
      '   DEPENTIT.IDTITULAR =:IdPessoa '
      'order by DEPENTIT.NUMSEQUENCIA')
    ControlType.Strings = (
      'FLGCONTAIMPOSTOR;CheckBox;1;0'
      'FLGCONTASALARIOF;CheckBox;1;0')
    ValidateWithMask = True
    Left = 359
    Top = 399
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end>
  end
  object qryFaixa: TwwQuery [68]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from FAIXASAL order by IDFAIXASALARIAL')
    ValidateWithMask = True
    Left = 204
    Top = 41
  end
  object tblParam: TwwTable [69]
    DatabaseName = 'BaseDados'
    TableName = 'CM.PARAMRH'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 150
    Top = 47
  end
  object qryAgBan: TwwQuery [70]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select B.NUMBANCO, PB.NOME, A.NUMAGENCIA, A.IDPESSOA, '
      '          PA.NOME AS AGENCIA '
      'from BANCO B, PESSOA PB, AGENCIABANCARIA A, PESSOA PA'
      'where B.IDPESSOA = PB.IDPESSOA and   '
      '                A.IDPESSOA = PA.IDPESSOA and   '
      '                B.IDPESSOA =  A.IDBANCO '
      'order by B.NUMBANCO, A.NUMAGENCIA')
    ValidateWithMask = True
    Left = 83
    Top = 535
  end
  object tblCatEmpr: TwwTable [71]
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDCATEMPRGRE'
    TableName = 'CM.CATEMPRGRE'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 213
    Top = 520
  end
  object tblSitRisco: TwwTable [72]
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDSITRISCO'
    TableName = 'CM.SITRISCOFGTS'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 327
    Top = 517
  end
  object tblHstSit: TwwTable [73]
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPESSOA;DATASITFUNC'
    TableName = 'CM.HSTSITFUNC'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 96
    Top = 47
  end
  object qryCursos: TwwQuery [74]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select C.DESCRICAO, '
      '    decode(H.DATREINI,'#39#39',H.DATPLINI,'
      '           H.DATREINI) as DATAINI, H.DATPLINI, H.DATREINI,'
      '    H.DATREFIM, H.DUR_TOT, '
      '    decode(H.FLGAVALTEOR,1,H.AVALTEOR,'#39#39') as AVTEOR, '
      '    decode(H.FLGAVALPRAT,1,H.AVALPRAT,'#39#39')  as AVPRAT'
      'From CURSO C, HSTTRN H '
      'Where  H.IDPESSOA = :IdPessoa '
      'And      C.IDCURSO   = H.IDCURSO'
      'And      (H.DATREINI >=  to_date(:Datini, '#39'dd/mm/yyyy'#39')  or  '
      '             H.DATPLINI >=  to_date(:Datini, '#39'dd/mm/yyyy'#39') )'
      'Order by  DATAINI')
    ValidateWithMask = True
    Left = 155
    Top = 496
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
        Value = 1059805
      end
      item
        DataType = ftString
        Name = 'Datini'
        ParamType = ptUnknown
        Value = '01/01/1997'
      end
      item
        DataType = ftString
        Name = 'Datini'
        ParamType = ptUnknown
        Value = '01/01/1997'
      end>
  end
  object dsCursos: TwwDataSource [75]
    DataSet = qryCursos
    Left = 523
    Top = 518
  end
  object dsAval: TwwDataSource [76]
    DataSet = qryAval
    Left = 571
    Top = 503
  end
  object qryAval: TwwQuery [77]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select T.DESCRTIPOAVAL, '
      '    decode(H.DATAREAL,'#39#39', H.DATAPLAN, H.DATAREAL) as DATA, '
      '     H.DATAPLAN, H.DATAREAL, AVALIACAO'
      'From TIPOAVAL T, HSTAVAL H '
      'Where  H.IDPESSOA = :IdPessoa '
      'And      T.CODTIPOAVAL = H.CODTIPOAVAL'
      'And      (H.DATAREAL >=  to_date(:Datini, '#39'dd/mm/yyyy'#39')  or  '
      '             H.DATAPLAN >=  to_date(:Datini, '#39'dd/mm/yyyy'#39') )'
      'Order by  DATA')
    ValidateWithMask = True
    Left = 194
    Top = 493
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
        Value = 1059805
      end
      item
        DataType = ftString
        Name = 'Datini'
        ParamType = ptUnknown
        Value = '01/01/1997'
      end
      item
        DataType = ftString
        Name = 'Datini'
        ParamType = ptUnknown
        Value = '01/01/1997'
      end>
  end
  object dsEvol: TwwDataSource [78]
    DataSet = qryEvol
    Left = 421
    Top = 520
  end
  object qryEvol: TwwQuery [79]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select EVOLFUNC.DATAALTERFUNC,MOTIVO.DESCRICAO,'
      'EVOLFUNC.SALARIO,EVOLFUNC.TIPOPAGAMENTO,EVOLFUNC.PERC_REAJ,'
      'CARGO.TITULO, EVOLFUNC.CODCENTROCUSTO as CCUSTO '
      'from EVOLFUNC,MOTIVO,CARGO '
      'where EVOLFUNC.IDPESSOA = :IdPessoa'
      'and   EVOLFUNC.IDMOTIVO = MOTIVO.IDMOTIVO'
      'and   EVOLFUNC.IDCARGO = CARGO.IDCARGO'
      'and   EVOLFUNC.DATAALTERFUNC >= to_date(:DatIni,'#39'dd/mm/yyyy'#39')'
      'order by EVOLFUNC.DATAALTERFUNC')
    ValidateWithMask = True
    Left = 266
    Top = 493
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
        Value = 1059805
      end
      item
        DataType = ftString
        Name = 'DatIni'
        ParamType = ptUnknown
        Value = '01/01/1990'
      end>
  end
  object dsBenef: TwwDataSource [80]
    DataSet = qryBenef
    Left = 497
    Top = 489
  end
  object qryBenef: TwwQuery [81]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select P.DESCRICAO, T.DESCRBENEFSALAR, R.ANOMESINICIO,'
      '       R.FLGPERMANENTE,'
      '       decode(R.FLGPERMANENTE,1,'#39#39',R.PARCELAS)'
      '            as PARCELAS,'
      '       decode(R.FLGPERMANENTE,1,'#39#39',R.NUMOCORRENCIAS)'
      '            as NUMOCORRENCIAS,'
      '       R.VALORRUBRICA'
      'from PROVDESC P, TIPOBENSAL T, RUBRICAINDIV R'
      'where R.IDPESSOA  = :IdPessoa'
      'and   R.IDRUBRICA = P.IDPROVENTO'
      'and   P.IDBENEFSALAR = T.IDBENEFSALAR'
      'and   R.ANOMESINICIO >='
      '        (substr(:DatIni,7,4) || '#39'/'#39' || substr(:DatIni,4,2))'
      'order by R.ANOMESINICIO')
    ControlType.Strings = (
      'FLGPERMANENTE;CheckBox;1;0')
    ValidateWithMask = True
    Left = 335
    Top = 496
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
        Value = 1059805
      end
      item
        DataType = ftString
        Name = 'DatIni'
        ParamType = ptUnknown
        Value = '01/01/1990'
      end
      item
        DataType = ftString
        Name = 'DatIni'
        ParamType = ptUnknown
        Value = '01/01/1990'
      end>
  end
  object dsMedic: TwwDataSource [82]
    DataSet = qryMedic
    Left = 656
    Top = 514
  end
  object qryMedic: TwwQuery [83]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select T.DESCRTIPOOCMED, H.DATAPLAN, H.DATAREAL, '
      '           H.EXAMINADOR, H.AVALIACAO,'
      '       decode(H.DATAREAL,'#39#39', H.DATAPLAN, H.DATAREAL) as DATA'
      'from  TIPOCMED T, HSTASMED H'
      'where H.IDPESSOA = :IdPessoa'
      'and   H.CODTIPOOCMED = T.CODTIPOOCMED'
      'and   (H.DATAREAL >=  to_date(:Datini, '#39'dd/mm/yyyy'#39')  or  '
      '          H.DATAPLAN >=  to_date(:Datini, '#39'dd/mm/yyyy'#39') )'
      'order by DATA')
    ValidateWithMask = True
    Left = 395
    Top = 496
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
        Value = 1059805
      end
      item
        DataType = ftString
        Name = 'Datini'
        ParamType = ptUnknown
        Value = '01/01/1990'
      end
      item
        DataType = ftString
        Name = 'Datini'
        ParamType = ptUnknown
        Value = '01/01/1990'
      end>
  end
  object dsFerias: TwwDataSource [84]
    DataSet = qryFerias
    Left = 520
    Top = 443
  end
  object qryFerias: TwwQuery [85]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from FERIAS'
      'where IDPESSOA = :IdPessoa'
      'and   INIGOZOFERIAS >= to_date(:DatIni,'#39'dd/mm/yyyy'#39')'
      'order by INIGOZOFERIAS')
    ControlType.Strings = (
      'FLGABONO;CheckBox;1;0'
      'FLGOCORRIDA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 553
    Top = 491
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
        Value = 1059805
      end
      item
        DataType = ftString
        Name = 'DatIni'
        ParamType = ptUnknown
        Value = '01/01/1982'
      end>
  end
  object qryHistRub: TwwQuery [86]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select P.DESCRICAO, P.FLGDESCONTO, '
      '    decode(P.FLGDESCONTO,0, '#39'Provento'#39', '
      
        '                decode(P.FLGDESCONTO,1, '#39'Desconto'#39', '#39'Outros'#39')) a' +
        's TIPO,'
      '     H.VALORPROVENTO, '
      '     H.REFERENCIA'
      'From PROVDESC P, HISTRUBSAL H '
      'Where  H.IDPESSOA = :IdPessoa '
      'And      H.IDMOTIVO = :IdMotivo'
      
        'And      (P.FLGDESCONTO   <= 1  or  P.CODRUBCLT IN ('#39'40695'#39','#39'436' +
        '96'#39','
      '                '#39'43697'#39','#39'43700'#39','#39'43701'#39'))'
      'And      H.MES =  :Datini'
      'And      H.IDRUBRICA = P.IDPROVENTO'
      'Order by  H.IDMOTIVO, P.FLGDESCONTO, upper(P.DESCRICAO)')
    PictureMasks.Strings = (
      'VALORPROVENTO'#9'##,###,##0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 664
    Top = 291
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdMotivo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Datini'
        ParamType = ptUnknown
        Value = '1999/01'
      end>
    object qryHistRubDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 130
    end
    object qryHistRubFLGDESCONTO: TFloatField
      FieldName = 'FLGDESCONTO'
    end
    object qryHistRubTIPO: TStringField
      FieldName = 'TIPO'
      Size = 8
    end
    object qryHistRubVALORPROVENTO: TFloatField
      FieldName = 'VALORPROVENTO'
      DisplayFormat = '#,###,##0.00'
    end
    object qryHistRubREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 10
    end
  end
  object dsHistRub: TwwDataSource [87]
    DataSet = qryHistRub
    Left = 607
    Top = 443
  end
  inherited qryTipoDoc: TwwQuery
    Left = 744
    Top = 329
  end
  object qryCursosExternos: TwwQuery [92]
    CachedUpdates = True
    BeforeInsert = qryCursosExternosBeforeInsert
    AfterInsert = qryCursosExternosAfterInsert
    BeforePost = qryCursosExternosBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select C.DESCRICAO, H.IDPESSOA, H.IDCURSO, H.IDENTIDINSTR,'
      '    H.DATREINI, H.DATREFIM, H.DUR_TOT, H.NUMSEQ'
      'From  HSTTRN H, CURSO C'
      'Where  H.IDPESSOA          = :IdPessoa '
      'And      H.IDCURSO            = C.IDCURSO'
      'And      H.FLGCONTROLE  = 0'
      'Order by  H.DATREINI')
    UpdateObject = updCursosExternos
    ValidateWithMask = True
    Left = 227
    Top = 296
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end>
  end
  object qryProgFerias: TwwQuery [93]
    CachedUpdates = True
    BeforeInsert = qryProgFeriasBeforeInsert
    AfterInsert = qryProgFeriasAfterInsert
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from FERIAS'
      'where IDPESSOA = :IdPessoa'
      'and   FLGOCORRIDA = 0'
      'order by INIGOZOFERIAS')
    UpdateObject = updProgFerias
    ControlType.Strings = (
      'FLGABONO;CheckBox;1;0'
      'FLGOCORRIDA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 401
    Top = 283
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end>
  end
  object updCursosExternos: TUpdateSQL [94]
    ModifySQL.Strings = (
      'update HSTTRN'
      'set'
      '  IDENTIDINSTR = :IDENTIDINSTR,'
      '  DATREINI = :DATREINI,'
      '  DATREFIM = :DATREFIM,'
      '  DUR_TOT = :DUR_TOT'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDCURSO = :OLD_IDCURSO and'
      '  NUMSEQ = :OLD_NUMSEQ')
    InsertSQL.Strings = (
      'insert into HSTTRN'
      
        '  (IDPESSOA, IDCURSO, IDENTIDINSTR, DATREINI, DATREFIM, DUR_TOT,' +
        ' '
      'NUMSEQ)'
      'values'
      
        '  (:IDPESSOA, :IDCURSO, :IDENTIDINSTR, :DATREINI, :DATREFIM, :DU' +
        'R_TOT, '
      '   :NUMSEQ)')
    DeleteSQL.Strings = (
      'delete from HSTTRN'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDCURSO = :OLD_IDCURSO and'
      '  NUMSEQ = :OLD_NUMSEQ')
    Left = 221
    Top = 248
  end
  object updProgFerias: TUpdateSQL [95]
    ModifySQL.Strings = (
      'update FERIAS'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  INIPERIODOFERIAS = :INIPERIODOFERIAS,'
      '  NUMSEQ = :NUMSEQ,'
      '  INIGOZOFERIAS = :INIGOZOFERIAS,'
      '  FIMGOZOFERIAS = :FIMGOZOFERIAS,'
      '  FLGOCORRIDA = :FLGOCORRIDA,'
      '  FLGABONO = :FLGABONO,'
      '  QTDPARCDEVOL = :QTDPARCDEVOL'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  INIPERIODOFERIAS = :OLD_INIPERIODOFERIAS and'
      '  NUMSEQ = :OLD_NUMSEQ')
    InsertSQL.Strings = (
      'insert into FERIAS'
      
        '  (IDPESSOA, INIPERIODOFERIAS, NUMSEQ, INIGOZOFERIAS, FIMGOZOFER' +
        'IAS, FLGOCORRIDA, '
      '   FLGABONO, QTDPARCDEVOL)'
      'values'
      
        '  (:IDPESSOA, :INIPERIODOFERIAS, :NUMSEQ, :INIGOZOFERIAS, :FIMGO' +
        'ZOFERIAS, '
      '   :FLGOCORRIDA, :FLGABONO, :QTDPARCDEVOL)')
    DeleteSQL.Strings = (
      'delete from FERIAS'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  INIPERIODOFERIAS = :OLD_INIPERIODOFERIAS and'
      '  NUMSEQ = :OLD_NUMSEQ')
    Left = 397
    Top = 240
  end
  object dsCursosExternos: TwwDataSource [96]
    DataSet = qryCursosExternos
    Left = 146
    Top = 273
  end
  object dsProgFerias: TwwDataSource [97]
    DataSet = qryProgFerias
    Left = 442
    Top = 249
  end
  object tblCurso: TwwQuery [98]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select C.IDCURSO, C.DESCRICAO, C.IDENTIDINSTR, C.DUR_PRAT,'
      '    C.DUR_TEOR, T.DESCRICAO AS TIPOCURSO'
      'from      CURSO C, TIPCURSO T'
      'where  C.IDTIPOCURSO = T.IDTIPOCURSO(+)'
      'order by upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 160
    Top = 231
  end
  object qryEntid: TwwQuery [99]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select P.IDPESSOA, upper(P.NOME) as NOME '
      'from PESSOA P, FUNCIONARIO F'
      'where P.IDPESSOA = F.IDPESSOA '
      'Union'
      'Select P.IDPESSOA, upper(P.NOME) as NOME '
      'from PESSOA P, TERCEIRO T'
      'where P.IDPESSOA = T.IDPESSOA'
      'Order By 2')
    ValidateWithMask = True
    Left = 146
    Top = 322
  end
  object qryUltSeq: TwwQuery [100]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select max(NUMSEQ) as ULTSEQ'
      'from hsttrn'
      'where  IDPESSOA = :IDPESSOA'
      'and  IDCURSO = :IDCURSO')
    ValidateWithMask = True
    Left = 720
    Top = 9
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDCURSO'
        ParamType = ptUnknown
      end>
  end
  object qryAuxCurso: TwwQuery [101]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select NVL(MAX(H.NUMSEQ),0) AS NUMSEQ'
      'From  HSTTRN H'
      'Where  H.IDPESSOA          = :IdPessoa ')
    ValidateWithMask = True
    Left = 307
    Top = 296
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end>
  end
  object qryMotivoFolha: TwwQuery [102]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDMOTIVO, DESCRICAO '
      'from MOTIVO '
      'where GRUPOMOTIVO = '#39'F'#39' '
      'order by upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 560
    Top = 435
  end
  inherited dsCidade: TwwDataSource
    Left = 37
    Top = 348
  end
  inherited qryNaturalidade_Padrao: TwwQuery
    Top = 469
  end
  inherited DsNaturalidade_Padrao: TwwDataSource
    Top = 516
  end
end
