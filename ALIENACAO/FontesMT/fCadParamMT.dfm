inherited frmCadParamMT: TfrmCadParamMT
  Left = 505
  Top = 267
  HelpContext = 230005
  Caption = 'Parâmetros do Sistema'
  ClientHeight = 475
  ClientWidth = 635
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 635
    Height = 389
    object pcParam: TPageControl
      Left = 1
      Top = 1
      Width = 633
      Height = 387
      ActivePage = tsOper
      Align = alClient
      TabOrder = 0
      object tsGeral: TTabSheet
        Caption = 'Geral'
        ImageIndex = 2
        object PnlGeral: TPanel
          Left = 0
          Top = 0
          Width = 625
          Height = 359
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object dbchkNumProp: TDBCheckBox
            Left = 24
            Top = 32
            Width = 329
            Height = 17
            Caption = 'Gera Numeração Automática de Propostas'
            DataField = 'FLGNUMPROPOSTA'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object dbchkIntegraCAF: TDBCheckBox
            Left = 24
            Top = 64
            Width = 329
            Height = 17
            Caption = 'Integra com Ativo Fixo'
            DataField = 'FLGINTEGRAATIVO'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBCheckBox1: TDBCheckBox
            Left = 24
            Top = 96
            Width = 329
            Height = 17
            Caption = 'Integra com Contabilidade'
            DataField = 'FLGINTEGRACONTAB'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBCheckBox2: TDBCheckBox
            Left = 24
            Top = 128
            Width = 329
            Height = 17
            Caption = 'Integra com Contas a Pagar e Receber'
            DataField = 'FLGINTEGRACAPCAR'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object pnlDiario: TPanel
            Left = 8
            Top = 209
            Width = 345
            Height = 81
            TabOrder = 4
            object Label1: TLabel
              Left = 35
              Top = 32
              Width = 108
              Height = 13
              Caption = 'Competência (mês)'
            end
            object Label3: TLabel
              Left = 211
              Top = 32
              Width = 23
              Height = 13
              Caption = 'Ano'
            end
            object dbchkDiario: TDBCheckBox
              Left = 16
              Top = 8
              Width = 217
              Height = 17
              Caption = 'Gera Contabilização Diária'
              DataField = 'FLGDIARIO'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object cboMes: TwwDBComboBox
              Left = 35
              Top = 46
              Width = 169
              Height = 21
              ShowButton = True
              Style = csDropDownList
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
              Left = 211
              Top = 46
              Width = 65
              Height = 21
              Increment = 1
              DataField = 'ANOCOMPETENCIA'
              DataSource = ds
              TabOrder = 2
              UnboundDataType = wwDefault
            end
          end
          object dbCkbLogotipo: TDBCheckBox
            Left = 24
            Top = 160
            Width = 257
            Height = 17
            Caption = 'Imprimir Logotipo nos Relatórios'
            DataField = 'FLGLOGORELAT'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 5
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object GroupBox4: TGroupBox
            Left = 372
            Top = 206
            Width = 238
            Height = 83
            Caption = 'Código Do Imóvel'
            TabOrder = 6
            object DBCheckBox5: TDBCheckBox
              Left = 13
              Top = 23
              Width = 212
              Height = 17
              Caption = 'Gerar Automaticamente o código'
              DataField = 'FLGAUTCOD'
              DataSource = ds
              TabOrder = 0
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox6: TDBCheckBox
              Left = 13
              Top = 58
              Width = 219
              Height = 17
              Caption = 'Validar o preenchimento do código'
              DataField = 'FLGVALCOD'
              DataSource = ds
              TabOrder = 1
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
          end
        end
      end
      object tsPadrao: TTabSheet
        Caption = 'Padrão'
        ImageIndex = 2
        object pnlPadrao: TPanel
          Left = 0
          Top = 0
          Width = 625
          Height = 359
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object GroupBox2: TGroupBox
            Left = 64
            Top = 6
            Width = 449
            Height = 184
            Caption = ' Opções padrão para Receitas  (Integração Financeira) '
            TabOrder = 0
            object Label2: TLabel
              Left = 16
              Top = 18
              Width = 160
              Height = 13
              Caption = 'Centro de Responsabilidade'
            end
            object Label4: TLabel
              Left = 16
              Top = 56
              Width = 108
              Height = 13
              Caption = 'Atividade / Projeto'
            end
            object Label13: TLabel
              Left = 16
              Top = 96
              Width = 98
              Height = 13
              Caption = 'Centro de Custos'
            end
            object Label14: TLabel
              Left = 16
              Top = 136
              Width = 54
              Height = 13
              Caption = 'Programa'
            end
            object DBcboCentroRespon: TwwDBLookupCombo
              Left = 16
              Top = 32
              Width = 417
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'NOME')
              DataField = 'CODCENTRORESPON'
              DataSource = ds
              LookupTable = CdsCentroRespons
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
              Top = 70
              Width = 417
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'25'#9'NOME')
              DataField = 'UNIDNEGOC'
              DataSource = ds
              LookupTable = CdsAtividadeProj
              LookupField = 'UNIDNEGOC'
              Style = csDropDownList
              DropDownWidth = 249
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object dbcboCentroCusto: TwwDBLookupCombo
              Left = 16
              Top = 110
              Width = 417
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'25'#9'Nome'#9'F'
                'CODCENTROCUSTO'#9'10'#9'Código'#9'F')
              DataField = 'CODCENTROCUSTO'
              DataSource = ds
              LookupTable = cdsCentroCusto
              LookupField = 'CODCENTROCUSTO'
              Style = csDropDownList
              DropDownWidth = 249
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object dbcboPrograma: TwwDBLookupCombo
              Left = 16
              Top = 152
              Width = 417
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCPROGRAMA'#9'60'#9'DESCPROGRAMA'#9'F')
              DataField = 'IDPROGRAMA'
              DataSource = ds
              LookupTable = cdsPrograma
              LookupField = 'IDPROGRAMA'
              Style = csDropDownList
              DropDownWidth = 249
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
          end
          object GroupBox3: TGroupBox
            Left = 24
            Top = 201
            Width = 561
            Height = 101
            Caption = 'Permite filtros de integração financeira do tipo'
            TabOrder = 1
            object DBCheckBox18: TDBCheckBox
              Left = 24
              Top = 21
              Width = 241
              Height = 17
              Caption = 'Por contrato e tipo de despesa/receita'
              DataField = 'FLGPARTDCON'
              DataSource = ds
              TabOrder = 0
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox19: TDBCheckBox
              Left = 24
              Top = 40
              Width = 241
              Height = 17
              Caption = 'Por imóvel e tipo de despesa/receita'
              DataField = 'FLGPARTDIM'
              DataSource = ds
              TabOrder = 1
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox20: TDBCheckBox
              Left = 24
              Top = 60
              Width = 273
              Height = 17
              Caption = 'Por tipo de imóvel e tipo de despesa/receita'
              DataField = 'FLGPARTDTPIM'
              DataSource = ds
              TabOrder = 2
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox21: TDBCheckBox
              Left = 304
              Top = 21
              Width = 241
              Height = 17
              Caption = 'Somente por contrato'
              DataField = 'FLGPARCON'
              DataSource = ds
              TabOrder = 3
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox22: TDBCheckBox
              Left = 304
              Top = 40
              Width = 241
              Height = 17
              Caption = 'Somente por imóvel'
              DataField = 'FLGPARIM'
              DataSource = ds
              TabOrder = 4
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox23: TDBCheckBox
              Left = 304
              Top = 60
              Width = 241
              Height = 17
              Caption = 'Somente por tipo de despesa/receita'
              DataField = 'FLGPARTPDES'
              DataSource = ds
              TabOrder = 5
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox24: TDBCheckBox
              Left = 304
              Top = 79
              Width = 241
              Height = 17
              Caption = 'Somente por tipo de imóvel'
              DataField = 'FLGPARTPIM'
              DataSource = ds
              TabOrder = 6
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
          end
        end
      end
      object tsOper: TTabSheet
        Caption = 'Receitas / Operações'
        object pnlOper: TPanel
          Left = 0
          Top = 0
          Width = 625
          Height = 359
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object PageControl1: TPageControl
            Left = 0
            Top = 0
            Width = 625
            Height = 359
            ActivePage = tbsOperacoDiaria
            Align = alClient
            TabOrder = 0
            object tbsPagamento: TTabSheet
              Caption = 'Pagamentos / Parcelamento'
              object Label9: TLabel
                Left = 24
                Top = 18
                Width = 107
                Height = 13
                Caption = 'Pagamento a Vista'
              end
              object Label11: TLabel
                Left = 24
                Top = 114
                Width = 188
                Height = 13
                Caption = 'Pagamento de Amortização Extra'
              end
              object Label12: TLabel
                Left = 24
                Top = 66
                Width = 114
                Height = 13
                Caption = 'Pagamento de Sinal'
              end
              object Label5: TLabel
                Left = 24
                Top = 162
                Width = 122
                Height = 13
                Caption = 'Projeção de Parcelas'
              end
              object Label6: TLabel
                Left = 352
                Top = 18
                Width = 188
                Height = 13
                Caption = 'Prestação ( amortização + juros )'
              end
              object Label7: TLabel
                Left = 352
                Top = 114
                Width = 146
                Height = 13
                Caption = 'Provisionamento de Juros'
              end
              object Label8: TLabel
                Left = 352
                Top = 162
                Width = 112
                Height = 13
                Caption = 'Correção Monetária'
              end
              object dblcTipoAVista: TwwDBLookupCombo
                Left = 24
                Top = 32
                Width = 313
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCCUSTORECIMO'#9'30'#9'Tipo de Receita'#9'F')
                DataField = 'IDRECAVISTA'
                DataSource = ds
                LookupTable = CdsTipoCustoRecImov
                LookupField = 'IDTIPOCUSTORECIMO'
                Style = csDropDownList
                DropDownWidth = 8
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                ShowMatchText = True
              end
              object dblcTipoAmortiz: TwwDBLookupCombo
                Left = 24
                Top = 128
                Width = 313
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCCUSTORECIMO'#9'30'#9'Tipo de Receita'#9'F')
                DataField = 'IDRECAMORTEXTRA'
                DataSource = ds
                LookupTable = CdsTipoCustoRecImov
                LookupField = 'IDTIPOCUSTORECIMO'
                Style = csDropDownList
                DropDownWidth = 8
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                ShowMatchText = True
              end
              object dblcTipoSinal: TwwDBLookupCombo
                Left = 24
                Top = 80
                Width = 313
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCCUSTORECIMO'#9'30'#9'Tipo de Receita'#9'F')
                DataField = 'IDRECSINAL'
                DataSource = ds
                LookupTable = CdsTipoCustoRecImov
                LookupField = 'IDTIPOCUSTORECIMO'
                Style = csDropDownList
                DropDownWidth = 8
                TabOrder = 2
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                ShowMatchText = True
              end
              object dblcProjecao: TwwDBLookupCombo
                Left = 24
                Top = 176
                Width = 313
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCCUSTORECIMO'#9'30'#9'Tipo de Receita'#9'F')
                DataField = 'IDRECPROJECAO'
                DataSource = ds
                LookupTable = CdsTipoCustoRecImov
                LookupField = 'IDTIPOCUSTORECIMO'
                Style = csDropDownList
                DropDownWidth = 8
                TabOrder = 3
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                ShowMatchText = True
              end
              object dblcTipoParcela: TwwDBLookupCombo
                Left = 352
                Top = 32
                Width = 257
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCCUSTORECIMO'#9'30'#9'Tipo de Receita'#9'F')
                DataField = 'IDRECAMORTIZACAO'
                DataSource = ds
                LookupTable = CdsTipoCustoRecImov
                LookupField = 'IDTIPOCUSTORECIMO'
                Style = csDropDownList
                DropDownWidth = 8
                TabOrder = 4
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                ShowMatchText = True
              end
              object DBCheckBox3: TDBCheckBox
                Left = 352
                Top = 92
                Width = 137
                Height = 17
                Caption = 'Lançamento DIÁRIO'
                DataField = 'FLGCMJURDIARIO'
                DataSource = ds
                TabOrder = 5
                ValueChecked = '1'
                ValueUnchecked = '0'
                OnClick = DBCheckBox3Click
              end
              object wwDBLookupCombo1: TwwDBLookupCombo
                Left = 352
                Top = 128
                Width = 257
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCCUSTORECIMO'#9'30'#9'Tipo de Receita'#9'F')
                DataField = 'IDRECJUROS'
                DataSource = ds
                LookupTable = CdsTipoCustoRecImov
                LookupField = 'IDTIPOCUSTORECIMO'
                Style = csDropDownList
                DropDownWidth = 8
                TabOrder = 6
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                ShowMatchText = True
              end
              object wwDBLookupCombo2: TwwDBLookupCombo
                Left = 352
                Top = 176
                Width = 257
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCCUSTORECIMO'#9'30'#9'Tipo de Receita'#9'F')
                DataField = 'IDRECCORRECAO'
                DataSource = ds
                LookupTable = CdsTipoCustoRecImov
                LookupField = 'IDTIPOCUSTORECIMO'
                Style = csDropDownList
                DropDownWidth = 8
                TabOrder = 7
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                ShowMatchText = True
              end
              object gbAcordo: TGroupBox
                Left = 24
                Top = 208
                Width = 585
                Height = 97
                Caption = ' Acordo '
                TabOrder = 8
                object Label26: TLabel
                  Left = 311
                  Top = 52
                  Width = 202
                  Height = 13
                  Caption = 'Provisionamento de Juros (Acordo) '
                end
                object Label27: TLabel
                  Left = 309
                  Top = 12
                  Width = 164
                  Height = 13
                  Caption = 'Correção Monetária (Acordo)'
                end
                object Label28: TLabel
                  Left = 16
                  Top = 18
                  Width = 188
                  Height = 13
                  Caption = 'Prestação ( amortização + juros )'
                end
                object wwDBLookupCombo15: TwwDBLookupCombo
                  Left = 312
                  Top = 68
                  Width = 257
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCCUSTORECIMO'#9'30'#9'Tipo de Receita'#9'F')
                  DataField = 'IDRECJUROSAC'
                  DataSource = ds
                  LookupTable = CdsTipoCustoRecImov
                  LookupField = 'IDTIPOCUSTORECIMO'
                  Style = csDropDownList
                  DropDownWidth = 8
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = False
                  ShowMatchText = True
                end
                object wwDBLookupCombo16: TwwDBLookupCombo
                  Left = 311
                  Top = 28
                  Width = 257
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCCUSTORECIMO'#9'30'#9'Tipo de Receita'#9'F')
                  DataField = 'IDRECCORRAC'
                  DataSource = ds
                  LookupTable = CdsTipoCustoRecImov
                  LookupField = 'IDTIPOCUSTORECIMO'
                  Style = csDropDownList
                  DropDownWidth = 8
                  TabOrder = 1
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = False
                  ShowMatchText = True
                end
                object wwDBLookupCombo17: TwwDBLookupCombo
                  Left = 16
                  Top = 32
                  Width = 257
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCCUSTORECIMO'#9'30'#9'Tipo de Receita'#9'F')
                  DataField = 'IDRECAMORTAC'
                  DataSource = ds
                  LookupTable = CdsTipoCustoRecImov
                  LookupField = 'IDTIPOCUSTORECIMO'
                  Style = csDropDownList
                  DropDownWidth = 8
                  TabOrder = 2
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = False
                  ShowMatchText = True
                end
              end
            end
            object tbsOperacoDiaria: TTabSheet
              Caption = 'Operações Diárias'
              ImageIndex = 2
              object Label15: TLabel
                Left = 24
                Top = 16
                Width = 120
                Height = 13
                Caption = 'Atualização de Multa'
              end
              object Label17: TLabel
                Left = 24
                Top = 62
                Width = 119
                Height = 13
                Caption = 'Atualização de Juros'
              end
              object Label16: TLabel
                Left = 24
                Top = 108
                Width = 200
                Height = 13
                Caption = 'Atualização de Correção Monetária'
              end
              object Label18: TLabel
                Left = 24
                Top = 154
                Width = 155
                Height = 13
                Caption = 'Provisionamento de Perdas'
              end
              object Label10: TLabel
                Left = 24
                Top = 200
                Width = 137
                Height = 13
                Caption = 'Atualização de Resíduo'
              end
              object Label22: TLabel
                Left = 328
                Top = 16
                Width = 172
                Height = 13
                Caption = 'Atualização de Multa (Acordo)'
              end
              object Label23: TLabel
                Left = 328
                Top = 62
                Width = 171
                Height = 13
                Caption = 'Atualização de Juros (Acordo)'
              end
              object Label24: TLabel
                Left = 328
                Top = 108
                Width = 252
                Height = 13
                Caption = 'Atualização de Correção Monetária (Acordo)'
              end
              object Label25: TLabel
                Left = 328
                Top = 154
                Width = 207
                Height = 13
                Caption = 'Provisionamento de Perdas (Acordo)'
              end
              object wwDBLookupCombo3: TwwDBLookupCombo
                Left = 24
                Top = 30
                Width = 289
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCCUSTORECIMO'#9'30'#9'Tipo de Receita'#9'F')
                DataField = 'IDOPERATUALMULTA'
                DataSource = ds
                LookupTable = cdsTipoOper
                LookupField = 'IDTIPOCUSTORECIMO'
                Style = csDropDownList
                DropDownWidth = 8
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
              object wwDBLookupCombo5: TwwDBLookupCombo
                Left = 24
                Top = 76
                Width = 289
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCCUSTORECIMO'#9'30'#9'Tipo de Receita'#9'F')
                DataField = 'IDOPERATUALJUROS'
                DataSource = ds
                LookupTable = cdsTipoOper
                LookupField = 'IDTIPOCUSTORECIMO'
                Style = csDropDownList
                DropDownWidth = 8
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
              object wwDBLookupCombo4: TwwDBLookupCombo
                Left = 24
                Top = 122
                Width = 289
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCCUSTORECIMO'#9'30'#9'Tipo de Receita'#9'F')
                DataField = 'IDOPERATUALCM'
                DataSource = ds
                LookupTable = cdsTipoOper
                LookupField = 'IDTIPOCUSTORECIMO'
                Style = csDropDownList
                DropDownWidth = 8
                TabOrder = 2
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
              object wwDBLookupCombo6: TwwDBLookupCombo
                Left = 24
                Top = 168
                Width = 289
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCCUSTORECIMO'#9'30'#9'Tipo de Receita'#9'F')
                DataField = 'IDOPERPROVPER'
                DataSource = ds
                LookupTable = cdsTipoOper
                LookupField = 'IDTIPOCUSTORECIMO'
                Style = csDropDownList
                DropDownWidth = 8
                TabOrder = 3
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
              object wwDBLookupCombo7: TwwDBLookupCombo
                Left = 24
                Top = 214
                Width = 289
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCCUSTORECIMO'#9'30'#9'Tipo de Receita'#9'F')
                DataField = 'IDOPERATUALRES'
                DataSource = ds
                LookupTable = cdsTipoOper
                LookupField = 'IDTIPOCUSTORECIMO'
                Style = csDropDownList
                DropDownWidth = 8
                TabOrder = 4
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
              object DBCheckBox4: TDBCheckBox
                Left = 24
                Top = 249
                Width = 294
                Height = 17
                Caption = 'Atualiza DATA PROGRAMADA dos documentos'
                DataField = 'FLGATUALDATAPROG'
                DataSource = ds
                TabOrder = 5
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object wwDBLookupCombo11: TwwDBLookupCombo
                Left = 328
                Top = 30
                Width = 289
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCCUSTORECIMO'#9'30'#9'Tipo de Receita'#9'F')
                DataField = 'IDOPERATMULTAC'
                DataSource = ds
                LookupTable = cdsTipoOper
                LookupField = 'IDTIPOCUSTORECIMO'
                Style = csDropDownList
                DropDownWidth = 8
                TabOrder = 6
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
              object wwDBLookupCombo12: TwwDBLookupCombo
                Left = 328
                Top = 76
                Width = 289
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCCUSTORECIMO'#9'30'#9'Tipo de Receita'#9'F')
                DataField = 'IDOPERATJURAC'
                DataSource = ds
                LookupTable = cdsTipoOper
                LookupField = 'IDTIPOCUSTORECIMO'
                Style = csDropDownList
                DropDownWidth = 8
                TabOrder = 7
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
              object wwDBLookupCombo13: TwwDBLookupCombo
                Left = 328
                Top = 122
                Width = 289
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCCUSTORECIMO'#9'30'#9'Tipo de Receita'#9'F')
                DataField = 'IDOPERATCMAC'
                DataSource = ds
                LookupTable = cdsTipoOper
                LookupField = 'IDTIPOCUSTORECIMO'
                Style = csDropDownList
                DropDownWidth = 8
                TabOrder = 8
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
              object wwDBLookupCombo14: TwwDBLookupCombo
                Left = 328
                Top = 168
                Width = 289
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCCUSTORECIMO'#9'30'#9'Tipo de Receita'#9'F')
                DataField = 'IDOPERPROVPERAC'
                DataSource = ds
                LookupTable = cdsTipoOper
                LookupField = 'IDTIPOCUSTORECIMO'
                Style = csDropDownList
                DropDownWidth = 8
                TabOrder = 9
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
              object grbPathETL: TGroupBox
                Left = 18
                Top = 272
                Width = 587
                Height = 57
                Caption = 'Caminho de Criação do Arquivo ETL'
                TabOrder = 10
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
            object tbsAbono: TTabSheet
              Caption = 'Abonos'
              ImageIndex = 3
              object Label19: TLabel
                Left = 176
                Top = 32
                Width = 32
                Height = 13
                Caption = 'Multa'
              end
              object Label20: TLabel
                Left = 176
                Top = 78
                Width = 31
                Height = 13
                Caption = 'Juros'
              end
              object Label21: TLabel
                Left = 176
                Top = 124
                Width = 112
                Height = 13
                Caption = 'Correção Monetária'
              end
              object wwDBLookupCombo8: TwwDBLookupCombo
                Left = 176
                Top = 46
                Width = 289
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCCUSTORECIMO'#9'30'#9'Tipo de Receita'#9'F')
                DataField = 'IDOPERABONOMULTA'
                DataSource = ds
                LookupTable = cdsTipoOper
                LookupField = 'IDTIPOCUSTORECIMO'
                Style = csDropDownList
                DropDownWidth = 8
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
              object wwDBLookupCombo9: TwwDBLookupCombo
                Left = 176
                Top = 92
                Width = 289
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCCUSTORECIMO'#9'30'#9'Tipo de Receita'#9'F')
                DataField = 'IDOPERABONOJUROS'
                DataSource = ds
                LookupTable = cdsTipoOper
                LookupField = 'IDTIPOCUSTORECIMO'
                Style = csDropDownList
                DropDownWidth = 8
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
              object wwDBLookupCombo10: TwwDBLookupCombo
                Left = 176
                Top = 138
                Width = 289
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCCUSTORECIMO'#9'30'#9'Tipo de Receita'#9'F')
                DataField = 'IDOPERABONOCM'
                DataSource = ds
                LookupTable = cdsTipoOper
                LookupField = 'IDTIPOCUSTORECIMO'
                Style = csDropDownList
                DropDownWidth = 8
                TabOrder = 2
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
              object GroupBox1: TGroupBox
                Left = 152
                Top = 176
                Width = 345
                Height = 112
                Caption = ' Resíduos '
                TabOrder = 3
                object Label31: TLabel
                  Left = 24
                  Top = 24
                  Width = 204
                  Height = 13
                  Caption = 'Abono por adiantamento de resíduo'
                end
                object Label32: TLabel
                  Left = 23
                  Top = 64
                  Width = 147
                  Height = 13
                  Caption = 'Abono  de resíduo normal'
                end
                object wwDBLookupCombo20: TwwDBLookupCombo
                  Left = 24
                  Top = 38
                  Width = 289
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCCUSTORECIMO'#9'30'#9'Tipo de Receita'#9'F')
                  DataField = 'IDOPERABONORESA'
                  DataSource = ds
                  LookupTable = cdsTipoOper
                  LookupField = 'IDTIPOCUSTORECIMO'
                  Style = csDropDownList
                  DropDownWidth = 8
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                end
                object wwDBLookupCombo21: TwwDBLookupCombo
                  Left = 24
                  Top = 78
                  Width = 289
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCCUSTORECIMO'#9'30'#9'Tipo de Receita'#9'F')
                  DataField = 'IDOPERABONORESN'
                  DataSource = ds
                  LookupTable = cdsTipoOper
                  LookupField = 'IDTIPOCUSTORECIMO'
                  Style = csDropDownList
                  DropDownWidth = 8
                  TabOrder = 1
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                end
              end
            end
          end
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'Cobranças e Inadimplências'
        ImageIndex = 3
        object Label29: TLabel
          Left = 32
          Top = 218
          Width = 107
          Height = 13
          Caption = 'Alterador de CPMF'
        end
        object Label30: TLabel
          Left = 32
          Top = 266
          Width = 221
          Height = 13
          Caption = 'Alterador de Adiantamento de Resíduo'
        end
        inline molRegra: TmolRegraDB
          Left = 24
          Top = 16
          Width = 561
          inherited Regra: TLabel
            Width = 163
            Caption = 'Regra para Cálculo de Multa'
          end
          inherited sbHelpRegra: TSpeedButton
            Left = 520
          end
          inherited DBedtRegra: TDBEdit
            Width = 425
            DataField = 'NOMEREGRA'
            DataSource = ds
          end
          inherited btnBuscaRegra: TBitBtn
            Left = 472
          end
          inherited btnLimpaRegra: TBitBtn
            Left = 496
          end
          inherited DBedtIDRegra: TDBEdit
            DataField = 'IDREGRAMULTA'
            DataSource = ds
          end
        end
        object DBRadioGroup1: TDBRadioGroup
          Left = 32
          Top = 71
          Width = 507
          Height = 49
          Caption = ' Tipo de Data Programada  '
          Columns = 2
          DataField = 'FLGTIPODATAPROG'
          DataSource = ds
          Items.Strings = (
            'Vencimento'
            'Limite')
          TabOrder = 1
          Values.Strings = (
            'V'
            'L')
        end
        object dbrdgrpProcessoCorrecao: TDBRadioGroup
          Left = 32
          Top = 136
          Width = 507
          Height = 65
          Caption = ' Processo de Correção '
          DataField = 'FLGINDMESANTERIOR'
          DataSource = ds
          Items.Strings = (
            
              'Utilizar apenas o indice do ultimo mês anterior, quando não exis' +
              'tir o indice corrente'
            
              'Utilizar o indice do mês anterior para todo o período de inadimp' +
              'lência')
          TabOrder = 2
          Values.Strings = (
            '1'
            '0')
        end
        object wwDBLookupCombo18: TwwDBLookupCombo
          Left = 32
          Top = 232
          Width = 505
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'Descrição'#9'F')
          DataField = 'CODALTERADORCPMF'
          DataSource = ds
          LookupTable = cdsTipoAlterador
          LookupField = 'CODALTERADOR'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
        end
        object wwDBLookupCombo19: TwwDBLookupCombo
          Left = 32
          Top = 280
          Width = 505
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'Descrição'#9'F')
          DataField = 'CODALTERADORADRES'
          DataSource = ds
          LookupTable = cdsTipoAlterador
          LookupField = 'CODALTERADOR'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 4
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 635
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Width = 33
        Enabled = False
        Glyph.Data = {00000000}
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 33
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 134
        Width = 32
        Enabled = False
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 93
        Width = 41
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 436
    Width = 635
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 930
    Top = 55
    TargetsData = (
      1
      1
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited ds: TwwDataSource
    Left = 176
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 856
    Top = 63
  end
  inherited CmeCadastro: TCmEventosCadastro
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
    Left = 240
    Top = 16
  end
  inherited Cds: TCMClientDataSet
    ProviderName = 'DataSetProvider1'
    OnCalcFields = CdsCalcFields
    Left = 208
    Top = 0
    object CdsIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object CdsUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
    end
    object CdsCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      FixedChar = True
      Size = 10
    end
    object CdsFLGNUMPROPOSTA: TStringField
      FieldName = 'FLGNUMPROPOSTA'
      FixedChar = True
      Size = 1
    end
    object CdsFLGDIARIO: TStringField
      FieldName = 'FLGDIARIO'
      FixedChar = True
      Size = 1
    end
    object CdsFLGINTEGRAATIVO: TStringField
      FieldName = 'FLGINTEGRAATIVO'
      FixedChar = True
      Size = 1
    end
    object CdsIDRECAVISTA: TFloatField
      FieldName = 'IDRECAVISTA'
    end
    object CdsIDRECAMORTIZACAO: TFloatField
      FieldName = 'IDRECAMORTIZACAO'
    end
    object CdsIDRECCORRECAO: TFloatField
      FieldName = 'IDRECCORRECAO'
    end
    object CdsIDRECAMORTEXTRA: TFloatField
      FieldName = 'IDRECAMORTEXTRA'
    end
    object CdsIDRECSINAL: TFloatField
      FieldName = 'IDRECSINAL'
    end
    object CdsIDRECJUROS: TFloatField
      FieldName = 'IDRECJUROS'
    end
    object CdsIDRECPROJECAO: TFloatField
      FieldName = 'IDRECPROJECAO'
    end
    object CdsIDRECPERDAS: TFloatField
      FieldName = 'IDRECPERDAS'
    end
    object CdsFLGPARIM: TStringField
      FieldName = 'FLGPARIM'
      FixedChar = True
      Size = 1
    end
    object CdsFLGPARCON: TStringField
      FieldName = 'FLGPARCON'
      FixedChar = True
      Size = 1
    end
    object CdsFLGPARTPIM: TStringField
      FieldName = 'FLGPARTPIM'
      FixedChar = True
      Size = 1
    end
    object CdsFLGPARTPDES: TStringField
      FieldName = 'FLGPARTPDES'
      FixedChar = True
      Size = 1
    end
    object CdsFLGPARTDIM: TStringField
      FieldName = 'FLGPARTDIM'
      FixedChar = True
      Size = 1
    end
    object CdsFLGPARTDCON: TStringField
      FieldName = 'FLGPARTDCON'
      FixedChar = True
      Size = 1
    end
    object CdsFLGPARTDTPIM: TStringField
      FieldName = 'FLGPARTDTPIM'
      FixedChar = True
      Size = 1
    end
    object CdsFLGINTEGRACONTAB: TStringField
      FieldName = 'FLGINTEGRACONTAB'
      FixedChar = True
      Size = 1
    end
    object CdsFLGINTEGRACAPCAR: TStringField
      FieldName = 'FLGINTEGRACAPCAR'
      FixedChar = True
      Size = 1
    end
    object CdsMESCOMPETENCIA: TFloatField
      FieldName = 'MESCOMPETENCIA'
    end
    object CdsANOCOMPETENCIA: TFloatField
      FieldName = 'ANOCOMPETENCIA'
    end
    object CdsIDPROGRAMA: TFloatField
      FieldName = 'IDPROGRAMA'
    end
    object CdsCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
    object CdsIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
    end
    object CdsFLGLOGORELAT: TStringField
      FieldName = 'FLGLOGORELAT'
      FixedChar = True
      Size = 1
    end
    object CdsIDOPERATUALCM: TFloatField
      FieldName = 'IDOPERATUALCM'
    end
    object CdsIDOPERATUALMULTA: TFloatField
      FieldName = 'IDOPERATUALMULTA'
    end
    object CdsIDOPERATUALJUROS: TFloatField
      FieldName = 'IDOPERATUALJUROS'
    end
    object CdsIDOPERPROVPER: TFloatField
      FieldName = 'IDOPERPROVPER'
    end
    object CdsTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object CdsTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Size = 30
    end
    object CdsIDREGRAMULTA: TFloatField
      FieldName = 'IDREGRAMULTA'
    end
    object CdsNOMEREGRA: TStringField
      DisplayWidth = 60
      FieldKind = fkCalculated
      FieldName = 'NOMEREGRA'
      Size = 60
      Calculated = True
    end
    object CdsFLGCMJURDIARIO: TFloatField
      FieldName = 'FLGCMJURDIARIO'
    end
    object CdsIDRECCORRSALDO: TFloatField
      FieldName = 'IDRECCORRSALDO'
    end
    object CdsFLGATUALDATAPROG: TFloatField
      FieldName = 'FLGATUALDATAPROG'
    end
    object CdsIDOPERATUALRES: TFloatField
      FieldName = 'IDOPERATUALRES'
    end
    object CdsFLGTIPODATAPROG: TStringField
      FieldName = 'FLGTIPODATAPROG'
      FixedChar = True
      Size = 1
    end
    object CdsIDOPERABONOMULTA: TFloatField
      FieldName = 'IDOPERABONOMULTA'
    end
    object CdsIDOPERABONOJUROS: TFloatField
      FieldName = 'IDOPERABONOJUROS'
    end
    object CdsIDOPERABONOCM: TFloatField
      FieldName = 'IDOPERABONOCM'
    end
    object CdsIDOPERATMULTAC: TFloatField
      FieldName = 'IDOPERATMULTAC'
    end
    object CdsIDOPERATJURAC: TFloatField
      FieldName = 'IDOPERATJURAC'
    end
    object CdsIDOPERATCMAC: TFloatField
      FieldName = 'IDOPERATCMAC'
    end
    object CdsIDOPERPROVPERAC: TFloatField
      FieldName = 'IDOPERPROVPERAC'
    end
    object CdsIDRECJUROSAC: TFloatField
      FieldName = 'IDRECJUROSAC'
    end
    object CdsIDRECCORRAC: TFloatField
      FieldName = 'IDRECCORRAC'
    end
    object CdsFLGINDMESANTERIOR: TFloatField
      FieldName = 'FLGINDMESANTERIOR'
    end
    object CdsIDRECAMORTAC: TFloatField
      FieldName = 'IDRECAMORTAC'
    end
    object CdsDTULTFECH: TDateTimeField
      FieldName = 'DTULTFECH'
    end
    object CdsCODALTERADORCPMF: TFloatField
      FieldName = 'CODALTERADORCPMF'
    end
    object CdsCODALTERADORADRES: TFloatField
      FieldName = 'CODALTERADORADRES'
    end
    object CdsIDOPERABONORESN: TFloatField
      FieldName = 'IDOPERABONORESN'
    end
    object CdsIDOPERABONORESA: TFloatField
      FieldName = 'IDOPERABONORESA'
    end
    object CdsFLGAUTCOD: TStringField
      FieldName = 'FLGAUTCOD'
      Size = 1
    end
    object CdsFLGVALCOD: TStringField
      FieldName = 'FLGVALCOD'
      Size = 1
    end
    object CdsPATHETLPRODUCAO: TStringField
      FieldName = 'PATHETLPRODUCAO'
      Size = 250
    end
    object CdsPATHETLHOM: TStringField
      FieldName = 'PATHETLHOM'
      Size = 250
    end
  end
  inherited MontaSelect: TMontaSelect
    Left = 288
    Top = 0
  end
  object CdsTipoCustoRecImov: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 464
    object CdsTipoCustoRecImovDESCCUSTORECIMO: TStringField
      DisplayLabel = 'Receita / Despesa'
      DisplayWidth = 60
      FieldName = 'DESCCUSTORECIMO'
      Size = 60
    end
    object CdsTipoCustoRecImovFLGDIARIO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGDIARIO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsTipoCustoRecImovIDTIPOCUSTORECIMO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOCUSTORECIMO'
      Visible = False
    end
    object CdsTipoCustoRecImovRECCUSTO: TStringField
      DisplayWidth = 1
      FieldName = 'RECCUSTO'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object CdsCentroRespons: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 496
    Top = 71
    object CdsCentroResponsCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      FixedChar = True
      Size = 10
    end
    object CdsCentroResponsNOME: TStringField
      FieldName = 'NOME'
      FixedChar = True
      Size = 30
    end
  end
  object CdsAtividadeProj: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 431
    Top = 79
    object CdsAtividadeProjUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
    end
    object CdsAtividadeProjNOME: TStringField
      FieldName = 'NOME'
      Size = 25
    end
  end
  object cdsCentroCusto: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 495
    Top = 133
    Data = {
      DA1B00009619E0BD01000000180000000F00570000000300000050020E434F44
      43454E54524F435553544F01004900000002000753554254595045020049000A
      0046697865644368617200055749445448020002000A00094944454D50524553
      4108000400000000001149445553554152494F494E434C5553414F0800040000
      0000000949445553554152494F0800040000000000044E4F4D45010049000000
      0100055749445448020002001E000E535441545553475255504F434443010049
      00000002000753554254595045020049000A0046697865644368617200055749
      4454480200020001000B524553504F4E534156454C0100490000000200075355
      4254595045020049000A00466978656443686172000557494454480200020014
      000B434F44524544555A49444F01004900000002000753554254595045020049
      000A004669786564436861720005574944544802000200030005415449564F01
      004900000002000753554254595045020049000A004669786564436861720005
      57494454480200020001000D5452474454494E434C5553414F08000800000000
      000F54524755534552494E434C5553414F010049000000010005574944544802
      0002001E000A434F44434F525245535001004900000001000557494454480200
      02001E000A494450524F4752414D4108000400000000000A434F444558544552
      4E4F01004900000002000753554254595045020049000A004669786564436861
      7200055749445448020002000A000E4944504C414E43454E5443555354080004
      00000000000100044C4349440400010009080000004040400104313330300000
      000000000040000000008096C44005434F414445014105434F41444501530024
      4D5A79BCCC4207434D31303534310431333030000000000000F03F0040404001
      04313430300000000000000040000000008096C44005434F474543014105434F
      474543015300A0DF5A79BCCC4207434D31303534310431343030000000000000
      F03F004040400104313230300000000000000040000000008096C440054A5552
      49440141054A55524944015300CC2B5B79BCCC4207434D313035343104313230
      30000000000000F03F0040404001043731303000000000000000400000000080
      96C44005434F534547014105434F534547015300209B5B79BCCC4207434D3130
      3534310437313030000000000000F03F00404040010437323030000000000000
      0040000000008096C44005434F494E46014105434F494E4601530080085C79BC
      CC4207434D31303534310437323030000000000000F03F004040400104383130
      300000000000000040000000008096C44005434F415449014105434F41544901
      5300705E5C79BCCC4207434D31303534310438313030000000000000F03F0040
      40400104383230300000000000000040000000008096C44005434F5249410141
      05434F52494101530014975C79BCCC4207434D31303534310438323030000000
      000000F03F004040400004383230330000000000000040000000008096C44005
      47454143490141054745414349015300E03BEE85BCCC4207434D313035343100
      000000000014400438323033000000000000F03F004040400103343231000000
      000000004000000000004EC4400F444541494D202D2053454D2055534F014105
      444541494D01530090398CB4ABCC4204434D393003343231000000000000F03F
      004040400103343232000000000000004000000000004EC4400F444550414420
      2853454D2055534F290141054445504144015300586C8CB4ABCC4204434D3930
      03343232000000000000F03F0040404001033432330000000000000040000000
      00004EC4400F4445524548202D2053454D2055534F0141054445524548015300
      A4898CB4ABCC4204434D393003343233000000000000F03F0040004001033432
      34000000000000004000000000004EC4400F4445494E46202D2053454D205553
      4F0141054445494E4603343234015300FCA48CB4ABCC4204434D393003343234
      000000000000F03F004040400103333131000000000000004000000000004EC4
      400F4153444553202D2053454D2055534F0141054153444553015300486348FD
      ABCC4204434D393003333131000000000000F03F004040400104323232310000
      00000000004000000000004EC4400F5345544553203D2053454D2055534F0141
      1453494C56494E454920412E204445204A45535553015300780AD3B4ABCC4204
      434D39300432323231000000000000F03F004040400104323232320000000000
      00004000000000004EC4400F5345434F54202D2053454D2055534F0141064D41
      4E4F454C0153007C33D3B4ABCC4204434D39300432323232000000000000F03F
      004040400103333031000000000000004000000000004EC4400F43454E415020
      2D2053454D2055534F0141054449534547015300941CEBB4ABCC4204434D3930
      03333031000000000000F03F0040404001043332313100000000000000400000
      0000004EC4400F5345424543202D2053454D2055534F01410544454142450153
      004CA5EBB4ABCC4204434D39300433323131000000000000F03F004000400103
      323232000000000000004000000000004EC4400F4445414649202D2053454D20
      55534F0141074544554152444F03323232015300E0BDD5B4ABCC4204434D3930
      03323232000000000000F03F0040404001013600000000000000400000000000
      80564009436F6E73656C686F73015309436F6E73656C686F73015300CC15D142
      ACCC4204434D39300136000000000000F03F0040404001043332313200000000
      0000004000000000004EC4400F5345424555202D2053454D2055534F01410544
      4541424501530020D6EBB4ABCC4204434D39300433323132000000000000F03F
      00404040010433323231000000000000004000000000004EC4400F5345434144
      202D2053454D2055534F0141054445524543015300641EECB4ABCC4204434D39
      300433323231000000000000F03F004040400104333232320000000000000040
      00000000004EC4400F534552454C202D2053454D2055534F0141054445524543
      0153006847ECB4ABCC4204434D39300433323232000000000000F03F00404040
      0103363031000000000000004000000000004EC4401E436F6E73656C686F2044
      656C69626572617469766F2D2053454D2055534F015312436F6E732E2044656C
      69626572617469766F01530000B4D142ACCC4204434D39300336303100000000
      0000F03F004040400103363032000000000000004000000000004EC44019436F
      6E73656C686F2046697363616C202D2053454D2055534F01530F436F6E73656C
      686F2046697363616C0153001CD9D142ACCC4204434D39300336303200000000
      0000F03F004040400103353030000000000000004000000000004EC440184761
      62696E657465204449464953202D2053454D2055534F01411442454E544F204C
      55495A20444520414755494152015300DC01BA44ACCC4204434D393003353030
      000000000000F03F00404040010434323431000000000000004000000000004E
      C44010534544455320202D2053454D2055534F0141054445494E460153006066
      EEB4ABCC4204434D39300434323431000000000000F03F004040400104343234
      32000000000000004000000000004EC4400F5345535550202D2053454D205553
      4F0141054445494E460153001C9BEEB4ABCC4204434D39300434323432000000
      000000F03F00404040010132000000000000004000000000004EC4400F444946
      494E202D2053454D2055534F015305444946494E01530044BD86B4ABCC420443
      4D39300132000000000000F03F00404040010131000000000000004000000000
      004EC4400544495052450153054449505245015300049E86B4ABCC4204434D39
      300131000000000000F03F00404040010133000000000000004000000000004E
      C4400F4449534547202D2053454D2055534F0153054449534547015300C0D286
      B4ABCC4204434D39300133000000000000F03F00404040010134000000000000
      004000000000004EC4400F4449524144202D2053454D2055534F015305444952
      41440153003CE886B4ABCC4204434D39300134000000000000F03F0040404001
      0135000000000000004000000000004EC4400F4449464953202D2053454D2055
      534F0153054449464953015300A00187B4ABCC4204434D393001350000000000
      00F03F00404040010139000000000000004000000000004EC440055245464552
      0153055245464552015300101987B4ABCC4204434D39300139000000000000F0
      3F004040400103313030000000000000004000000000004EC44018476162696E
      657465204449505245202D2053454D2055534F0141054449505245015300F047
      87B4ABCC4204434D393003313030000000000000F03F00404040010332303000
      0000000000004000000000004EC44018476162696E65746520444946494E202D
      2053454D2055534F014105444946494E015300DC7487B4ABCC4204434D393003
      323030000000000000F03F004040400103333030000000000000004000000000
      004EC44018476162696E657465204449534547202D2053454D2055534F014105
      44495345470153001C9487B4ABCC4204434D393003333030000000000000F03F
      004040400103343030000000000000004000000000004EC44016476162696E65
      74652044495241442053454D2055534F01410544495241440153005CB387B4AB
      CC4204434D393003343030000000000000F03F00404040010331313100000000
      0000004000000000004EC4400F44454A5552202D2053454D2055534F01410544
      454A5552015300982688B4ABCC4204434D393003313131000000000000F03F00
      4040400103313132000000000000004000000000004EC4400F4445434F53202D
      2053454D2055534F0141054445434F53015300A84D88B4ABCC4204434D393003
      313132000000000000F03F004040400103313133000000000000004000000000
      004EC4400D415544494E2053454D2055534F014105415544494E015300DC6E88
      B4ABCC4204434D393003313133000000000000F03F0040404001033231310000
      00000000004000000000004EC440104153534F4320202D2053454D2055534F01
      41104341524C4F532046524544455249434F015300D41689B4ABCC4204434D39
      3003323131000000000000F03F00404040010332313200000000000000400000
      0000004EC4400F4153414E49202D2053454D2055534F0141064D494755454C01
      53002C3289B4ABCC4204434D393003323132000000000000F03F004040400103
      323231000000000000004000000000004EC4400F4445434F4E202D2053454D20
      55534F01410E4341524C4F532053414E544F524F015300485789B4ABCC420443
      4D393003323231000000000000F03F0040404001033232330000000000000040
      00000000004EC4400F4445494E56202D2053454D2055534F0141054445494E56
      01530000DA8AB4ABCC4204434D393003323233000000000000F03F0040404001
      03333231000000000000004000000000004EC4400F4445414245202D2053454D
      2055534F014105444541424501530004808BB4ABCC4204434D39300333323100
      0000000000F03F004040400103333232000000000000004000000000004EC440
      0F4445524543202D2053454D2055534F01410544455245430153002CA38BB4AB
      CC4204434D393003333232000000000000F03F00404040010334313100000000
      0000004000000000806AC4400F41534F4D45202853454D2055534F2901410541
      534F4D450153007CE98BB4ABCC4204434D393003343131000000000000F03F00
      4040400103323133000000000000004000000000004EC4400F41534F4D45202D
      2053454D2055534F01410E44454E4953452050455354414E41015300143ABD97
      B3CC4207434D313032333603323133000000000000F03F004040400103323234
      000000000000004000000000004EC4400E444541494D202D53454D2055534F01
      4105444541494D015300F8F45C9AB3CC4207434D313034353303323234000000
      000000F03F004040400103323235000000000000004000000000004EC4400F44
      45504144202D2053454D2055534F01410544455041440153001C6C5D9AB3CC42
      07434D313034353303323235000000000000F03F004040400103323236000000
      000000004000000000004EC4400F4445524548202D2053454D2055534F014105
      444552454801530034D3609AB3CC4207434D3130343533033232360000000000
      00F03F004040400103323237000000000000004000000000004EC4400F444549
      4E46202D2053454D2055534F0141054445494E460153003C25619AB3CC420743
      4D313034353303323237000000000000F03F0040404001043232373100000000
      0000004000000000004EC4400F5345444553202D2053454D2055534F01410544
      45494E46015300C861619AB3CC4207434D313034353304323237310000000000
      00F03F00404040010432323732000000000000004000000000004EC4400F5345
      535550202D2053454D2055534F0141054445494E46015300C08C619AB3CC4207
      434D31303435330432323732000000000000F03F004040400103313134000000
      000000004000000000004EC4400F4445504143202D2053454D2055534F014105
      4445504143015300CC6B7577B9CC4207434D3130343533033131340000000000
      00F03F00404040010431313231000000000000004000000000004EC4400F4345
      4E4150202D2053454D2055534F0141054445434F5301530010B7B377B9CC4207
      434D31303234300431313231000000000000F03F004040400103313230000000
      000000004000000000004EC440054A555249440153054A55524944015300B49B
      600DBCCC4207434D313033393603313230000000000000F03F00404040010331
      39390000000000000040000000008096C4400544495052450141054449505245
      015300081D5E0DBCCC4207434D313033393603313939000000000000F03F0040
      404001033131300000000000000040000000008096C44005415544494E014105
      415544494E0153008426600DBCCC4207434D3130333936033131300000000000
      00F03F004040400104313230310000000000000040000000008096C44005434F
      4E5445014105434F4E5445015300909B610DBCCC4207434D3130333936043132
      3031000000000000F03F00404040010431323032000000000000004000000000
      8096C44005434F4E5355014105434F4E5355015300FC06620DBCCC4207434D31
      303339360431323032000000000000F03F004040400103313330000000000000
      0040000000008096C44005434F414445015305434F414445015300A0BC620DBC
      CC4207434D313033393603313330000000000000F03F00404040010431333031
      0000000000000040000000008096C440054745504C4F0141054745504C4F0153
      00E058630DBCCC4207434D31303339360431333031000000000000F03F004040
      400104313330320000000000000040000000008096C440054745434F45014105
      4745434F4501530044EF630DBCCC4207434D3130333936043133303200000000
      0000F03F0040404001033134300000000000000040000000008096C44005434F
      474543015305434F4745430153001474640DBCCC4207434D3130333936033134
      30000000000000F03F0040404001043134303100000000000000400000000080
      96C44005474550454E014105474550454E015300F41F650DBCCC4207434D3130
      3339360431343031000000000000F03F00404040010431343032000000000000
      0040000000008096C4400547454154490141054745415449015300B477660DBC
      CC4207434D31303339360431343032000000000000F03F004040400103363130
      0000000000000040000000008096C44005434F44454C014105434F44454C0153
      00A4C7670DBCCC4207434D313033393603363130000000000000F03F00404040
      01033632300000000000000040000000008096C44005434F464953014105434F
      464953015300949A680DBCCC4207434D313033393603363230000000000000F0
      3F00404040010137000000000000004000000000004EC44005444942454F0153
      05444942454F015300AC90690DBCCC4207434D31303339360137000000000000
      F03F0040404001033739390000000000000040000000008096C4400544494245
      4F014105444942454F015300A4386A0DBCCC4207434D31303339360337393900
      0000000000F03F004040400103373130000000000000004000000000004EC440
      05434F534547015305434F534547015300A4326B0DBCCC4207434D3130333936
      03373130000000000000F03F0040404001043731303100000000000000400000
      00008096C440054745434150014105474543415001530004A06B0DBCCC420743
      4D31303339360437313031000000000000F03F00404040010437313032000000
      0000000040000000008096C44005474541424501410547454142450153005C38
      6C0DBCCC4207434D31303339360437313032000000000000F03F004040400104
      373130330000000000000040000000008096C440054745434152014105474543
      415201530098AB6C0DBCCC4207434D31303339360437313033000000000000F0
      3F004040400103373230000000000000004000000000004EC44005434F494E46
      015305434F494E460153007416710DBCCC4207434D3130333936033732300000
      00000000F03F004040400104373230310000000000000040000000008096C440
      0547454150410141054745415041015300988D710DBCCC4207434D3130333936
      0437323031000000000000F03F00404040010437323032000000000000004000
      0000008096C4400547454C4F4701410547454C4F47015300B8DB710DBCCC4207
      434D31303339360437323032000000000000F03F004040400101380000000000
      00004000000000004EC4400544494649440153054449464944015300201E720D
      BCCC4207434D31303339360138000000000000F03F0040404001033839390000
      000000000040000000008096C4400544494649440141054449464944015300D8
      A6720DBCCC4207434D313033393603383939000000000000F03F004040400103
      383130000000000000004000000000004EC44005434F415449015305434F4154
      490153008431730DBCCC4207434D313033393603383130000000000000F03F00
      4040400104383130310000000000000040000000008096C44005474554454301
      41054745544543014E0054B6730DBCCC4207434D313033393604383130310000
      00000000F03F004040400104383130320000000000000040000000008096C440
      05474541545501410547454154550153005433740DBCCC4207434D3130333936
      0438313032000000000000F03F00404040010338323000000000000000400000
      0000004EC44005434F524941015305434F524941015300B077740DBCCC420743
      4D313033393603383230000000000000F03F0040404001043832303100000000
      00000040000000008096C440054745494E560141054745494E560153003CB474
      0DBCCC4207434D31303339360438323031000000000000F03F00404040010438
      3230320000000000000040000000008096C440054745434F460141054745434F
      4601530074FE740DBCCC4207434D31303339360438323032000000000000F03F
      004050401503313530000000000000004000000000AB5A37410E476162696E65
      746520444950524501410153003886462FBECC4209434D31353330353339}
    object cdsCentroCustoNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 25
      FieldName = 'NOME'
      Size = 30
    end
    object cdsCentroCustoCODCENTROCUSTO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
    object cdsCentroCustoIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Visible = False
    end
    object cdsCentroCustoCODREDUZIDO: TStringField
      FieldName = 'CODREDUZIDO'
      Visible = False
      FixedChar = True
      Size = 3
    end
  end
  object cdsPrograma: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 399
    Top = 125
    object cdsProgramaDESCPROGRAMA: TStringField
      DisplayWidth = 60
      FieldName = 'DESCPROGRAMA'
      Size = 60
    end
    object cdsProgramaIDPROGRAMA: TFloatField
      FieldName = 'IDPROGRAMA'
      Visible = False
    end
  end
  object cdsTipoOper: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 560
    Top = 32
    object StringField1: TStringField
      DisplayLabel = 'Receita / Despesa'
      DisplayWidth = 60
      FieldName = 'DESCCUSTORECIMO'
      Size = 60
    end
    object StringField2: TStringField
      DisplayWidth = 1
      FieldName = 'FLGDIARIO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object FloatField1: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOCUSTORECIMO'
      Visible = False
    end
    object StringField3: TStringField
      DisplayWidth = 1
      FieldName = 'RECCUSTO'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 600
    Top = 8
  end
  object sqlTeste: TCMSqlParams
    SQL.Strings = (
      'select * from paramalienacao')
    ClientDataSet = Cds
    Left = 352
  end
  object cdsTipoAlterador: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 584
    Top = 128
  end
end
