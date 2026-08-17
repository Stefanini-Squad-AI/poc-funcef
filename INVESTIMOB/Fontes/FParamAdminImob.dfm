inherited frmParamAdminImob: TfrmParamAdminImob
  Left = 302
  Top = 143
  Caption = 'Parâmetros do Sistema'
  ClientHeight = 476
  ClientWidth = 499
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 35
    Width = 499
    Height = 406
    object pgcParametros: TPageControl
      Left = 1
      Top = 1
      Width = 497
      Height = 404
      ActivePage = tbsIntegra
      Align = alClient
      MultiLine = True
      TabOrder = 0
      object tbsIntegra: TTabSheet
        Caption = 'Integração'
        ImageIndex = 5
        object CheckBox1: TDBCheckBox
          Left = 40
          Top = 128
          Width = 441
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
          Left = 40
          Top = 200
          Width = 441
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
          Left = 40
          Top = 56
          Width = 441
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
        object CheckBox4: TDBCheckBox
          Left = 40
          Top = 272
          Width = 441
          Height = 21
          Caption = 'Integrar com Gestão de Investimentos'
          DataField = 'FLGINTEGRAGESTAO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object tbsGeral: TTabSheet
        Caption = 'Geral'
        object GroupBox1: TGroupBox
          Left = 16
          Top = 24
          Width = 449
          Height = 305
          Caption = ' Opções padrão para Receitas e Despesas (Integração Financeira) '
          TabOrder = 0
          object Label2: TLabel
            Left = 16
            Top = 26
            Width = 160
            Height = 13
            Caption = 'Centro de Responsabilidade'
          end
          object Label4: TLabel
            Left = 16
            Top = 82
            Width = 108
            Height = 13
            Caption = 'Atividade / Projeto'
          end
          object Label1: TLabel
            Left = 16
            Top = 138
            Width = 199
            Height = 13
            Caption = 'Contas-Caixa x Forma de Cobrança'
          end
          object Label17: TLabel
            Left = 16
            Top = 194
            Width = 92
            Height = 13
            Caption = 'Centro de Custo'
          end
          object Label18: TLabel
            Left = 16
            Top = 250
            Width = 54
            Height = 13
            Caption = 'Programa'
          end
          object DBcboCentroRespon: TwwDBLookupCombo
            Left = 16
            Top = 40
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
            AllowClearKey = False
          end
          object DBcboUnidNegocios: TwwDBLookupCombo
            Left = 16
            Top = 96
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
            AllowClearKey = False
          end
          object DBcboPortadorForma: TwwDBLookupCombo
            Left = 16
            Top = 152
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
            AllowClearKey = False
          end
          object DBcboLookCentroCusto: TwwDBLookupCombo
            Left = 16
            Top = 208
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
            AllowClearKey = False
          end
          object DBcboPrograma: TwwDBLookupCombo
            Left = 16
            Top = 264
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
            AllowClearKey = False
          end
        end
        object GroupBox4: TGroupBox
          Left = 216
          Top = 352
          Width = 449
          Height = 57
          Caption = ' Contabilização de Receitas e Despesas '
          TabOrder = 1
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
        object GroupBox5: TGroupBox
          Left = 472
          Top = 296
          Width = 409
          Height = 49
          Caption = ' Eventos '
          TabOrder = 2
          Visible = False
          object DBCheckBox17: TDBCheckBox
            Left = 16
            Top = 22
            Width = 417
            Height = 17
            Caption = 'Permitir a alteração/exclusão de Eventos gerados pelo Sistema'
            DataField = 'FLGALTERAEVENTO'
            DataSource = ds
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      object tbsContratos: TTabSheet
        Caption = 'Contratos'
        object Label8: TLabel
          Left = 372
          Top = 148
          Width = 36
          Height = 13
          Caption = 'meses'
        end
        object Label7: TLabel
          Left = 26
          Top = 148
          Width = 280
          Height = 13
          Caption = 'Antecedência de avisos de Eventos contratuais: '
        end
        object Label12: TLabel
          Left = 218
          Top = 105
          Width = 181
          Height = 13
          Caption = '"Gerar Cobrança Automática..."'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBrdgAutoRescisao: TDBRadioGroup
          Left = 18
          Top = 16
          Width = 393
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
        object wwDBSpinEdit1: TwwDBSpinEdit
          Left = 310
          Top = 144
          Width = 57
          Height = 21
          Increment = 1
          DataField = 'PRAZOAVISO'
          DataSource = ds
          TabOrder = 2
          UnboundDataType = wwDefault
        end
        object DBCheckBox1: TDBCheckBox
          Left = 26
          Top = 200
          Width = 241
          Height = 17
          Caption = 'Sugerir próximo número do Contrato:  '
          DataField = 'FLGSUGERECONTRATO'
          DataSource = ds
          TabOrder = 3
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox2: TDBCheckBox
          Left = 42
          Top = 224
          Width = 369
          Height = 17
          Caption = 'Concatenar o ano corrente com o número sugerido'
          DataField = 'FLGCONCATENAANO'
          DataSource = ds
          TabOrder = 5
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox3: TDBCheckBox
          Left = 26
          Top = 280
          Width = 385
          Height = 17
          Caption = 'Obrigar a indicação da Atividade nos Contratos'
          DataField = 'FLGOBRIGATIVIDADE'
          DataSource = ds
          TabOrder = 6
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object wwDBSpinEdit3: TwwDBSpinEdit
          Left = 262
          Top = 197
          Width = 77
          Height = 21
          Increment = 1
          DataField = 'PROXNUMCONTRATO'
          DataSource = ds
          TabOrder = 4
          UnboundDataType = wwDefault
        end
        object DBCheckBox5: TDBCheckBox
          Left = 26
          Top = 104
          Width = 193
          Height = 17
          Caption = 'Exibir nos Contratos a opção:  '
          DataField = 'FLGEXIBELABELCOBR'
          DataSource = ds
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox14: TDBCheckBox
          Left = 26
          Top = 320
          Width = 385
          Height = 17
          Caption = 'Permitir Imóveis com aluguel ZERO nos Contratos'
          DataField = 'FLGALUGUELZERO'
          DataSource = ds
          TabOrder = 7
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object tbsFolha: TTabSheet
        Caption = 'Folha de Aluguéis'
        object Label9: TLabel
          Left = 324
          Top = 48
          Width = 36
          Height = 13
          Caption = 'meses'
        end
        object Label10: TLabel
          Left = 299
          Top = 334
          Width = 328
          Height = 13
          Caption = 'para os Contratos que tenham esse parâmetro preenchido'
          Enabled = False
          Visible = False
        end
        object Label11: TLabel
          Left = 299
          Top = 288
          Width = 176
          Height = 13
          Caption = 'da data de vencimento original'
          Enabled = False
          Visible = False
        end
        object Label13: TLabel
          Left = 44
          Top = 48
          Width = 218
          Height = 13
          Caption = 'Gerar lançamentos de previsão para:  '
        end
        object wwDBSpinEdit2: TwwDBSpinEdit
          Left = 260
          Top = 44
          Width = 57
          Height = 21
          Increment = 1
          DataField = 'QTDEMESPREVFOLHA'
          DataSource = ds
          TabOrder = 1
          UnboundDataType = wwDefault
        end
        object DBCheckBox6: TDBCheckBox
          Left = 280
          Top = 318
          Width = 377
          Height = 17
          Caption = 'Calcular e gerar automaticamente a taxa de administração'
          DataField = 'FLGGERATXADMIN'
          DataSource = ds
          Enabled = False
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
          Visible = False
        end
        object DBCheckBox7: TDBCheckBox
          Left = 280
          Top = 272
          Width = 401
          Height = 17
          Caption = 'Vencimento das obrigações contratuais no 1º dia útil a partir'
          DataField = 'FLGVENCDIAUTIL'
          DataSource = ds
          Enabled = False
          TabOrder = 4
          ValueChecked = '1'
          ValueUnchecked = '0'
          Visible = False
        end
        object DBCheckBox8: TDBCheckBox
          Left = 24
          Top = 16
          Width = 377
          Height = 17
          Caption = 'Impedir execução da Folha p/ meses posteriores ao atual'
          DataField = 'FLGMESPOSTERIOR'
          DataSource = ds
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object grpComissao: TGroupBox
          Left = 280
          Top = 160
          Width = 401
          Height = 97
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
            Top = 0
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
          Left = 24
          Top = 80
          Width = 401
          Height = 17
          Caption = 'Encerramento/prorrogação contratual acompanha filtro da Folha'
          DataField = 'FLGFILTRAENCERRA'
          DataSource = ds
          TabOrder = 5
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox16: TDBCheckBox
          Left = 24
          Top = 120
          Width = 377
          Height = 17
          Caption = 'Reajuste contratual acompanha filtro da Folha'
          DataField = 'FLGFILTRAREAJUSTE'
          DataSource = ds
          TabOrder = 6
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object tbsLancamento: TTabSheet
        Caption = 'Lançamentos'
        object Label15: TLabel
          Left = 59
          Top = 128
          Width = 139
          Height = 13
          Caption = 'em lançamentos a pagar'
        end
        object Label20: TLabel
          Left = 59
          Top = 56
          Width = 150
          Height = 13
          Caption = 'em lançamentos a receber'
        end
        object DBCheckBox13: TDBCheckBox
          Left = 24
          Top = 88
          Width = 401
          Height = 17
          Caption = 'Obrigar a indicação do Contrato em lançamentos a pagar'
          Ctl3D = True
          DataField = 'FLGOBRIGACONTRATO'
          DataSource = ds
          ParentCtl3D = False
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox15: TDBCheckBox
          Left = 40
          Top = 112
          Width = 385
          Height = 17
          Caption = 'Permitir a indicação de um Contrato já encerrado/rescindido'
          DataField = 'FLGLANCPAGENCERRA'
          DataSource = ds
          TabOrder = 3
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBchkUsaAP: TDBCheckBox
          Left = 24
          Top = 272
          Width = 401
          Height = 17
          Caption = 'Obrigar o preenchimento dos campos ligados a APs'
          DataField = 'FLGUSAAP'
          DataSource = ds
          TabOrder = 5
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox11: TDBCheckBox
          Left = 40
          Top = 40
          Width = 385
          Height = 17
          Caption = 'Permitir a indicação de um Contrato já encerrado/rescindido'
          DataField = 'FLGLANCRECENCERRA'
          DataSource = ds
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox12: TCheckBox
          Left = 24
          Top = 16
          Width = 401
          Height = 17
          Caption = 'Obrigar a indicação do Contrato em lançamentos a receber'
          Checked = True
          Ctl3D = True
          Enabled = False
          ParentCtl3D = False
          State = cbChecked
          TabOrder = 0
        end
        object DBrdgResponsavel: TDBRadioGroup
          Left = 24
          Top = 160
          Width = 401
          Height = 89
          Caption = ' Despesas de responsabilidade do Locatário '
          DataField = 'FLGREEMBOLSOAUT'
          DataSource = ds
          Items.Strings = (
            'Permite lançamento (ignora responsável)'
            'Gera reembolso automaticamente'
            'Não permite o lançamento')
          TabOrder = 4
          Values.Strings = (
            '0'
            '1'
            '2')
        end
        object DBchkDiaUtilAP: TDBCheckBox
          Left = 24
          Top = 312
          Width = 401
          Height = 17
          Caption = 'Obrigar vencimento em dia útil para lançamentos a pagar'
          DataField = 'FLGDIAUTILAP'
          DataSource = ds
          TabOrder = 6
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
      end
      object tbsInvestimento: TTabSheet
        Caption = 'Gestão de Investimentos'
        TabVisible = False
        object GroupBox2: TGroupBox
          Left = 16
          Top = 144
          Width = 449
          Height = 157
          Caption = ' Movimentação da(s) Carteira(s) de Investimento '
          Enabled = False
          TabOrder = 1
          object DBchkAlimentaAlter: TDBCheckBox
            Left = 16
            Top = 24
            Width = 409
            Height = 17
            Caption = 'Juros, multa e correção monetária geram movimentação'
            DataField = 'FLGALIMENTAALTER'
            DataSource = ds
            Enabled = False
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBchkAlimentaDeprec: TDBCheckBox
            Left = 16
            Top = 48
            Width = 409
            Height = 17
            Caption = 'Depreciação de Bens ligados a Imóveis gera movimentação'
            DataField = 'FLGALIMENTADEPREC'
            DataSource = ds
            Enabled = False
            TabOrder = 1
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBrdgAlimentaData: TDBRadioGroup
            Left = 16
            Top = 76
            Width = 417
            Height = 65
            Caption = ' Gerar Movimentação: '
            DataField = 'FLGALIMENTADATA'
            DataSource = ds
            Enabled = False
            Items.Strings = (
              'na Data de Vencimento'
              'na Data de efetivo pagamento / recebimento')
            TabOrder = 2
            Values.Strings = (
              'V'
              'E')
          end
        end
        object GroupBox3: TGroupBox
          Left = 16
          Top = 8
          Width = 449
          Height = 125
          Caption = ' Parâmetros p/ Integração com Investimentos '
          TabOrder = 0
          object Label3: TLabel
            Left = 88
            Top = 32
            Width = 213
            Height = 13
            Caption = 'Valor inicial da Cota na(s) Carteira(s):'
          end
          object Label5: TLabel
            Left = 211
            Top = 64
            Width = 90
            Height = 13
            Caption = 'Moeda Atuarial:'
          end
          object Label6: TLabel
            Left = 149
            Top = 95
            Width = 152
            Height = 13
            Caption = 'Máscara do Setor Emissor:'
          end
          object DBcboMoedaAtuarial: TwwDBLookupCombo
            Left = 312
            Top = 60
            Width = 121
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MOESIGLA'#9'10'#9'Moeda')
            DataSource = dsParamInvest
            Style = csDropDownList
            DropDownWidth = 249
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object DBEdit1: TDBEdit
            Left = 312
            Top = 28
            Width = 121
            Height = 21
            DataField = 'VLRCOTAINICART'
            DataSource = dsParamInvest
            TabOrder = 0
          end
          object DBedtMascaraEmissor: TDBEdit
            Left = 312
            Top = 92
            Width = 121
            Height = 21
            DataField = 'MASCSETOREMISSOR'
            DataSource = dsParamInvest
            TabOrder = 2
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 499
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
    Top = 441
    Width = 499
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
  end
  inherited ds: TwwDataSource
    Left = 224
    Top = 0
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PARAMIMOVEL'
      'set'
      '  IDPESSOA = :IDPESSOA,'
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
      '  FLGEXIBELABELCOBR = :FLGEXIBELABELCOBR,'
      '  PRAZOAVISO = :PRAZOAVISO,'
      '  FLGAUTORESCISAO = :FLGAUTORESCISAO,'
      '  FLGOBRIGATIVIDADE = :FLGOBRIGATIVIDADE,'
      '  FLGINTEGRARECEB = :FLGINTEGRARECEB,'
      '  FLGINTEGRAPAG = :FLGINTEGRAPAG,'
      '  NOMEVLRAQUISICAO = :NOMEVLRAQUISICAO,'
      '  FLGINTEGRAFOLHA = :FLGINTEGRAFOLHA,'
      '  FLGGERATXADMIN = :FLGGERATXADMIN,'
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
      '  FLGALUGUELZERO = :FLGALUGUELZERO,'
      '  FLGFILTRAREAJUSTE = :FLGFILTRAREAJUSTE,'
      '  FLGFILTRAENCERRA = :FLGFILTRAENCERRA,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  IDPROGRAMA = :IDPROGRAMA,'
      '  FLGALTERAEVENTO = :FLGALTERAEVENTO,'
      '  FLGEVENTOUSUARIO = :FLGEVENTOUSUARIO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PARAMIMOVEL'
      
        '  (IDPESSOA, CODCENTRORESPON, UNIDNEGOC, CODPORTFORMA, FLGINTEGR' +
        'ACONTAB, '
      
        '   FLGINTEGRACAPCAR, FLGINTEGRAGESTAO, FLGINTEGRAATIVO, FLGUSASC' +
        'IMOVEL, '
      
        '   FLGUSASCLOCATARIO, FLGALIMENTAALTER, FLGALIMENTADATA, FLGALIM' +
        'ENTADEPREC, '
      
        '   FLGSUGERECONTRATO, FLGCONCATENAANO, PROXNUMCONTRATO, FLGVENCD' +
        'IAUTIL, '
      
        '   FLGEXIBELABELCOBR, PRAZOAVISO, FLGAUTORESCISAO, FLGOBRIGATIVI' +
        'DADE, FLGINTEGRARECEB, '
      
        '   FLGINTEGRAPAG, NOMEVLRAQUISICAO, FLGINTEGRAFOLHA, FLGGERATXAD' +
        'MIN, QTDEMESPREVFOLHA, '
      
        '   FLGMESPOSTERIOR, FLGREAVALMERCADO, FLGOBRIGACONTRATO, FLGCOMI' +
        'SSAOALT, '
      
        '   FLGLANCRESCINDIDO, IDTCUSTORECIMOCOM, FLGUSAAP, FLGDIAUTILAP,' +
        ' FLGCONSIDERARESP, '
      
        '   FLGREEMBOLSOAUT, FLGLANCRECENCERRA, FLGLANCPAGENCERRA, FLGALU' +
        'GUELZERO, '
      
        '   FLGFILTRAREAJUSTE, FLGFILTRAENCERRA, CODCENTROCUSTO, IDEMPRES' +
        'A, IDPROGRAMA, '
      '   FLGALTERAEVENTO, FLGEVENTOUSUARIO)'
      'values'
      
        '  (:IDPESSOA, :CODCENTRORESPON, :UNIDNEGOC, :CODPORTFORMA, :FLGI' +
        'NTEGRACONTAB, '
      
        '   :FLGINTEGRACAPCAR, :FLGINTEGRAGESTAO, :FLGINTEGRAATIVO, :FLGU' +
        'SASCIMOVEL, '
      
        '   :FLGUSASCLOCATARIO, :FLGALIMENTAALTER, :FLGALIMENTADATA, :FLG' +
        'ALIMENTADEPREC, '
      
        '   :FLGSUGERECONTRATO, :FLGCONCATENAANO, :PROXNUMCONTRATO, :FLGV' +
        'ENCDIAUTIL, '
      
        '   :FLGEXIBELABELCOBR, :PRAZOAVISO, :FLGAUTORESCISAO, :FLGOBRIGA' +
        'TIVIDADE, '
      
        '   :FLGINTEGRARECEB, :FLGINTEGRAPAG, :NOMEVLRAQUISICAO, :FLGINTE' +
        'GRAFOLHA, '
      
        '   :FLGGERATXADMIN, :QTDEMESPREVFOLHA, :FLGMESPOSTERIOR, :FLGREA' +
        'VALMERCADO, '
      
        '   :FLGOBRIGACONTRATO, :FLGCOMISSAOALT, :FLGLANCRESCINDIDO, :IDT' +
        'CUSTORECIMOCOM, '
      
        '   :FLGUSAAP, :FLGDIAUTILAP, :FLGCONSIDERARESP, :FLGREEMBOLSOAUT' +
        ', :FLGLANCRECENCERRA, '
      
        '   :FLGLANCPAGENCERRA, :FLGALUGUELZERO, :FLGFILTRAREAJUSTE, :FLG' +
        'FILTRAENCERRA, '
      
        '   :CODCENTROCUSTO, :IDEMPRESA, :IDPROGRAMA, :FLGALTERAEVENTO, :' +
        'FLGEVENTOUSUARIO)')
    DeleteSQL.Strings = (
      'delete from PARAMIMOVEL'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 160
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
    Top = 42
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   P.IDPESSOA,'
      ''
      '   P.CODCENTRORESPON,'
      '   P.UNIDNEGOC,'
      '   P.CODPORTFORMA,'
      ''
      '   P.FLGINTEGRACONTAB,'
      '   P.FLGINTEGRACAPCAR,'
      '   P.FLGINTEGRAGESTAO,'
      '   P.FLGINTEGRAATIVO,'
      ''
      '   P.FLGUSASCIMOVEL,'
      '   P.FLGUSASCLOCATARIO,'
      ''
      '   P.FLGALIMENTAALTER,'
      '   P.FLGALIMENTADATA,'
      '   P.FLGALIMENTADEPREC,'
      ''
      '   P.FLGSUGERECONTRATO,'
      '   P.FLGCONCATENAANO,'
      '   P.PROXNUMCONTRATO,'
      ''
      '   P.FLGVENCDIAUTIL,'
      ''
      '   P.FLGEXIBELABELCOBR,'
      '   P.PRAZOAVISO,'
      '   P.FLGAUTORESCISAO,'
      '   P.FLGOBRIGATIVIDADE,'
      ''
      '   P.FLGINTEGRARECEB,'
      '   P.FLGINTEGRAPAG,'
      ''
      '   P.NOMEVLRAQUISICAO,'
      ''
      '   P.FLGINTEGRAFOLHA,'
      '   P.FLGGERATXADMIN,'
      '   P.QTDEMESPREVFOLHA,'
      ''
      '   P.FLGMESPOSTERIOR,'
      ''
      '   P.FLGREAVALMERCADO,'
      ''
      '   P.FLGOBRIGACONTRATO,'
      '   P.FLGCOMISSAOALT,'
      '   P.FLGLANCRESCINDIDO,'
      '   P.IDTCUSTORECIMOCOM,'
      '   P.FLGUSAAP, FLGDIAUTILAP,'
      ''
      '   P.FLGCONSIDERARESP, P.FLGREEMBOLSOAUT,'
      '   P.FLGLANCRECENCERRA, P.FLGLANCPAGENCERRA,'
      '   P.FLGALUGUELZERO,'
      ''
      '   FLGFILTRAREAJUSTE, FLGFILTRAENCERRA,'
      ''
      '   P.CODCENTROCUSTO, P.IDEMPRESA,'
      '   P.IDPROGRAMA,'
      ''
      '   P.FLGALTERAEVENTO, P.FLGEVENTOUSUARIO'
      ''
      'FROM'
      '   PARAMIMOVEL P'
      ''
      'WHERE'
      '   ( P.IDPESSOA =:PIDPESSOA )'
      ' ')
    Left = 192
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
    object qryFLGEXIBELABELCOBR: TFloatField
      FieldName = 'FLGEXIBELABELCOBR'
      Origin = 'PARAMIMOVEL.FLGEXIBELABELCOBR'
    end
    object qryPRAZOAVISO: TFloatField
      FieldName = 'PRAZOAVISO'
      Origin = 'PARAMIMOVEL.PRAZOAVISO'
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
      'ORDER BY'
      '  NOME')
    ValidateWithMask = True
    Left = 432
    Top = 48
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
      'ORDER BY'
      '  NOME')
    ValidateWithMask = True
    Left = 424
    Top = 36
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
    Left = 432
    Top = 24
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
    Left = 432
    Top = 12
  end
  object qryParamInvest: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   PI.IDPARAMINVEST, PI.VLRCOTAINICART, '
      '   PI.MASCSETOREMISSOR, PI.MOEDAATU'
      'FROM'
      '   PARAMINVEST PI'
      '')
    UpdateObject = updParamInvest
    ValidateWithMask = True
    Left = 32
    Top = 432
    object qryParamInvestVLRCOTAINICART: TFloatField
      FieldName = 'VLRCOTAINICART'
      Origin = 'PARAMINVEST.VLRCOTAINICART'
      DisplayFormat = '#0.00'
    end
    object qryParamInvestIDPARAMINVEST: TFloatField
      FieldName = 'IDPARAMINVEST'
      Origin = 'PARAMINVEST.IDPARAMINVEST'
    end
    object qryParamInvestMASCSETOREMISSOR: TStringField
      FieldName = 'MASCSETOREMISSOR'
      Origin = 'PARAMINVEST.MASCSETOREMISSOR'
      Size = 15
    end
    object qryParamInvestMOEDAATU: TFloatField
      FieldName = 'MOEDAATU'
      Origin = 'PARAMINVEST.MOEDAATU'
    end
  end
  object dsParamInvest: TwwDataSource
    DataSet = qryParamInvest
    Left = 32
    Top = 420
  end
  object updParamInvest: TUpdateSQL
    ModifySQL.Strings = (
      'update PARAMINVEST'
      'set'
      '  VLRCOTAINICART = :VLRCOTAINICART,'
      '  MASCSETOREMISSOR = :MASCSETOREMISSOR,'
      '  MOEDAATU = :MOEDAATU'
      'where'
      '  IDPARAMINVEST = :OLD_IDPARAMINVEST')
    InsertSQL.Strings = (
      'insert into PARAMINVEST'
      '  (IDPARAMINVEST, VLRCOTAINICART, MASCSETOREMISSOR, MOEDAATU)'
      'values'
      
        '  (:IDPARAMINVEST, :VLRCOTAINICART, :MASCSETOREMISSOR, :MOEDAATU' +
        ')')
    DeleteSQL.Strings = (
      'delete from PARAMINVEST'
      'where'
      '  IDPARAMINVEST = :OLD_IDPARAMINVEST')
    Left = 32
    Top = 408
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
    Left = 432
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
end
