inherited frmParamAdminImob: TfrmParamAdminImob
  Left = 334
  Top = 240
  HelpContext = 230005
  Caption = 'Parâmetros do Sistema'
  ClientHeight = 506
  ClientWidth = 639
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 35
    Width = 639
    Height = 436
    object pgcParametros: TPageControl
      Left = 1
      Top = 1
      Width = 637
      Height = 434
      ActivePage = tsOperacoes
      Align = alClient
      MultiLine = True
      TabOrder = 0
      object tbsIntegra: TTabSheet
        Caption = 'Integração'
        ImageIndex = 5
        object pnlIntegra: TPanel
          Left = 0
          Top = 0
          Width = 629
          Height = 388
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Label14: TLabel
            Left = 408
            Top = 32
            Width = 33
            Height = 25
            AutoSize = False
          end
          object CheckBox1: TDBCheckBox
            Left = 57
            Top = 102
            Width = 409
            Height = 21
            Caption = 'Integrar com Contabilidade '
            DataField = 'FLGINTEGRACONTAB'
            DataSource = ds
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object CheckBox5: TDBCheckBox
            Left = 57
            Top = 67
            Width = 409
            Height = 21
            Caption = 'Integrar com Contas a Pagar e Receber'
            DataField = 'FLGINTEGRACAPCAR'
            DataSource = ds
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object CheckBox3: TDBCheckBox
            Left = 57
            Top = 32
            Width = 409
            Height = 21
            Caption = 'Integrar com Ativo Fixo'
            DataField = 'FLGINTEGRAATIVO'
            DataSource = ds
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object panDiario: TPanel
            Left = 50
            Top = 205
            Width = 311
            Height = 81
            TabOrder = 3
            object Label5: TLabel
              Left = 8
              Top = 40
              Width = 168
              Height = 13
              Caption = 'Competência em aberto (mês)'
            end
            object Label6: TLabel
              Left = 216
              Top = 40
              Width = 23
              Height = 13
              Caption = 'Ano'
            end
            object dbchkDiario: TDBCheckBox
              Left = 8
              Top = 8
              Width = 225
              Height = 21
              Caption = 'Contabilização Diária'
              DataField = 'FLGDIARIO'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -19
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              ValueChecked = 'S'
              ValueUnchecked = 'N'
              OnClick = dbchkDiarioClick
            end
            object cboMes: TwwDBComboBox
              Left = 8
              Top = 54
              Width = 191
              Height = 21
              ShowButton = True
              Style = csDropDown
              MapList = True
              AllowClearKey = False
              DataField = 'MESCOMPETENCIA'
              DataSource = ds
              DropDownCount = 8
              ItemHeight = 0
              Items.Strings = (
                'Janeiro'#9'1'
                'Fevereiro'#9'2'
                'Março'#9'3'
                'Abril'#9'4'
                'Maio'#9'5'
                'Junho'#9'6'
                'Julho'#9'7'
                'Agosto'#9'8'
                'Setembro'#9'9'
                'Outubro'#9'10'
                'Novembro'#9'11'
                'Dezembro'#9'12')
              Sorted = False
              TabOrder = 1
              UnboundDataType = wwDefault
            end
            object DBspnAno: TwwDBSpinEdit
              Left = 216
              Top = 54
              Width = 65
              Height = 21
              Increment = 1
              DataField = 'ANOCOMPETENCIA'
              DataSource = ds
              TabOrder = 2
              UnboundDataType = wwDefault
            end
          end
          object cbInvestImob: TDBCheckBox
            Left = 57
            Top = 171
            Width = 409
            Height = 21
            Caption = 'Utiliza o Investimentos Imobiliário'
            DataField = 'FLGUSAINVESTIMOB'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object dbcbIntegraOrcamento: TDBCheckBox
            Left = 57
            Top = 136
            Width = 288
            Height = 21
            Caption = 'Integrar com Orçamento'
            DataField = 'FLGINTEGRAORCAMEN'
            DataSource = ds
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 5
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      object tbsGeral: TTabSheet
        Caption = 'Padrão'
        object GroupBox4: TGroupBox
          Left = 216
          Top = 352
          Width = 449
          Height = 57
          Caption = ' Contabilização de Receitas e Despesas '
          TabOrder = 0
          Visible = False
          object DBCheckBox9: TDBCheckBox
            Left = 16
            Top = 18
            Width = 417
            Height = 17
            Caption = 'Obrigar o uso de Subconta ligada ao Locatário'
            DataField = 'FLGUSASCLOCATARIO'
            DataSource = ds
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox10: TDBCheckBox
            Left = 16
            Top = 34
            Width = 417
            Height = 17
            Caption = 'Obrigar o uso de Subconta ligada ao Imóvel'
            DataField = 'FLGUSASCIMOVEL'
            DataSource = ds
            TabOrder = 1
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
        object pnlPadrao: TPanel
          Left = 0
          Top = 0
          Width = 629
          Height = 388
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Label21: TLabel
            Left = 51
            Top = 242
            Width = 225
            Height = 13
            Caption = 'Tipo de Imóvel Locado a Patrocinadora'
          end
          object GroupBox1: TGroupBox
            Left = 37
            Top = 2
            Width = 449
            Height = 239
            Caption = ' Opções padrão para Receitas e Despesas (Integração Financeira) '
            TabOrder = 0
            object Label2: TLabel
              Left = 16
              Top = 15
              Width = 160
              Height = 13
              Caption = 'Centro de Responsabilidade'
            end
            object Label4: TLabel
              Left = 16
              Top = 51
              Width = 108
              Height = 13
              Caption = 'Atividade / Projeto'
            end
            object Label1: TLabel
              Left = 16
              Top = 89
              Width = 199
              Height = 13
              Caption = 'Contas-Caixa x Forma de Cobrança'
            end
            object Label17: TLabel
              Left = 16
              Top = 126
              Width = 92
              Height = 13
              Caption = 'Centro de Custo'
            end
            object Label18: TLabel
              Left = 16
              Top = 163
              Width = 54
              Height = 13
              Caption = 'Programa'
            end
            object Label15: TLabel
              Left = 16
              Top = 200
              Width = 156
              Height = 13
              Caption = 'Tipo de Receita de Aluguel'
            end
            object DBcboCentroRespon: TwwDBLookupCombo
              Left = 16
              Top = 28
              Width = 417
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'NOME')
              DataField = 'CODCENTRORESPON'
              DataSource = ds
              LookupTable = qryLookCentroRespon
              LookupField = 'CODCENTRORESPON'
              Style = csDropDownList
              DropDownWidth = 249
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object DBcboUnidNegocios: TwwDBLookupCombo
              Left = 16
              Top = 64
              Width = 417
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'25'#9'NOME')
              DataField = 'UNIDNEGOC'
              DataSource = ds
              LookupTable = qryLookUnidNegocio
              LookupField = 'UNIDNEGOC'
              Style = csDropDownList
              DropDownWidth = 249
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object DBcboPortadorForma: TwwDBLookupCombo
              Left = 16
              Top = 102
              Width = 417
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'Forma de Cobrança')
              DataField = 'CODPORTFORMA'
              DataSource = ds
              LookupTable = qryLookPortadorForma
              LookupField = 'CODPORTFORMA'
              Style = csDropDownList
              DropDownWidth = 249
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object DBcboLookCentroCusto: TwwDBLookupCombo
              Left = 16
              Top = 139
              Width = 417
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'NOME')
              DataField = 'CODCENTROCUSTO'
              DataSource = ds
              LookupTable = dtmLookImobiliario.qryLookCentroCusto
              LookupField = 'CODCENTROCUSTO'
              Style = csDropDownList
              DropDownWidth = 249
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object DBcboPrograma: TwwDBLookupCombo
              Left = 16
              Top = 176
              Width = 417
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCPROGRAMA'#9'60'#9'DESCPROGRAMA')
              DataField = 'IDPROGRAMA'
              DataSource = ds
              LookupTable = qryLookPrograma
              LookupField = 'IDPROGRAMA'
              Style = csDropDownList
              DropDownWidth = 249
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dbCboTipoReceitaAluguel: TwwDBLookupCombo
              Left = 16
              Top = 213
              Width = 417
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCCUSTORECIMO'#9'30'#9'Tipo de Receita'#9'F')
              DataField = 'IDTCUSTORECIMOALU'
              DataSource = ds
              LookupTable = dtmLookImobiliario.qryLookTipoRecDes
              LookupField = 'IDTIPOCUSTORECIMO'
              Style = csDropDownList
              DropDownCount = 6
              DropDownWidth = 249
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
          end
          object wwDBLookupCombo1: TwwDBLookupCombo
            Left = 51
            Top = 255
            Width = 417
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCTIPOIMOVEL'#9'25'#9'Descrição'#9'F')
            DataField = 'TIPOIMOVELPATRO'
            DataSource = ds
            LookupTable = dtmLookImobiliario.qryLookTipoImovel
            LookupField = 'CODTIPIMOVEL'
            Style = csDropDownList
            DropDownCount = 6
            DropDownWidth = 249
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
          end
          object dbCkbLogotipo: TDBCheckBox
            Left = 51
            Top = 280
            Width = 207
            Height = 17
            Caption = 'Imprimir Logotipo nos relatórios'
            DataField = 'FLGLOGORELAT'
            DataSource = ds
            TabOrder = 2
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBCheckBox29: TDBCheckBox
            Left = 297
            Top = 280
            Width = 169
            Height = 17
            Caption = 'Ativa o Quadro de Avisos'
            DataField = 'FLGAVISO'
            DataSource = ds
            TabOrder = 3
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object GroupBox5: TGroupBox
            Left = 37
            Top = 297
            Width = 266
            Height = 68
            Caption = ' Eventos '
            TabOrder = 4
            object Label29: TLabel
              Left = 25
              Top = 37
              Width = 208
              Height = 13
              Caption = 'apenas pelo Usuário de Lançamento'
            end
            object cbPermiteAlteracao: TDBCheckBox
              Left = 5
              Top = 21
              Width = 258
              Height = 17
              Caption = 
                'Permitir a Alteração/Exclusão de Eventos apenas pelo Usuário de ' +
                'Lançamento'
              DataField = 'FLGALTERAEVENTO'
              DataSource = ds
              TabOrder = 0
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object GbAtividadeProjeto: TGroupBox
            Left = 308
            Top = 297
            Width = 179
            Height = 68
            Caption = 'Dados Complementares'
            TabOrder = 5
            object Label28: TLabel
              Left = 17
              Top = 17
              Width = 49
              Height = 13
              Caption = 'Máscara'
            end
            object dbedMascaraAP: TwwDBEdit
              Left = 17
              Top = 31
              Width = 145
              Height = 21
              DataField = 'MASCARACOMPL'
              DataSource = ds
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
        end
      end
      object tbsContratos: TTabSheet
        Caption = 'Contratos'
        object pnlContratos: TPanel
          Left = 0
          Top = 0
          Width = 629
          Height = 388
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object DBrdgAutoRescisao: TDBRadioGroup
            Left = 34
            Top = 11
            Width = 401
            Height = 65
            Caption = ' Quando do fim da vigência de um Contrato: '
            DataField = 'FLGAUTORESCISAO'
            DataSource = ds
            Items.Strings = (
              'Prorrogar o Contrato por prazo indeterminado'
              'Encerrar automaticamente o Contrato')
            TabOrder = 0
            Values.Strings = (
              '0'
              '1')
          end
          object DBCheckBox3: TDBCheckBox
            Left = 42
            Top = 166
            Width = 351
            Height = 17
            Caption = 'Obrigar a indicação da Atividade nos Contratos'
            DataField = 'FLGOBRIGATIVIDADE'
            DataSource = ds
            TabOrder = 1
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox14: TDBCheckBox
            Left = 42
            Top = 190
            Width = 351
            Height = 17
            Caption = 'Permitir Imóveis com aluguel ZERO nos Contratos'
            DataField = 'FLGALUGUELZERO'
            DataSource = ds
            TabOrder = 2
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object GroupBox8: TGroupBox
            Left = 34
            Top = 84
            Width = 401
            Height = 73
            Caption = 'Numeração do Contrato '
            TabOrder = 3
            object DBCheckBox1: TDBCheckBox
              Left = 8
              Top = 24
              Width = 241
              Height = 17
              Caption = 'Gerar o próximo número do Contrato:  '
              DataField = 'FLGSUGERECONTRATO'
              DataSource = ds
              TabOrder = 0
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object wwDBSpinEdit3: TwwDBSpinEdit
              Left = 254
              Top = 20
              Width = 77
              Height = 21
              Increment = 1
              DataField = 'PROXNUMCONTRATO'
              DataSource = ds
              TabOrder = 1
              UnboundDataType = wwDefault
            end
            object DBCheckBox2: TDBCheckBox
              Left = 8
              Top = 48
              Width = 337
              Height = 17
              Caption = 'Concatenar o ano corrente com o número sugerido'
              DataField = 'FLGCONCATENAANO'
              DataSource = ds
              TabOrder = 2
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object GroupBox9: TGroupBox
            Left = 40
            Top = 214
            Width = 395
            Height = 53
            Caption = 'Grupo de Regras '
            TabOrder = 4
            object dblcGrpRegra: TwwDBLookupCombo
              Left = 20
              Top = 22
              Width = 309
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'60'#9'Descrição'#9'F')
              DataField = 'IDGRUPOREGRA'
              DataSource = ds
              LookupTable = cdsGrpRegra
              LookupField = 'IDGRUPOREGRA'
              DropDownWidth = 405
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = True
            end
          end
          object GroupBox6: TGroupBox
            Left = 40
            Top = 273
            Width = 395
            Height = 48
            Caption = ' Eventos '
            TabOrder = 5
            object DBCheckBox17: TDBCheckBox
              Left = 5
              Top = 21
              Width = 380
              Height = 17
              Caption = 'Registra evento para alteração cadastral de contrato e imóvel'
              DataField = 'FLGREGEVENTO'
              DataSource = ds
              TabOrder = 0
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object GroupBox11: TGroupBox
            Left = 41
            Top = 324
            Width = 394
            Height = 57
            Caption = 'Código do Imóvel'
            TabOrder = 6
            object DBCheckBox32: TDBCheckBox
              Left = 10
              Top = 17
              Width = 229
              Height = 17
              Caption = 'Gerar Automaticamente o Código'
              DataField = 'FLGAUTCOD'
              DataSource = ds
              TabOrder = 0
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox33: TDBCheckBox
              Left = 10
              Top = 35
              Width = 223
              Height = 17
              Caption = 'Validar o Preenchimento do código'
              DataField = 'FLGVALCOD'
              DataSource = ds
              TabOrder = 1
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
          end
        end
      end
      object tbsFolha: TTabSheet
        Caption = 'Folha de Aluguéis'
        object Label10: TLabel
          Left = 323
          Top = 342
          Width = 328
          Height = 13
          Caption = 'para os Contratos que tenham esse parâmetro preenchido'
          Enabled = False
          Visible = False
        end
        object pnlFolha: TPanel
          Left = 0
          Top = 0
          Width = 629
          Height = 388
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Label11: TLabel
            Left = 442
            Top = 312
            Width = 176
            Height = 13
            Caption = 'da data de vencimento original'
            Enabled = False
            Visible = False
          end
          object DBCheckBox6: TDBCheckBox
            Left = 441
            Top = 302
            Width = 377
            Height = 17
            Caption = 'Calcular e gerar automaticamente a taxa de administração'
            DataField = 'FLGGERATXADMIN'
            DataSource = ds
            Enabled = False
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
            Visible = False
          end
          object DBCheckBox7: TDBCheckBox
            Left = 441
            Top = 288
            Width = 401
            Height = 17
            Caption = 'Vencimento das obrigações contratuais no 1º dia útil a partir'
            DataField = 'FLGVENCDIAUTIL'
            DataSource = ds
            Enabled = False
            TabOrder = 1
            ValueChecked = '1'
            ValueUnchecked = '0'
            Visible = False
          end
          object DBCheckBox8: TDBCheckBox
            Left = 16
            Top = 139
            Width = 425
            Height = 17
            Caption = 
              'Impedir execução da Folha de Aluguel p/ meses posteriores ao atu' +
              'al'
            DataField = 'FLGMESPOSTERIOR'
            DataSource = ds
            TabOrder = 2
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object grpComissao: TGroupBox
            Left = 449
            Top = 208
            Width = 401
            Height = 73
            Caption = ' Taxa de Administração '
            Enabled = False
            TabOrder = 3
            Visible = False
            object Label16: TLabel
              Left = 16
              Top = 50
              Width = 97
              Height = 13
              Caption = 'Tipo de Despesa'
            end
            object cboComissaoLanc: TwwDBLookupCombo
              Left = 16
              Top = 64
              Width = 369
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCCUSTORECIMO'#9'30'#9'Tipo de Despesa')
              DataField = 'IDTCUSTORECIMOCOM'
              DataSource = ds
              LookupField = 'IDTIPOCUSTORECIMO'
              Enabled = False
              TabOrder = 1
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
            object DBrdgComissao: TDBRadioGroup
              Left = 0
              Top = 1
              Width = 401
              Height = 43
              Caption = ' Taxa de Administração '
              Columns = 2
              DataField = 'FLGCOMISSAOALT'
              DataSource = ds
              Enabled = False
              Items.Strings = (
                'é Alterador'
                'é um novo Lançamento')
              TabOrder = 0
              TabStop = True
              Values.Strings = (
                '1'
                '0')
              Visible = False
              OnClick = DBrdgComissaoClick
            end
          end
          object DBCheckBox4: TDBCheckBox
            Left = 16
            Top = 163
            Width = 457
            Height = 17
            Caption = 
              'Encerramento/prorrogação contratual acompanha filtro da Folha de' +
              ' Aluguéis'
            DataField = 'FLGFILTRAENCERRA'
            DataSource = ds
            TabOrder = 4
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox16: TDBCheckBox
            Left = 16
            Top = 187
            Width = 377
            Height = 17
            Caption = 'Reajuste contratual acompanha filtro da Folha de Aluguéis'
            DataField = 'FLGFILTRAREAJUSTE'
            DataSource = ds
            TabOrder = 5
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object GroupBox10: TGroupBox
            Left = 16
            Top = 8
            Width = 425
            Height = 121
            Caption = 'Lançamento de Previsão'
            TabOrder = 6
            object Label13: TLabel
              Left = 25
              Top = 97
              Width = 36
              Height = 13
              Caption = 'Gerar '
            end
            object Label9: TLabel
              Left = 128
              Top = 97
              Width = 106
              Height = 13
              Caption = 'meses de previsão'
            end
            object wwDBSpinEdit2: TwwDBSpinEdit
              Left = 65
              Top = 94
              Width = 57
              Height = 21
              Increment = 1
              DataField = 'QTDEMESPREVFOLHA'
              DataSource = ds
              TabOrder = 0
              UnboundDataType = wwDefault
            end
            object dbrgPrevFolha: TDBRadioGroup
              Left = 20
              Top = 12
              Width = 385
              Height = 76
              DataField = 'FLGPREVFOLHA'
              DataSource = ds
              Items.Strings = (
                'Não gerar lançamentos de previsão'
                'Gerar previsão para o período integral do contrato'
                'Gerar previsão apenas pelo período abaixo determinado')
              TabOrder = 1
              Values.Strings = (
                '0'
                '1'
                '2')
            end
          end
          object DBRadioGroup1: TDBRadioGroup
            Left = 16
            Top = 210
            Width = 417
            Height = 44
            Caption = ' Tipo de Data Programada  '
            Columns = 2
            DataField = 'FLGTIPODATAPROG'
            DataSource = ds
            Items.Strings = (
              'Vencimento'
              'Limite')
            TabOrder = 7
            Values.Strings = (
              'V'
              'L')
          end
        end
      end
      object tbsLancamento: TTabSheet
        Caption = 'Lançamentos'
        object pnlLanca: TPanel
          Left = 0
          Top = 0
          Width = 629
          Height = 388
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object lblBloqueio1: TLabel
            Left = 24
            Top = 308
            Width = 157
            Height = 13
            Caption = 'Bloquear lançamentos após'
          end
          object lblBloqueio2: TLabel
            Left = 238
            Top = 308
            Width = 159
            Height = 13
            Caption = 'meses do fechamento diário'
          end
          object DBrdgResponsavel: TDBRadioGroup
            Left = 16
            Top = 230
            Width = 489
            Height = 49
            Caption = ' Despesas de responsabilidade do Locatário '
            DataField = 'FLGREEMBOLSOAUT'
            DataSource = ds
            Items.Strings = (
              'Permite o lançamento ignorando a responsabilidade'
              'Permite o lançamento obrigando a liberação do documento')
            TabOrder = 2
            Values.Strings = (
              '0'
              '1')
          end
          object GroupBox3: TGroupBox
            Left = 16
            Top = 2
            Width = 489
            Height = 87
            Caption = 'Contas a Receber'
            TabOrder = 0
            object DBCheckBox12: TCheckBox
              Left = 8
              Top = 16
              Width = 369
              Height = 17
              Caption = 'Obrigar a indicação do Contrato em lançamentos a receber'
              Checked = True
              Ctl3D = True
              Enabled = False
              ParentCtl3D = False
              State = cbChecked
              TabOrder = 0
            end
            object DBCheckBox11: TDBCheckBox
              Left = 8
              Top = 32
              Width = 369
              Height = 17
              Caption = 'Permitir a indicação de um Contrato já encerrado/rescindido'
              DataField = 'FLGLANCRECENCERRA'
              DataSource = ds
              TabOrder = 1
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox28: TDBCheckBox
              Left = 8
              Top = 48
              Width = 369
              Height = 17
              Caption = 'Permitir a indicação de um Imóvel Inativo'
              DataField = 'FLGLANCRECINATIVO'
              DataSource = ds
              TabOrder = 2
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox5: TDBCheckBox
              Left = 8
              Top = 64
              Width = 369
              Height = 17
              Caption = 'NÃO permitir lançamentos referentes à receita de aluguel'
              DataField = 'FLGBLOQRECALUGUEL'
              DataSource = ds
              TabOrder = 3
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object b: TGroupBox
            Left = 16
            Top = 93
            Width = 489
            Height = 132
            Caption = 'Contas a Pagar'
            TabOrder = 1
            object DBCheckBox13: TDBCheckBox
              Left = 8
              Top = 16
              Width = 369
              Height = 17
              Caption = 'Obrigar a indicação do Contrato em lançamentos a pagar'
              Ctl3D = True
              DataField = 'FLGOBRIGACONTRATO'
              DataSource = ds
              ParentCtl3D = False
              TabOrder = 0
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox15: TDBCheckBox
              Left = 8
              Top = 32
              Width = 369
              Height = 17
              Caption = 'Permitir a indicação de um Contrato já encerrado/rescindido'
              DataField = 'FLGLANCPAGENCERRA'
              DataSource = ds
              TabOrder = 1
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox27: TDBCheckBox
              Left = 8
              Top = 48
              Width = 369
              Height = 17
              Caption = 'Permitir a indicação de um Imóvel Inativo ( obriga liberação )'
              DataField = 'FLGLANCPAGINATIVO'
              DataSource = ds
              TabOrder = 2
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBchkUsaAP: TDBCheckBox
              Left = 8
              Top = 80
              Width = 369
              Height = 17
              Caption = 'Obrigar o preenchimento dos campos ligados a APs'
              DataField = 'FLGUSAAP'
              DataSource = ds
              TabOrder = 4
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBchkDiaUtilAP: TDBCheckBox
              Left = 8
              Top = 64
              Width = 369
              Height = 17
              Caption = 'Obrigar vencimento em dia útil para lançamentos a pagar'
              DataField = 'FLGDIAUTILAP'
              DataSource = ds
              TabOrder = 3
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox25: TDBCheckBox
              Left = 8
              Top = 96
              Width = 369
              Height = 17
              Caption = 'Permitir Lançamentos com Tipo de Imóvel diferente'
              DataField = 'FLGMULTITIPO'
              DataSource = ds
              TabOrder = 5
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox31: TDBCheckBox
              Left = 8
              Top = 112
              Width = 441
              Height = 17
              Caption = 
                'NÃO permitir lançamentos com vencimento anterior a data de lança' +
                'mento'
              DataField = 'FLGBLOQDTLANC'
              DataSource = ds
              TabOrder = 6
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object spnMesBloq: TwwDBSpinEdit
            Left = 186
            Top = 306
            Width = 45
            Height = 21
            Increment = 1
            MaxValue = 100
            DataField = 'MESBLOQLANCTO'
            DataSource = ds
            TabOrder = 4
            UnboundDataType = wwDefault
          end
          object DBCheckBox36: TDBCheckBox
            Left = 25
            Top = 285
            Width = 344
            Height = 17
            Caption = 'Permitir registro contábil fora da competência gerencial'
            DataField = 'FLGLANCFORACOMP'
            DataSource = ds
            TabOrder = 3
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'Parâmetros de Integração'
        ImageIndex = 5
        object pnlParam: TPanel
          Left = 0
          Top = 0
          Width = 446
          Height = 381
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object GroupBox2: TGroupBox
            Left = 64
            Top = 24
            Width = 329
            Height = 217
            Caption = 'Permite filtros do tipo'
            TabOrder = 0
            object DBCheckBox18: TDBCheckBox
              Left = 40
              Top = 32
              Width = 241
              Height = 17
              Caption = 'Por contrato e tipo de despesa/receita'
              DataField = 'FLGPARTDCON'
              DataSource = ds
              TabOrder = 0
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox19: TDBCheckBox
              Left = 40
              Top = 56
              Width = 241
              Height = 17
              Caption = 'Por imóvel e tipo de despesa/receita'
              DataField = 'FLGPARTDIM'
              DataSource = ds
              TabOrder = 1
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox20: TDBCheckBox
              Left = 40
              Top = 80
              Width = 273
              Height = 17
              Caption = 'Por tipo de imóvel e tipo de despesa/receita'
              DataField = 'FLGPARTDTPIM'
              DataSource = ds
              TabOrder = 2
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox21: TDBCheckBox
              Left = 40
              Top = 104
              Width = 241
              Height = 17
              Caption = 'Somente por contrato'
              DataField = 'FLGPARCON'
              DataSource = ds
              TabOrder = 3
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox22: TDBCheckBox
              Left = 40
              Top = 128
              Width = 241
              Height = 17
              Caption = 'Somente por imóvel'
              DataField = 'FLGPARIM'
              DataSource = ds
              TabOrder = 4
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox23: TDBCheckBox
              Left = 40
              Top = 152
              Width = 241
              Height = 17
              Caption = 'Somente por tipo de despesa/receita'
              DataField = 'FLGPARTPDES'
              DataSource = ds
              TabOrder = 5
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox24: TDBCheckBox
              Left = 40
              Top = 176
              Width = 241
              Height = 17
              Caption = 'Somente por tipo de imóvel'
              DataField = 'FLGPARTPIM'
              DataSource = ds
              TabOrder = 6
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object DBCheckBox26: TDBCheckBox
            Left = 24
            Top = 265
            Width = 441
            Height = 17
            Caption = 
              'Histórico Contábil (concatenado) diferente da observação do Docu' +
              'mento'
            DataField = 'FLGHISTCONTDIFAP'
            DataSource = ds
            TabOrder = 1
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      object tbsCarta: TTabSheet
        Caption = 'Cobrança/Inadimplência'
        ImageIndex = 6
        object pnlAvisos: TPanel
          Left = 0
          Top = 0
          Width = 629
          Height = 388
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object GroupBox7: TGroupBox
            Left = 13
            Top = 5
            Width = 507
            Height = 185
            Caption = 'Carta de Cobrança Padrão '
            TabOrder = 0
            object Label8: TLabel
              Left = 20
              Top = 17
              Width = 47
              Height = 13
              Caption = '1ª Carta'
            end
            object Label19: TLabel
              Left = 20
              Top = 59
              Width = 47
              Height = 13
              Caption = '2ª Carta'
            end
            object Label20: TLabel
              Left = 20
              Top = 100
              Width = 47
              Height = 13
              Caption = '3ª Carta'
            end
            object Label22: TLabel
              Left = 20
              Top = 139
              Width = 47
              Height = 13
              Caption = '4ª Carta'
            end
            object wwDBLookupCombo3: TwwDBLookupCombo
              Left = 20
              Top = 35
              Width = 467
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'MODELOCARTA'#9'60'#9#9'F')
              DataField = 'IDCARTACOBRANCA1'
              DataSource = ds
              LookupTable = qryCartaCobranca
              LookupField = 'IDCARTACOBRANCA'
              Style = csDropDownList
              DropDownCount = 6
              DropDownWidth = 249
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object wwDBLookupCombo8: TwwDBLookupCombo
              Left = 20
              Top = 75
              Width = 467
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'MODELOCARTA'#9'60'#9#9'F')
              DataField = 'IDCARTACOBRANCA2'
              DataSource = ds
              LookupTable = qryCartaCobranca
              LookupField = 'IDCARTACOBRANCA'
              Style = csDropDownList
              DropDownCount = 6
              DropDownWidth = 249
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object wwDBLookupCombo9: TwwDBLookupCombo
              Left = 20
              Top = 115
              Width = 467
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'MODELOCARTA'#9'60'#9#9'F')
              DataField = 'IDCARTACOBRANCA3'
              DataSource = ds
              LookupTable = qryCartaCobranca
              LookupField = 'IDCARTACOBRANCA'
              Style = csDropDownList
              DropDownCount = 6
              DropDownWidth = 249
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object wwDBLookupCombo10: TwwDBLookupCombo
              Left = 20
              Top = 155
              Width = 467
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'MODELOCARTA'#9'60'#9#9'F')
              DataField = 'IDCARTACOBRANCA4'
              DataSource = ds
              LookupTable = qryCartaCobranca
              LookupField = 'IDCARTACOBRANCA'
              Style = csDropDownList
              DropDownCount = 6
              DropDownWidth = 249
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
          end
          object dbrdgrpCalculoInsadimp: TDBRadioGroup
            Left = 13
            Top = 194
            Width = 507
            Height = 49
            Caption = 'Cálculo de Inadimplência'
            Columns = 2
            DataField = 'FLGCALCINADIMP'
            DataSource = ds
            Items.Strings = (
              'Por Diferença'
              'Proporcional')
            TabOrder = 1
            Values.Strings = (
              'D'
              'P')
          end
          inline molRegraDB: TmolRegraDB
            Left = 5
            Top = 244
            Width = 507
            TabOrder = 2
            inherited Regra: TLabel
              Width = 162
              Caption = 'Regra para cálculo de Multa'
            end
            inherited sbHelpRegra: TSpeedButton
              Left = 440
            end
            inherited DBedtRegra: TDBEdit
              Left = 56
              Width = 337
              DataField = 'NOMEREGRA'
              DataSource = ds
            end
            inherited btnBuscaRegra: TBitBtn
              Left = 392
              OnClick = molRegraDBbtnBuscaRegraClick
            end
            inherited btnLimpaRegra: TBitBtn
              Left = 416
            end
            inherited DBedtIDRegra: TDBEdit
              Width = 48
              DataField = 'IDREGRAMULTA'
              DataSource = ds
            end
            inherited MS_Regra: TMontaSelect
              Left = 344
            end
          end
          object dbrdgrpProcessoCorrecao: TDBRadioGroup
            Left = 13
            Top = 290
            Width = 507
            Height = 65
            Caption = 'Processo de Correção'
            DataField = 'FLGINDMESANTERIOR'
            DataSource = ds
            Items.Strings = (
              
                'Utilizar apenas o indice do ultimo mês anterior, quando não exis' +
                'tir o indice corrente'
              
                'Utilizar o indice do mês anterior para todo o período de inadimp' +
                'lência')
            TabOrder = 3
            Values.Strings = (
              '1'
              '0')
          end
        end
      end
      object tsOperacoes: TTabSheet
        Caption = 'Operações Contábeis'
        ImageIndex = 7
        object pnlOperacao: TPanel
          Left = 0
          Top = 0
          Width = 629
          Height = 388
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object PageControl1: TPageControl
            Left = 0
            Top = 0
            Width = 629
            Height = 388
            ActivePage = TabSheet2
            Align = alClient
            TabOrder = 0
            object TabSheet2: TTabSheet
              Caption = 'Atualização de documentos vencidos'
              object Label3: TLabel
                Left = 58
                Top = 13
                Width = 120
                Height = 13
                Caption = 'Atualização de Multa'
              end
              object Label23: TLabel
                Left = 58
                Top = 61
                Width = 119
                Height = 13
                Caption = 'Atualização de Juros'
              end
              object Label24: TLabel
                Left = 58
                Top = 107
                Width = 200
                Height = 13
                Caption = 'Atualização de Correção Monetária'
              end
              object wwDBLookupCombo5: TwwDBLookupCombo
                Left = 58
                Top = 28
                Width = 369
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCCUSTORECIMO'#9'30'#9'Tipo de Operação'#9'F')
                DataField = 'IDOPERATUALMULTA'
                DataSource = ds
                LookupTable = qryLookTipoOper
                LookupField = 'IDTIPOCUSTORECIMO'
                Style = csDropDownList
                DropDownCount = 6
                DropDownWidth = 249
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
              end
              object wwDBLookupCombo6: TwwDBLookupCombo
                Left = 58
                Top = 77
                Width = 369
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCCUSTORECIMO'#9'30'#9'Tipo de Operação'#9'F')
                DataField = 'IDOPERATUALJUROS'
                DataSource = ds
                LookupTable = qryLookTipoOper
                LookupField = 'IDTIPOCUSTORECIMO'
                Style = csDropDownList
                DropDownCount = 6
                DropDownWidth = 249
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
              end
              object wwDBLookupCombo7: TwwDBLookupCombo
                Left = 58
                Top = 123
                Width = 369
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCCUSTORECIMO'#9'30'#9'Tipo de Operação'#9'F')
                DataField = 'IDOPERATUALCM'
                DataSource = ds
                LookupTable = qryLookTipoOper
                LookupField = 'IDTIPOCUSTORECIMO'
                Style = csDropDownList
                DropDownCount = 6
                DropDownWidth = 249
                TabOrder = 2
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
              end
              object DBCheckBox30: TDBCheckBox
                Left = 58
                Top = 162
                Width = 374
                Height = 17
                Caption = 'Atualiza DATA PROGRAMADA dos documentos'
                DataField = 'FLGATUALDATAPROG'
                DataSource = ds
                TabOrder = 3
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object grbPathETL: TGroupBox
                Left = 16
                Top = 192
                Width = 587
                Height = 57
                Caption = 'Caminho de Criação do Arquivo ETL'
                TabOrder = 4
                object lblPathETLProducao: TLabel
                  Left = 9
                  Top = 16
                  Width = 55
                  Height = 13
                  Caption = 'Produção'
                end
                object lblPathETLHomologacao: TLabel
                  Left = 297
                  Top = 16
                  Width = 78
                  Height = 13
                  Caption = 'Homologação'
                end
                object dbedtPathETLProducao: TwwDBEdit
                  Left = 9
                  Top = 30
                  Width = 280
                  Height = 21
                  DataField = 'PATHETLPRODUCAO'
                  DataSource = ds
                  MaxLength = 250
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
                object dbedtPathETLHom: TwwDBEdit
                  Left = 297
                  Top = 30
                  Width = 280
                  Height = 21
                  DataField = 'PATHETLHOM'
                  DataSource = ds
                  MaxLength = 250
                  TabOrder = 1
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
              end
            end
            object TabSheet3: TTabSheet
              Caption = 'Provisionamentos'
              ImageIndex = 1
              object Label7: TLabel
                Left = 58
                Top = 24
                Width = 180
                Height = 13
                Caption = 'Provisão de receitas de aluguel'
              end
              object Label12: TLabel
                Left = 58
                Top = 71
                Width = 111
                Height = 13
                Caption = 'Provisão de Perdas'
              end
              object wwDBLookupCombo2: TwwDBLookupCombo
                Left = 58
                Top = 40
                Width = 369
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCCUSTORECIMO'#9'30'#9'Tipo de Operação'#9'F')
                DataField = 'IDOPERPROVREC'
                DataSource = ds
                LookupTable = qryLookTipoOper
                LookupField = 'IDTIPOCUSTORECIMO'
                Style = csDropDownList
                DropDownCount = 6
                DropDownWidth = 249
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
              end
              object wwDBLookupCombo4: TwwDBLookupCombo
                Left = 58
                Top = 88
                Width = 369
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCCUSTORECIMO'#9'30'#9'Tipo de Operação'#9'F')
                DataField = 'IDOPERPROVPER'
                DataSource = ds
                LookupTable = qryLookTipoOper
                LookupField = 'IDTIPOCUSTORECIMO'
                Style = csDropDownList
                DropDownCount = 6
                DropDownWidth = 249
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
              end
            end
            object TabSheet4: TTabSheet
              Caption = 'Abonos'
              ImageIndex = 2
              object Label25: TLabel
                Left = 58
                Top = 21
                Width = 32
                Height = 13
                Caption = 'Multa'
              end
              object Label26: TLabel
                Left = 58
                Top = 69
                Width = 31
                Height = 13
                Caption = 'Juros'
              end
              object Label27: TLabel
                Left = 58
                Top = 115
                Width = 112
                Height = 13
                Caption = 'Correção Monetária'
              end
              object wwDBLookupCombo11: TwwDBLookupCombo
                Left = 58
                Top = 36
                Width = 369
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCCUSTORECIMO'#9'30'#9'Tipo de Operação'#9'F')
                DataField = 'IDOPERABONOMULTA'
                DataSource = ds
                LookupTable = qryLookTipoOper
                LookupField = 'IDTIPOCUSTORECIMO'
                Style = csDropDownList
                DropDownCount = 6
                DropDownWidth = 249
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
              end
              object wwDBLookupCombo12: TwwDBLookupCombo
                Left = 58
                Top = 85
                Width = 369
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCCUSTORECIMO'#9'30'#9'Tipo de Operação'#9'F')
                DataField = 'IDOPERABONOJUROS'
                DataSource = ds
                LookupTable = qryLookTipoOper
                LookupField = 'IDTIPOCUSTORECIMO'
                Style = csDropDownList
                DropDownCount = 6
                DropDownWidth = 249
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
              end
              object wwDBLookupCombo13: TwwDBLookupCombo
                Left = 58
                Top = 131
                Width = 369
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCCUSTORECIMO'#9'30'#9'Tipo de Operação'#9'F')
                DataField = 'IDOPERABONOCM'
                DataSource = ds
                LookupTable = qryLookTipoOper
                LookupField = 'IDTIPOCUSTORECIMO'
                Style = csDropDownList
                DropDownCount = 6
                DropDownWidth = 249
                TabOrder = 2
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
              end
            end
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 639
    Height = 35
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Width = 17
        Height = 29
        Enabled = False
        Layout = blGlyphLeft
        Spacing = 4
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 17
        Width = 89
        Height = 29
        Layout = blGlyphLeft
        Spacing = 4
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 123
        Width = 17
        Height = 29
        Enabled = False
        Layout = blGlyphLeft
        Spacing = 4
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 106
        Width = 17
        Height = 29
        Enabled = False
        Layout = blGlyphLeft
        Spacing = 4
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 471
    Width = 639
    Height = 35
    inherited tb97Fundo: TToolbar97
      Left = 315
      DockPos = 315
      inherited sep1: TToolbarSep97
        Left = 88
      end
      inherited sep3: TToolbarSep97
        Left = 176
      end
      object ToolbarSep974: TToolbarSep97 [2]
        Left = 0
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnSair: TBitBtn
        Left = 3
        Width = 85
        Height = 29
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 91
        Width = 85
        Height = 29
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 132
      DockPos = 132
      inherited ToolbarSep971: TToolbarSep97
        Left = 88
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 176
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      object ToolbarSep973: TToolbarSep97 [2]
        Left = 0
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 3
        Width = 85
        Height = 29
      end
      inherited bbtnCancelar: TBitBtn
        Left = 91
        Width = 85
        Height = 29
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65496
    Top = 65496
    TargetsData = (
      1
      1
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited ds: TwwDataSource
    Left = 288
    Top = 0
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PARAMIMOVEL'
      'set'
      '  CODCENTRORESPON = :CODCENTRORESPON,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  CODPORTFORMA = :CODPORTFORMA,'
      '  FLGINTEGRACONTAB = :FLGINTEGRACONTAB,'
      '  FLGINTEGRACAPCAR = :FLGINTEGRACAPCAR,'
      '  FLGINTEGRAGESTAO = :FLGINTEGRAGESTAO,'
      '  FLGINTEGRAATIVO = :FLGINTEGRAATIVO,'
      '  FLGUSASCIMOVEL = :FLGUSASCIMOVEL,'
      '  FLGUSASCLOCATARIO = :FLGUSASCLOCATARIO,'
      '  FLGALIMENTAALTER = :FLGALIMENTAALTER,'
      '  FLGALIMENTADATA = :FLGALIMENTADATA,'
      '  FLGALIMENTADEPREC = :FLGALIMENTADEPREC,'
      '  FLGSUGERECONTRATO = :FLGSUGERECONTRATO,'
      '  FLGCONCATENAANO = :FLGCONCATENAANO,'
      '  PROXNUMCONTRATO = :PROXNUMCONTRATO,'
      '  FLGVENCDIAUTIL = :FLGVENCDIAUTIL,'
      '  FLGAUTORESCISAO = :FLGAUTORESCISAO,'
      '  FLGOBRIGATIVIDADE = :FLGOBRIGATIVIDADE,'
      '  FLGINTEGRARECEB = :FLGINTEGRARECEB,'
      '  FLGINTEGRAPAG = :FLGINTEGRAPAG,'
      '  NOMEVLRAQUISICAO = :NOMEVLRAQUISICAO,'
      '  FLGINTEGRAFOLHA = :FLGINTEGRAFOLHA,'
      '  FLGINTEGRAORCAMEN = :FLGINTEGRAORCAMEN,'
      '  FLGGERATXADMIN = :FLGGERATXADMIN,'
      '  FLGPREVFOLHA = :FLGPREVFOLHA,'
      '  QTDEMESPREVFOLHA = :QTDEMESPREVFOLHA,'
      '  FLGMESPOSTERIOR = :FLGMESPOSTERIOR,'
      '  FLGREAVALMERCADO = :FLGREAVALMERCADO,'
      '  FLGOBRIGACONTRATO = :FLGOBRIGACONTRATO,'
      '  FLGCOMISSAOALT = :FLGCOMISSAOALT,'
      '  FLGLANCRESCINDIDO = :FLGLANCRESCINDIDO,'
      '  IDTCUSTORECIMOCOM = :IDTCUSTORECIMOCOM,'
      '  FLGUSAAP = :FLGUSAAP,'
      '  FLGDIAUTILAP = :FLGDIAUTILAP,'
      '  FLGCONSIDERARESP = :FLGCONSIDERARESP,'
      '  FLGREEMBOLSOAUT = :FLGREEMBOLSOAUT,'
      '  FLGLANCRECENCERRA = :FLGLANCRECENCERRA,'
      '  FLGLANCPAGENCERRA = :FLGLANCPAGENCERRA,'
      '  FLGLANCRECINATIVO = :FLGLANCRECINATIVO,'
      '  FLGALUGUELZERO = :FLGALUGUELZERO,'
      '  FLGFILTRAREAJUSTE = :FLGFILTRAREAJUSTE,'
      '  FLGFILTRAENCERRA = :FLGFILTRAENCERRA,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  IDPROGRAMA = :IDPROGRAMA,'
      '  FLGALTERAEVENTO = :FLGALTERAEVENTO,'
      '  FLGEVENTOUSUARIO = :FLGEVENTOUSUARIO,'
      '  FLGPARTPIM = :FLGPARTPIM,'
      '  FLGPARTPDES = :FLGPARTPDES,'
      '  FLGPARIM = :FLGPARIM,'
      '  FLGPARCON = :FLGPARCON,'
      '  FLGPARTDTPIM = :FLGPARTDTPIM,'
      '  FLGPARTDIM = :FLGPARTDIM,'
      '  FLGPARTDCON = :FLGPARTDCON,'
      '  FLGMULTITIPO = :FLGMULTITIPO,'
      '  FLGHISTCONTDIFAP = :FLGHISTCONTDIFAP,'
      '  FLGUSAINVESTIMOB = :FLGUSAINVESTIMOB,'
      '  TIPOIMOVELPATRO = :TIPOIMOVELPATRO,'
      '  FLGDIARIO = :FLGDIARIO,'
      '  MESCOMPETENCIA = :MESCOMPETENCIA,'
      '  ANOCOMPETENCIA = :ANOCOMPETENCIA,'
      '  IDOPERATUALMULTA = :IDOPERATUALMULTA,'
      '  IDOPERATUALJUROS = :IDOPERATUALJUROS,'
      '  IDOPERATUALCM = :IDOPERATUALCM,'
      '  IDOPERPROVPER = :IDOPERPROVPER,'
      '  IDOPERPROVREC = :IDOPERPROVREC,'
      '  FLGLANCFORACOMP = :FLGLANCFORACOMP,'
      '  MESBLOQLANCTO = :MESBLOQLANCTO,'
      '  IDTCUSTORECIMOALU = :IDTCUSTORECIMOALU,'
      '  FLGLANCPAGINATIVO = :FLGLANCPAGINATIVO,'
      '  IDGRUPOREGRA = :IDGRUPOREGRA,'
      '  FLGAVISO = :FLGAVISO,'
      '  FLGLOGORELAT = :FLGLOGORELAT,'
      '  IDCARTACOBRANCA1 = :IDCARTACOBRANCA1,'
      '  IDCARTACOBRANCA2 = :IDCARTACOBRANCA2,'
      '  IDCARTACOBRANCA3 = :IDCARTACOBRANCA3,'
      '  IDCARTACOBRANCA4 = :IDCARTACOBRANCA4,'
      '  FLGCALCINADIMP = :FLGCALCINADIMP,'
      '  IDREGRAMULTA = :IDREGRAMULTA,'
      '  FLGBLOQRECALUGUEL = :FLGBLOQRECALUGUEL,'
      '  FLGATUALDATAPROG = :FLGATUALDATAPROG,'
      '  FLGTIPODATAPROG = :FLGTIPODATAPROG,'
      '  FLGINDMESANTERIOR = :FLGINDMESANTERIOR,'
      '  IDOPERABONOMULTA = :IDOPERABONOMULTA,'
      '  IDOPERABONOJUROS = :IDOPERABONOJUROS,'
      '  IDOPERABONOCM = :IDOPERABONOCM,'
      '  MASCARACOMPL = :MASCARACOMPL,'
      '  FLGREGEVENTO = :FLGREGEVENTO,'
      '  FLGBLOQDTLANC = :FLGBLOQDTLANC,'
      '  FLGAUTCOD = :FLGAUTCOD,'
      '  FLGVALCOD = :FLGVALCOD,'
      '  PATHETLPRODUCAO = :PATHETLPRODUCAO,'
      '  PATHETLHOM = :PATHETLHOM'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA'
      ' ')
    InsertSQL.Strings = (
      'insert into PARAMIMOVEL'
      '  (CODCENTRORESPON, UNIDNEGOC, CODPORTFORMA, '
      'FLGINTEGRACONTAB, FLGINTEGRACAPCAR, '
      '   FLGINTEGRAGESTAO, FLGINTEGRAATIVO, FLGUSASCIMOVEL, '
      'FLGUSASCLOCATARIO, '
      '   FLGALIMENTAALTER, FLGALIMENTADATA, FLGALIMENTADEPREC, '
      'FLGSUGERECONTRATO, '
      '   FLGCONCATENAANO, PROXNUMCONTRATO, FLGVENCDIAUTIL, '
      'FLGAUTORESCISAO, FLGOBRIGATIVIDADE, '
      '   FLGINTEGRARECEB, FLGINTEGRAPAG, NOMEVLRAQUISICAO, '
      'FLGINTEGRAFOLHA, FLGINTEGRAORCAMEN, '
      '   FLGGERATXADMIN, FLGPREVFOLHA, QTDEMESPREVFOLHA, '
      'FLGMESPOSTERIOR, FLGREAVALMERCADO, '
      '   FLGOBRIGACONTRATO, FLGCOMISSAOALT, FLGLANCRESCINDIDO, '
      'IDTCUSTORECIMOCOM, '
      '   FLGUSAAP, FLGDIAUTILAP, FLGCONSIDERARESP, FLGREEMBOLSOAUT, '
      'FLGLANCRECENCERRA, '
      '   FLGLANCPAGENCERRA, FLGLANCRECINATIVO, FLGALUGUELZERO, '
      'FLGFILTRAREAJUSTE, '
      '   FLGFILTRAENCERRA, CODCENTROCUSTO, IDEMPRESA, IDPROGRAMA, '
      'FLGALTERAEVENTO, '
      '   FLGEVENTOUSUARIO, FLGPARTPIM, FLGPARTPDES, FLGPARIM, '
      'FLGPARCON, FLGPARTDTPIM, '
      '   FLGPARTDIM, FLGPARTDCON, FLGMULTITIPO, FLGHISTCONTDIFAP, '
      'FLGUSAINVESTIMOB, '
      '   TIPOIMOVELPATRO, FLGDIARIO, MESCOMPETENCIA, ANOCOMPETENCIA, '
      'IDOPERATUALMULTA, '
      '   IDOPERATUALJUROS, IDOPERATUALCM, IDOPERPROVPER, '
      'IDOPERPROVREC, FLGLANCFORACOMP, '
      '   MESBLOQLANCTO, IDTCUSTORECIMOALU, FLGLANCPAGINATIVO, '
      'IDGRUPOREGRA, FLGAVISO, '
      '   FLGLOGORELAT, IDCARTACOBRANCA1, IDCARTACOBRANCA2, '
      'IDCARTACOBRANCA3, '
      '   IDCARTACOBRANCA4, FLGCALCINADIMP, IDREGRAMULTA, '
      'FLGBLOQRECALUGUEL, FLGATUALDATAPROG, '
      '   FLGTIPODATAPROG, FLGINDMESANTERIOR, IDOPERABONOMULTA, '
      'IDOPERABONOJUROS, '
      '   IDOPERABONOCM, MASCARACOMPL, FLGREGEVENTO, FLGBLOQDTLANC, '
      'FLGAUTCOD,FLGVALCOD, PATHETLPRODUCAO, PATHETLHOM)'
      'values'
      '  (:CODCENTRORESPON, :UNIDNEGOC, :CODPORTFORMA, '
      ':FLGINTEGRACONTAB, :FLGINTEGRACAPCAR, '
      '   :FLGINTEGRAGESTAO, :FLGINTEGRAATIVO, :FLGUSASCIMOVEL, '
      ':FLGUSASCLOCATARIO, '
      '   :FLGALIMENTAALTER, :FLGALIMENTADATA, :FLGALIMENTADEPREC, '
      ':FLGSUGERECONTRATO, '
      '   :FLGCONCATENAANO, :PROXNUMCONTRATO, :FLGVENCDIAUTIL, '
      ':FLGAUTORESCISAO, '
      '   :FLGOBRIGATIVIDADE, :FLGINTEGRARECEB, :FLGINTEGRAPAG, '
      ':NOMEVLRAQUISICAO, '
      '   :FLGINTEGRAFOLHA, :FLGINTEGRAORCAMEN, :FLGGERATXADMIN, '
      ':FLGPREVFOLHA, '
      '   :QTDEMESPREVFOLHA, :FLGMESPOSTERIOR, :FLGREAVALMERCADO, '
      ':FLGOBRIGACONTRATO, '
      '   :FLGCOMISSAOALT, :FLGLANCRESCINDIDO, :IDTCUSTORECIMOCOM, '
      ':FLGUSAAP, '
      '   :FLGDIAUTILAP, :FLGCONSIDERARESP, :FLGREEMBOLSOAUT, '
      ':FLGLANCRECENCERRA, '
      '   :FLGLANCPAGENCERRA, :FLGLANCRECINATIVO, :FLGALUGUELZERO, '
      ':FLGFILTRAREAJUSTE, '
      '   :FLGFILTRAENCERRA, :CODCENTROCUSTO, :IDEMPRESA, :IDPROGRAMA, '
      ':FLGALTERAEVENTO, '
      '   :FLGEVENTOUSUARIO, :FLGPARTPIM, :FLGPARTPDES, :FLGPARIM, '
      ':FLGPARCON, '
      '   :FLGPARTDTPIM, :FLGPARTDIM, :FLGPARTDCON, :FLGMULTITIPO, '
      ':FLGHISTCONTDIFAP, '
      
        '   :FLGUSAINVESTIMOB, :TIPOIMOVELPATRO, :FLGDIARIO, :MESCOMPETEN' +
        'CIA, '
      ':ANOCOMPETENCIA, '
      '   :IDOPERATUALMULTA, :IDOPERATUALJUROS, :IDOPERATUALCM, '
      ':IDOPERPROVPER, '
      '   :IDOPERPROVREC, :FLGLANCFORACOMP, :MESBLOQLANCTO, '
      ':IDTCUSTORECIMOALU, '
      '   :FLGLANCPAGINATIVO, :IDGRUPOREGRA, :FLGAVISO, :FLGLOGORELAT, '
      ':IDCARTACOBRANCA1, '
      '   :IDCARTACOBRANCA2, :IDCARTACOBRANCA3, :IDCARTACOBRANCA4, '
      ':FLGCALCINADIMP, '
      '   :IDREGRAMULTA, :FLGBLOQRECALUGUEL, :FLGATUALDATAPROG, '
      ':FLGTIPODATAPROG, '
      '   :FLGINDMESANTERIOR, :IDOPERABONOMULTA, :IDOPERABONOJUROS, '
      ':IDOPERABONOCM, '
      '   :MASCARACOMPL, :FLGREGEVENTO, '
      ':FLGBLOQDTLANC,:FLGAUTCOD,:FLGVALCOD, :PATHETLPRODUCAO, '
      ':PATHETLHOM)')
    DeleteSQL.Strings = (
      'delete from PARAMIMOVEL'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 192
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Left = 1000
    Top = 96
  end
  inherited ImlPadrao: TImageList
    Left = 993
    Top = 65534
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 998
    Top = 64626
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   PIM.IDPESSOA,'
      '   PIM.CODCENTRORESPON,'
      '   PIM.UNIDNEGOC,'
      '   PIM.CODPORTFORMA,'
      '   PIM.FLGINTEGRACONTAB,'
      '   PIM.FLGINTEGRACAPCAR,'
      '   PIM.FLGINTEGRAGESTAO,'
      '   PIM.FLGINTEGRAATIVO,'
      '   PIM.FLGUSASCIMOVEL,'
      '   PIM.FLGUSASCLOCATARIO,'
      '   PIM.FLGALIMENTAALTER,'
      '   PIM.FLGALIMENTADATA,'
      '   PIM.FLGALIMENTADEPREC,'
      '   PIM.FLGSUGERECONTRATO,'
      '   PIM.FLGCONCATENAANO,'
      '   PIM.PROXNUMCONTRATO,'
      '   PIM.FLGVENCDIAUTIL,'
      '   PIM.FLGAUTORESCISAO,'
      '   PIM.FLGOBRIGATIVIDADE,'
      '   PIM.FLGINTEGRARECEB,'
      '   PIM.FLGINTEGRAPAG,'
      '   PIM.NOMEVLRAQUISICAO,'
      '   PIM.FLGINTEGRAFOLHA,'
      '   PIM.FLGINTEGRAORCAMEN,'
      '   PIM.FLGGERATXADMIN,'
      '   PIM.FLGPREVFOLHA,'
      '   PIM.QTDEMESPREVFOLHA,'
      '   PIM.FLGMESPOSTERIOR,'
      '   PIM.FLGREAVALMERCADO,'
      '   PIM.FLGOBRIGACONTRATO,'
      '   PIM.FLGCOMISSAOALT,'
      '   PIM.FLGLANCRESCINDIDO,'
      '   PIM.IDTCUSTORECIMOCOM,'
      '   PIM.FLGUSAAP, FLGDIAUTILAP,'
      '   PIM.FLGCONSIDERARESP, PIM.FLGREEMBOLSOAUT,'
      '   PIM.FLGLANCRECENCERRA, PIM.FLGLANCPAGENCERRA,'
      '   PIM.FLGLANCRECINATIVO,'
      '   PIM.FLGALUGUELZERO,'
      '   PIM.FLGFILTRAREAJUSTE, PIM.FLGFILTRAENCERRA,'
      '   PIM.CODCENTROCUSTO, PIM.IDEMPRESA,'
      '   PIM.IDPROGRAMA,'
      '   PIM.FLGALTERAEVENTO, PIM.FLGEVENTOUSUARIO,'
      '   PIM.FLGPARTPIM, PIM.FLGPARTPDES, PIM.FLGPARIM,'
      '   PIM.FLGPARCON, PIM.FLGPARTDTPIM, PIM.FLGPARTDIM,'
      '   PIM.FLGPARTDCON, PIM.FLGMULTITIPO,'
      '   PIM.FLGHISTCONTDIFAP,'
      '   PIM.FLGUSAINVESTIMOB, PIM.TIPOIMOVELPATRO,'
      '   PIM.FLGDIARIO, PIM.MESCOMPETENCIA, PIM.ANOCOMPETENCIA,'
      
        '   PIM.IDOPERATUALMULTA, PIM.IDOPERATUALJUROS, PIM.IDOPERATUALCM' +
        ','
      '   PIM.IDOPERPROVPER, PIM.IDOPERPROVREC, PIM.FLGLANCFORACOMP,'
      
        '   PIM.MESBLOQLANCTO, PIM.IDTCUSTORECIMOALU, PIM.FLGLANCPAGINATI' +
        'VO,'
      '   PIM.IDGRUPOREGRA, PIM.FLGAVISO,  PIM.FLGLOGORELAT,'
      '   PIM.IDCARTACOBRANCA1,   PIM.IDCARTACOBRANCA2,'
      '   PIM.IDCARTACOBRANCA3,   PIM.IDCARTACOBRANCA4,'
      '   PIM.FLGCALCINADIMP,'
      '   PIM.IDREGRAMULTA,'
      ''
      '   PIM.FLGBLOQRECALUGUEL,'
      '   PIM.FLGATUALDATAPROG,'
      '   PIM.FLGTIPODATAPROG,'
      '   PIM.FLGINDMESANTERIOR,'
      ''
      '   PIM.IDOPERABONOMULTA,'
      '   PIM.IDOPERABONOJUROS,'
      '   PIM.IDOPERABONOCM,'
      ''
      '   PIM.MASCARACOMPL,'
      ''
      '   PIM.FLGREGEVENTO,'
      ''
      '   PIM.FLGBLOQDTLANC,'
      ''
      '   REG.NOMEREGRA,'
      ''
      '   PIM.FLGUSAUNIDADE,'
      '   PIM.FLGAUTCOD,'
      '   PIM.FLGVALCOD,'
      ''
      '   PIM.PATHETLHOM,'
      '   PIM.PATHETLPRODUCAO'
      'FROM'
      '   PARAMIMOVEL PIM,'
      '   REGRA       REG'
      ''
      'WHERE'
      '       PIM.IDPESSOA     =:PIDPESSOA'
      '   AND PIM.IDREGRAMULTA = REG.IDREGRA(+)'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 240
    Top = 0
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'PARAMIMOVEL.CODCENTRORESPON'
      Size = 10
    end
    object qryUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'PARAMIMOVEL.UNIDNEGOC'
    end
    object qryCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Origin = 'PARAMIMOVEL.CODPORTFORMA'
    end
    object qryFLGINTEGRACONTAB: TFloatField
      FieldName = 'FLGINTEGRACONTAB'
      Origin = 'PARAMIMOVEL.FLGINTEGRACONTAB'
    end
    object qryFLGINTEGRACAPCAR: TFloatField
      FieldName = 'FLGINTEGRACAPCAR'
      Origin = 'PARAMIMOVEL.FLGINTEGRACAPCAR'
    end
    object qryFLGINTEGRAGESTAO: TFloatField
      FieldName = 'FLGINTEGRAGESTAO'
      Origin = 'PARAMIMOVEL.FLGINTEGRAGESTAO'
    end
    object qryFLGINTEGRAATIVO: TFloatField
      FieldName = 'FLGINTEGRAATIVO'
      Origin = 'PARAMIMOVEL.FLGINTEGRAATIVO'
    end
    object qryFLGUSASCIMOVEL: TFloatField
      FieldName = 'FLGUSASCIMOVEL'
      Origin = 'PARAMIMOVEL.FLGUSASCIMOVEL'
    end
    object qryFLGUSASCLOCATARIO: TFloatField
      FieldName = 'FLGUSASCLOCATARIO'
      Origin = 'PARAMIMOVEL.FLGUSASCLOCATARIO'
    end
    object qryFLGALIMENTAALTER: TFloatField
      FieldName = 'FLGALIMENTAALTER'
      Origin = 'PARAMIMOVEL.FLGALIMENTAALTER'
    end
    object qryFLGALIMENTADATA: TStringField
      FieldName = 'FLGALIMENTADATA'
      Origin = 'PARAMIMOVEL.FLGALIMENTADATA'
      Size = 1
    end
    object qryFLGALIMENTADEPREC: TFloatField
      FieldName = 'FLGALIMENTADEPREC'
      Origin = 'PARAMIMOVEL.FLGALIMENTADEPREC'
    end
    object qryFLGSUGERECONTRATO: TFloatField
      FieldName = 'FLGSUGERECONTRATO'
      Origin = 'PARAMIMOVEL.FLGSUGERECONTRATO'
    end
    object qryFLGCONCATENAANO: TFloatField
      FieldName = 'FLGCONCATENAANO'
      Origin = 'PARAMIMOVEL.FLGCONCATENAANO'
    end
    object qryFLGAUTORESCISAO: TFloatField
      FieldName = 'FLGAUTORESCISAO'
      Origin = 'PARAMIMOVEL.FLGAUTORESCISAO'
    end
    object qryFLGOBRIGATIVIDADE: TFloatField
      FieldName = 'FLGOBRIGATIVIDADE'
      Origin = 'PARAMIMOVEL.FLGOBRIGATIVIDADE'
    end
    object qryFLGINTEGRARECEB: TFloatField
      FieldName = 'FLGINTEGRARECEB'
      Origin = 'PARAMIMOVEL.FLGINTEGRARECEB'
    end
    object qryFLGINTEGRAPAG: TFloatField
      FieldName = 'FLGINTEGRAPAG'
      Origin = 'PARAMIMOVEL.FLGINTEGRAPAG'
    end
    object qryNOMEVLRAQUISICAO: TStringField
      FieldName = 'NOMEVLRAQUISICAO'
      Origin = 'PARAMIMOVEL.NOMEVLRAQUISICAO'
      Size = 30
    end
    object qryFLGINTEGRAFOLHA: TFloatField
      FieldName = 'FLGINTEGRAFOLHA'
      Origin = 'PARAMIMOVEL.FLGINTEGRAFOLHA'
    end
    object qryFLGGERATXADMIN: TFloatField
      FieldName = 'FLGGERATXADMIN'
      Origin = 'PARAMIMOVEL.FLGGERATXADMIN'
    end
    object qryQTDEMESPREVFOLHA: TFloatField
      FieldName = 'QTDEMESPREVFOLHA'
      Origin = 'PARAMIMOVEL.QTDEMESPREVFOLHA'
    end
    object qryFLGMESPOSTERIOR: TFloatField
      FieldName = 'FLGMESPOSTERIOR'
      Origin = 'PARAMIMOVEL.FLGMESPOSTERIOR'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PARAMIMOVEL.IDPESSOA'
    end
    object qryPROXNUMCONTRATO: TFloatField
      FieldName = 'PROXNUMCONTRATO'
    end
    object qryFLGVENCDIAUTIL: TFloatField
      FieldName = 'FLGVENCDIAUTIL'
    end
    object qryFLGREAVALMERCADO: TFloatField
      FieldName = 'FLGREAVALMERCADO'
      Origin = 'PARAMIMOVEL.FLGREAVALMERCADO'
    end
    object qryFLGOBRIGACONTRATO: TFloatField
      FieldName = 'FLGOBRIGACONTRATO'
      Origin = 'PARAMIMOVEL.FLGOBRIGACONTRATO'
    end
    object qryFLGCOMISSAOALT: TFloatField
      FieldName = 'FLGCOMISSAOALT'
      Origin = 'PARAMIMOVEL.FLGCOMISSAOALT'
    end
    object qryFLGLANCRESCINDIDO: TFloatField
      FieldName = 'FLGLANCRESCINDIDO'
      Origin = 'PARAMIMOVEL.FLGLANCRESCINDIDO'
    end
    object qryIDTCUSTORECIMOCOM: TFloatField
      FieldName = 'IDTCUSTORECIMOCOM'
      Origin = 'PARAMIMOVEL.IDTCUSTORECIMOCOM'
    end
    object qryFLGUSAAP: TFloatField
      FieldName = 'FLGUSAAP'
      Origin = 'PARAMIMOVEL.FLGUSAAP'
    end
    object qryCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
    object qryIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
    end
    object qryIDPROGRAMA: TFloatField
      FieldName = 'IDPROGRAMA'
    end
    object qryFLGREEMBOLSOAUT: TFloatField
      FieldName = 'FLGREEMBOLSOAUT'
      Origin = 'PARAMIMOVEL.FLGREEMBOLSOAUT'
    end
    object qryFLGLANCRECENCERRA: TFloatField
      FieldName = 'FLGLANCRECENCERRA'
      Origin = 'PARAMIMOVEL.FLGLANCRECENCERRA'
    end
    object qryFLGLANCPAGENCERRA: TFloatField
      FieldName = 'FLGLANCPAGENCERRA'
      Origin = 'PARAMIMOVEL.FLGLANCPAGENCERRA'
    end
    object qryFLGCONSIDERARESP: TFloatField
      FieldName = 'FLGCONSIDERARESP'
    end
    object qryFLGALUGUELZERO: TFloatField
      FieldName = 'FLGALUGUELZERO'
    end
    object qryFLGDIAUTILAP: TStringField
      FieldName = 'FLGDIAUTILAP'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGDIAUTILAP'
      FixedChar = True
      Size = 1
    end
    object qryFLGFILTRAREAJUSTE: TFloatField
      FieldName = 'FLGFILTRAREAJUSTE'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGFILTRAREAJUSTE'
    end
    object qryFLGFILTRAENCERRA: TFloatField
      FieldName = 'FLGFILTRAENCERRA'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGFILTRAENCERRA'
    end
    object qryFLGALTERAEVENTO: TFloatField
      FieldName = 'FLGALTERAEVENTO'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGALTERAEVENTO'
    end
    object qryFLGEVENTOUSUARIO: TFloatField
      FieldName = 'FLGEVENTOUSUARIO'
    end
    object qryFLGPARTPIM: TFloatField
      FieldName = 'FLGPARTPIM'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGPARTPIM'
    end
    object qryFLGPARTPDES: TFloatField
      FieldName = 'FLGPARTPDES'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGPARTPDES'
    end
    object qryFLGPARIM: TFloatField
      FieldName = 'FLGPARIM'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGPARIM'
    end
    object qryFLGPARCON: TFloatField
      FieldName = 'FLGPARCON'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGPARCON'
    end
    object qryFLGPARTDTPIM: TFloatField
      FieldName = 'FLGPARTDTPIM'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGPARTDTPIM'
    end
    object qryFLGPARTDIM: TFloatField
      FieldName = 'FLGPARTDIM'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGPARTDIM'
    end
    object qryFLGPARTDCON: TFloatField
      FieldName = 'FLGPARTDCON'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGPARTDCON'
    end
    object qryFLGMULTITIPO: TFloatField
      FieldName = 'FLGMULTITIPO'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGMULTITIPO'
    end
    object qryFLGHISTCONTDIFAP: TFloatField
      FieldName = 'FLGHISTCONTDIFAP'
    end
    object qryFLGDIARIO: TStringField
      FieldName = 'FLGDIARIO'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGDIARIO'
      FixedChar = True
      Size = 1
    end
    object qryMESCOMPETENCIA: TFloatField
      FieldName = 'MESCOMPETENCIA'
      Origin = 'BASEDADOS.PARAMIMOVEL.MESCOMPETENCIA'
    end
    object qryANOCOMPETENCIA: TFloatField
      FieldName = 'ANOCOMPETENCIA'
      Origin = 'BASEDADOS.PARAMIMOVEL.ANOCOMPETENCIA'
    end
    object qryFLGUSAINVESTIMOB: TStringField
      FieldName = 'FLGUSAINVESTIMOB'
      FixedChar = True
      Size = 1
    end
    object qryFLGLANCRECINATIVO: TFloatField
      FieldName = 'FLGLANCRECINATIVO'
    end
    object qryMESBLOQLANCTO: TFloatField
      FieldName = 'MESBLOQLANCTO'
    end
    object qryIDTCUSTORECIMOALU: TFloatField
      FieldName = 'IDTCUSTORECIMOALU'
    end
    object qryFLGLANCPAGINATIVO: TStringField
      FieldName = 'FLGLANCPAGINATIVO'
      FixedChar = True
      Size = 1
    end
    object qryFLGINTEGRAORCAMEN: TFloatField
      FieldName = 'FLGINTEGRAORCAMEN'
    end
    object qryFLGAVISO: TStringField
      FieldName = 'FLGAVISO'
      FixedChar = True
      Size = 1
    end
    object qryTIPOIMOVELPATRO: TStringField
      FieldName = 'TIPOIMOVELPATRO'
      Size = 5
    end
    object qryIDGRUPOREGRA: TFloatField
      FieldName = 'IDGRUPOREGRA'
    end
    object qryFLGPREVFOLHA: TFloatField
      FieldName = 'FLGPREVFOLHA'
    end
    object qryIDOPERATUALMULTA: TFloatField
      FieldName = 'IDOPERATUALMULTA'
    end
    object qryIDOPERATUALJUROS: TFloatField
      FieldName = 'IDOPERATUALJUROS'
    end
    object qryIDOPERATUALCM: TFloatField
      FieldName = 'IDOPERATUALCM'
    end
    object qryIDOPERPROVPER: TFloatField
      FieldName = 'IDOPERPROVPER'
    end
    object qryIDOPERPROVREC: TFloatField
      FieldName = 'IDOPERPROVREC'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDOPERPROVREC'
    end
    object qryFLGLOGORELAT: TStringField
      FieldName = 'FLGLOGORELAT'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGLOGORELAT'
      FixedChar = True
      Size = 1
    end
    object qryIDCARTACOBRANCA1: TFloatField
      FieldName = 'IDCARTACOBRANCA1'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDCARTACOBRANCA1'
    end
    object qryIDCARTACOBRANCA2: TFloatField
      FieldName = 'IDCARTACOBRANCA2'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDCARTACOBRANCA2'
    end
    object qryIDCARTACOBRANCA3: TFloatField
      FieldName = 'IDCARTACOBRANCA3'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDCARTACOBRANCA3'
    end
    object qryIDCARTACOBRANCA4: TFloatField
      FieldName = 'IDCARTACOBRANCA4'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDCARTACOBRANCA4'
    end
    object qryFLGLANCFORACOMP: TStringField
      FieldName = 'FLGLANCFORACOMP'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGLANCFORACOMP'
      FixedChar = True
      Size = 1
    end
    object qryFLGCALCINADIMP: TStringField
      FieldName = 'FLGCALCINADIMP'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGCALCINADIMP'
      FixedChar = True
      Size = 1
    end
    object qryIDREGRAMULTA: TFloatField
      FieldName = 'IDREGRAMULTA'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDREGRAMULTA'
    end
    object qryNOMEREGRA: TStringField
      FieldName = 'NOMEREGRA'
      Size = 60
    end
    object qryFLGBLOQRECALUGUEL: TFloatField
      FieldName = 'FLGBLOQRECALUGUEL'
    end
    object qryFLGATUALDATAPROG: TFloatField
      FieldName = 'FLGATUALDATAPROG'
    end
    object qryFLGTIPODATAPROG: TStringField
      FieldName = 'FLGTIPODATAPROG'
      FixedChar = True
      Size = 1
    end
    object qryIDOPERABONOMULTA: TFloatField
      FieldName = 'IDOPERABONOMULTA'
    end
    object qryIDOPERABONOJUROS: TFloatField
      FieldName = 'IDOPERABONOJUROS'
    end
    object qryIDOPERABONOCM: TFloatField
      FieldName = 'IDOPERABONOCM'
    end
    object qryFLGINDMESANTERIOR: TFloatField
      FieldName = 'FLGINDMESANTERIOR'
    end
    object qryMASCARACOMPL: TStringField
      FieldName = 'MASCARACOMPL'
      FixedChar = True
      Size = 15
    end
    object qryFLGREGEVENTO: TFloatField
      FieldName = 'FLGREGEVENTO'
    end
    object qryFLGBLOQDTLANC: TFloatField
      FieldName = 'FLGBLOQDTLANC'
    end
    object qryFLGUSAUNIDADE: TFloatField
      FieldName = 'FLGUSAUNIDADE'
    end
    object qryFLGAUTCOD: TStringField
      FieldName = 'FLGAUTCOD'
      Size = 1
    end
    object qryFLGVALCOD: TStringField
      FieldName = 'FLGVALCOD'
      Size = 1
    end
    object qryPATHETLHOM: TStringField
      FieldName = 'PATHETLHOM'
      Size = 250
    end
    object qryPATHETLPRODUCAO: TStringField
      FieldName = 'PATHETLPRODUCAO'
      Size = 250
    end
  end
  object qryLookUnidNegocio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   UNIDNEGOC, NOME'
      'FROM'
      '   UNIDNEGOCIO'
      'WHERE'
      '   ( IDPESSOA =:EMPRESAPROP )'
      '   AND ( UNETIPO = '#39'A'#39' )'
      '   AND ( ATIVO = '#39'S'#39')'
      'ORDER BY'
      '  NOME'
      ' ')
    ValidateWithMask = True
    Left = 536
    Top = 114
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end>
    object qryLookUnidNegocioNOME: TStringField
      DisplayWidth = 25
      FieldName = 'NOME'
      Origin = 'UNIDNEGOCIO.NOME'
      Size = 25
    end
    object qryLookUnidNegocioUNIDNEGOC: TFloatField
      DisplayWidth = 10
      FieldName = 'UNIDNEGOC'
      Origin = 'UNIDNEGOCIO.UNIDNEGOC'
      Visible = False
    end
  end
  object qryLookCentroRespon: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODCENTRORESPON, NOME'
      'FROM'
      '  CENTRESPON'
      'WHERE'
      '   ( IDPESSOA =:EMPRESAPROP )'
      '   AND ( ANALITICOSINTET = '#39'A'#39' )'
      '   AND ( ATIVO = '#39'S'#39')'
      'ORDER BY'
      '  NOME')
    ValidateWithMask = True
    Left = 686
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end>
    object qryLookCentroResponNOME: TStringField
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'CENTRESPON.NOME'
      Size = 30
    end
    object qryLookCentroResponCODCENTRORESPON: TStringField
      DisplayWidth = 10
      FieldName = 'CODCENTRORESPON'
      Origin = 'CENTRESPON.CODCENTRORESPON'
      Visible = False
      Size = 10
    end
  end
  object qryLookPortadorForma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODPORTFORMA, DESCRICAO'
      'FROM'
      '  PORTADORFORMA'
      'WHERE'
      '  IDPESSOA =:EMPRESAPROP'
      'ORDER BY'
      '  DESCRICAO')
    ValidateWithMask = True
    Left = 560
    Top = 198
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end>
    object qryLookPortadorFormaDESCRICAO: TStringField
      DisplayLabel = 'Forma de Cobrança'
      DisplayWidth = 50
      FieldName = 'DESCRICAO'
      Origin = 'PORTADORFORMA.DESCRICAO'
      Size = 50
    end
    object qryLookPortadorFormaCODPORTFORMA: TFloatField
      DisplayWidth = 10
      FieldName = 'CODPORTFORMA'
      Origin = 'PORTADORFORMA.CODPORTFORMA'
      Visible = False
    end
  end
  object qryParamGlobal: TwwQuery
    ValidateWithMask = True
    Left = 688
    Top = 332
  end
  object qryLookPrograma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   P.IDPROGRAMA, P.CODPROGRAMA, P.DESCPROGRAMA'
      ''
      'FROM'
      '   PROGRAMA P'
      ''
      'ORDER BY'
      '   P.DESCPROGRAMA'
      ''
      '   ')
    ValidateWithMask = True
    Left = 472
    Top = 171
    object qryLookProgramaDESCPROGRAMA: TStringField
      DisplayWidth = 60
      FieldName = 'DESCPROGRAMA'
      Origin = 'PROGRAMA.DESCPROGRAMA'
      Size = 60
    end
    object qryLookProgramaIDPROGRAMA: TFloatField
      FieldName = 'IDPROGRAMA'
      Origin = 'PROGRAMA.IDPROGRAMA'
      Visible = False
    end
    object qryLookProgramaCODPROGRAMA: TStringField
      FieldName = 'CODPROGRAMA'
      Origin = 'PROGRAMA.CODPROGRAMA'
      Visible = False
      Size = 2
    end
  end
  object cdsGrpRegra: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 624
    Top = 135
    object cdsGrpRegraDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object cdsGrpRegraIDGRUPOREGRA: TFloatField
      FieldName = 'IDGRUPOREGRA'
      Visible = False
    end
  end
  object qryLookTipoOper: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   T.IDTIPOCUSTORECIMO, T.DESCCUSTORECIMO, T.RECCUSTO, T.CODTIPD' +
        'OC,'
      '   T.FLGOBRIGAORC, T.IDTIPODESPESA, T.FLGDIARIO'
      ''
      'FROM'
      '   TIPOCUSTORECIMOV T'
      ''
      'WHERE'
      '       ( (:PIDMODULO IS NULL) OR (T.IDMODULO =:PIDMODULO) )'
      
        '   AND ( (:PIDTIPOCUSTORECIMO IS NULL) OR (T.IDTIPOCUSTORECIMO =' +
        ' :PIDTIPOCUSTORECIMO) )'
      '   AND ( (:PRECCUSTO IS NULL) OR (T.RECCUSTO =:PRECCUSTO) )'
      ''
      'ORDER BY'
      '   T.DESCCUSTORECIMO'
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 568
    Top = 274
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCUSTORECIMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCUSTORECIMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PRECCUSTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PRECCUSTO'
        ParamType = ptUnknown
      end>
    object qryLookTipoOperDESCCUSTORECIMO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 30
      FieldName = 'DESCCUSTORECIMO'
      Origin = 'TIPOCUSTORECIMOV.DESCCUSTORECIMO'
      Size = 60
    end
    object qryLookTipoOperIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
      Origin = 'TIPOCUSTORECIMOV.IDTIPOCUSTORECIMO'
      Visible = False
    end
    object qryLookTipoOperRECCUSTO: TStringField
      FieldName = 'RECCUSTO'
      Origin = 'TIPOCUSTORECIMOV.RECCUSTO'
      Visible = False
      Size = 1
    end
    object qryLookTipoOperCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
      Origin = 'TIPOCUSTORECIMOV.CODTIPDOC'
      Visible = False
    end
    object qryLookTipoOperFLGOBRIGAORC: TFloatField
      FieldName = 'FLGOBRIGAORC'
      Origin = 'TIPOCUSTORECIMOV.FLGOBRIGAORC'
      Visible = False
    end
    object qryLookTipoOperIDTIPODESPESA: TFloatField
      FieldName = 'IDTIPODESPESA'
      Visible = False
    end
    object qryLookTipoOperFLGDIARIO: TStringField
      FieldName = 'FLGDIARIO'
      Origin = 'BASEDADOS.TIPOCUSTORECIMOV.FLGDIARIO'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object qryCartaCobranca: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDCARTACOBRANCA,'
      '   MODELOCARTA,'
      '   IDREPORTS,'
      '   ORIGEMCM,'
      '   FLGTIPOCARTA'
      'FROM'
      '   CARTACOBRANCA'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 480
    Top = 272
    object qryCartaCobrancaMODELOCARTA: TStringField
      DisplayWidth = 60
      FieldName = 'MODELOCARTA'
      Origin = 'BASEDADOS.CARTACOBRANCA.MODELOCARTA'
      Size = 60
    end
    object qryCartaCobrancaIDCARTACOBRANCA: TFloatField
      FieldName = 'IDCARTACOBRANCA'
      Origin = 'BASEDADOS.CARTACOBRANCA.IDCARTACOBRANCA'
      Visible = False
    end
    object qryCartaCobrancaIDREPORTS: TFloatField
      FieldName = 'IDREPORTS'
      Origin = 'BASEDADOS.CARTACOBRANCA.IDREPORTS'
      Visible = False
    end
    object qryCartaCobrancaORIGEMCM: TFloatField
      FieldName = 'ORIGEMCM'
      Origin = 'BASEDADOS.CARTACOBRANCA.ORIGEMCM'
      Visible = False
    end
    object qryCartaCobrancaFLGTIPOCARTA: TStringField
      FieldName = 'FLGTIPOCARTA'
      Origin = 'BASEDADOS.CARTACOBRANCA.FLGTIPOCARTA'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
end
