inherited frmCadFunc: TfrmCadFunc
  Left = -4
  Top = -4
  HelpContext = 690006
  Caption = 'Cadastro de Pessoal'
  ClientHeight = 578
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 492
    BorderWidth = 2
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 2
      Top = 55
      Width = 788
      Height = 435
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos'
        'Contas Bancárias'
        'Dados Pessoais'
        'Situação Funcional'
        'Últimos Empregos')
      detdbGrids.Strings = (
        ''
        'dbGrdDet'
        'dbgTelefone'
        'dbgContato'
        'GrdContaBancaria_Padrao'
        ''
        ''
        'dbgrUltEmpr')
      inherited pgctrlDetalhe: TPageControl
        Width = 690
        Height = 376
        inherited tbsDocumento: TTabSheet
          Caption = 'tbsDocumento'
          inherited PgCtrlPesFisica_Padrao: TPageControl
            Width = 682
            Height = 348
          end
          inherited PnlDocumentos_Padrao: TPanel
            Width = 682
            Height = 348
            inherited pnlItemsDoc: TPanel
              Height = 346
            end
            inherited pnlFoto: TPanel
              Width = 192
              Height = 346
              inherited BvlImagem: TBevel
                Height = 315
              end
              inherited PnlAssociaFoto_Padrao: TPanel
                Top = 315
                Width = 192
              end
              inherited SbImagePessoa_Padrao: TScrollBox
                Width = 190
                Height = 315
                inherited imgPessoa: TDBImage
                  Left = 34
                  Top = 35
                  Width = 190
                  Height = 213
                end
              end
            end
            inherited lstDocumentos: TListView
              Height = 346
            end
          end
        end
        inherited tbsDet: TTabSheet
          Caption = 'tbsDet'
          inherited pnlControlesDet: TPanel
            Width = 682
            Height = 348
            inherited grpTipoEnd: TGroupBox
              Left = 485
              Height = 348
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 682
            Height = 348
          end
        end
        inherited tbsTelefone: TTabSheet
          Caption = 'tbsTelefone'
          inherited SplContatos_Padrao: TSplitter
            Left = 453
            Height = 348
          end
          inherited Panel1: TPanel
            Width = 453
            Height = 348
          end
          inherited dbgTelefone: TwwDBGrid
            Width = 453
            Height = 348
          end
          inherited PnlContatol_Padrao: TPanel
            Left = 456
            Height = 348
            inherited GrdExibeContatos_Padrao: TwwDBGrid
              Height = 334
            end
          end
        end
        inherited tbsContato: TTabSheet
          Caption = 'tbsContato'
          inherited SplTelefones_Padrao: TSplitter
            Left = 480
            Height = 348
          end
          inherited Panel2: TPanel
            Width = 480
            Height = 348
          end
          inherited dbgContato: TwwDBGrid
            Width = 480
            Height = 348
          end
          inherited PnlTelefones_Padrao: TPanel
            Left = 483
            Height = 348
            inherited GrdTelefones_Padrao: TwwDBGrid
              Height = 334
            end
          end
        end
        inherited tbsDadosBancarios: TTabSheet
          Caption = 'tbsDadosBancarios'
          inherited PnlDadosBancarios_Padrao: TPanel
            Width = 682
            Height = 348
          end
          inherited GrdContaBancaria_Padrao: TwwDBGrid
            Width = 682
            Height = 348
          end
        end
        object tbsDadosPess: TTabSheet
          Caption = 'tbsDadosPess'
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
          object Label23: TLabel
            Left = 83
            Top = 137
            Width = 82
            Height = 13
            Caption = 'Nacionalidade'
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
            Style = csDropDownList
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
            UsePictureMask = False
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
          object dblckNacional: TwwDBLookupCombo
            Left = 83
            Top = 150
            Width = 319
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMENACIONALIDADE'#9'30'#9'NOMENACIONALIDADE')
            DataField = 'IDPAIS'
            DataSource = dsPessoaFisica
            LookupTable = CdsPaises
            LookupField = 'IDPAIS'
            Style = csDropDownList
            TabOrder = 8
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
            OnChange = dblckNacionalChange
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
            object dblckCidadeNasc: TwwDBLookupCombo
              Left = 48
              Top = 14
              Width = 263
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'50'#9'NOME'#9'F')
              DataField = 'IDCIDADES'
              DataSource = dsPessoaFisica
              LookupTable = CdsCidadeNasc
              LookupField = 'IDCIDADES'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
            end
            object dblckEstadoNasc: TwwDBLookupCombo
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
              LookupTable = CdsEstadoNasc
              LookupField = 'CODESTADO'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
            end
          end
          object dblckGrauInstr: TwwDBLookupCombo
            Left = 408
            Top = 140
            Width = 250
            Height = 21
            DropDownAlignment = taRightJustify
            Selected.Strings = (
              'DESCRICAO'#9'30'#9'DESCRICAO')
            DataField = 'IDGRINSTR'
            DataSource = dsPessoaFisica
            LookupTable = CdsGrauInstr
            LookupField = 'IDGRINSTR'
            Style = csDropDownList
            TabOrder = 10
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
          end
          object dblckProfissao: TwwDBLookupCombo
            Left = 408
            Top = 178
            Width = 250
            Height = 21
            DropDownAlignment = taRightJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'DESCRICAO')
            DataField = 'IDPROFISS'
            DataSource = dsPessoaFisica
            LookupTable = CdsProfissao
            LookupField = 'IDPROFISS'
            Style = csDropDownList
            TabOrder = 11
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
          end
          object dblckSindi: TwwDBLookupCombo
            Left = 408
            Top = 214
            Width = 250
            Height = 21
            DropDownAlignment = taRightJustify
            Selected.Strings = (
              'NOME'#9'60'#9'NOME'#9'F')
            DataField = 'IDSINDICATO'
            DataSource = dsPessoaFisica
            LookupTable = CdsSindicato
            LookupField = 'IDPESSOA'
            Style = csDropDownList
            TabOrder = 12
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
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
          object dbrgDeficienteFis: TGroupBox
            Left = 521
            Top = 84
            Width = 136
            Height = 44
            Caption = 'Tipo de Deficiência'
            TabOrder = 7
            object dbcmbDeficFis: TwwDBComboBox
              Left = 8
              Top = 16
              Width = 120
              Height = 21
              ShowButton = True
              Style = csDropDown
              MapList = True
              AllowClearKey = False
              DataField = 'FLGDEFICIENTE'
              DataSource = dsPessoaFisica
              DropDownCount = 8
              ItemHeight = 0
              Items.Strings = (
                'Não é Portador'#9'2'
                'Física'#9'1'
                'Auditiva'#9'3'
                'Visual'#9'4'
                'Mental'#9'5'
                'Múltipla'#9'6'
                'Reabilitado'#9'7')
              Sorted = False
              TabOrder = 0
              UnboundDataType = wwDefault
            end
          end
        end
        object tbsSitFunc: TTabSheet
          Caption = 'tbsSitFunc'
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
            object Label13: TLabel
              Left = 184
              Top = 77
              Width = 97
              Height = 13
              Caption = 'Motivo Gerencial'
            end
            object Label24: TLabel
              Left = 9
              Top = 77
              Width = 79
              Height = 13
              Caption = 'Motivo Oficial'
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
              OnExit = dbedMatricExit
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
            object dblckSituacao: TwwDBLookupCombo
              Left = 9
              Top = 54
              Width = 343
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'30'#9'DESCRICAO')
              DataField = 'IDSITFUNC'
              DataSource = dsSubTipo
              LookupTable = CdsSitFunc
              LookupField = 'IDSITFUNC'
              Style = csDropDownList
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
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
              LookupTable = CdsHorario
              LookupField = 'IDHORARIO'
              Style = csDropDownList
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
            end
            object dblckFonteRecr: TwwDBLookupCombo
              Left = 9
              Top = 166
              Width = 343
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'30'#9'DESCRICAO')
              DataField = 'IDFONTRECR'
              DataSource = dsPessoaFisica
              LookupTable = CdsFonteRecr
              LookupField = 'IDFONTRECR'
              Style = csDropDownList
              TabOrder = 7
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
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
            object dblckMotivo1: TwwDBLookupCombo
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
              LookupTable = CdsMotivo
              LookupField = 'IDMOTIVO'
              Style = csDropDownList
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
            end
            object dblckMotivo2: TwwDBLookupCombo
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
              LookupTable = CdsMotivo
              LookupField = 'IDMOTIVO'
              Style = csDropDownList
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
            end
            object chkMarcaPonto: TDBCheckBox
              Left = 136
              Top = 111
              Width = 97
              Height = 17
              Caption = 'Marca Ponto'
              DataField = 'FLGMARCAPONTO'
              DataSource = dsSubTipo
              TabOrder = 8
              ValueChecked = '1'
              ValueUnchecked = '0'
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
              object Label25: TLabel
                Left = 6
                Top = 22
                Width = 28
                Height = 13
                Caption = 'Final'
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
            object dblckCargo: TwwDBLookupCombo
              Left = 9
              Top = 15
              Width = 343
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'TITULO'#9'30'#9'TITULO')
              DataField = 'IDCARGO'
              DataSource = dsSubTipo
              LookupTable = CdsCargo
              LookupField = 'IDCARGO'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              OnChange = dblckCargoChange
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
            object dblckEstab: TwwDBLookupCombo
              Left = 65
              Top = 11
              Width = 262
              Height = 21
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'NOME'#9'40'#9'NOME')
              DataField = 'IDESTAB'
              DataSource = dsSubTipo
              LookupTable = CdsEstab
              LookupField = 'IDPESSOA'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
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
            object dblckChefe: TwwDBLookupCombo
              Left = 65
              Top = 83
              Width = 263
              Height = 21
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'NOME'#9'60'#9'Pessoa'#9'F'
                'TITULO'#9'30'#9'Cargo'#9'F')
              DataField = 'IDCHEFE'
              DataSource = dsSubTipo
              LookupTable = CdsChefe
              LookupField = 'IDPESSOA'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
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
            object dblckCCusto: TwwDBLookupCombo
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
              LookupTable = CdsCCusto
              LookupField = 'CODCENTROCUSTO'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              OnChange = dblckCCustoChange
            end
          end
        end
        object tbsUltEmpr: TTabSheet
          Caption = 'tbsUltEmpr'
          object dbgrUltEmpr: TwwDBGrid
            Left = 0
            Top = 0
            Width = 682
            Height = 348
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
            Width = 682
            Height = 348
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object Label12: TLabel
              Left = 18
              Top = 34
              Width = 111
              Height = 13
              Caption = 'Número Sequencial'
            end
            object Label16: TLabel
              Left = 362
              Top = 34
              Width = 49
              Height = 13
              Caption = 'Empresa'
            end
            object Label19: TLabel
              Left = 18
              Top = 92
              Width = 136
              Height = 13
              Caption = 'Cargo (da nossa tabela)'
            end
            object Label22: TLabel
              Left = 362
              Top = 92
              Width = 90
              Height = 13
              Caption = 'Título do Cargo'
            end
            object Label61: TLabel
              Left = 18
              Top = 153
              Width = 66
              Height = 13
              Caption = 'Data Inicial'
            end
            object Label62: TLabel
              Left = 216
              Top = 153
              Width = 59
              Height = 13
              Caption = 'Data Final'
            end
            object Label63: TLabel
              Left = 362
              Top = 153
              Width = 79
              Height = 13
              Caption = 'Último Salário'
            end
            object Label64: TLabel
              Left = 18
              Top = 209
              Width = 95
              Height = 13
              Caption = 'Motivo da Saída'
            end
            object dblckUltCargo: TwwDBLookupCombo
              Left = 18
              Top = 107
              Width = 300
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'TITULO'#9'30'#9'TITULO')
              DataField = 'IDCARGO'
              DataSource = dsUltEmpr
              LookupTable = CdsCargo
              LookupField = 'IDCARGO'
              Style = csDropDownList
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              OnCloseUp = dblckUltCargoCloseUp
            end
            object dbedUltAdm: TCMDateTimePicker
              Left = 18
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
              Left = 215
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
              Left = 362
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
              Left = 19
              Top = 224
              Width = 300
              Height = 21
              Hint = 'Motivo da Alteração na Situação Funcional'
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'DESCRICAO')
              DataField = 'IDMOTIVO'
              DataSource = dsUltEmpr
              LookupTable = CdsMotivo
              LookupField = 'IDMOTIVO'
              Style = csDropDownList
              ParentShowHint = False
              ShowHint = True
              TabOrder = 7
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
            end
            object dbedUltCargo: TwwDBEdit
              Left = 362
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
              Left = 362
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
              Left = 18
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
      inherited Dock973: TDock97
        Width = 780
      end
      inherited Dock974: TDock97
        Left = 694
        Height = 376
      end
    end
    inherited pnlMestre: TPanel
      Left = 2
      Top = 2
      Width = 788
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
    object Panel4: TPanel
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
    Top = 539
    inherited tb97Fundo: TToolbar97
      Left = 620
      DockPos = 640
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 690006
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 451
      DockPos = 471
    end
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 376
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 737
    Top = 40
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 530
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    Left = 348
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PESSOA.NOME'
      'FUNCIONARIO.MATRICULA'
      'SITFUNC.DESCRICAO'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO')
    TipodeDado.Strings = (
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
      'Cargo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA '
      'FUNCIONARIO'
      'CARGO'
      'SITFUNC')
    CamposChave.Strings = (
      'FUNCIONARIO.IDPESSOA')
    Filtro.Strings = (
      'FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA'
      'FUNCIONARIO.IDCARGO = CARGO.IDCARGO(+)'
      'FUNCIONARIO.IDSITFUNC = SITFUNC.IDSITFUNC(+)')
    Mascaras.Strings = (
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
      '40')
    Left = 663
    Top = 13
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 530
    Top = 1
  end
  inherited dsDet: TwwDataSource
    Left = 411
    Top = 1
  end
  inherited dsSubTipo: TwwDataSource
    OnStateChange = dsSubTipoStateChange
    Left = 461
    Top = 14
  end
  inherited dsPessoaFisica: TwwDataSource
    Left = 616
    Top = 530
  end
  inherited ImlDocumentos: TImageList
    Left = 737
    Top = 27
  end
  inherited dsTelefone: TwwDataSource
    Left = 163
    Top = 535
  end
  inherited dsEndereco: TwwDataSource
    Left = 97
    Top = 535
  end
  inherited dsContato: TwwDataSource
    Left = 225
    Top = 534
  end
  inherited dsTelContato: TwwDataSource
    Left = 291
    Top = 534
  end
  inherited dsDocumento: TwwDataSource
    Left = 26
    Top = 534
  end
  inherited dsEscolhePessoa: TwwDataSource
    Left = 684
    Top = 499
  end
  inherited dsImagem: TwwDataSource
    Left = 536
    Top = 532
  end
  inherited dsImagensDoc: TwwDataSource
    Left = 369
    Top = 534
  end
  inherited MSGrupo: TMontaSelect
    Left = 663
    Top = 1
  end
  inherited DsNaturalidade: TwwDataSource
    Left = 753
    Top = 528
  end
  inherited CdsDocumento: TCMClientDataSet
    Left = 26
    Top = 521
  end
  inherited CdsTipoDoc: TCMClientDataSet
    Left = 736
    Top = 468
  end
  inherited CdsEndereco: TCMClientDataSet
    Left = 97
    Top = 522
  end
  inherited CdsTelefone: TCMClientDataSet
    Left = 163
    Top = 522
  end
  inherited CdsContato: TCMClientDataSet
    Left = 225
    Top = 521
  end
  inherited CdsTelContato: TCMClientDataSet
    Left = 291
    Top = 522
  end
  inherited CdsImagem: TCMClientDataSet
    Left = 536
    Top = 519
  end
  inherited CdsEscolhePessoa: TCMClientDataSet
    Left = 684
    Top = 486
  end
  inherited CdsImagensDoc: TCMClientDataSet
    Left = 369
    Top = 521
  end
  inherited CdsSubTipo: TCMClientDataSet
    BeforePost = CdsSubTipoBeforePost
    AfterScroll = CdsSubTipoAfterScroll
    Left = 461
    Top = 1
  end
  inherited CdsPessoaFisica: TCMClientDataSet
    AfterScroll = CdsPessoaFisicaAfterScroll
    Left = 616
    Top = 516
  end
  inherited CdsCidade: TCMClientDataSet
    Left = 736
    Top = 455
  end
  inherited CdsNaturalidade: TCMClientDataSet
    Left = 753
    Top = 515
  end
  inherited CdsEstado: TCMClientDataSet
    Left = 736
    Top = 442
  end
  inherited MsCidades: TMontaSelect
    Left = 591
    Top = 14
  end
  inherited DsContaBancaria: TwwDataSource
    Left = 456
    Top = 534
  end
  inherited CdsContaBancaria: TCMClientDataSet
    Left = 456
    Top = 521
  end
  inherited MsBanco: TMontaSelect
    Left = 591
    Top = 1
  end
  inherited CdsBanco: TCMClientDataSet
    Left = 736
    Top = 429
  end
  object opndArqBmp: TOpenPictureDialog [44]
    Filter = 
      'All (*.bmp;*.ico;*.emf;*.wmf)|*.bmp;*.ico;*.emf;*.wmf|Bitmaps (*' +
      '.bmp)|*.bmp|Icons (*.ico)|*.ico|Enhanced Metafiles (*.emf)|*.emf' +
      '|Metafiles (*.wmf)|*.wmf'
    Left = 737
    Top = 14
  end
  object dsUltEmpr: TwwDataSource [45]
    AutoEdit = False
    DataSet = CdsUltEmpr
    Left = 736
    Top = 116
  end
  inherited ppmCaixa: TPopupMenu
    Left = 737
    Top = 1
  end
  object CdsMotivo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 720
    Top = 384
  end
  object CdsPaises: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 720
    Top = 370
  end
  object CdsCidadeNasc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 720
    Top = 357
  end
  object CdsEstadoNasc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 720
    Top = 343
  end
  object CdsCCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 720
    Top = 330
  end
  object CdsSitFunc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 720
    Top = 316
  end
  object CdsParamRH: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 720
    Top = 302
  end
  object CdsCargo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 720
    Top = 289
  end
  object CdsChefe: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 720
    Top = 276
  end
  object CdsSindicato: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 720
    Top = 263
  end
  object CdsGrauInstr: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 720
    Top = 249
  end
  object CdsProfissao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 720
    Top = 236
  end
  object CdsFonteRecr: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 720
    Top = 223
  end
  object CdsEstab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 720
    Top = 210
  end
  object CdsUltEmpr: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 736
    Top = 103
  end
  object CdsHorario: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 720
    Top = 196
  end
end
