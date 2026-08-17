inherited frmCadCand: TfrmCadCand
  Left = 272
  Top = 102
  HelpContext = 730003
  Caption = 'Candidato'
  ClientHeight = 581
  ClientWidth = 984
  WindowState = wsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 984
    Height = 495
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 54
      Width = 982
      Height = 440
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos'
        'Contas Bancárias'
        'Dados Pessoais'
        'Projeção Funcional'
        'Últimos Empregos'
        'Requisições'
        'Testes e Entrevistas'
        'Cursos'
        'Envolvimento em Processos')
      detdbGrids.Strings = (
        ''
        'dbGrdDet'
        'dbgTelefone'
        'dbgContato'
        'GrdContaBancaria_Padrao'
        ''
        ''
        'dbgrUltEmpr'
        'dbgrRequis'
        'dbgrTestes'
        'dbgrCursos'
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 884
        Height = 381
        ActivePage = tbsDadosPess
        inherited tbsDocumento: TTabSheet
          Caption = 'tbsDocumento'
          inherited PgCtrlPesFisica_Padrao: TPageControl
            Width = 876
            Height = 353
          end
          inherited PnlDocumentos_Padrao: TPanel
            Width = 876
            Height = 353
            inherited pnlItemsDoc: TPanel
              Height = 351
            end
            inherited pnlFoto: TPanel
              Width = 386
              Height = 351
              inherited BvlImagem: TBevel
                Height = 320
              end
              inherited PnlAssociaFoto_Padrao: TPanel
                Top = 320
                Width = 386
                inherited btnAssociarimgPessoa: TButton
                  Left = 27
                end
              end
              inherited SbImagePessoa_Padrao: TScrollBox
                Width = 384
                Height = 320
                inherited imgPessoa: TDBImage
                  Left = 27
                end
              end
            end
            inherited lstDocumentos: TListView
              Height = 351
            end
          end
        end
        inherited tbsDet: TTabSheet
          Caption = 'tbsDet'
          inherited pnlControlesDet: TPanel
            Width = 876
            Height = 353
            inherited grpTipoEnd: TGroupBox
              Left = 679
              Height = 353
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 876
            Height = 353
          end
        end
        inherited tbsTelefone: TTabSheet
          Caption = 'tbsTelefone'
          inherited SplContatos_Padrao: TSplitter
            Left = 647
            Height = 353
          end
          inherited Panel1: TPanel
            Width = 647
            Height = 353
          end
          inherited dbgTelefone: TwwDBGrid
            Width = 647
            Height = 353
          end
          inherited PnlContatol_Padrao: TPanel
            Left = 650
            Height = 353
            inherited GrdExibeContatos_Padrao: TwwDBGrid
              Height = 340
            end
          end
        end
        inherited tbsContato: TTabSheet
          Caption = 'tbsContato'
          inherited SplTelefones_Padrao: TSplitter
            Left = 674
            Height = 353
          end
          inherited Panel2: TPanel
            Width = 674
            Height = 353
          end
          inherited dbgContato: TwwDBGrid
            Width = 674
            Height = 353
          end
          inherited PnlTelefones_Padrao: TPanel
            Left = 677
            Height = 353
            inherited GrdTelefones_Padrao: TwwDBGrid
              Height = 332
            end
          end
        end
        inherited tbsDadosBancarios: TTabSheet
          Caption = 'tbsDadosBancarios'
          inherited GrdContaBancaria_Padrao: TwwDBGrid
            Width = 876
            Height = 353
          end
          inherited PnlDadosBancarios_Padrao: TPanel
            Width = 876
            Height = 353
          end
        end
        object tbsDadosPess: TTabSheet
          Caption = 'tbsDadosPess'
          object Label2: TLabel
            Left = 215
            Top = 6
            Width = 98
            Height = 13
            Caption = 'Data Nascimento'
          end
          object Label15: TLabel
            Left = 215
            Top = 53
            Width = 64
            Height = 13
            Caption = 'Raça / Cor'
          end
          object Label18: TLabel
            Left = 408
            Top = 101
            Width = 103
            Height = 13
            Caption = 'Grau de Instrução'
          end
          object Label20: TLabel
            Left = 408
            Top = 170
            Width = 53
            Height = 13
            Caption = 'Profissão'
          end
          object Label34: TLabel
            Left = 408
            Top = 208
            Width = 54
            Height = 13
            Caption = 'Sindicato'
          end
          object Label66: TLabel
            Left = 328
            Top = 53
            Width = 92
            Height = 13
            Caption = 'Tipo Sanguíneo'
          end
          object Label43: TLabel
            Left = 83
            Top = 139
            Width = 82
            Height = 13
            Caption = 'Nacionalidade'
          end
          object lblEstCivil: TLabel
            Left = 215
            Top = 102
            Width = 68
            Height = 13
            Caption = 'Estado Civil'
          end
          object gbxDepend: TGroupBox
            Left = 83
            Top = 6
            Width = 126
            Height = 130
            Caption = 'Qtde.Dependentes'
            TabOrder = 0
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
              DataField = 'NUMDEPIRRF'
              DataSource = dsPessoaFisica
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
              DataField = 'NUMDEPSALF'
              DataSource = dsPessoaFisica
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
              DataField = 'NUMDEPTOT'
              DataSource = dsPessoaFisica
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
          object dbrgSexo: TDBRadioGroup
            Left = 470
            Top = 6
            Width = 197
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
            Left = 215
            Top = 20
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
            TabOrder = 1
          end
          object cmbRaca: TComboBox
            Left = 215
            Top = 67
            Width = 100
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 4
            Items.Strings = (
              'Branca'
              'Negra'
              'Amarela'
              'Parda'
              'Indígena')
          end
          object dbrgDeficienteFis: TDBRadioGroup
            Left = 328
            Top = 6
            Width = 136
            Height = 33
            Caption = 'Deficiente Físico?'
            Columns = 2
            DataField = 'FLGDEFICIENTE'
            DataSource = dsPessoaFisica
            Items.Strings = (
              'Sim'
              'Não')
            TabOrder = 2
            TabStop = True
            Values.Strings = (
              '1'
              '2')
          end
          object dblckGrauInstr: TwwDBLookupCombo
            Left = 408
            Top = 115
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
            TabOrder = 7
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
          end
          object dblckNacionalidade: TwwDBLookupCombo
            Left = 83
            Top = 153
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
            OnChange = dblckNacionalidadeChange
          end
          object gbxNaturalidade: TGroupBox
            Left = 83
            Top = 178
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
            object dblckNaturalidade: TwwDBLookupCombo
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
          object dblckProfissao: TwwDBLookupCombo
            Left = 408
            Top = 183
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
            TabOrder = 10
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
          end
          object dblckSindicato: TwwDBLookupCombo
            Left = 408
            Top = 221
            Width = 250
            Height = 21
            DropDownAlignment = taRightJustify
            Selected.Strings = (
              'RAZAOSOCIAL'#9'40'#9'RAZAOSOCIAL'#9'F')
            DataField = 'IDSINDICATO'
            DataSource = dsPessoaFisica
            LookupTable = CdsSindicato
            LookupField = 'IDPESSOA'
            Style = csDropDownList
            TabOrder = 11
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
          end
          object gbxFiliacao: TGroupBox
            Left = 83
            Top = 245
            Width = 576
            Height = 64
            Caption = 'Filiação'
            TabOrder = 12
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
          object dbcmbTipoSang: TwwDBComboBox
            Left = 328
            Top = 67
            Width = 136
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
            TabOrder = 5
            UnboundDataType = wwDefault
          end
          object cmbEstCivil: TwwDBLookupCombo
            Left = 215
            Top = 115
            Width = 188
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'20'#9'DESCRICAO'#9'F')
            DataField = 'ESTCIVIL'
            DataSource = dsPessoaFisica
            LookupTable = CdsEstCivil
            LookupField = 'ESTCIVIL'
            Style = csDropDownList
            TabOrder = 6
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = False
          end
        end
        object tbsSitFunc: TTabSheet
          Caption = 'tbsSitFunc'
          object Label21: TLabel
            Left = 113
            Top = 219
            Width = 104
            Height = 13
            Caption = 'Admissão Prevista'
          end
          object Label26: TLabel
            Left = 113
            Top = 155
            Width = 105
            Height = 13
            Caption = 'Salário Pretendido'
          end
          object Label28: TLabel
            Left = 113
            Top = 95
            Width = 147
            Height = 13
            Caption = 'Cargo a que se candidata'
          end
          object Label13: TLabel
            Left = 367
            Top = 219
            Width = 98
            Height = 13
            Caption = 'Data de Inclusão'
          end
          object Label23: TLabel
            Left = 539
            Top = 219
            Width = 94
            Height = 13
            Caption = 'Última Alteração'
          end
          object Label24: TLabel
            Left = 113
            Top = 33
            Width = 108
            Height = 13
            Caption = 'Num. Identificação'
          end
          object Label25: TLabel
            Left = 367
            Top = 30
            Width = 134
            Height = 13
            Caption = 'Fonte de Recrutamento'
          end
          object dbedDatAdmis: TCMDateTimePicker
            Left = 113
            Top = 233
            Width = 105
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DAT_ADMIS'
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
            TabOrder = 5
          end
          object dbrgTipContrato: TDBRadioGroup
            Left = 367
            Top = 83
            Width = 278
            Height = 56
            Caption = 'Tipo de Contrato'
            Columns = 3
            DataField = 'TIPOCONTRATO'
            DataSource = dsSubTipo
            Items.Strings = (
              'Efetivo'
              'Temporário'
              'Estagiário'
              'Terceiro'
              'Autônomo')
            TabOrder = 2
            Values.Strings = (
              'E'
              'T'
              'G'
              '3'
              'A')
          end
          object dbedSalario: TDBRealEdit
            Left = 113
            Top = 169
            Width = 105
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            TabOrder = 3
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'SALARIO'
            DataSource = dsSubTipo
          end
          object dbrgTipoSalario: TDBRadioGroup
            Left = 367
            Top = 158
            Width = 278
            Height = 36
            Caption = 'Base do Salário'
            Columns = 3
            DataField = 'TIPOPAGAMENTO'
            DataSource = dsSubTipo
            Items.Strings = (
              'Hora'
              'Dia'
              'Mês')
            TabOrder = 4
            Values.Strings = (
              'H'
              'D'
              'M')
          end
          object dblckCargo: TwwDBLookupCombo
            Left = 113
            Top = 109
            Width = 241
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'TITULO'#9'30'#9'TITULO')
            DataField = 'IDCARGO'
            DataSource = dsSubTipo
            LookupTable = CdsCargo
            LookupField = 'IDCARGO'
            Style = csDropDownList
            TabOrder = 1
            AutoDropDown = False
            ShowButton = True
            UseTFields = False
            AllowClearKey = False
          end
          object dbedUltAlt: TCMDateTimePicker
            Left = 539
            Top = 233
            Width = 105
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            Color = clGray
            ButtonStyle = cbsCustom
            DataField = 'DATULTATU'
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            ShowButton = True
            TabOrder = 7
          end
          object dbedNumIncsricao: TDBEdit
            Left = 113
            Top = 46
            Width = 108
            Height = 21
            TabStop = False
            Color = clGray
            DataField = 'IDPESSOA'
            DataSource = dsSubTipo
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object dblckFonte: TwwDBLookupCombo
            Left = 367
            Top = 44
            Width = 278
            Height = 21
            DropDownAlignment = taRightJustify
            Selected.Strings = (
              'DESCRICAO'#9'30'#9'DESCRICAO')
            DataField = 'IDFONTRECR'
            DataSource = dsPessoaFisica
            LookupTable = CdsFonte
            LookupField = 'IDFONTRECR'
            Style = csDropDownList
            TabOrder = 6
            AutoDropDown = False
            ShowButton = True
            UseTFields = False
            AllowClearKey = False
          end
          object dbedInclusao: TCMDateTimePicker
            Left = 367
            Top = 233
            Width = 105
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            Color = clGray
            ButtonStyle = cbsCustom
            DataField = 'DATINCLU'
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            ShowButton = True
            TabOrder = 8
          end
        end
        object tbsUltEmpr: TTabSheet
          Caption = 'tbsUltEmpr'
          object dbgrUltEmpr: TwwDBGrid
            Left = 0
            Top = 0
            Width = 876
            Height = 353
            Selected.Strings = (
              'NUMSEQ'#9'10'#9'Num.Seq.'
              'EMPRESA'#9'40'#9'Empresa'
              'IDCARGO'#9'10'#9'Cod.Cargo'
              'DAT_ADMIS'#9'10'#9'Admissão'
              'DATADEM'#9'10'#9'Demissão'
              'ULTSALARIO'#9'10'#9'Ult.Salário'
              'CARGO'#9'30'#9'Cargo'
              'IDMOTIVO'#9'10'#9'Mot.Saída'
              'IDPESSJUR'#9'10'#9'Cod.Empresa')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsUltEmpr
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgWordWrap]
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            UseTFields = False
            IndicatorColor = icBlack
          end
          object pnlUltEmpr: TPanel
            Left = 0
            Top = 0
            Width = 876
            Height = 353
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object Label12: TLabel
              Left = 17
              Top = 23
              Width = 111
              Height = 13
              Caption = 'Número Sequencial'
            end
            object Label16: TLabel
              Left = 360
              Top = 23
              Width = 49
              Height = 13
              Caption = 'Empresa'
            end
            object Label19: TLabel
              Left = 17
              Top = 69
              Width = 136
              Height = 13
              Caption = 'Cargo (da nossa tabela)'
            end
            object Label22: TLabel
              Left = 360
              Top = 69
              Width = 90
              Height = 13
              Caption = 'Título do Cargo'
            end
            object Label61: TLabel
              Left = 17
              Top = 113
              Width = 66
              Height = 13
              Caption = 'Data Inicial'
            end
            object Label62: TLabel
              Left = 121
              Top = 113
              Width = 59
              Height = 13
              Caption = 'Data Final'
            end
            object Label63: TLabel
              Left = 224
              Top = 113
              Width = 79
              Height = 13
              Caption = 'Último Salário'
            end
            object Label64: TLabel
              Left = 358
              Top = 114
              Width = 95
              Height = 13
              Caption = 'Motivo da Saída'
            end
            object Label3: TLabel
              Left = 17
              Top = 169
              Width = 75
              Height = 13
              Caption = 'Observações'
            end
            object dblckUltCargo: TwwDBLookupCombo
              Left = 17
              Top = 84
              Width = 320
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
            end
            object dbedUltAdm: TCMDateTimePicker
              Left = 17
              Top = 128
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
              Left = 120
              Top = 128
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
              Left = 224
              Top = 128
              Width = 110
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
              Left = 359
              Top = 129
              Width = 300
              Height = 21
              Hint = 'Motivo da Alteração na Situação Funcional'
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'DESCRICAO'#9'F')
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
              Left = 360
              Top = 84
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
              Left = 360
              Top = 39
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
              Left = 17
              Top = 39
              Width = 112
              Height = 21
              DataField = 'NUMSEQ'
              DataSource = dsUltEmpr
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbmObser: TDBMemo
              Left = 17
              Top = 183
              Width = 640
              Height = 102
              DataField = 'OBSERVACAO'
              DataSource = dsUltEmpr
              ScrollBars = ssVertical
              TabOrder = 8
            end
          end
        end
        object tbsRequis: TTabSheet
          Caption = 'tbsRequis'
          ImageIndex = 7
          object dbgrRequis: TwwDBGrid
            Left = 0
            Top = 0
            Width = 676
            Height = 345
            Selected.Strings = (
              'NUMREQ'#9'10'#9'Num.Requis.'
              'DATAREQ'#9'18'#9'Data Requis.'
              'TITULO'#9'40'#9'Cargo'
              'CCUSTO'#9'30'#9'Centro de Custo'
              'ESTAB'#9'60'#9'Estabelecimento'
              'SEXO'#9'1'#9'Sexo'
              'SITUACAO'#9'1'#9'Situação')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsRequis
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgWordWrap]
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            UseTFields = False
            IndicatorColor = icBlack
          end
          object pnlRequis: TPanel
            Left = 0
            Top = 0
            Width = 676
            Height = 345
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object Bevel1: TBevel
              Left = 194
              Top = 64
              Width = 322
              Height = 193
            end
            object Label4: TLabel
              Left = 289
              Top = 183
              Width = 129
              Height = 13
              Caption = 'Número da Requisicão'
              FocusControl = dbedRequis
            end
            object sbtnProcurarRequis: TToolbarButton97
              Left = 289
              Top = 94
              Width = 130
              Height = 62
              AllowAllUp = True
              GroupIndex = 1
              Caption = '&Procurar Requisição'
              Flat = False
              ImageIndex = 3
              Images = ImlPadrao
              Layout = blGlyphTop
              Opaque = False
              Spacing = 0
              OnClick = sbtnProcurarRequisClick
            end
            object fcLabel1: TfcLabel
              Left = 194
              Top = 39
              Width = 322
              Height = 21
              Caption = 'Associa este Candidato a uma Requisicão'
              Color = clBtnFace
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TextOptions.Alignment = taLeftJustify
              TextOptions.Shadow.Enabled = True
              TextOptions.Shadow.XOffset = 2
              TextOptions.Shadow.YOffset = 2
              TextOptions.VAlignment = vaTop
            end
            object dbedRequis: TDBEdit
              Left = 289
              Top = 201
              Width = 130
              Height = 21
              Color = clGray
              DataField = 'NUMREQ'
              DataSource = dsRequis
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
          end
        end
        object tbshTestes: TTabSheet
          Caption = 'tbshTestes'
          ImageIndex = 8
          object Label37: TLabel
            Left = 102
            Top = 139
            Width = 75
            Height = 13
            Caption = 'Observações'
          end
          object dbgrTestes: TwwDBGrid
            Left = 0
            Top = 0
            Width = 772
            Height = 153
            Selected.Strings = (
              'DESCRTIPOAVAL'#9'41'#9'Descrição'
              'DATAREF'#9'12'#9'Data'
              'AVALIACAO'#9'10'#9'Avaliação'
              'AVALIADOR'#9'40'#9'Avaliador')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsHstAval
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgWordWrap]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            UseTFields = False
            IndicatorColor = icBlack
          end
          object pnlTestes: TPanel
            Left = 0
            Top = 0
            Width = 876
            Height = 353
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object Label6: TLabel
              Left = 126
              Top = 49
              Width = 104
              Height = 13
              Caption = 'Tipo de Avaliação'
            end
            object Label7: TLabel
              Left = 497
              Top = 49
              Width = 57
              Height = 13
              Caption = 'Avaliação'
              FocusControl = dbedAvaliacao
            end
            object Label10: TLabel
              Left = 348
              Top = 102
              Width = 54
              Height = 13
              Caption = 'Avaliador'
              FocusControl = dbedAvaliador
            end
            object Label11: TLabel
              Left = 126
              Top = 162
              Width = 365
              Height = 13
              Caption = 'Observações Referentes ao Registro Selecionado ou em Edição'
              FocusControl = dbedObserv
            end
            object Label5: TLabel
              Left = 126
              Top = 102
              Width = 88
              Height = 13
              Caption = 'Data Planejada'
              FocusControl = dbedAvaliador
            end
            object Label44: TLabel
              Left = 237
              Top = 102
              Width = 58
              Height = 13
              Caption = 'Data Real'
              FocusControl = dbedAvaliador
            end
            object dblckTipoEntr: TwwDBLookupCombo
              Left = 126
              Top = 64
              Width = 349
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRTIPOAVAL'#9'30'#9'DESCRTIPOAVAL')
              DataField = 'CODTIPOAVAL'
              DataSource = dsHstAval
              LookupTable = CdsTipAval
              LookupField = 'CODTIPOAVAL'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
            end
            object dbedAvaliacao: TDBEdit
              Left = 497
              Top = 64
              Width = 84
              Height = 21
              DataField = 'AVALIACAO'
              DataSource = dsHstAval
              TabOrder = 1
            end
            object dbedDatPlan: TCMDateTimePicker
              Left = 126
              Top = 117
              Width = 100
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAPLAN'
              DataSource = dsHstAval
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
            object dbedDatReal: TCMDateTimePicker
              Left = 237
              Top = 117
              Width = 100
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAREAL'
              DataSource = dsHstAval
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
            object dbedAvaliador: TDBEdit
              Left = 348
              Top = 117
              Width = 232
              Height = 21
              DataField = 'AVALIADOR'
              DataSource = dsHstAval
              TabOrder = 4
            end
            object dbedObserv: TDBMemo
              Left = 126
              Top = 177
              Width = 452
              Height = 111
              DataField = 'COMENT'
              DataSource = dsHstAval
              ScrollBars = ssVertical
              TabOrder = 5
            end
          end
        end
        object tbshCursos: TTabSheet
          Caption = 'tbshCursos'
          ImageIndex = 9
          object dbgrCursos: TwwDBGrid
            Left = 0
            Top = 0
            Width = 876
            Height = 353
            Selected.Strings = (
              'DESCRICAO'#9'58'#9'Curso'
              'DATREINI'#9'15'#9'Data de Início'
              'DATREFIM'#9'18'#9'Data Final')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsHstTrn
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgWordWrap]
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            UseTFields = False
            IndicatorColor = icBlack
          end
          object pnlCursos: TPanel
            Left = 0
            Top = 0
            Width = 876
            Height = 353
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label30: TLabel
              Left = 65
              Top = 34
              Width = 33
              Height = 13
              Caption = 'Curso'
            end
            object Label27: TLabel
              Left = 64
              Top = 77
              Width = 158
              Height = 13
              Caption = 'Empresa/Entidade/Instrutor'
            end
            object Label29: TLabel
              Left = 64
              Top = 118
              Width = 174
              Height = 13
              Caption = 'Instrutor da Empresa/Entidade'
            end
            object CMProcuraCurso: TCMProcura
              Left = 64
              Top = 48
              Width = 350
              Height = 27
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              MostraMensagens = True
              Mensagens.EmBranco = 'Chave não pode estar em branco'
              Mensagens.NaoExiste = 'Chave não existe'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = False
              OnValidaDados = CMProcuraCursoValidaDados
              DataSource = dsHstTrn
              DataField = 'IDCURSO'
              LookupChave = 'IDCURSO'
              LookupDescricao = 'DESCRICAO'
              MontaSelect = MontaSelectCurso
              LookupTabela = 'CM.CURSO'
              DataBaseName = 'BaseDados'
              ReadOnly = False
            end
            object dblckEntid: TwwDBLookupCombo
              Left = 64
              Top = 91
              Width = 350
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'NOME')
              DataField = 'IDENTIDINSTR'
              DataSource = dsHstTrn
              LookupTable = CdsEntid
              LookupField = 'IDPESSOA'
              Style = csDropDownList
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              OnChange = dblckEntidChange
              OnEnter = dblckEntidEnter
            end
            object dblckInstrutor: TwwDBLookupCombo
              Left = 64
              Top = 132
              Width = 350
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'NOME'#9'F')
              DataField = 'IDINSTRUTOR'
              DataSource = dsHstTrn
              LookupTable = CdsInstrutor
              LookupField = 'IDPESSOA'
              Style = csDropDownList
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
            end
            object gbxDatas: TGroupBox
              Left = 63
              Top = 164
              Width = 130
              Height = 110
              Caption = 'Datas'
              TabOrder = 3
              object Label31: TLabel
                Left = 10
                Top = 18
                Width = 78
                Height = 13
                Caption = 'Início Efetivo'
              end
              object Label32: TLabel
                Left = 10
                Top = 60
                Width = 72
                Height = 13
                Caption = 'Final Efetivo'
              end
              object cmDatReIni: TCMDateTimePicker
                Left = 10
                Top = 32
                Width = 110
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATREINI'
                DataSource = dsHstTrn
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
                Left = 10
                Top = 74
                Width = 110
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATREFIM'
                DataSource = dsHstTrn
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
              Left = 205
              Top = 164
              Width = 206
              Height = 110
              Caption = 'Carga Horária'
              TabOrder = 4
              object Label33: TLabel
                Left = 9
                Top = 18
                Width = 37
                Height = 13
                Caption = 'Teoria'
              end
              object Label35: TLabel
                Left = 9
                Top = 60
                Width = 41
                Height = 13
                Caption = 'Prática'
              end
              object Label36: TLabel
                Left = 113
                Top = 44
                Width = 30
                Height = 13
                Caption = 'Total'
              end
              object dbedDurTeor: TDBEdit
                Left = 9
                Top = 32
                Width = 84
                Height = 21
                DataField = 'DUR_TEOR'
                DataSource = dsHstTrn
                TabOrder = 0
              end
              object dbedDurPrat: TDBEdit
                Left = 9
                Top = 74
                Width = 84
                Height = 21
                DataField = 'DUR_PRAT'
                DataSource = dsHstTrn
                TabOrder = 1
              end
              object dbedDurTot: TDBEdit
                Left = 113
                Top = 58
                Width = 84
                Height = 21
                DataField = 'DUR_TOT'
                DataSource = dsHstTrn
                TabOrder = 2
              end
            end
            object gbxResult: TGroupBox
              Left = 430
              Top = 44
              Width = 190
              Height = 230
              Caption = 'Resultado'
              TabOrder = 5
              object LblAprov: TLabel
                Left = 75
                Top = 192
                Width = 63
                Height = 16
                Alignment = taCenter
                Caption = 'LblAprov'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object imgAprov: TImage
                Left = 16
                Top = 186
                Width = 37
                Height = 25
                Picture.Data = {
                  055449636F6E0000010001002020100000000000E80200001600000028000000
                  2000000040000000010004000000000080020000000000000000000000000000
                  0000000000000000000080000080000000808000800000008000800080800000
                  80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
                  FFFFFF0000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000330000000000000000000000033303303303300
                  0000000000000003303330333003003300000000000000033003330330002333
                  0000000000000030000033003033333000000000000033333330000003330003
                  33000000080333333333333333300233330000000F033333333333333302333B
                  B03000004F8333333333333333333BB003BB00004FF3333333333333B33BB003
                  3BBB00004FF333333333B3BB3BB0033BBBB000004FF83B333B3B3B3BBBB03BBB
                  BB0300F04FFF33B3B3B3BBBBBBBBBBBB00330FF04FFF8B3B3333BBBBBBBBBB00
                  33330FF044FFF8BBB03033BBBBB330333330FFF444FFF8BB0BB3003B33000333
                  3330FF44444FF88B3BBB300000033333B33FFF44444FFF3BB0BBB3000333B33B
                  B38FF4444444FF003B0BB333333BBBBBB3FFF44444444FF00030BBBBBBBBBBBB
                  BBFF444444440000000303BBB3300000BFF44444440000000000000000000000
                  0FF4444400000000000000000000000000444444000000000000000000000000
                  0000444400000000000000000000000000000444000000000000000000000000
                  0000000400000000000000000000000000000000000000000000000000000000
                  00000000FFFFFFFFFFFFFFFFFFFF1FFFFF8003FFFC0000FFF800007FF800007F
                  E000003F0000001F0000001F0000000F00000007000000070000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000C000000FE01F003FFFFF80FFFFFFC0FFFFFFF0FFFFFFF8FFFFFFFE
                  FFFFFFFF}
                Transparent = True
              end
              object imgReprov: TImage
                Left = 16
                Top = 186
                Width = 21
                Height = 32
                Picture.Data = {
                  07544269746D617066010000424D660100000000000076000000280000001400
                  0000140000000100040000000000F00000000000000000000000100000001000
                  0000000000000000800000800000008080008000000080008000808000008080
                  8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
                  FF00888888888888888888880000888888888888888888980000889888888888
                  8888898800008899887777777777988800008899900000000009988800008889
                  90BFFFBFFF9988880000888899FCCCCCCF97888800008888999FBFFFB9978888
                  000088888999CCC9990788880000888880999FB99F0788880000888880FC9999
                  CF0788880000888880FF9999BF0788880000888880FC99990007888800008888
                  80B99F099F0788880000888880999F099998888800008888999FBF0F08998888
                  0000889999000000888998880000889998888888888889880000888888888888
                  888888980000888888888888888888880000}
                Transparent = True
              end
              object dbrgAvalTeor: TDBRadioGroup
                Left = 22
                Top = 20
                Width = 147
                Height = 69
                Caption = 'Avaliação Teórica?'
                DataField = 'FLGAVALTEOR'
                DataSource = dsHstTrn
                Items.Strings = (
                  'Sim'
                  'Não')
                TabOrder = 0
                Values.Strings = (
                  '1'
                  '0')
                OnChange = dbrgAvalTeorChange
              end
              object dbrgAvalPrat: TDBRadioGroup
                Left = 22
                Top = 103
                Width = 147
                Height = 69
                Caption = 'Avaliação Prática?'
                DataField = 'FLGAVALPRAT'
                DataSource = dsHstTrn
                Items.Strings = (
                  'Sim'
                  'Não')
                TabOrder = 1
                Values.Strings = (
                  '1'
                  '0')
                OnChange = dbrgAvalPratChange
              end
              object dbedAvTeor: TDBRealEdit
                Left = 85
                Top = 38
                Width = 54
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0,00')
                TabOrder = 2
                WordWrap = False
                OnChange = dbedAvTeorChange
                IntDigits = 10
                DecDigits = 0
                NumberFormat = fNumber
                Signal = False
                DataField = 'AVALTEOR'
                DataSource = dsHstTrn
              end
              object dbedAvPrat: TDBRealEdit
                Left = 85
                Top = 121
                Width = 54
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0,00')
                TabOrder = 3
                WordWrap = False
                OnChange = dbedAvTeorChange
                IntDigits = 10
                DecDigits = 0
                NumberFormat = fNumber
                Signal = False
                DataField = 'AVALPRAT'
                DataSource = dsDet
              end
            end
          end
        end
        object tbsProcessos: TTabSheet
          Caption = 'tbsProcessos'
          ImageIndex = 10
          object dbgrProcessos: TwwDBGrid
            Left = 0
            Top = 0
            Width = 676
            Height = 345
            Selected.Strings = (
              'TIPO'#9'17'#9'Tipo de Processo'
              'NUMPROCTRAB'#9'14'#9'Número Interno'
              'DATANOTIF'#9'15'#9'Data Notificação'
              'CATEGORIA'#9'44'#9'Tipo de Envolvimento')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsProcessos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgWordWrap]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            UseTFields = False
            IndicatorColor = icBlack
          end
        end
      end
      inherited Dock973: TDock97
        Width = 974
      end
      inherited Dock974: TDock97
        Left = 888
        Height = 381
      end
    end
    inherited pnlMestre: TPanel
      Width = 982
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
    Width = 984
  end
  inherited Dock971: TDock97
    Top = 542
    Width = 984
    inherited tb97Fundo: TToolbar97
      Left = 640
      DockPos = 640
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 730003
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 471
      DockPos = 471
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 700
    Top = 155
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 372
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 743
    Top = 241
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 700
    Top = 142
  end
  inherited Cds: TCMClientDataSet
    Left = 344
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Candidato'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO'
      'CANDIDAT.IDPESSOA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Nome da Pessoa'
      'CPF'
      'Cargo'
      'Num. Registro')
    SensivelACaixa.Strings = (
      'N'
      'S'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'CANDIDAT'
      'CARGO')
    CamposChave.Strings = (
      'CANDIDAT.IDPESSOA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA   = CANDIDAT.IDPESSOA'
      'CANDIDAT.IDCARGO = CARGO.IDCARGO(+)')
    Larguras.Strings = (
      '60'
      '22'
      '40'
      '18')
    Left = 730
    Top = 71
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 700
    Top = 129
  end
  inherited dsDet: TwwDataSource
    Left = 400
    Top = 1
  end
  inherited dsSubTipo: TwwDataSource
    Left = 21
    Top = 534
  end
  inherited dsPessoaFisica: TwwDataSource
    Left = 95
    Top = 534
  end
  inherited ImlDocumentos: TImageList
    Left = 743
    Top = 228
  end
  inherited dsTelefone: TwwDataSource
    Left = 319
    Top = 534
  end
  inherited dsEndereco: TwwDataSource
    Left = 252
    Top = 534
  end
  inherited dsContato: TwwDataSource
    Left = 381
    Top = 534
  end
  inherited dsTelContato: TwwDataSource
    Left = 27
    Top = 373
  end
  inherited dsDocumento: TwwDataSource
    Left = 178
    Top = 534
  end
  inherited dsEscolhePessoa: TwwDataSource
    Left = 730
    Top = 521
  end
  inherited dsImagem: TwwDataSource
    Left = 588
    Top = 507
  end
  inherited dsImagensDoc: TwwDataSource
    Left = 527
    Top = 536
  end
  inherited MSGrupo: TMontaSelect
    Left = 730
    Top = 57
  end
  inherited DsNaturalidade: TwwDataSource
    Left = 30
    Top = 317
  end
  inherited CdsDocumento: TCMClientDataSet
    Left = 178
    Top = 520
  end
  inherited CdsTipoDoc: TCMClientDataSet
    Left = 21
    Top = 467
  end
  inherited CdsEndereco: TCMClientDataSet
    Left = 252
    Top = 520
  end
  inherited CdsTelefone: TCMClientDataSet
    Left = 319
    Top = 520
  end
  inherited CdsContato: TCMClientDataSet
    Left = 381
    Top = 520
  end
  inherited CdsTelContato: TCMClientDataSet
    Left = 27
    Top = 359
  end
  inherited CdsImagem: TCMClientDataSet
    Left = 588
    Top = 493
  end
  inherited CdsEscolhePessoa: TCMClientDataSet
    Left = 730
    Top = 507
  end
  inherited CdsImagensDoc: TCMClientDataSet
    Left = 527
    Top = 522
  end
  inherited CdsSubTipo: TCMClientDataSet
    AfterInsert = CdsSubTipoAfterInsert
    AfterEdit = CdsSubTipoAfterEdit
    Left = 21
    Top = 520
  end
  inherited CdsPessoaFisica: TCMClientDataSet
    Left = 95
    Top = 520
  end
  inherited CdsCidade: TCMClientDataSet
    Left = 21
    Top = 453
  end
  inherited CdsNaturalidade: TCMClientDataSet
    Left = 30
    Top = 303
  end
  inherited CdsEstado: TCMClientDataSet
    Left = 21
    Top = 439
  end
  inherited MsCidades: TMontaSelect
    Left = 730
    Top = 43
  end
  inherited DsContaBancaria: TwwDataSource
    Left = 450
    Top = 510
  end
  inherited CdsContaBancaria: TCMClientDataSet
    Left = 450
    Top = 497
  end
  object dsUltEmpr: TwwDataSource [42]
    AutoEdit = False
    DataSet = CdsUltEmpr
    Left = 655
    Top = 529
  end
  object opndArqBmp: TOpenPictureDialog [43]
    Filter = 
      'All (*.bmp;*.ico;*.emf;*.wmf)|*.bmp;*.ico;*.emf;*.wmf|Bitmaps (*' +
      '.bmp)|*.bmp|Icons (*.ico)|*.ico|Enhanced Metafiles (*.emf)|*.emf' +
      '|Metafiles (*.wmf)|*.wmf'
    Left = 743
    Top = 214
  end
  inherited MsBanco: TMontaSelect
    Left = 730
    Top = 29
  end
  inherited CdsBanco: TCMClientDataSet
    Left = 21
    Top = 426
  end
  inherited ppmCaixa: TPopupMenu
    Left = 743
    Top = 201
  end
  object dsRequis: TwwDataSource
    AutoEdit = False
    DataSet = CdsRequis
    Left = 570
    Top = 15
  end
  object MontaSelectRequis: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Requisição'
    Colunas.Strings = (
      'R.NUMREQ'
      'R.DATAREQ'
      'R.DATAPLAN'
      'C.TITULO'
      'F1.MATRICULA'
      'P1.NOME'
      'F2.MATRICULA'
      'P2.NOME'
      'ESTAB.NOME'
      'CC.CODCENTROCUSTO'
      'CC.NOME')
    TipodeDado.Strings = (
      'N'
      'D'
      'D'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Num.Requisição'
      'Data Requisição'
      'Data Desejada'
      'Cargo'
      'Matr.Substituído'
      'Nome Substituído'
      'Matr.Ocupante'
      'Nome Ocupante'
      'Estabelecimento'
      'Cod.Centro Custo'
      'Nome Centro Custo')
    Tabelas.Strings = (
      'REQUIPES R'
      'CARGO    C'
      'FUNCIONARIO F1'
      'PESSOA   P1'
      'FUNCIONARIO F2'
      'PESSOA   P2'
      'PESSOA   ESTAB'
      'CENTCUST CC')
    CamposChave.Strings = (
      'R.NUMREQ'
      'R.DATAREQ'
      'C.TITULO'
      'ESTAB.NOME'
      'CC.NOME'
      'R.SEXO'
      'R.SITUACAO')
    Filtro.Strings = (
      'R.IDCARGO = C.IDCARGO(+)'
      'R.IDSUBSTITUIDO = F1.IDPESSOA(+)'
      'R.IDSUBSTITUIDO = P1.IDPESSOA(+)'
      '(R.IDSUBSTITUIDO IS NULL OR P1.IDPESSOA = F1.IDPESSOA)'
      'R.IDNOVOOCUP = F2.IDPESSOA(+)'
      'R.IDNOVOOCUP = P2.IDPESSOA(+)'
      '(R.IDNOVOOCUP IS NULL OR P2.IDPESSOA = F2.IDPESSOA)'
      'R.IDESTAB = ESTAB.IDPESSOA(+)'
      'R.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)')
    Larguras.Strings = (
      '10'
      '12'
      '12'
      '30'
      '10'
      '40'
      '10'
      '40'
      '40'
      '10'
      '40')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    Left = 729
    Top = 15
  end
  object dsHstAval: TwwDataSource
    AutoEdit = False
    DataSet = CdsHstAval
    Left = 449
    Top = 15
  end
  object dsHstTrn: TwwDataSource
    AutoEdit = False
    DataSet = CdsHstTrn
    OnStateChange = dsHstTrnStateChange
    Left = 510
    Top = 15
  end
  object dsProcessos: TDataSource
    AutoEdit = False
    DataSet = CdsProcessos
    Left = 638
    Top = 15
  end
  object CdsProcessos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 638
    Top = 1
  end
  object CdsMotivo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 723
    Top = 461
  end
  object CdsCargo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 723
    Top = 447
  end
  object CdsEstadoNasc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 723
    Top = 433
  end
  object CdsCidadeNasc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 723
    Top = 419
  end
  object CdsPaises: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 723
    Top = 405
  end
  object CdsSindicato: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 723
    Top = 391
  end
  object CdsGrauInstr: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 723
    Top = 377
  end
  object CdsProfissao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 723
    Top = 363
  end
  object CdsFonte: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 723
    Top = 349
  end
  object CdsTipAval: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 723
    Top = 335
  end
  object CdsCurso: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 723
    Top = 321
  end
  object MontaSelectCurso: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona o Curso'
    Colunas.Strings = (
      'DESCRICAO'
      'IDCURSO'
      'ABREV')
    TipodeDado.Strings = (
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Título'
      'Código'
      'Nome Abreviado')
    Tabelas.Strings = (
      'CURSO')
    CamposChave.Strings = (
      'IDCURSO')
    Larguras.Strings = (
      '60'
      '15'
      '20')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 730
    Top = 1
  end
  object CdsEntid: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 723
    Top = 307
  end
  object CdsInstrutor: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 723
    Top = 293
  end
  object CdsHstAval: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 449
    Top = 1
  end
  object CdsHstTrn: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterInsert = CdsHstTrnAfterInsert
    Left = 510
    Top = 1
  end
  object CdsRequis: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 570
    Top = 1
  end
  object CdsUltEmpr: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 655
    Top = 515
  end
  object CdsEstCivil: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 815
    Top = 280
  end
  object dsEstCivil: TwwDataSource
    DataSet = CdsEstCivil
    Left = 817
    Top = 266
  end
end
