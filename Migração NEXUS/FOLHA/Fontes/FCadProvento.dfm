inherited FrmCadProvento: TFrmCadProvento
  Left = 619
  Top = 83
  HelpContext = 180024
  Caption = 'Rubricas Salariais'
  ClientHeight = 630
  ClientWidth = 667
  OnActivate = CmeCadastroAtualizaBotoes
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 667
    Height = 544
    inherited dbGrd: TwwDBGrid [0]
      Width = 665
      Height = 542
      Selected.Strings = (
        'IDPROVENTO'#9'10'#9'Código'
        'DESCRICAO'#9'130'#9'Descrição')
      TitleLines = 2
      Visible = False
    end
    inherited pnlControles: TPanel [1]
      Width = 790
      Height = 132
      Align = alNone
      object Label2: TLabel
        Left = 7
        Top = -1
        Width = 168
        Height = 13
        Caption = 'Descrição Interna da Rubrica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel1: TBevel
        Left = 0
        Top = 125
        Width = 739
        Height = 2
      end
      object dbedDescricao: TwwDBEdit
        Left = 5
        Top = 12
        Width = 309
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbedDescricaoExit
      end
      object grpTipoRubrica: TGroupBox
        Left = 324
        Top = 0
        Width = 293
        Height = 116
        Caption = 'Categoria(s) de Rubrica(s) '
        TabOrder = 2
        object chkFolhaBeneficio: TCheckBox
          Left = 10
          Top = 13
          Width = 151
          Height = 16
          Caption = 'Folha de Benefícios'
          TabOrder = 0
        end
        object chkGeral: TCheckBox
          Left = 10
          Top = 29
          Width = 97
          Height = 17
          Caption = 'Geral '
          TabOrder = 1
        end
        object chkAssistencial: TCheckBox
          Left = 10
          Top = 93
          Width = 88
          Height = 17
          Caption = 'Assistencial'
          TabOrder = 5
        end
        object chkEmprestimo: TCheckBox
          Left = 10
          Top = 76
          Width = 85
          Height = 17
          Caption = 'Empréstimo'
          TabOrder = 4
        end
        object chkPatrocinadora: TCheckBox
          Left = 10
          Top = 45
          Width = 104
          Height = 17
          Caption = 'Patrocinadora'
          TabOrder = 2
        end
        object chkFolhaPagaFunda: TCheckBox
          Left = 10
          Top = 61
          Width = 201
          Height = 15
          Caption = 'Folha de Pagamento Fundação '
          TabOrder = 3
        end
      end
      object GroupBox4: TGroupBox
        Left = 4
        Top = 33
        Width = 309
        Height = 84
        Hint = 'Estas informações são utilizadas para emissão de contracheque.'
        Caption = 'Informações Personalizadas'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        object Label3: TLabel
          Left = 6
          Top = 60
          Width = 58
          Height = 13
          Caption = 'Descrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 8
          Top = 22
          Width = 44
          Height = 13
          Caption = 'Código '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedDescPer: TwwDBEdit
          Left = 68
          Top = 56
          Width = 236
          Height = 21
          DataField = 'DESCRPROVDESC'
          DataSource = ds
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbecodexterno: TDBEdit
          Left = 67
          Top = 18
          Width = 237
          Height = 21
          DataField = 'CODPROVDESC'
          DataSource = ds
          TabOrder = 0
        end
      end
    end
    object pgcOpcoes: TPageControl
      Left = 2
      Top = 133
      Width = 663
      Height = 369
      ActivePage = tbsReinf
      MultiLine = True
      TabOrder = 2
      object tbsGrupoRubrica: TTabSheet
        Caption = 'Grupo e Natureza'
        object pnlGrupoRubrica: TPanel
          Left = 0
          Top = 0
          Width = 655
          Height = 323
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object Label5: TLabel
            Left = 10
            Top = 4
            Width = 118
            Height = 13
            Caption = 'Natureza da Rubrica'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dblkcmbflgAtrasoDevol: TwwDBComboBox
            Left = 10
            Top = 17
            Width = 600
            Height = 21
            ShowButton = True
            Style = csDropDown
            MapList = True
            AllowClearKey = True
            DataField = 'FLGATRASODEVOL'
            DataSource = ds
            DropDownCount = 8
            ItemHeight = 0
            Items.Strings = (
              'NORMAL'#9'N'
              'ATRASO'#9'A'
              'DEVOLUÇÃO'#9'D')
            Sorted = False
            TabOrder = 0
            UnboundDataType = wwDefault
          end
          object grp1: TGroupBox
            Left = 14
            Top = 40
            Width = 595
            Height = 131
            Caption = 'Regime Progressivo'
            TabOrder = 1
            object LblGrupoRubrica: TLabel
              Left = 7
              Top = 20
              Width = 101
              Height = 13
              Caption = 'Grupo da Rubrica'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label6: TLabel
              Left = 7
              Top = 55
              Width = 185
              Height = 13
              Caption = 'Linha do Informe de Rendimento'
            end
            object Label7: TLabel
              Left = 7
              Top = 90
              Width = 183
              Height = 13
              Caption = 'Código IRRF - Receita p/ DARF'
            end
            object dblkGrupoRubrica: TwwDBLookupCombo
              Left = 7
              Top = 34
              Width = 584
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'60'#9'Descrição'#9'F')
              DataField = 'IDGRUPORUBRICA'
              DataSource = ds
              LookupTable = qryGrupoRubrica
              LookupField = 'IDGRUPORUBRICA'
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = True
            end
            object dblkcmbIdInfome: TwwDBLookupCombo
              Left = 7
              Top = 69
              Width = 584
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEINFORME'#9'60'#9'NOMEINFORME')
              DataField = 'IDINFORME'
              DataSource = ds
              LookupTable = qryInformerendimento
              LookupField = 'IDINFORME'
              TabOrder = 1
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = True
            end
            object wwDBLookupCombo2: TwwDBLookupCombo
              Left = 7
              Top = 104
              Width = 584
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'JUNCAO'#9'70'#9'Código IRRF - Receita p/ DARF'#9'F')
              DataField = 'CODIRRFDARF'
              DataSource = ds
              LookupTable = qryIRRFDARF
              LookupField = 'CODNATUREZA'
              Options = [loTitles]
              TabOrder = 2
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = True
            end
          end
          object grp2: TGroupBox
            Left = 14
            Top = 176
            Width = 595
            Height = 129
            Caption = 'Regime Regressivo'
            TabOrder = 2
            object lbl3: TLabel
              Left = 7
              Top = 20
              Width = 101
              Height = 13
              Caption = 'Grupo da Rubrica'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl4: TLabel
              Left = 7
              Top = 54
              Width = 185
              Height = 13
              Caption = 'Linha do Informe de Rendimento'
            end
            object lbl5: TLabel
              Left = 7
              Top = 89
              Width = 183
              Height = 13
              Caption = 'Código IRRF - Receita p/ DARF'
            end
            object wwDBLookupCombo2REG: TwwDBLookupCombo
              Left = 7
              Top = 102
              Width = 584
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'JUNCAO'#9'70'#9'Código IRRF - Receita p/ DARF'#9'F')
              DataField = 'CODIRRFDARFREG'
              DataSource = ds
              LookupTable = qryIRRFDARF
              LookupField = 'CODNATUREZA'
              Options = [loTitles]
              TabOrder = 2
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = True
            end
            object dblkcmbIdInfomeREG: TwwDBLookupCombo
              Left = 7
              Top = 67
              Width = 584
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEINFORME'#9'60'#9'NOMEINFORME')
              DataField = 'IDINFORMEREG'
              DataSource = ds
              LookupTable = qryInformerendimento
              LookupField = 'IDINFORME'
              TabOrder = 1
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = True
            end
            object dblkGrupoRubricaREG: TwwDBLookupCombo
              Left = 7
              Top = 34
              Width = 584
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'60'#9'Descrição'#9'F')
              DataField = 'IDGRUPORUBRICAREG'
              DataSource = ds
              LookupTable = qryGrupoRubrica
              LookupField = 'IDGRUPORUBRICA'
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = True
            end
          end
        end
      end
      object tbsReinf: TTabSheet
        Caption = 'Natureza Reinf'
        ImageIndex = 4
        object pnlReinf: TPanel
          Left = 0
          Top = 0
          Width = 655
          Height = 323
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object grpExteriorReinf: TGroupBox
            Left = 0
            Top = 240
            Width = 655
            Height = 75
            Align = alTop
            Caption = 'Residente Exterior'
            TabOrder = 0
            object dblkExteriorReinf: TwwDBLookupCombo
              Left = 7
              Top = 27
              Width = 634
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'JUNCAO'#9'70'#9'Código Natureza REINF'#9'F')
              DataField = 'CODNATREINF_EXTERIOR'
              DataSource = ds
              LookupTable = qryNaturezaReinf
              LookupField = 'CODNATUREZAREINF'
              Options = [loTitles]
              DropDownWidth = 850
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = True
            end
          end
          object grpProgressivoReinf: TGroupBox
            Left = 0
            Top = 0
            Width = 655
            Height = 120
            Align = alTop
            Caption = 'Progressivo'
            TabOrder = 1
            object lblProgbd: TLabel
              Left = 7
              Top = 20
              Width = 107
              Height = 13
              Caption = 'Benefício Definido'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblprogcd: TLabel
              Left = 7
              Top = 68
              Width = 123
              Height = 13
              Caption = 'Contribuição Definida'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dblkProgBDReinf: TwwDBLookupCombo
              Left = 7
              Top = 39
              Width = 634
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'JUNCAO'#9'70'#9'Código IRRF - Receita p/ DARF'#9'F')
              DataField = 'CODNATREINF_PROG_BD'
              DataSource = ds
              LookupTable = qryNaturezaReinf
              LookupField = 'CODNATUREZAREINF'
              Options = [loTitles]
              DropDownWidth = 850
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = True
            end
            object dblkProgCDReinf: TwwDBLookupCombo
              Left = 7
              Top = 87
              Width = 634
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'JUNCAO'#9'70'#9'Código Natureza REINF'#9'F')
              DataField = 'CODNATREINF_PROG_CD'
              DataSource = ds
              LookupTable = qryNaturezaReinf
              LookupField = 'CODNATUREZAREINF'
              Options = [loTitles]
              DropDownWidth = 850
              TabOrder = 1
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = True
            end
          end
          object grpRegressivoReinf: TGroupBox
            Left = 0
            Top = 120
            Width = 655
            Height = 120
            Align = alTop
            Caption = 'Regressivo'
            TabOrder = 2
            object lblRegbd: TLabel
              Left = 7
              Top = 20
              Width = 107
              Height = 13
              Caption = 'Benefício Definido'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblRegcd: TLabel
              Left = 7
              Top = 68
              Width = 123
              Height = 13
              Caption = 'Contribuição Definida'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dblkRegrBDReinf: TwwDBLookupCombo
              Left = 7
              Top = 39
              Width = 634
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'JUNCAO'#9'70'#9'Código Natureza REINF'#9'F')
              DataField = 'CODNATREINF_REGR_BD'
              DataSource = ds
              LookupTable = qryNaturezaReinf
              LookupField = 'CODNATUREZAREINF'
              Options = [loTitles]
              DropDownWidth = 850
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = True
            end
            object dblkRegrCDReinf: TwwDBLookupCombo
              Left = 7
              Top = 87
              Width = 634
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'JUNCAO'#9'70'#9'Código Natureza REINF'#9'F')
              DataField = 'CODNATREINF_REGR_CD'
              DataSource = ds
              LookupTable = qryNaturezaReinf
              LookupField = 'CODNATUREZAREINF'
              Options = [loTitles]
              DropDownWidth = 850
              TabOrder = 1
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = True
            end
          end
        end
      end
      object tbsTipoRubrica: TTabSheet
        Caption = 'Tipo e Finalidade da Rubrica'
        ImageIndex = 1
        object pnlTipoRubrica: TPanel
          Left = 0
          Top = 0
          Width = 655
          Height = 323
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object grpTipo: TGroupBox
            Left = 4
            Top = 3
            Width = 308
            Height = 38
            Caption = 'Tipo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnExit = grpTipoExit
            object chkVisivel: TCheckBox
              Left = 185
              Top = 10
              Width = 115
              Height = 19
              Caption = 'Visível na Folha'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              Visible = False
            end
            object rbNormal: TRadioButton
              Left = 12
              Top = 13
              Width = 65
              Height = 17
              Caption = 'Normal'
              TabOrder = 1
              OnClick = rbNormalClick
            end
            object rbEspecial: TRadioButton
              Left = 84
              Top = 13
              Width = 73
              Height = 17
              Caption = 'Especial'
              TabOrder = 2
              OnClick = rbEspecialClick
            end
          end
          object dbrgrpDesconto: TDBRadioGroup
            Left = 4
            Top = 40
            Width = 308
            Height = 31
            Caption = ' Finalidade '
            Columns = 3
            DataField = 'FLGDESCONTO'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Items.Strings = (
              'Provento'
              'Desconto'
              'Outros')
            ParentFont = False
            TabOrder = 1
            TabStop = True
            Values.Strings = (
              '0'
              '1'
              '2')
            OnChange = dbrgrpDescontoChange
            OnClick = dbrgrpDescontoClick
          end
          object pnlPrioridadeDesconto: TPanel
            Left = 4
            Top = 75
            Width = 307
            Height = 27
            TabOrder = 2
            object Label1: TLabel
              Left = 9
              Top = 7
              Width = 145
              Height = 13
              Caption = 'Prioridade para Desconto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedNumPrioridade: TDBEdit
              Left = 169
              Top = 4
              Width = 121
              Height = 21
              DataField = 'NUMPRIORIDADEFB'
              DataSource = ds
              TabOrder = 0
            end
          end
          object rdgBcalc: TRadioGroup
            Left = 320
            Top = 3
            Width = 292
            Height = 99
            Caption = 'Incide sobre as seguintes Bases de Proventos :'
            Items.Strings = (
              'Suplementação'
              'Resgate'
              'INSS'
              'Suplementação e Resgate'
              'Suplementação, Resgate e INSS')
            TabOrder = 3
          end
          object GroupBox2: TGroupBox
            Left = 4
            Top = 106
            Width = 307
            Height = 40
            Caption = 'Fonte Pagadora'
            TabOrder = 4
            object dblkFontePagadora: TwwDBLookupCombo
              Left = 9
              Top = 13
              Width = 292
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'Descrição'#9'F')
              DataField = 'CODFONTEPAGADORA'
              DataSource = ds
              LookupTable = qryFontepagadora
              LookupField = 'IDFONTEPAGADORA'
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
          end
          object grbExibeHist: TGroupBox
            Left = 4
            Top = 148
            Width = 307
            Height = 41
            Caption = 'Rubrica a ser exibida no histórico'
            TabOrder = 5
            object chkBenef: TCheckBox
              Left = 10
              Top = 17
              Width = 97
              Height = 17
              Caption = 'Beneficio'
              TabOrder = 0
              OnClick = chkBenefClick
            end
            object chkContrib: TCheckBox
              Left = 127
              Top = 17
              Width = 97
              Height = 17
              Caption = 'Contribuição'
              TabOrder = 1
              OnClick = chkContribClick
            end
          end
          object chkIrrfinf: TCheckBox
            Left = 316
            Top = 105
            Width = 137
            Height = 17
            Caption = 'IRRF Informativo'
            TabOrder = 6
            OnClick = chkContribClick
          end
          object chkAcao: TDBCheckBox
            Left = 316
            Top = 172
            Width = 305
            Height = 13
            Caption = 'Ação Judicial'
            DataField = 'FLGACAOJUDICIAL'
            DataSource = ds
            TabOrder = 10
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object chkEncerramento: TDBCheckBox
            Left = 316
            Top = 139
            Width = 200
            Height = 11
            Caption = 'Encerramento de Benefício'
            DataField = 'FLGENCERRAMENTO'
            DataSource = ds
            TabOrder = 8
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object chkEncerramentoProporcialMesMorte: TDBCheckBox
            Left = 316
            Top = 155
            Width = 305
            Height = 12
            Caption = 'Encerramento proporcional no mês de falecimento'
            DataField = 'FLGPROPORCIONAL'
            DataSource = ds
            TabOrder = 9
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object chkExcessoDebito: TDBCheckBox
            Left = 316
            Top = 124
            Width = 171
            Height = 10
            Caption = 'Excesso de Débito'
            DataField = 'FLGREPROGRAMAR'
            DataSource = ds
            TabOrder = 7
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object chkCorrrecaoMonetaria: TDBCheckBox
            Left = 316
            Top = 189
            Width = 145
            Height = 14
            Caption = 'Correção Monetária'
            DataField = 'FLGCORRECAOMONETARIA'
            DataSource = ds
            TabOrder = 11
            ValueChecked = '1'
            ValueUnchecked = '0'
            OnClick = dbchkFlgContabRubricaClick
          end
          object gbxColunaMapa: TGroupBox
            Left = 4
            Top = 192
            Width = 308
            Height = 49
            Caption = 'Coluna Mapa'
            TabOrder = 12
            object dblkColunaMapa: TDBLookupComboBox
              Left = 9
              Top = 16
              Width = 292
              Height = 21
              DataField = 'IDCOLUNAMAPA'
              DataSource = ds
              KeyField = 'IDCOLUNAMAPA'
              ListField = 'DESCRICAO'
              ListSource = dsMapa
              TabOrder = 0
            end
          end
        end
      end
      object tbsPrazo: TTabSheet
        Caption = 'Prazo , Estado e Incidências da Rubrica'
        ImageIndex = 2
        object pnlPagina3: TPanel
          Left = 0
          Top = 0
          Width = 740
          Height = 319
          BevelOuter = bvLowered
          TabOrder = 0
          object LblEstadoRub: TLabel
            Left = 442
            Top = 66
            Width = 106
            Height = 13
            Caption = 'Estado da Rubrica'
          end
          object GroupBox1: TGroupBox
            Left = 4
            Top = 7
            Width = 224
            Height = 157
            Caption = 'Somente para Previdência'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object DBCheckBox4: TDBCheckBox
              Left = 6
              Top = 104
              Width = 216
              Height = 14
              Caption = 'Salário de participação Atuarial'
              DataField = 'FLGSALPARTATUARIA'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 5
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox3: TDBCheckBox
              Left = 6
              Top = 86
              Width = 216
              Height = 14
              Caption = 'Salário de benefício Retroativo'
              DataField = 'FLGSALBENEFRETRO'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox2: TDBCheckBox
              Left = 6
              Top = 68
              Width = 216
              Height = 14
              Caption = 'Salário de participação Retroativo'
              DataField = 'FLGSALPARTRETRO'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox1: TDBCheckBox
              Left = 6
              Top = 50
              Width = 216
              Height = 14
              Caption = 'Compõe Remuneração Total'
              DataField = 'FLGCOMPOEREMTOTAL'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object dbchkCompoeSalBenef: TDBCheckBox
              Left = 6
              Top = 32
              Width = 216
              Height = 14
              Caption = 'Compõe Salário de Benefício'
              DataField = 'FLGCOMPOESALBENEF'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object dbchkCompoeSalPart: TDBCheckBox
              Left = 6
              Top = 14
              Width = 207
              Height = 14
              Caption = 'Compõe Salário de Participação'
              DataField = 'FLGCOMPOESALPART'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object dbchkCompoeDIRFResg: TDBCheckBox
              Left = 6
              Top = 122
              Width = 216
              Height = 14
              Caption = 'Compõe DIRF de Resgate'
              DataField = 'DIRF_RESGATE'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 6
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object GroupBox3: TGroupBox
            Left = 231
            Top = 7
            Width = 209
            Height = 201
            TabOrder = 1
            object dbcAceita: TDBCheckBox
              Left = 3
              Top = 9
              Width = 171
              Height = 14
              Caption = 'Aceita Desconto Parcial'
              DataField = 'DESCPARCIAL'
              DataSource = ds
              TabOrder = 0
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object dbckFLGDESCPENSAO: TDBCheckBox
              Left = 3
              Top = 25
              Width = 172
              Height = 14
              Caption = 'Usa no Cálculo de Pensão'
              DataField = 'FLGDESCPENSAO'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object dbchkObrigaFavorecido: TDBCheckBox
              Left = 3
              Top = 41
              Width = 180
              Height = 14
              Caption = 'Exige Indicação Favorecido '
              DataField = 'FLGOBRIGAFAVOREC'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object dbckIRRF: TDBCheckBox
              Left = 3
              Top = 75
              Width = 97
              Height = 14
              Caption = 'Incide I&RRF'
              DataField = 'FLGIRRF'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox5: TDBCheckBox
              Left = 3
              Top = 106
              Width = 173
              Height = 14
              Caption = 'Incide no S&alário Família'
              DataField = 'FLGSALFAMILIA'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 5
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object dbcIRACJUD: TDBCheckBox
              Left = 3
              Top = 90
              Width = 189
              Height = 14
              Caption = 'Incide IRRF de Ação Judicial'
              DataField = 'FLGIRRFACJUD'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object dbcboxFlgAgrupa: TDBCheckBox
              Left = 3
              Top = 122
              Width = 193
              Height = 14
              Caption = 'Agrupa valor no contracheque'
              DataField = 'FLGAGRUPA'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 6
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object dbcboxRubLegal: TDBCheckBox
              Left = 3
              Top = 139
              Width = 190
              Height = 14
              Caption = 'Rubrica Legal Líquida'
              DataField = 'FLGRUBLEGAL'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 7
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object dbcboxMargem: TDBCheckBox
              Left = 3
              Top = 155
              Width = 190
              Height = 14
              Caption = 'Compõe Margem Líquida'
              DataField = 'FLGMARGEM'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 8
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object dbchkExcluiContribPA: TDBCheckBox
              Left = 3
              Top = 172
              Width = 190
              Height = 14
              Caption = 'Exclui Contribuição Base PA'
              DataField = 'FlgExcluiContribPA'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 9
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox6: TDBCheckBox
              Left = 3
              Top = 57
              Width = 203
              Height = 14
              Caption = 'Não lança pagto ao Favorecido'
              DataField = 'FLGNAOPAGAFAVOREC'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 10
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object DbCboEstadoRub: TwwDBComboBox
            Left = 442
            Top = 79
            Width = 178
            Height = 21
            ShowButton = True
            Style = csDropDown
            MapList = True
            AllowClearKey = False
            DataField = 'FLGESTADORUB'
            DataSource = ds
            DropDownCount = 8
            ItemHeight = 0
            Items.Strings = (
              'Ativa'#9'0'
              'Calculada'#9'1'
              'Bloqueada'#9'2')
            Sorted = False
            TabOrder = 3
            UnboundDataType = wwDefault
          end
          object gbxPrazo: TDBRadioGroup
            Left = 442
            Top = 7
            Width = 176
            Height = 57
            Caption = 'Prazo'
            DataField = 'PRAZO'
            DataSource = ds
            Items.Strings = (
              'Permanente'
              'Livre'
              'Uma ocorrência')
            TabOrder = 2
            Values.Strings = (
              '0'
              '1'
              '2')
          end
          object dbchkRRA: TDBCheckBox
            Left = 443
            Top = 124
            Width = 57
            Height = 17
            Caption = 'RRA'
            DataField = 'FLGRRA'
            DataSource = ds
            TabOrder = 5
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbchkVisualConv: TDBCheckBox
            Left = 443
            Top = 145
            Width = 179
            Height = 17
            Caption = 'Visualiza Convênio Externo'
            DataField = 'FLGVISUALIZACONV'
            DataSource = ds
            TabOrder = 6
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbchkBitri: TDBCheckBox
            Left = 443
            Top = 104
            Width = 107
            Height = 17
            Caption = 'Bitributação'
            DataField = 'FLGBITRIBUTACAO'
            DataSource = ds
            TabOrder = 4
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbchkDivBen: TDBCheckBox
            Left = 443
            Top = 165
            Width = 163
            Height = 17
            Caption = 'Dívida de Benefício'
            DataField = 'FLGDIVIDABENEFICIO'
            DataSource = ds
            TabOrder = 7
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object grpcontab: TGroupBox
            Left = 4
            Top = 212
            Width = 301
            Height = 73
            Caption = 'Somente para Contabilização'
            TabOrder = 8
            object dbchkFlgContAbono: TDBCheckBox
              Left = 5
              Top = 35
              Width = 287
              Height = 30
              Caption = 'Contabiliza em conta especifica em caso de referência de abono '
              DataField = 'FLGCONTABONO'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              ValueChecked = '1'
              ValueUnchecked = '0'
              OnClick = dbchkFlgContabRubricaClick
            end
            object dbchkFlgContabBenef: TDBCheckBox
              Left = 5
              Top = 19
              Width = 287
              Height = 17
              Caption = 'Contabiliza de acordo com o tipo de benefício'
              DataField = 'FLGCONTBENEFICIO'
              DataSource = ds
              TabOrder = 0
              ValueChecked = '1'
              ValueUnchecked = '0'
              OnClick = dbchkFlgContabRubricaClick
            end
          end
        end
      end
      object Pagina4: TTabSheet
        Caption = 'Estruturas de Cálculo Associadas a Rubrica'
        ImageIndex = 3
        object pnlEstruturadeCalculo: TPanel
          Left = 0
          Top = 0
          Width = 655
          Height = 323
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object dbgEstruturadeCalculo: TwwDBGrid
            Left = 1
            Top = 1
            Width = 653
            Height = 321
            Selected.Strings = (
              'DESCRICAO'#9'83'#9'Descrição'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsEstruturaCalculo
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
      end
    end
  end
  inherited Dock972: TDock97
    Width = 667
    object wwDBLookupCombo3: TwwDBLookupCombo
      Left = 440
      Top = 14
      Width = 212
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CODFONTEPAGADORA'#9'10'#9'CODFONTEPAGADORA'#9'F'
        'DESCRICAO'#9'50'#9'DESCRICAO'#9'F')
      DataField = 'CODFONTEPAGADORA'
      DataSource = ds
      LookupTable = qryFontepagadora
      LookupField = 'CODFONTEPAGADORA'
      TabOrder = 1
      Visible = False
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
    end
  end
  inherited Dock971: TDock97
    Top = 591
    Width = 667
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 608
    Top = 6
    TargetsData = (
      1
      1
      (
        ''
        'Filter'
        0))
  end
  inherited ds: TwwDataSource
    AutoEdit = False
    Left = 205
    Top = 110
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PROVDESC'
      'set'
      '  FLGDESCONTO = :FLGDESCONTO,'
      '  DESCPARCIAL = :DESCPARCIAL,'
      '  CODRUBCLT = :CODRUBCLT,'
      '  IDBENEFSALAR = :IDBENEFSALAR,'
      '  DESCRICAO = :DESCRICAO,'
      '  FLGIRRF = :FLGIRRF,'
      '  FLGFGTS = :FLGFGTS,'
      '  FLGINSS = :FLGINSS,'
      '  NUMPRIORIDADEFB = :NUMPRIORIDADEFB,'
      '  FLGINTERNO = :FLGINTERNO,'
      '  FLGCONSOLIDA = :FLGCONSOLIDA,'
      '  FLGCONSTAFOLHA = :FLGCONSTAFOLHA,'
      '  FLGOBRIGAFAVOREC = :FLGOBRIGAFAVOREC,'
      '  FLGNAOPAGAFAVOREC = :FLGNAOPAGAFAVOREC,'
      '  FLGRAIS = :FLGRAIS,'
      '  FLGUSO = :FLGUSO,'
      '  FLGESPECIAL = :FLGESPECIAL,'
      '  FLGINCIDECONTRIB = :FLGINCIDECONTRIB,'
      '  FLGINCIDESALPART = :FLGINCIDESALPART,'
      '  FLGCOMPOESALPART = :FLGCOMPOESALPART,'
      '  FLGCOMPOESALBENEF = :FLGCOMPOESALBENEF,'
      '  FLGPRORATA = :FLGPRORATA,'
      '  FLGTPRUBRICA = :FLGTPRUBRICA,'
      '  FLGCOMPOEREMTOTAL = :FLGCOMPOEREMTOTAL,'
      '  IDREGRA = :IDREGRA,'
      '  FLGDESCPENSAO = :FLGDESCPENSAO,'
      '  FLGATRASODEVOL = :FLGATRASODEVOL,'
      '  IDINFORME = :IDINFORME,'
      '  CODIRRFDARF = :CODIRRFDARF,'
      '  FLGSALPARTRETRO = :FLGSALPARTRETRO,'
      '  FLGSALBENEFRETRO = :FLGSALBENEFRETRO,'
      '  FLGSALPARTATUARIA = :FLGSALPARTATUARIA,'
      '  IDMODULO = :IDMODULO,'
      '  TIPOBASEDESCONTO = :TIPOBASEDESCONTO,'
      '  CODPROVDESC = :CODPROVDESC,'
      '  DESCRPROVDESC = :DESCRPROVDESC,'
      '  PRAZO = :PRAZO,'
      '  CODFONTEPAGADORA = :CODFONTEPAGADORA,'
      '  IDGRUPORUBRICA = :IDGRUPORUBRICA,'
      '  FLGESTADORUB = :FLGESTADORUB,'
      '  FLGIRRFACJUD = :FLGIRRFACJUD,'
      '  FLGRRA = :FLGRRA,'
      '  FLGVISUALIZACONV = :FLGVISUALIZACONV,'
      '  IDFUNDACAO = :IDFUNDACAO,'
      '  FLGAGRUPA = :FLGAGRUPA,'
      '  FLGRUBLEGAL = :FLGRUBLEGAL,'
      '  FLGMARGEM = :FLGMARGEM,'
      '  FLGEXIBEHIST = :FLGEXIBEHIST,'
      '  FLGENCERRAMENTO = :FLGENCERRAMENTO,'
      '  FLGPROPORCIONAL = :FLGPROPORCIONAL,'
      '  FLGACAOJUDICIAL = :FLGACAOJUDICIAL,'
      '  FLGIRRFINFORMATIVO= :FLGIRRFINFORMATIVO,'
      '  FLGBITRIBUTACAO= :FLGBITRIBUTACAO,'
      '  FLGDIVIDABENEFICIO=:FLGDIVIDABENEFICIO,'
      '  FLGCORRECAOMONETARIA = :FLGCORRECAOMONETARIA, '
      '  FLGCONTBENEFICIO = :FLGCONTBENEFICIO ,'
      '  FLGCONTABONO = :FLGCONTABONO,'
      '  FLGEXCLUICONTRIBPA = :FLGEXCLUICONTRIBPA,'
      '  CODIRRFDARFREG =:CODIRRFDARFREG,'
      '  IDINFORMEREG =:IDINFORMEREG,'
      '  IDGRUPORUBRICAREG=:IDGRUPORUBRICAREG,'
      '  IDCOLUNAMAPA = :IDCOLUNAMAPA,'
      '  CODNATREINF_PROG_BD = :CODNATREINF_PROG_BD, '
      '  CODNATREINF_PROG_CD = :CODNATREINF_PROG_CD, '
      '  CODNATREINF_REGR_BD = :CODNATREINF_REGR_BD, '
      '  CODNATREINF_REGR_CD = :CODNATREINF_REGR_CD, '
      '  CODNATREINF_EXTERIOR = :CODNATREINF_EXTERIOR'
      'where'
      '  IDPROVENTO = :OLD_IDPROVENTO'
      ' ')
    InsertSQL.Strings = (
      'insert into PROVDESC'
      '  (IDPROVENTO,'
      '   FLGDESCONTO,'
      '   DESCPARCIAL,'
      '   CODRUBCLT,'
      '   IDBENEFSALAR,'
      '   DESCRICAO,'
      '   FLGIRRF,'
      '   FLGFGTS,'
      '   FLGINSS,'
      '   NUMPRIORIDADEFB,'
      '   FLGINTERNO,'
      '   FLGCONSOLIDA,'
      '   FLGCONSTAFOLHA,'
      '   FLGOBRIGAFAVOREC,'
      '   FLGNAOPAGAFAVOREC,'
      '   FLGRAIS,'
      '   FLGUSO,'
      '   FLGESPECIAL,'
      '   FLGINCIDECONTRIB,'
      '   FLGINCIDESALPART,'
      '   FLGCOMPOESALPART,'
      '   FLGCOMPOESALBENEF,'
      '   FLGPRORATA,'
      '   FLGTPRUBRICA,'
      '   FLGCOMPOEREMTOTAL,'
      '   IDREGRA,'
      '   FLGDESCPENSAO,'
      '   FLGATRASODEVOL,'
      '   IDINFORME,'
      '   CODIRRFDARF,'
      '   FLGSALPARTRETRO,'
      '   FLGSALBENEFRETRO,'
      '   FLGSALPARTATUARIA,'
      '   IDMODULO,'
      '   TIPOBASEDESCONTO,'
      '   CODPROVDESC,'
      '   DESCRPROVDESC,'
      '   PRAZO,'
      '   CODFONTEPAGADORA,'
      '   IDGRUPORUBRICA,'
      '   FLGESTADORUB,'
      '   FLGIRRFACJUD,'
      '   IDFUNDACAO,'
      '   FLGAGRUPA,'
      '   FLGRUBLEGAL,'
      '   FLGMARGEM,'
      '   FLGVISUALIZACONV,'
      '   FLGRRA,'
      '   FLGEXIBEHIST,'
      '   FLGENCERRAMENTO,'
      '   FLGPROPORCIONAL,'
      '   FLGACAOJUDICIAL,'
      '   FLGIRRFINFORMATIVO,'
      '   FLGBITRIBUTACAO,'
      '   FLGDIVIDABENEFICIO,'
      '   FLGCORRECAOMONETARIA,'
      '   FLGCONTBENEFICIO,'
      '   FLGCONTABONO,'
      '   FLGEXCLUICONTRIBPA,'
      '   CODIRRFDARFREG,'
      '   IDINFORMEREG,'
      '   IDGRUPORUBRICAREG,'
      '  IDCOLUNAMAPA,'
      '  CODNATREINF_PROG_BD, '
      '  CODNATREINF_PROG_CD, '
      '  CODNATREINF_REGR_BD, '
      '  CODNATREINF_REGR_CD, '
      '  CODNATREINF_EXTERIOR)'
      'values'
      '  (:IDPROVENTO,'
      '   :FLGDESCONTO,'
      '   :DESCPARCIAL,'
      '   :CODRUBCLT,'
      '   :IDBENEFSALAR,'
      '   :DESCRICAO,'
      '   :FLGIRRF,'
      '   :FLGFGTS,'
      '   :FLGINSS,'
      '   :NUMPRIORIDADEFB,'
      '   :FLGINTERNO,'
      '   :FLGCONSOLIDA,'
      '   :FLGCONSTAFOLHA,'
      '   :FLGOBRIGAFAVOREC,'
      '   :FLGNAOPAGAFAVOREC,'
      '   :FLGRAIS,'
      '   :FLGUSO,'
      '   :FLGESPECIAL,'
      '   :FLGINCIDECONTRIB,'
      '   :FLGINCIDESALPART,'
      '   :FLGCOMPOESALPART,'
      '   :FLGCOMPOESALBENEF,'
      '   :FLGPRORATA,'
      '   :FLGTPRUBRICA,'
      '   :FLGCOMPOEREMTOTAL,'
      '   :IDREGRA,'
      '   :FLGDESCPENSAO,'
      '   :FLGATRASODEVOL,'
      '   :IDINFORME,'
      '   :CODIRRFDARF,'
      '   :FLGSALPARTRETRO,'
      '   :FLGSALBENEFRETRO,'
      '   :FLGSALPARTATUARIA,'
      '   :IDMODULO,'
      '   :TIPOBASEDESCONTO,'
      '   :CODPROVDESC,'
      '   :DESCRPROVDESC,'
      '   :PRAZO,'
      '   :CODFONTEPAGADORA,'
      '   :IDGRUPORUBRICA,'
      '   :FLGESTADORUB,'
      '   :FLGIRRFACJUD,'
      '   :IDFUNDACAO,'
      '   :FLGAGRUPA,'
      '   :FLGRUBLEGAL,'
      '   :FLGMARGEM,'
      '   :FLGVISUALIZACONV,'
      '   :FLGRRA,'
      '   :FLGEXIBEHIST,'
      '   :FLGENCERRAMENTO,'
      '   :FLGPROPORCIONAL,'
      '   :FLGACAOJUDICIAL,'
      '   :FLGIRRFINFORMATIVO,'
      '   :FLGBITRIBUTACAO,'
      '   :FLGDIVIDABENEFICIO,'
      '   :FLGCORRECAOMONETARIA,'
      '   :FLGCONTBENEFICIO,'
      '   :FLGCONTABONO,'
      '   :FLGEXCLUICONTRIBPA,'
      '   :CODIRRFDARFREG,'
      '   :IDINFORMEREG,'
      '   :IDGRUPORUBRICAREG,'
      '   :IDCOLUNAMAPA,'
      '   :CODNATREINF_PROG_BD, '
      '   :CODNATREINF_PROG_CD, '
      '   :CODNATREINF_REGR_BD, '
      '   :CODNATREINF_REGR_CD, '
      '   :CODNATREINF_EXTERIOR)'
      ' ')
    DeleteSQL.Strings = (
      'delete from PROVDESC'
      'where'
      '  IDPROVENTO = :OLD_IDPROVENTO')
    Left = 265
    Top = 406
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PROVDESC.IDPROVENTO'
      'PROVDESC.DESCRICAO'
      'PROVDESC.CODPROVDESC'
      'PROVDESC.DESCRPROVDESC')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código Interno'
      'Descrição Interna'
      'Código Externo'
      'Descrição Externa')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROVDESC')
    CamposChave.Strings = (
      'PROVDESC.IDPROVENTO'
      'PROVDESC.CODPROVDESC')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '130'
      '15'
      '130')
    Left = 557
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 177
    Top = 406
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 374
    Top = 2
  end
  inherited qry: TwwQuery
    AfterInsert = qryAfterInsert
    SQL.Strings = (
      'SELECT'
      '  PD.IDPROVENTO,'
      '  PD.FLGDESCONTO,'
      '  PD.DESCPARCIAL,'
      '  PD.CODRUBCLT,'
      '  PD.IDBENEFSALAR,'
      '  PD.DESCRICAO,'
      '  PD.FLGIRRF,'
      '  PD.FLGFGTS,'
      '  PD.FLGINSS,'
      '  PD.NUMPRIORIDADEFB,'
      '  PD.FLGINTERNO,'
      '  PD.FLGCONSOLIDA,'
      '  PD.FLGCONSTAFOLHA,'
      '  PD.FLGOBRIGAFAVOREC,'
      '  PD.FLGNAOPAGAFAVOREC,'
      '  PD.FLGRAIS,'
      '  PD.FLGUSO,'
      '  PD.FLGESPECIAL,'
      '  NVL(RXE.FLGSALFAMILIA,0) FLGSALFAMILIA,'
      '  PD.FLGINCIDECONTRIB,'
      '  PD.FLGINCIDESALPART,'
      '  PD.FLGCOMPOESALPART,'
      '  PD.FLGCOMPOESALBENEF,'
      '  PD.FLGPRORATA,'
      '  PD.FLGTPRUBRICA,'
      '  PD.FLGCOMPOEREMTOTAL,'
      '  PD.IDREGRA,'
      '  PD.FLGDESCPENSAO,'
      '  PD.FLGATRASODEVOL,'
      '  PD.IDINFORME,'
      '  PD.CODIRRFDARF,'
      '  PD.FLGSALPARTRETRO,'
      '  PD.FLGSALBENEFRETRO,'
      '  PD.FLGSALPARTATUARIA,'
      '  PD.IDMODULO,'
      '  PD.TIPOBASEDESCONTO,'
      '  PD.CODPROVDESC,'
      '  PD.DESCRPROVDESC,'
      '  PD.PRAZO,'
      '  PD.CODFONTEPAGADORA,'
      '  PD.IDGRUPORUBRICA,'
      '  PD.FLGESTADORUB,'
      '  PD.FLGIRRFACJUD,'
      '  PD.IDFUNDACAO,'
      '  PD.FLGAGRUPA,'
      '  PD.FLGRRA,'
      '  PD.FLGVISUALIZACONV,'
      '  PD.FLGRUBLEGAL,'
      '  PD.FLGMARGEM,'
      '  PD.FLGEXIBEHIST,'
      '  PD.FLGIRRFINFORMATIVO, --douglas.siqueira'
      '  PD.FLGREPROGRAMAR,'
      '  PD.FLGBITRIBUTACAO,'
      '  PD.FLGENCERRAMENTO,'
      '  PD.FLGPROPORCIONAL,'
      '  PD.FLGACAOJUDICIAL,'
      '  PD.FLGDIVIDABENEFICIO,'
      '  PD.FLGCORRECAOMONETARIA,'
      '  PD.FLGCONTBENEFICIO ,'
      '  PD.FLGCONTABONO,'
      '  PD.FLGEXCLUICONTRIBPA,'
      
        '  PD.CODIRRFDARFREG, PD.IDINFORMEREG, PD.IDGRUPORUBRICAREG  --15' +
        '1061'
      ', (SELECT COUNT(1)'
      '  FROM RUBXEVENTO'
      ' WHERE IDPROVENTO = :IDPROVENTO'
      '   AND IDMOTIVO = 3106) as DIRF_RESGATE,'
      'PD.IDCOLUNAMAPA,'
      'PD.CODNATREINF_PROG_BD,'
      'PD.CODNATREINF_PROG_CD,'
      'PD.CODNATREINF_REGR_BD,'
      'PD.CODNATREINF_REGR_CD,'
      'PD.CODNATREINF_EXTERIOR'
      'FROM PROVDESC PD, VW_RUBXEVENTO RXE'
      'WHERE PD.IDPROVENTO = RXE.IDPROVENTO(+)'
      '  AND PD.IDPROVENTO = :IDPROVENTO'
      ' '
      ' ')
    Left = 167
    Top = 480
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPROVENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPROVENTO'
        ParamType = ptUnknown
      end>
  end
  object qryRegra: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      'IDREGRA,'
      'NOMEREGRA '
      'FROM REGRA '
      'ORDER BY NOMEREGRA')
    ValidateWithMask = True
    Left = 567
    Top = 129
  end
  object qryInformerendimento: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDINFORME,NOMEINFORME'
      'FROM INFORME'
      'ORDER BY NOMEINFORME'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 575
    Top = 474
  end
  object qryIRRFDARF: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT CODNATUREZA, DESCRICAO, CODNATUREZA ||'#39' - '#39'|| DESCRICAO A' +
        'S JUNCAO'
      'FROM NATURENDIMENTO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 512
    Top = 463
  end
  object qryFontepagadora: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDFONTEPAGADORA,'
      '      DESCRICAO,'
      '      CODFONTEPAGADORA'
      'FROM'
      '    FONTEPAGADORA'
      'ORDER BY DESCRICAO'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 495
    Top = 130
  end
  object qryGrupoRubrica: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDGRUPORUBRICA, DESCRICAO'
      'FROM GRUPORUBRICA'
      'WHERE IDFUNDACAO = :PIDFUNDACAO'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 581
    Top = 420
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryEstruturadeCalculo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT EC.IDRUBRICAEXIBICAO, EXR.IDRUBRICA, EC.DESCRICAO'
      'FROM ESTRUTURACALCULO EC, ESTRUTURAXRUBRICA EXR'
      'WHERE EXR.IDESTRUTURA = EC.IDESTRUTURA'
      'AND EXR.IDRUBRICA = :PIDRUBRICA'
      'AND EC.IDFUNDACAO = :PIDFUNDACAO ')
    ValidateWithMask = True
    Left = 505
    Top = 409
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDRUBRICA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object dsEstruturaCalculo: TwwDataSource
    DataSet = qryEstruturadeCalculo
    Left = 434
    Top = 478
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 567
    Top = 74
  end
  object updRubxEvento: TUpdateSQL
    ModifySQL.Strings = (
      'update RUBXEVENTO'
      'set'
      '  IDMOTIVO = :IDMOTIVO, '
      '  IDREGRACALC = :IDREGRACALC'
      'where'
      '  IDPROVENTO = :OLD_IDPROVENTO')
    InsertSQL.Strings = (
      'insert into RUBXEVENTO'
      '  (IDPROVENTO, IDMOTIVO, IDREGRACALC)'
      'values'
      '  (:IDPROVENTO, :IDMOTIVO, :IDREGRACALC)'
      ' ')
    DeleteSQL.Strings = (
      'delete from RUBXEVENTO'
      'where IDMOTIVO = 1'
      'AND   IDPROVENTO = :OLD_IDPROVENTO')
    Left = 204
    Top = 177
  end
  object qryRubxEvento: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPROVENTO, IDMOTIVO, IDREGRACALC'
      '   FROM   RUBXEVENTO'
      ' WHERE IDPROVENTO = :IDPROVENTO'
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 284
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPROVENTO'
        ParamType = ptUnknown
      end>
  end
  object qryMapa: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      
        'SELECT C.IDCOLUNAMAPA,C.DESCRICAO FROM COLUNAMAPA C ORDER BY DES' +
        'CRICAO')
    ValidateWithMask = True
    Left = 56
    Top = 430
  end
  object dsMapa: TwwDataSource
    DataSet = qryMapa
    Left = 24
    Top = 430
  end
  object qryNaturezaReinf: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT CODNATUREZAREINF, DESCRICAO, SUBSTR(CODNATUREZAREINF ||'#39' ' +
        '- '#39'|| DESCRICAO,1,255) AS JUNCAO'
      'FROM NATUREZA_RENDIMENTO_REINF'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 496
    Top = 507
  end
end
