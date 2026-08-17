inherited frmParamAPrevCS: TfrmParamAPrevCS
  Left = 481
  Top = 146
  Caption = 'Parâmetros do Sistema de Administração Previdenciária'
  ClientHeight = 464
  ClientWidth = 672
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 672
    Height = 378
    object pgctrlParam: TPageControl
      Left = 1
      Top = 1
      Width = 670
      Height = 376
      ActivePage = tbsGeral
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnChange = pgctrlParamChange
      object tbsGeral: TTabSheet
        Caption = 'Gerais'
        object pnlGerais: TPanel
          Left = 0
          Top = 0
          Width = 662
          Height = 348
          Align = alClient
          BevelOuter = bvLowered
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object DBCheckBox1: TDBCheckBox
            Left = 12
            Top = 6
            Width = 304
            Height = 17
            Caption = 'Oferecer Certificado de Inscrição ao Participante'
            DataField = 'FLGIMPCERTIF'
            DataSource = ds
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox3: TDBCheckBox
            Left = 12
            Top = 26
            Width = 139
            Height = 17
            Caption = 'Multifundação'
            DataField = 'FLGMULTIFUNDACAO'
            DataSource = ds
            TabOrder = 1
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object gbPrevidenciario: TGroupBox
            Left = 10
            Top = 191
            Width = 535
            Height = 71
            Caption = ' Previdenciário '
            TabOrder = 5
            object dbcbFlgIntContab: TDBCheckBox
              Left = 10
              Top = 14
              Width = 193
              Height = 18
              Caption = 'Integrado com Contabilidade'
              DataField = 'FLGINTCONTAB'
              DataSource = ds
              TabOrder = 0
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object dbcbFlgIntCPagarPrev: TDBCheckBox
              Left = 10
              Top = 31
              Width = 195
              Height = 18
              Caption = 'Integrado com Contas a Pagar'
              DataField = 'FLGINTCPAGARPREV'
              DataSource = ds
              TabOrder = 1
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object dbcbFLGINTCRECEBERPR: TDBCheckBox
              Left = 10
              Top = 48
              Width = 209
              Height = 18
              Caption = 'Integrado com Contas a Receber'
              DataField = 'FLGINTCRECEBERPR'
              DataSource = ds
              TabOrder = 2
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object chkbxflgintfundacao: TDBCheckBox
              Left = 269
              Top = 13
              Width = 231
              Height = 17
              Caption = 'Gerar integração para a Fundação'
              DataField = 'FLGINTFUNDACAO'
              DataSource = ds
              TabOrder = 3
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object gbDocumentoSpc: TGroupBox
            Left = 10
            Top = 265
            Width = 259
            Height = 65
            TabOrder = 6
            Visible = False
            object Label22: TLabel
              Left = 5
              Top = 10
              Width = 251
              Height = 27
              AutoSize = False
              Caption = 'Documento correspondente ao código da Fundação no SPC'
              WordWrap = True
            end
            object dblkpcmbNomeDocumento: TwwDBLookupCombo
              Left = 6
              Top = 38
              Width = 247
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEDOCUMENTO'#9'30'#9'Nome do Documento')
              DataField = 'IDDOCUMENTO'
              DataSource = ds
              LookupTable = qryTipoDocPessoa
              LookupField = 'IDDOCUMENTO'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
          end
          object DBCheckBox5: TDBCheckBox
            Left = 12
            Top = 47
            Width = 304
            Height = 17
            Caption = 'Exibir Situações marcadas como "Gerais"'
            DataField = 'FLGMOSTRASITGERAL'
            DataSource = ds
            TabOrder = 2
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object GroupBox4: TGroupBox
            Left = 285
            Top = 265
            Width = 259
            Height = 65
            TabOrder = 7
            object Label23: TLabel
              Left = 5
              Top = 10
              Width = 246
              Height = 27
              AutoSize = False
              Caption = 'Grau de Instrução correspondente a "Universitário"'
              WordWrap = True
            end
            object wwDBLookupCombo12: TwwDBLookupCombo
              Left = 6
              Top = 38
              Width = 247
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'30'#9'Descrição'#9'F')
              DataField = 'IDGRINSTR'
              DataSource = ds
              LookupTable = qryGrau
              LookupField = 'IDGRINSTR'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
          end
          object DBCheckBox7: TDBCheckBox
            Left = 12
            Top = 67
            Width = 448
            Height = 17
            Caption = 
              'Atualizar matrículas dos funcionários da fundação no Previdenciá' +
              'rio'
            DataField = 'FLGATUMATRICULA'
            DataSource = ds
            TabOrder = 3
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox8: TDBCheckBox
            Left = 12
            Top = 88
            Width = 448
            Height = 17
            Caption = 'Gerar rubricas de contribuição e benefícios automaticamente'
            DataField = 'FLGRUBRICAAUTO'
            DataSource = ds
            TabOrder = 4
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox9: TDBCheckBox
            Left = 12
            Top = 108
            Width = 448
            Height = 17
            Caption = 'Liberar reordenação do histórico de reservas'
            DataField = 'FLGACERTARESERVA'
            DataSource = ds
            TabOrder = 8
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox10: TDBCheckBox
            Left = 12
            Top = 129
            Width = 549
            Height = 17
            Caption = 
              'Conta Tempo de Serviço na Inscrição do Participante/Evento Manut' +
              'enção Saldo de Contas'
            DataField = 'FLGCONTATEMPINSC'
            DataSource = ds
            TabOrder = 9
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox11: TDBCheckBox
            Left = 12
            Top = 149
            Width = 333
            Height = 17
            Caption = 'Permitir salário de participação ZERADO na inscrição'
            DataField = 'FLGINSCSALZERO'
            DataSource = ds
            TabOrder = 10
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox13: TDBCheckBox
            Left = 12
            Top = 170
            Width = 396
            Height = 17
            Caption = 'Não permitir visualização de rubricas do Folha de Pagamentos'
            DataField = 'FLGCONTROLERUB'
            DataSource = ds
            TabOrder = 11
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      object tbsContrib: TTabSheet
        Caption = 'Contribuições'
        object pnlContribuicoes: TPanel
          Left = 0
          Top = 0
          Width = 662
          Height = 348
          Align = alClient
          BevelOuter = bvLowered
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object grpTpReserva: TGroupBox
            Left = 12
            Top = 15
            Width = 361
            Height = 106
            Caption = 'Máscara de Tipo de Reserva'
            TabOrder = 0
            object Panel2: TPanel
              Left = 225
              Top = 12
              Width = 127
              Height = 85
              BevelOuter = bvLowered
              TabOrder = 0
              object Label6: TLabel
                Left = 3
                Top = 3
                Width = 40
                Height = 13
                Caption = 'Exemplo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -10
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Edit1: TEdit
                Left = 45
                Top = 18
                Width = 76
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -10
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                Text = '99.999.999'
              end
              object Edit2: TEdit
                Left = 45
                Top = 57
                Width = 76
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -10
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                Text = '__.___.___'
              end
            end
            object pnlMascara: TPanel
              Left = 6
              Top = 12
              Width = 202
              Height = 85
              BevelOuter = bvNone
              TabOrder = 1
              object Label7: TLabel
                Left = 9
                Top = 18
                Width = 55
                Height = 13
                Caption = 'Definição'
              end
              object Label8: TLabel
                Left = 9
                Top = 57
                Width = 58
                Height = 13
                Caption = 'Resultado'
              end
              object edInput: TEdit
                Left = 73
                Top = 15
                Width = 121
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -10
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 12
                ParentFont = False
                TabOrder = 0
                OnExit = edInputExit
                OnKeyPress = edInputKeyPress
              end
              object edDisplay: TEdit
                Left = 73
                Top = 49
                Width = 121
                Height = 21
                TabStop = False
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -10
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 10
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
              end
            end
          end
          object GroupBox5: TGroupBox
            Left = 12
            Top = 128
            Width = 361
            Height = 57
            Caption = ' Auxilio Doença '
            TabOrder = 1
            object dbckCobraContADoenca: TDBCheckBox
              Left = 12
              Top = 22
              Width = 304
              Height = 17
              Caption = 'Cobrar Contribuição no Evento Auxílio Doença'
              DataField = 'FLGCOBCONTAUXDOE'
              DataSource = ds
              TabOrder = 0
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object GroupBox12: TGroupBox
            Left = 12
            Top = 194
            Width = 361
            Height = 67
            Caption = 'Geração de Contribuição Patronal de Participante Assistido '
            TabOrder = 2
            object dbckCobracontpatr: TDBCheckBox
              Left = 12
              Top = 32
              Width = 277
              Height = 17
              Caption = 'Gerar no Preparo da Folha de Benefícios'
              DataField = 'FLGCOBPATROFOLHA'
              DataSource = ds
              TabOrder = 0
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object DBRadioGroup1: TDBRadioGroup
            Left = 12
            Top = 269
            Width = 361
            Height = 46
            Caption = ' Reinscrição - Trazer Opções Preenchidas '
            Columns = 2
            DataField = 'FLGNAOTRAZOP'
            DataSource = ds
            Items.Strings = (
              'Sim'
              'Não')
            TabOrder = 3
            Values.Strings = (
              '0'
              '1')
          end
          object GroupBox3: TGroupBox
            Left = 380
            Top = 15
            Width = 261
            Height = 50
            Caption = ' Tratamento de divergências'
            TabOrder = 4
            object dbchkAcumAlter: TDBCheckBox
              Left = 12
              Top = 21
              Width = 225
              Height = 17
              Caption = 'Acumular valores de alteradores'
              DataField = 'FLGACUMALTER'
              DataSource = ds
              TabOrder = 0
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object GroupBox13: TGroupBox
            Left = 380
            Top = 71
            Width = 261
            Height = 50
            Caption = ' Nível das informações contábeis '
            TabOrder = 5
            object DBCheckBox2: TDBCheckBox
              Left = 12
              Top = 17
              Width = 225
              Height = 21
              Caption = ' Buscar informações individual'
              DataField = 'FLGINFCONTABINDIV'
              DataSource = ds
              TabOrder = 0
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object GroupBox15: TGroupBox
            Left = 380
            Top = 128
            Width = 261
            Height = 41
            Caption = ' Reserva (p/Padrão de Mov.de Reservas) '
            TabOrder = 6
            object dbckAceitaReservaNegativa: TDBCheckBox
              Left = 12
              Top = 18
              Width = 225
              Height = 17
              Caption = 'Fundação aceita reserva negativa'
              DataField = 'FLGRESNEGATIVA'
              DataSource = ds
              TabOrder = 0
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object grbInfParcelamento: TGroupBox
            Left = 380
            Top = 224
            Width = 261
            Height = 91
            Caption = 'Informações para Parcelamento'
            TabOrder = 7
            object Label30: TLabel
              Left = 15
              Top = 12
              Width = 191
              Height = 26
              Caption = 'Margem para Desconto em Folha (sobre o salário de participação)'
              WordWrap = True
            end
            object Label31: TLabel
              Left = 23
              Top = 42
              Width = 42
              Height = 13
              Caption = 'Mínimo'
            end
            object Label33: TLabel
              Left = 159
              Top = 42
              Width = 10
              Height = 13
              Caption = '%'
            end
            object Label39: TLabel
              Left = 159
              Top = 70
              Width = 10
              Height = 13
              Caption = '%'
            end
            object Label32: TLabel
              Left = 22
              Top = 70
              Width = 43
              Height = 13
              Caption = 'Máximo'
            end
            object wwDBEdit2: TwwDBEdit
              Left = 80
              Top = 38
              Width = 73
              Height = 21
              DataField = 'PERCMINDESC'
              DataSource = ds
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object wwDBEdit3: TwwDBEdit
              Left = 80
              Top = 66
              Width = 73
              Height = 21
              DataField = 'PERCMAXDESC'
              DataSource = ds
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
          object GroupBox17: TGroupBox
            Left = 380
            Top = 176
            Width = 261
            Height = 45
            Caption = '  Demissão da Patrocinadora  '
            TabOrder = 8
            object DBCheckBox12: TDBCheckBox
              Left = 12
              Top = 16
              Width = 225
              Height = 17
              Caption = 'Não efetuar acertos no evento'
              DataField = 'FLGNAOACERTCONTDP'
              DataSource = ds
              TabOrder = 0
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
        end
      end
      object tbsBenef: TTabSheet
        Caption = 'Benefícios'
        object pnlBeneficios: TPanel
          Left = 0
          Top = 0
          Width = 662
          Height = 348
          Align = alClient
          BevelOuter = bvLowered
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object dbrgpSimulaBenef: TDBRadioGroup
            Left = 8
            Top = 197
            Width = 320
            Height = 34
            Caption = ' Grava Simulação de Benefício '
            Columns = 2
            DataField = 'FLGGRAVASIMULABEN'
            DataSource = ds
            Items.Strings = (
              'Sim'
              'Não')
            TabOrder = 1
            TabStop = True
            Values.Strings = (
              '1'
              '0')
          end
          object GroupBox1: TGroupBox
            Left = 332
            Top = 8
            Width = 319
            Height = 113
            Caption = ' Recadastramento '
            TabOrder = 4
            object Label13: TLabel
              Left = 15
              Top = 61
              Width = 165
              Height = 13
              Caption = 'Documento a ser pesquisado'
            end
            object DbrgPesquisa: TDBRadioGroup
              Left = 15
              Top = 20
              Width = 249
              Height = 38
              Caption = ' Pesquisar por '
              Columns = 2
              DataField = 'FLGCPOBUSCA'
              DataSource = ds
              Items.Strings = (
                'Matrícula'
                'Documento')
              TabOrder = 0
              Values.Strings = (
                '0'
                '1')
              OnChange = DbrgPesquisaClick
              OnClick = DbrgPesquisaClick
            end
            object dblcDocumento: TwwDBLookupCombo
              Left = 15
              Top = 77
              Width = 249
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEDOCUMENTO'#9'30'#9'Documento'#9'F')
              DataField = 'TIPODOCBUSCA'
              DataSource = ds
              LookupTable = qryDocumento
              LookupField = 'IDDOCUMENTO'
              Enabled = False
              TabOrder = 1
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
          end
          object GroupBox2: TGroupBox
            Left = 8
            Top = 8
            Width = 320
            Height = 188
            Caption = ' Retenção / Encerramento '
            TabOrder = 0
            object Label24: TLabel
              Left = 8
              Top = 16
              Width = 194
              Height = 13
              Caption = 'Regra para Cálculo de Maioridade'
            end
            object Label10: TLabel
              Left = 28
              Top = 144
              Width = 275
              Height = 13
              Caption = 'inclusive dos Beneficiários que não eram retidos'
            end
            object Label16: TLabel
              Left = 28
              Top = 171
              Width = 185
              Height = 13
              Caption = 'o número de beneficiários ativos'
            end
            object DbChbxAtualizaGF: TDBCheckBox
              Left = 8
              Top = 157
              Width = 288
              Height = 16
              Hint = 
                'Indica se o sistema deve atualizar os percentuais de pensão auto' +
                'máticamente '
              Caption = 'Atualizar Percentual de pensão de acordo com '
              DataField = 'FLGATUPERCGF'
              DataSource = ds
              ParentShowHint = False
              ShowHint = True
              TabOrder = 5
              ValueChecked = '1'
              ValueUnchecked = '0'
              OnClick = dbchkMatPensionistaClick
            end
            object DBCheckBox4: TDBCheckBox
              Left = 8
              Top = 129
              Width = 297
              Height = 17
              Caption = 'Recalcular Benefícios na Liberação de Retidos'
              DataField = 'FLGLIBRECALCBEN'
              DataSource = ds
              TabOrder = 4
              ValueChecked = '1'
              ValueUnchecked = '0'
              OnClick = dbchkMatPensionistaClick
            end
            object DBCheckBox6: TDBCheckBox
              Left = 8
              Top = 111
              Width = 297
              Height = 19
              Caption = 'Recalcular Benefícios na Liberação de Retidos'
              DataField = 'FLGLIBRECALC'
              DataSource = ds
              TabOrder = 3
              ValueChecked = '1'
              ValueUnchecked = '0'
              OnClick = dbchkMatPensionistaClick
            end
            object dbckhFlgRetDataant: TDBCheckBox
              Left = 8
              Top = 94
              Width = 288
              Height = 19
              Hint = 
                'Indica se o sistema deve permitir que a data da retenção seja an' +
                'terior ao último mês em que o benefício foi pago normalmente'
              Caption = 'Permitir Retenção Anterior a Ult. Pagamento'
              DataField = 'FLGRETDATAANT'
              DataSource = ds
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              ValueChecked = '1'
              ValueUnchecked = '0'
              OnClick = dbchkMatPensionistaClick
            end
            object dbrgrpTipoAcertoFL: TDBRadioGroup
              Left = 8
              Top = 54
              Width = 305
              Height = 38
              Caption = 'Enviar Acertos Pós-Morte para'
              Columns = 2
              DataField = 'FLGTIPOACERTOFL'
              DataSource = ds
              Items.Strings = (
                'Beneficiários'
                'Conta do Participante')
              TabOrder = 1
              Values.Strings = (
                '0'
                '1')
            end
            object dblcRegraRetencao: TwwDBLookupCombo
              Left = 8
              Top = 30
              Width = 241
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'60'#9'Regra')
              DataField = 'IDREGRAMOTIVO'
              DataSource = ds
              LookupTable = qryRegra
              LookupField = 'IDREGRA'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
          end
          object GroupBox8: TGroupBox
            Left = 8
            Top = 234
            Width = 320
            Height = 46
            Caption = 'Forma de Pagamento de Benefício Vitalício'
            TabOrder = 2
            object wwDBLookupCombo15: TwwDBLookupCombo
              Left = 13
              Top = 17
              Width = 268
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'40'#9'Tipo Pagamento'#9'F')
              DataField = 'IDTPPGBENVITAL'
              DataSource = ds
              LookupTable = qryTpPagto
              LookupField = 'IDTPPAGTOBENEFIC'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
          end
          object GroupBox9: TGroupBox
            Left = 8
            Top = 280
            Width = 320
            Height = 58
            Caption = 'Limite de Dias para Pagamento Retroativo '
            TabOrder = 3
            object Label29: TLabel
              Left = 112
              Top = 15
              Width = 177
              Height = 41
              AutoSize = False
              Caption = 'Quantidade máxima de dias para processar pagamento retroativo.'
              WordWrap = True
            end
            object wwDBEdit1: TwwDBEdit
              Left = 12
              Top = 17
              Width = 89
              Height = 21
              DataField = 'QTDDIASRETRBENEF'
              DataSource = ds
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
          object grpMatPensionista: TGroupBox
            Left = 332
            Top = 131
            Width = 319
            Height = 100
            TabOrder = 5
            object Label1: TLabel
              Left = 13
              Top = 15
              Width = 149
              Height = 13
              Caption = 'Regra para Cálculo do DV'
            end
            object Label5: TLabel
              Left = 14
              Top = 53
              Width = 49
              Height = 13
              Caption = 'Máscara'
            end
            object wwDBLookupCombo3: TwwDBLookupCombo
              Left = 13
              Top = 29
              Width = 241
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'60'#9'Regra')
              DataField = 'IDRGDIGMATPENS'
              DataSource = ds
              LookupTable = qryRegra
              LookupField = 'IDREGRA'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object wwDBEdit4: TwwDBEdit
              Left = 13
              Top = 67
              Width = 89
              Height = 21
              DataField = 'MASCMATPENS'
              DataSource = ds
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
          object dbchkMatPensionista: TDBCheckBox
            Left = 339
            Top = 127
            Width = 306
            Height = 19
            Caption = 'Matrícula de pensionista gerada automaticamente'
            DataField = 'FLGINCAUTMATPENS'
            DataSource = ds
            TabOrder = 6
            ValueChecked = '1'
            ValueUnchecked = '0'
            OnClick = dbchkMatPensionistaClick
          end
          object GroupBox7: TGroupBox
            Left = 332
            Top = 234
            Width = 319
            Height = 104
            Caption = 'Outros'
            TabOrder = 7
            object Label17: TLabel
              Left = 11
              Top = 13
              Width = 203
              Height = 30
              AutoSize = False
              Caption = 
                'Regra de cálculo da margem para parcelamento de dívida na revisã' +
                'o'
              WordWrap = True
            end
            object Label12: TLabel
              Left = 11
              Top = 63
              Width = 229
              Height = 18
              AutoSize = False
              Caption = 'Regra de dados contábeis individuais'
              WordWrap = True
            end
            object cmbRegraMargemParc: TwwDBLookupCombo
              Left = 11
              Top = 41
              Width = 241
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'60'#9'Regra')
              DataField = 'IDRGMARGEMCONSIG'
              DataSource = ds
              LookupTable = qryRegra
              LookupField = 'IDREGRA'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object cmbRgContabBenef: TwwDBLookupCombo
              Left = 11
              Top = 77
              Width = 241
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'60'#9'Regra')
              DataField = 'IDRGCONTABBENEF'
              DataSource = ds
              LookupTable = qryRegra
              LookupField = 'IDREGRA'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
          end
        end
      end
      object tbsMotivos: TTabSheet
        Caption = 'Motivos'
        object pnlMotivos: TPanel
          Left = 0
          Top = 0
          Width = 662
          Height = 348
          Align = alClient
          BevelOuter = bvLowered
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object PageControl1: TPageControl
            Left = 1
            Top = 1
            Width = 660
            Height = 346
            ActivePage = tbsMotivoFolha
            Align = alClient
            TabOrder = 0
            object tbsMotivoContrib: TTabSheet
              Caption = 'Contribuições '
              object Panel1: TPanel
                Left = 0
                Top = 0
                Width = 652
                Height = 318
                Align = alClient
                BevelOuter = bvLowered
                TabOrder = 0
                object Label9: TLabel
                  Left = 12
                  Top = 11
                  Width = 367
                  Height = 13
                  Caption = 'Motivo para Cobrança de Contribuições Previdenciárias [padrão]'
                end
                object Label2: TLabel
                  Left = 12
                  Top = 64
                  Width = 277
                  Height = 13
                  Caption = 'Motivo para Tratamento de Divergência [padrão]'
                end
                object Label48: TLabel
                  Left = 12
                  Top = 121
                  Width = 250
                  Height = 13
                  Caption = 'Motivo para Contribuição de Férias [padrão]'
                end
                object dblkpcmbMotivoNormalPREV: TwwDBLookupCombo
                  Left = 12
                  Top = 26
                  Width = 310
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'50'#9'Motivo')
                  DataField = 'IDMOTIVOCONTRIBP'
                  DataSource = ds
                  LookupTable = qryMotivo
                  LookupField = 'IDMOTIVO'
                  Options = [loColLines]
                  ParentFont = False
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                end
                object dblkpcmbDIVERGPREV: TwwDBLookupCombo
                  Left = 12
                  Top = 79
                  Width = 310
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'50'#9'Motivo')
                  DataField = 'IDMOTIVODIVERG'
                  DataSource = ds
                  LookupTable = qryMotivo
                  LookupField = 'IDMOTIVO'
                  Options = [loColLines]
                  ParentFont = False
                  TabOrder = 1
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                end
                object wwDBLookupCombo16: TwwDBLookupCombo
                  Left = 12
                  Top = 136
                  Width = 310
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'50'#9'Motivo')
                  DataField = 'IDMOTIVOFERIAS'
                  DataSource = ds
                  LookupTable = qryMotivo
                  LookupField = 'IDMOTIVO'
                  Options = [loColLines]
                  ParentFont = False
                  TabOrder = 2
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                end
                object GroupBox10: TGroupBox
                  Left = 10
                  Top = 170
                  Width = 391
                  Height = 126
                  Caption = 'Motivos em caso do não processamento do envio de descontos'
                  TabOrder = 3
                  object Label49: TLabel
                    Left = 11
                    Top = 23
                    Width = 305
                    Height = 13
                    Caption = 'Motivo para Recebimento de Contribuições em Atraso'
                  end
                  object Label50: TLabel
                    Left = 11
                    Top = 68
                    Width = 232
                    Height = 13
                    Caption = 'Motivo para Devolução de Contribuições'
                  end
                  object wwDBLookupCombo17: TwwDBLookupCombo
                    Left = 11
                    Top = 40
                    Width = 310
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCRICAO'#9'50'#9'Motivo')
                    DataField = 'IDMOTIVOATRASO'
                    DataSource = ds
                    LookupTable = qryMotivo
                    LookupField = 'IDMOTIVO'
                    Options = [loColLines]
                    ParentFont = False
                    TabOrder = 0
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                  end
                  object wwDBLookupCombo18: TwwDBLookupCombo
                    Left = 11
                    Top = 84
                    Width = 310
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESCRICAO'#9'50'#9'Motivo')
                    DataField = 'IDMOTIVODEVOLUC'
                    DataSource = ds
                    LookupTable = qryMotivo
                    LookupField = 'IDMOTIVO'
                    Options = [loColLines]
                    ParentFont = False
                    TabOrder = 1
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                  end
                end
              end
            end
            object tbsMotivoFolha: TTabSheet
              Caption = 'Folha de Benefícios/Fundação'
              object Panel3: TPanel
                Left = 0
                Top = 0
                Width = 652
                Height = 318
                Align = alClient
                BevelOuter = bvLowered
                TabOrder = 0
                object Label18: TLabel
                  Left = 12
                  Top = 8
                  Width = 337
                  Height = 13
                  Caption = 'Motivo para Cobrança de Devolução de Benefício [padrão]'
                end
                object Label47: TLabel
                  Left = 12
                  Top = 49
                  Width = 354
                  Height = 13
                  Caption = 'Motivo para Acerto com Beneficiário não Identificado [padrão]'
                end
                object Label27: TLabel
                  Left = 12
                  Top = 89
                  Width = 487
                  Height = 13
                  Caption = 
                    'Motivo para Acerto de Benefício Pós-Morte na Conta do Próprio Pa' +
                    'rticipante [padrão]'
                end
                object Label11: TLabel
                  Left = 12
                  Top = 130
                  Width = 324
                  Height = 13
                  Caption = 'Motivo para Acertos gerados na Transferência de Planos'
                end
                object Label14: TLabel
                  Left = 12
                  Top = 172
                  Width = 273
                  Height = 13
                  Caption = 'Motivo para Quitação Automática de Benefícios'
                end
                object Label15: TLabel
                  Left = 12
                  Top = 215
                  Width = 239
                  Height = 13
                  Caption = 'Motivo de Abono para Folha da Fundação'
                end
                object wwDBLookupCombo2: TwwDBLookupCombo
                  Left = 12
                  Top = 23
                  Width = 310
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'50'#9'Motivo')
                  DataField = 'IDMOTIVODEVOLBEN'
                  DataSource = ds
                  LookupTable = qryMotivo
                  LookupField = 'IDMOTIVO'
                  Options = [loColLines]
                  ParentFont = False
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                end
                object wwDBLookupCombo1: TwwDBLookupCombo
                  Left = 12
                  Top = 64
                  Width = 310
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'50'#9'Motivo')
                  DataField = 'IDMOTDEVOLNAOIDEN'
                  DataSource = ds
                  LookupTable = qryMotivo
                  LookupField = 'IDMOTIVO'
                  Options = [loColLines]
                  ParentFont = False
                  TabOrder = 1
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                end
                object wwDBLookupCombo14: TwwDBLookupCombo
                  Left = 12
                  Top = 104
                  Width = 310
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'50'#9'Motivo')
                  DataField = 'IDMOTIVOACERTOFL'
                  DataSource = ds
                  LookupTable = qryMotivo
                  LookupField = 'IDMOTIVO'
                  Options = [loColLines]
                  ParentFont = False
                  TabOrder = 2
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                end
                object wwDBLookupCombo4: TwwDBLookupCombo
                  Left = 12
                  Top = 145
                  Width = 310
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'50'#9'Motivo')
                  DataField = 'IDMOTIVOACERTOTP'
                  DataSource = ds
                  LookupTable = qryMotivo
                  LookupField = 'IDMOTIVO'
                  Options = [loColLines]
                  ParentFont = False
                  TabOrder = 3
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                end
                object wwDBLookupCombo5: TwwDBLookupCombo
                  Left = 12
                  Top = 187
                  Width = 310
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'50'#9'Motivo')
                  DataField = 'IDMOTIVOQUITANT'
                  DataSource = ds
                  LookupTable = qryMotivo
                  LookupField = 'IDMOTIVO'
                  Options = [loColLines]
                  ParentFont = False
                  TabOrder = 4
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                end
                object dblkMotivoAbonoFolhaFund: TwwDBLookupCombo
                  Left = 12
                  Top = 230
                  Width = 310
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'50'#9'Motivo')
                  DataField = 'IDMOTABNFOLHAFUND'
                  DataSource = ds
                  LookupTable = qryMotivo
                  LookupField = 'IDMOTIVO'
                  Options = [loColLines]
                  ParentFont = False
                  TabOrder = 5
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                end
              end
            end
            object TabSheet1: TTabSheet
              Caption = 'Sal. de Manutenção'
              ImageIndex = 4
              object Panel6: TPanel
                Left = 0
                Top = 0
                Width = 652
                Height = 318
                Align = alClient
                BevelOuter = bvLowered
                TabOrder = 0
                object Label3: TLabel
                  Left = 12
                  Top = 8
                  Width = 470
                  Height = 13
                  Caption = 
                    'Motivo para as Rubricas de Salário de Manutenção (em caso de des' +
                    'membramento)'
                end
                object wwDBLookupCombo13: TwwDBLookupCombo
                  Left = 12
                  Top = 24
                  Width = 310
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'50'#9'Motivo')
                  DataField = 'IDMOTIVOSALMANUT'
                  DataSource = ds
                  LookupTable = qryMotivo
                  LookupField = 'IDMOTIVO'
                  Options = [loColLines]
                  ParentFont = False
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                end
              end
            end
            object tbMotivoParcelamento: TTabSheet
              Caption = 'Parcelamento'
              ImageIndex = 5
              object Label4: TLabel
                Left = 12
                Top = 8
                Width = 149
                Height = 13
                Caption = 'Motivo para Parcelamento'
              end
              object Label25: TLabel
                Left = 12
                Top = 56
                Width = 222
                Height = 13
                Caption = 'Motivo para Quitação de Parcelamento'
              end
              object Label26: TLabel
                Left = 12
                Top = 112
                Width = 240
                Height = 13
                Caption = 'Motivo para Amortização de Parcelamento'
              end
              object cmbMotivoParcela: TwwDBLookupCombo
                Left = 12
                Top = 24
                Width = 310
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'50'#9'Motivo')
                DataField = 'IDMOTIVOPARCELA'
                DataSource = ds
                LookupTable = qryMotivo
                LookupField = 'IDMOTIVO'
                Options = [loColLines]
                ParentFont = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
              object cmbMotivoQuitacao: TwwDBLookupCombo
                Left = 12
                Top = 72
                Width = 310
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'50'#9'Motivo')
                DataField = 'IDMOTIVOQUITACAO'
                DataSource = ds
                LookupTable = qryMotivo
                LookupField = 'IDMOTIVO'
                Options = [loColLines]
                ParentFont = False
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
              object cmbMotivoAmortiza: TwwDBLookupCombo
                Left = 12
                Top = 128
                Width = 310
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'50'#9'Motivo')
                DataField = 'IDMOTIVOAMORTIZA'
                DataSource = ds
                LookupTable = qryMotivo
                LookupField = 'IDMOTIVO'
                Options = [loColLines]
                ParentFont = False
                TabOrder = 2
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
            end
            object TabSheet2: TTabSheet
              Caption = 'Compra de Carência'
              ImageIndex = 6
              object Label28: TLabel
                Left = 12
                Top = 8
                Width = 186
                Height = 13
                Caption = 'Motivo para Compra de Carência'
              end
              object cmbMotivoCarencia: TwwDBLookupCombo
                Left = 12
                Top = 24
                Width = 310
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'50'#9'Motivo')
                DataField = 'IDMOTIVOCARENCIA'
                DataSource = ds
                LookupTable = qryMotivo
                LookupField = 'IDMOTIVO'
                Options = [loColLines]
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
      end
      object tbsINSS: TTabSheet
        Caption = 'Parâmetros do INSS'
        object pnlFundoINSS: TPanel
          Left = 0
          Top = 0
          Width = 662
          Height = 348
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object grpOpcaoINSS1: TGroupBox
            Left = 12
            Top = 64
            Width = 307
            Height = 121
            Caption = 'Primeiro Parâmetro'
            TabOrder = 1
            object Label40: TLabel
              Left = 9
              Top = 17
              Width = 62
              Height = 13
              Caption = 'Descrição '
            end
            object Label41: TLabel
              Left = 9
              Top = 57
              Width = 99
              Height = 13
              Caption = 'Regra de Cálculo'
            end
            object dbedNomeBINSS1: TwwDBEdit
              Left = 9
              Top = 31
              Width = 286
              Height = 21
              DataField = 'NOMEBINSS1'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbchkEditaINSS1: TDBCheckBox
              Left = 9
              Top = 96
              Width = 283
              Height = 17
              Caption = 'Permitir Alterar Valor Manualmente'
              DataField = 'FLGEDITABINSS1'
              DataSource = ds
              TabOrder = 2
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object dblkpcmbRgBINSS1: TwwDBLookupCombo
              Left = 9
              Top = 71
              Width = 286
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'60'#9'Regra')
              DataField = 'IDRGBINSS1'
              DataSource = ds
              LookupTable = qryRegra
              LookupField = 'IDREGRA'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
          end
          object grpOpcaoINSS2: TGroupBox
            Left = 330
            Top = 63
            Width = 307
            Height = 121
            Caption = 'Segundo Parâmetro'
            TabOrder = 2
            object Label42: TLabel
              Left = 9
              Top = 17
              Width = 62
              Height = 13
              Caption = 'Descrição '
            end
            object Label43: TLabel
              Left = 9
              Top = 57
              Width = 99
              Height = 13
              Caption = 'Regra de Cálculo'
            end
            object dbedNomeBINSS2: TwwDBEdit
              Left = 9
              Top = 31
              Width = 286
              Height = 21
              DataField = 'NOMEBINSS2'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbchkEditaINSS2: TDBCheckBox
              Left = 9
              Top = 96
              Width = 283
              Height = 17
              Caption = 'Permitir Alterar Valor Manualmente'
              DataField = 'FLGEDITABINSS2'
              DataSource = ds
              TabOrder = 2
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object dblkpcmbRgBINSS2: TwwDBLookupCombo
              Left = 9
              Top = 71
              Width = 286
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'60'#9'Regra')
              DataField = 'IDRGBINSS2'
              DataSource = ds
              LookupTable = qryRegra
              LookupField = 'IDREGRA'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
          end
          object grpOpcaoINSS3: TGroupBox
            Left = 12
            Top = 193
            Width = 307
            Height = 121
            Caption = 'Terceiro Parâmetro'
            TabOrder = 3
            object Label44: TLabel
              Left = 9
              Top = 17
              Width = 62
              Height = 13
              Caption = 'Descrição '
            end
            object Label45: TLabel
              Left = 9
              Top = 57
              Width = 99
              Height = 13
              Caption = 'Regra de Cálculo'
            end
            object dbedNomeBINSS3: TwwDBEdit
              Left = 9
              Top = 31
              Width = 286
              Height = 21
              DataField = 'NOMEBINSS3'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbchkEditaINSS3: TDBCheckBox
              Left = 9
              Top = 96
              Width = 283
              Height = 17
              Caption = 'Permitir Alterar Valor Manualmente'
              DataField = 'FLGEDITABINSS1'
              DataSource = ds
              TabOrder = 2
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object dblkpcmbRgBINSS3: TwwDBLookupCombo
              Left = 9
              Top = 71
              Width = 286
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'60'#9'Regra')
              DataField = 'IDRGBINSS3'
              DataSource = ds
              LookupTable = qryRegra
              LookupField = 'IDREGRA'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
          end
          object GroupBox6: TGroupBox
            Left = 12
            Top = 9
            Width = 469
            Height = 49
            Caption = 'Informe o Número de Parâmetros que serão utilizados'
            TabOrder = 0
            object Label46: TLabel
              Left = 138
              Top = 24
              Width = 63
              Height = 13
              Caption = 'parâmetros'
            end
            object dbspinNumOPINSS: TwwDBSpinEdit
              Left = 9
              Top = 18
              Width = 121
              Height = 21
              Increment = 1
              MaxValue = 3
              DataField = 'NUMOPINSS'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              UnboundDataType = wwDefault
              OnChange = dbspinNumOPINSSChange
            end
          end
          object GroupBox11: TGroupBox
            Left = 328
            Top = 193
            Width = 310
            Height = 47
            Caption = 'Grupo de Rubricas para Acerto'
            TabOrder = 4
            object cboxGrupoRubrica: TwwDBLookupCombo
              Left = 9
              Top = 17
              Width = 286
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'30'#9'Grupo de Rubricas'#9'F')
              DataField = 'IDGRUPORUBACERTO'
              DataSource = ds
              LookupTable = qryGrupoRubricas
              LookupField = 'IDGRUPORUBRICA'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
          end
          object GroupBox14: TGroupBox
            Left = 328
            Top = 242
            Width = 310
            Height = 46
            Caption = ' Identifica INSS '
            TabOrder = 5
            object BtProcuraINSS: TToolbarButton97
              Left = 279
              Top = 16
              Width = 22
              Height = 21
              AllowAllUp = True
              GroupIndex = 1
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
                33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
                8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
                F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
                F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
                0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
                B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
                B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
                333333333777733333333333FBFBFB3333333333333333333333}
              ImageIndex = 3
              Images = ImlPadrao
              Layout = blGlyphTop
              Opaque = False
              Spacing = 0
              OnClick = BtProcuraINSSClick
            end
            object EdNomeINSS: TEdit
              Left = 9
              Top = 16
              Width = 268
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 12
              ParentFont = False
              TabOrder = 0
              OnExit = edInputExit
              OnKeyPress = edInputKeyPress
            end
          end
          object GroupBox16: TGroupBox
            Left = 328
            Top = 289
            Width = 310
            Height = 55
            Caption = ' Identifica recebedor do repasse de reembolso '
            TabOrder = 6
            object BtProcuraRecebedor: TToolbarButton97
              Left = 279
              Top = 23
              Width = 22
              Height = 21
              AllowAllUp = True
              GroupIndex = 1
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
                33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
                8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
                F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
                F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
                0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
                B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
                B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
                333333333777733333333333FBFBFB3333333333333333333333}
              ImageIndex = 3
              Images = ImlPadrao
              Layout = blGlyphTop
              Opaque = False
              Spacing = 0
              OnClick = BtProcuraRecebedorClick
            end
            object EdNomePessoaRepasse: TEdit
              Left = 9
              Top = 23
              Width = 268
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 12
              ParentFont = False
              TabOrder = 0
              OnExit = edInputExit
              OnKeyPress = edInputKeyPress
            end
          end
        end
      end
      object tbsNaoGravavel: TTabSheet
        Caption = 'Temporários'
        ImageIndex = 6
        object Label51: TLabel
          Left = 8
          Top = 16
          Width = 286
          Height = 13
          Caption = 'No. de Meses para Tentativas de Buscar Salários '
        end
        object edNumTentativas: TEdit
          Left = 296
          Top = 16
          Width = 57
          Height = 21
          TabOrder = 0
          Text = '36'
          OnExit = edNumTentativasExit
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 672
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 425
    Width = 672
    inherited tb97Fundo: TToolbar97
      Left = 500
      DockPos = 570
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 331
      DockPos = 401
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 331
    Top = 1
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 482
    Top = 1
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PARAMAPREV'
      'set'
      '  FLGATUMATRICULA = :FLGATUMATRICULA,'
      '  FLGCALCJUNTO = :FLGCALCJUNTO,'
      '  FLGINCLUIMESCONC = :FLGINCLUIMESCONC,'
      '  NOMEBINSS3 = :NOMEBINSS3,'
      '  IDRGBINSS1 = :IDRGBINSS1,'
      '  IDRGBINSS2 = :IDRGBINSS2,'
      '  IDRGBINSS3 = :IDRGBINSS3,'
      '  FLGEDITABINSS1 = :FLGEDITABINSS1,'
      '  FLGEDITABINSS2 = :FLGEDITABINSS2,'
      '  FLGEDITABINSS3 = :FLGEDITABINSS3,'
      '  NUMOPINSS = :NUMOPINSS,'
      '  NOMEBINSS1 = :NOMEBINSS1,'
      '  NOMEBINSS2 = :NOMEBINSS2,'
      '  IDMOTDEVOLNAOIDEN = :IDMOTDEVOLNAOIDEN,'
      '  CODPORTFORMAPATRO = :CODPORTFORMAPATRO,'
      '  FLGIMPCERTIF = :FLGIMPCERTIF,'
      '  TIPOFAVPATRO = :TIPOFAVPATRO,'
      '  TIPOCLIPATRO = :TIPOCLIPATRO,'
      '  IDDOCUMENTO = :IDDOCUMENTO,'
      '  IDREGRACALCINSS = :IDREGRACALCINSS,'
      '  IDMOTIVOCONTRIBP = :IDMOTIVOCONTRIBP,'
      '  IDRUBIRRF = :IDRUBIRRF,'
      '  IDPESSOA = :IDPESSOA,'
      '  CODALTDESPDESCFO = :CODALTDESPDESCFO,'
      '  FLGTRATAPREVIAPA = :FLGTRATAPREVIAPA,'
      '  FLGCALCULOVALORES = :FLGCALCULOVALORES,'
      '  FLGCORRIGEBENEF = :FLGCORRIGEBENEF,'
      '  VLRARREDSALARIO = :VLRARREDSALARIO,'
      '  VLRBENEFMIN = :VLRBENEFMIN,'
      '  IDRUBIRRFRESG = :IDRUBIRRFRESG,'
      '  IDRUBCMBENEF = :IDRUBCMBENEF,'
      '  IDRUBAJCMBENEF = :IDRUBAJCMBENEF,'
      '  IDRUBCMCONT = :IDRUBCMCONT,'
      '  IDRUBAJCMCONT = :IDRUBAJCMCONT,'
      '  FLGGRAVASIMULABEN = :FLGGRAVASIMULABEN,'
      '  TIPOPERDIVERG = :TIPOPERDIVERG,'
      '  TIPOPERRESERVA = :TIPOPERRESERVA,'
      '  TIPOPERFLHBEN = :TIPOPERFLHBEN,'
      '  TIPOCLIMANTIDOS = :TIPOCLIMANTIDOS,'
      '  TIPOCLIATIVOS = :TIPOCLIATIVOS,'
      '  TIPOCLIASSISTIDOS = :TIPOCLIASSISTIDOS,'
      '  TIPOCLIMANTPARC = :TIPOCLIMANTPARC,'
      '  TIPOFAVATIVOS = :TIPOFAVATIVOS,'
      '  TIPOFAVMANTIDOS = :TIPOFAVMANTIDOS,'
      '  TIPOFAVASSISTIDOS = :TIPOFAVASSISTIDOS,'
      '  TIPOFAVMANTPARC = :TIPOFAVMANTPARC,'
      '  IDRUBADIANT = :IDRUBADIANT,'
      '  IDMOTIVOADIANT = :IDMOTIVOADIANT,'
      '  IDCONTRACHEQUE = :IDCONTRACHEQUE,'
      '  RUBRICAPROVENTOPA = :RUBRICAPROVENTOPA,'
      '  IDMOTIVODIVERG = :IDMOTIVODIVERG,'
      '  FLGCOBPRIMBCOASS = :FLGCOBPRIMBCOASS,'
      '  IDMOTIVOPARCELA = :IDMOTIVOPARCELA,'
      '  PLARECUPDESPEXANT = :PLARECUPDESPEXANT,'
      '  PLANO = :PLANO,'
      '  PLARECUPRECEXANT = :PLARECUPRECEXANT,'
      '  IDRUBIRRFINSS = :IDRUBIRRFINSS,'
      '  IDRUBIRRFABONO = :IDRUBIRRFABONO,'
      '  IDRUBIRRFEXT = :IDRUBIRRFEXT,'
      '  IDRUBIRRFPENSAO = :IDRUBIRRFPENSAO,'
      '  IDRUBIRRFPENALIM = :IDRUBIRRFPENALIM,'
      '  IDRUBARRED = :IDRUBARRED,'
      '  IDRUBARREDMESANT = :IDRUBARREDMESANT,'
      '  IDTIPOAGRECPMF = :IDTIPOAGRECPMF,'
      '  FLGUSAFOLHARESG = :FLGUSAFOLHARESG,'
      '  IDMOTIVODEVOLAS = :IDMOTIVODEVOLAS,'
      '  IDMOTIVOATRASOAS = :IDMOTIVOATRASOAS,'
      '  IDMOTIVOFINANCAS = :IDMOTIVOFINANCAS,'
      '  IDMOTIVODEVOLBEN = :IDMOTIVODEVOLBEN,'
      '  FLGAGRUPAFOLHABEN = :FLGAGRUPAFOLHABEN,'
      '  FLGFORMADESCONTO = :FLGFORMADESCONTO,'
      '  IDRUBRICACPMF = :IDRUBRICACPMF,'
      '  PERCCPMF = :PERCCPMF,'
      '  TPDOCPFLHBENELET = :TPDOCPFLHBENELET,'
      '  TPDOCPFLHBENINDIV = :TPDOCPFLHBENINDIV,'
      '  TPDOCRFLHBENELET = :TPDOCRFLHBENELET,'
      '  TPDOCRFLHBENINDIV = :TPDOCRFLHBENINDIV,'
      '  TPDOCPENVIOBANCO = :TPDOCPENVIOBANCO,'
      '  TPDOCPENVIOPATRO = :TPDOCPENVIOPATRO,'
      '  TPDOCRRECBANCO = :TPDOCRRECBANCO,'
      '  TPDOCRRECPATRO = :TPDOCRRECPATRO,'
      '  TIPOPERENVIO = :TIPOPERENVIO,'
      '  TIPOPERCOBRANCA = :TIPOPERCOBRANCA,'
      '  CODALTIRCOM = :CODALTIRCOM,'
      '  DATAULTDVR = :DATAULTDVR,'
      '  PRAZODVR = :PRAZODVR,'
      '  FLGINTCONTAB = :FLGINTCONTAB,'
      '  MARGEMDESCONTOS = :MARGEMDESCONTOS,'
      '  MASCTIPORESERVA = :MASCTIPORESERVA,'
      '  FLGMULTIFUNDACAO = :FLGMULTIFUNDACAO,'
      '  IDMOTIVOEMPRESTI = :IDMOTIVOEMPRESTI,'
      '  IDMOTIVOCONTRIBA = :IDMOTIVOCONTRIBA,'
      '  IDMOTIVOFOLHABEN = :IDMOTIVOFOLHABEN,'
      '  IDMOTIVOFORNPAG = :IDMOTIVOFORNPAG,'
      '  IDMOTIVOFORNCOMI = :IDMOTIVOFORNCOMI,'
      '  FLGINTCONTBASS = :FLGINTCONTBASS,'
      '  FLGINTCPAGAR = :FLGINTCPAGAR,'
      '  FLGINTCRECEBER = :FLGINTCRECEBER,'
      '  FLGINTCPAGARPREV = :FLGINTCPAGARPREV,'
      '  FLGINTCRECEBERPR = :FLGINTCRECEBERPR,'
      '  IDMOTIVOABONO = :IDMOTIVOABONO,'
      '  IDRUBQUITAEMPREST = :IDRUBQUITAEMPREST,'
      '  IDRUBQUITAPREV = :IDRUBQUITAPREV,'
      '  IDRUBQUITAASSIST = :IDRUBQUITAASSIST,'
      '  IDRUBPENSAO = :IDRUBPENSAO,'
      '  FLGMOSTRASITGERAL = :FLGMOSTRASITGERAL,'
      '  FLGCPOBUSCA = :FLGCPOBUSCA,'
      '  TIPODOCBUSCA = :TIPODOCBUSCA,'
      '  IDREGRAMOTIVO = :IDREGRAMOTIVO,'
      '  IDGRINSTR = :IDGRINSTR,'
      '  FLGRUBRICAAUTO = :FLGRUBRICAAUTO,'
      '  FLGACERTARESERVA = :FLGACERTARESERVA,'
      '  IDMOTIVOSALMANUT = :IDMOTIVOSALMANUT,'
      '  FLGCOBCONTAUXDOE = :FLGCOBCONTAUXDOE,'
      '  IDMOTIVOAMORTIZA = :IDMOTIVOAMORTIZA,'
      '  IDMOTIVOQUITACAO = :IDMOTIVOQUITACAO,'
      '  FLGTIPOACERTOFL = :FLGTIPOACERTOFL,'
      '  IDMOTIVOACERTOFL = :IDMOTIVOACERTOFL,'
      '  IDTPPGBENVITAL = :IDTPPGBENVITAL,'
      '  QTDDIASRETRBENEF = :QTDDIASRETRBENEF,'
      '  IDMOTIVOCARENCIA = :IDMOTIVOCARENCIA,'
      '  PERCMINDESC = :PERCMINDESC,'
      '  PERCMAXDESC = :PERCMAXDESC,'
      '  IDMOTIVOFERIAS = :IDMOTIVOFERIAS,'
      '  IDPARAMETRO = :IDPARAMETRO,'
      '  IDMOTIVOATRASO = :IDMOTIVOATRASO,'
      '  IDMOTIVODEVOLUC = :IDMOTIVODEVOLUC,'
      '  IDGRUPORUBACERTO = :IDGRUPORUBACERTO,'
      '  FLGCONTATEMPINSC = :FLGCONTATEMPINSC,'
      '  FLGCOBPATROFOLHA = :FLGCOBPATROFOLHA,'
      '  FLGNAOTRAZOP = :FLGNAOTRAZOP,'
      '  IDRGMARGEMCONSIG = :IDRGMARGEMCONSIG,'
      '  IDRGDIGMATPENS = :IDRGDIGMATPENS,'
      '  MASCMATPENS = :MASCMATPENS,'
      '  FLGINCAUTMATPENS = :FLGINCAUTMATPENS,'
      '  IDMOTIVOACERTOTP = :IDMOTIVOACERTOTP,'
      '  IDRGCONTABBENEF = :IDRGCONTABBENEF,'
      '  FLGACUMALTER = :FLGACUMALTER,'
      '  FLGRETDATAANT = :FLGRETDATAANT,'
      '  FLGLIBRECALC = :FLGLIBRECALC,'
      '  FLGLIBRECALCBEN = :FLGLIBRECALCBEN,'
      '  FLGINFCONTABINDIV = :FLGINFCONTABINDIV,'
      '  IDMOTIVOQUITANT = :IDMOTIVOQUITANT,'
      '  IDPESSOAINSS = :IDPESSOAINSS,'
      '  FLGRESNEGATIVA = :FLGRESNEGATIVA,'
      '  IDPESSOAREPASSE = :IDPESSOAREPASSE,'
      '  FLGINSCSALZERO = :FLGINSCSALZERO,'
      '  FLGNAOACERTCONTDP = :FLGNAOACERTCONTDP,'
      '  IDMOTABNFOLHAFUND = :IDMOTABNFOLHAFUND,'
      '  FLGATUPERCGF = :FLGATUPERCGF,'
      '  FLGCONTROLERUB = :FLGCONTROLERUB'
      'where'
      '  IDFUNDACAO = :OLD_IDFUNDACAO')
    InsertSQL.Strings = (
      'insert into PARAMAPREV'
      
        '  (FLGATUMATRICULA, FLGCALCJUNTO, FLGINCLUIMESCONC, NOMEBINSS3, ' +
        'IDRGBINSS1, '
      
        '   IDRGBINSS2, IDRGBINSS3, FLGEDITABINSS1, FLGEDITABINSS2, FLGED' +
        'ITABINSS3, '
      
        '   NUMOPINSS, NOMEBINSS1, NOMEBINSS2, IDMOTDEVOLNAOIDEN, CODPORT' +
        'FORMAPATRO, '
      
        '   FLGIMPCERTIF, TIPOFAVPATRO, TIPOCLIPATRO, IDDOCUMENTO, IDREGR' +
        'ACALCINSS, '
      
        '   IDMOTIVOCONTRIBP, IDRUBIRRF, IDPESSOA, CODALTDESPDESCFO, FLGT' +
        'RATAPREVIAPA, '
      
        '   FLGCALCULOVALORES, FLGCORRIGEBENEF, VLRARREDSALARIO, VLRBENEF' +
        'MIN, IDRUBIRRFRESG, '
      
        '   IDRUBCMBENEF, IDRUBAJCMBENEF, IDRUBCMCONT, IDRUBAJCMCONT, FLG' +
        'GRAVASIMULABEN, '
      
        '   TIPOPERDIVERG, TIPOPERRESERVA, TIPOPERFLHBEN, TIPOCLIMANTIDOS' +
        ', TIPOCLIATIVOS, '
      
        '   TIPOCLIASSISTIDOS, TIPOCLIMANTPARC, TIPOFAVATIVOS, TIPOFAVMAN' +
        'TIDOS, '
      
        '   TIPOFAVASSISTIDOS, TIPOFAVMANTPARC, IDRUBADIANT, IDMOTIVOADIA' +
        'NT, IDCONTRACHEQUE, '
      
        '   RUBRICAPROVENTOPA, IDMOTIVODIVERG, FLGCOBPRIMBCOASS, IDMOTIVO' +
        'PARCELA, '
      
        '   PLARECUPDESPEXANT, PLANO, PLARECUPRECEXANT, IDRUBIRRFINSS, ID' +
        'RUBIRRFABONO, '
      
        '   IDRUBIRRFEXT, IDRUBIRRFPENSAO, IDRUBIRRFPENALIM, IDRUBARRED, ' +
        'IDRUBARREDMESANT, '
      
        '   IDTIPOAGRECPMF, FLGUSAFOLHARESG, IDMOTIVODEVOLAS, IDMOTIVOATR' +
        'ASOAS, '
      
        '   IDMOTIVOFINANCAS, IDMOTIVODEVOLBEN, FLGAGRUPAFOLHABEN, FLGFOR' +
        'MADESCONTO, '
      
        '   IDRUBRICACPMF, PERCCPMF, TPDOCPFLHBENELET, TPDOCPFLHBENINDIV,' +
        ' TPDOCRFLHBENELET, '
      
        '   TPDOCRFLHBENINDIV, TPDOCPENVIOBANCO, TPDOCPENVIOPATRO, TPDOCR' +
        'RECBANCO, '
      
        '   TPDOCRRECPATRO, TIPOPERENVIO, TIPOPERCOBRANCA, CODALTIRCOM, D' +
        'ATAULTDVR, '
      
        '   PRAZODVR, FLGINTCONTAB, MARGEMDESCONTOS, MASCTIPORESERVA, FLG' +
        'MULTIFUNDACAO, '
      
        '   IDMOTIVOEMPRESTI, IDMOTIVOCONTRIBA, IDMOTIVOFOLHABEN, IDMOTIV' +
        'OFORNPAG, '
      
        '   IDMOTIVOFORNCOMI, FLGINTCONTBASS, FLGINTCPAGAR, FLGINTCRECEBE' +
        'R, FLGINTCPAGARPREV, '
      
        '   FLGINTCRECEBERPR, IDMOTIVOABONO, IDRUBQUITAEMPREST, IDRUBQUIT' +
        'APREV, '
      
        '   IDRUBQUITAASSIST, IDRUBPENSAO, FLGMOSTRASITGERAL, FLGCPOBUSCA' +
        ', TIPODOCBUSCA, '
      
        '   IDREGRAMOTIVO, IDGRINSTR, FLGRUBRICAAUTO, FLGACERTARESERVA, I' +
        'DMOTIVOSALMANUT, '
      
        '   FLGCOBCONTAUXDOE, IDMOTIVOAMORTIZA, IDMOTIVOQUITACAO, FLGTIPO' +
        'ACERTOFL, '
      
        '   IDMOTIVOACERTOFL, IDTPPGBENVITAL, QTDDIASRETRBENEF, IDMOTIVOC' +
        'ARENCIA, '
      
        '   PERCMINDESC, PERCMAXDESC, IDMOTIVOFERIAS, IDPARAMETRO, IDMOTI' +
        'VOATRASO, '
      
        '   IDMOTIVODEVOLUC, IDGRUPORUBACERTO, FLGCONTATEMPINSC, FLGCOBPA' +
        'TROFOLHA, '
      
        '   FLGNAOTRAZOP, IDRGMARGEMCONSIG, IDRGDIGMATPENS, MASCMATPENS, ' +
        'FLGINCAUTMATPENS, '
      
        '   IDMOTIVOACERTOTP, IDRGCONTABBENEF, FLGACUMALTER, FLGRETDATAAN' +
        'T, FLGLIBRECALC, '
      
        '   FLGLIBRECALCBEN, FLGINFCONTABINDIV, IDMOTIVOQUITANT, IDPESSOA' +
        'INSS, FLGRESNEGATIVA,'
      
        '   IDPESSOAREPASSE, FLGINSCSALZERO, FLGNAOACERTCONTDP, IDMOTABNF' +
        'OLHAFUND,'
      '   FLGATUPERCGF, FLGCONTROLERUB)'
      'values'
      
        '  (:FLGATUMATRICULA, :FLGCALCJUNTO, :FLGINCLUIMESCONC, :NOMEBINS' +
        'S3, :IDRGBINSS1, '
      
        '   :IDRGBINSS2, :IDRGBINSS3, :FLGEDITABINSS1, :FLGEDITABINSS2, :' +
        'FLGEDITABINSS3, '
      
        '   :NUMOPINSS, :NOMEBINSS1, :NOMEBINSS2, :IDMOTDEVOLNAOIDEN, :CO' +
        'DPORTFORMAPATRO, '
      
        '   :FLGIMPCERTIF, :TIPOFAVPATRO, :TIPOCLIPATRO, :IDDOCUMENTO, :I' +
        'DREGRACALCINSS, '
      
        '   :IDMOTIVOCONTRIBP, :IDRUBIRRF, :IDPESSOA, :CODALTDESPDESCFO, ' +
        ':FLGTRATAPREVIAPA, '
      
        '   :FLGCALCULOVALORES, :FLGCORRIGEBENEF, :VLRARREDSALARIO, :VLRB' +
        'ENEFMIN, '
      
        '   :IDRUBIRRFRESG, :IDRUBCMBENEF, :IDRUBAJCMBENEF, :IDRUBCMCONT,' +
        ' :IDRUBAJCMCONT, '
      
        '   :FLGGRAVASIMULABEN, :TIPOPERDIVERG, :TIPOPERRESERVA, :TIPOPER' +
        'FLHBEN, '
      
        '   :TIPOCLIMANTIDOS, :TIPOCLIATIVOS, :TIPOCLIASSISTIDOS, :TIPOCL' +
        'IMANTPARC, '
      
        '   :TIPOFAVATIVOS, :TIPOFAVMANTIDOS, :TIPOFAVASSISTIDOS, :TIPOFA' +
        'VMANTPARC, '
      
        '   :IDRUBADIANT, :IDMOTIVOADIANT, :IDCONTRACHEQUE, :RUBRICAPROVE' +
        'NTOPA, '
      
        '   :IDMOTIVODIVERG, :FLGCOBPRIMBCOASS, :IDMOTIVOPARCELA, :PLAREC' +
        'UPDESPEXANT, '
      
        '   :PLANO, :PLARECUPRECEXANT, :IDRUBIRRFINSS, :IDRUBIRRFABONO, :' +
        'IDRUBIRRFEXT, '
      
        '   :IDRUBIRRFPENSAO, :IDRUBIRRFPENALIM, :IDRUBARRED, :IDRUBARRED' +
        'MESANT, '
      
        '   :IDTIPOAGRECPMF, :FLGUSAFOLHARESG, :IDMOTIVODEVOLAS, :IDMOTIV' +
        'OATRASOAS, '
      
        '   :IDMOTIVOFINANCAS, :IDMOTIVODEVOLBEN, :FLGAGRUPAFOLHABEN, :FL' +
        'GFORMADESCONTO,'
      
        '   :IDRUBRICACPMF, :PERCCPMF, :TPDOCPFLHBENELET, :TPDOCPFLHBENIN' +
        'DIV, :TPDOCRFLHBENELET, '
      
        '   :TPDOCRFLHBENINDIV, :TPDOCPENVIOBANCO, :TPDOCPENVIOPATRO, :TP' +
        'DOCRRECBANCO, '
      
        '   :TPDOCRRECPATRO, :TIPOPERENVIO, :TIPOPERCOBRANCA, :CODALTIRCO' +
        'M, :DATAULTDVR, '
      
        '   :PRAZODVR, :FLGINTCONTAB, :MARGEMDESCONTOS, :MASCTIPORESERVA,' +
        ' :FLGMULTIFUNDACAO, '
      
        '   :IDMOTIVOEMPRESTI, :IDMOTIVOCONTRIBA, :IDMOTIVOFOLHABEN, :IDM' +
        'OTIVOFORNPAG, '
      
        '   :IDMOTIVOFORNCOMI, :FLGINTCONTBASS, :FLGINTCPAGAR, :FLGINTCRE' +
        'CEBER, '
      
        '   :FLGINTCPAGARPREV, :FLGINTCRECEBERPR, :IDMOTIVOABONO, :IDRUBQ' +
        'UITAEMPREST, '
      
        '   :IDRUBQUITAPREV, :IDRUBQUITAASSIST, :IDRUBPENSAO, :FLGMOSTRAS' +
        'ITGERAL, '
      
        '   :FLGCPOBUSCA, :TIPODOCBUSCA, :IDREGRAMOTIVO, :IDGRINSTR, :FLG' +
        'RUBRICAAUTO, '
      
        '   :FLGACERTARESERVA, :IDMOTIVOSALMANUT, :FLGCOBCONTAUXDOE, :IDM' +
        'OTIVOAMORTIZA, '
      
        '   :IDMOTIVOQUITACAO, :FLGTIPOACERTOFL, :IDMOTIVOACERTOFL, :IDTP' +
        'PGBENVITAL, '
      
        '   :QTDDIASRETRBENEF, :IDMOTIVOCARENCIA, :PERCMINDESC, :PERCMAXD' +
        'ESC, :IDMOTIVOFERIAS, '
      
        '   :IDPARAMETRO, :IDMOTIVOATRASO, :IDMOTIVODEVOLUC, :IDGRUPORUBA' +
        'CERTO, '
      
        '   :FLGCONTATEMPINSC, :FLGCOBPATROFOLHA, :FLGNAOTRAZOP, :IDRGMAR' +
        'GEMCONSIG, '
      
        '   :IDRGDIGMATPENS, :MASCMATPENS, :FLGINCAUTMATPENS, :IDMOTIVOAC' +
        'ERTOTP, '
      
        '   :IDRGCONTABBENEF, :FLGACUMALTER, :FLGRETDATAANT, :FLGLIBRECAL' +
        'C, :FLGLIBRECALCBEN, '
      
        '   :FLGINFCONTABINDIV, :IDMOTIVOQUITANT, :IDPESSOAINSS, :FLGRESN' +
        'EGATIVA,'
      
        '   :IDPESSOAREPASSE, :FLGINSCSALZERO, :FLGNAOACERTCONTDP, :IDMOT' +
        'ABNFOLHAFUND,'
      '   :FLGATUPERCGF, :FLGCONTROLERUB)')
    DeleteSQL.Strings = (
      'delete from PARAMAPREV'
      'where'
      '  IDFUNDACAO = :OLD_IDFUNDACAO')
    Left = 532
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Parâmetro'
    CamposChave.Strings = (
      '1')
    Left = 281
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 381
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 582
    Top = 1
  end
  inherited qry: TwwQuery
    BeforePost = qryBeforePost
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      'SELECT'
      '  FLGATUMATRICULA,'
      '  FLGCALCJUNTO,'
      '  FLGINCLUIMESCONC,'
      '  NOMEBINSS3,'
      '  IDRGBINSS1,'
      '  IDRGBINSS2,'
      '  IDRGBINSS3,'
      '  FLGEDITABINSS1,'
      '  FLGEDITABINSS2,'
      '  FLGEDITABINSS3,'
      '  NUMOPINSS,'
      '  NOMEBINSS1,'
      '  NOMEBINSS2,'
      '  IDMOTDEVOLNAOIDEN,'
      '  CODPORTFORMAPATRO,'
      '  FLGIMPCERTIF,'
      '  TIPOFAVPATRO,'
      '  TIPOCLIPATRO,'
      '  IDDOCUMENTO,'
      '  IDREGRACALCINSS,'
      '  IDMOTIVOCONTRIBP,'
      '  IDRUBIRRF,'
      '  IDPESSOA,'
      '  CODALTDESPDESCFO,'
      '  FLGTRATAPREVIAPA,'
      '  FLGCALCULOVALORES,'
      '  FLGCORRIGEBENEF,'
      '  VLRARREDSALARIO,'
      '  VLRBENEFMIN,'
      '  IDRUBIRRFRESG,'
      '  IDRUBCMBENEF,'
      '  IDRUBAJCMBENEF,'
      '  IDRUBCMCONT,'
      '  IDRUBAJCMCONT,'
      '  FLGGRAVASIMULABEN,'
      '  TIPOPERDIVERG,'
      '  TIPOPERRESERVA,'
      '  TIPOPERFLHBEN,'
      '  TIPOCLIMANTIDOS,'
      '  TIPOCLIATIVOS,'
      '  TIPOCLIASSISTIDOS,'
      '  TIPOCLIMANTPARC,'
      '  TIPOFAVATIVOS,'
      '  TIPOFAVMANTIDOS,'
      '  TIPOFAVASSISTIDOS,'
      '  TIPOFAVMANTPARC,'
      '  IDRUBADIANT,'
      '  IDMOTIVOADIANT,'
      '  IDCONTRACHEQUE,'
      '  RUBRICAPROVENTOPA,'
      '  IDMOTIVODIVERG,'
      '  FLGCOBPRIMBCOASS,'
      '  IDMOTIVOPARCELA,'
      '  PLARECUPDESPEXANT,'
      '  PLANO,'
      '  PLARECUPRECEXANT,'
      '  IDRUBIRRFINSS,'
      '  IDRUBIRRFABONO,'
      '  IDRUBIRRFEXT,'
      '  IDRUBIRRFPENSAO,'
      '  IDRUBIRRFPENALIM,'
      '  IDRUBARRED,'
      '  IDRUBARREDMESANT,'
      '  IDTIPOAGRECPMF,'
      '  FLGUSAFOLHARESG,'
      '  IDMOTIVODEVOLAS,'
      '  IDMOTIVOATRASOAS,'
      '  IDMOTIVOFINANCAS,'
      '  IDMOTIVODEVOLBEN,'
      '  FLGAGRUPAFOLHABEN,'
      '  FLGFORMADESCONTO,'
      '  IDRUBRICACPMF,'
      '  PERCCPMF,'
      '  TPDOCPFLHBENELET,'
      '  TPDOCPFLHBENINDIV,'
      '  TPDOCRFLHBENELET,'
      '  TPDOCRFLHBENINDIV,'
      '  TPDOCPENVIOBANCO,'
      '  TPDOCPENVIOPATRO,'
      '  TPDOCRRECBANCO,'
      '  TPDOCRRECPATRO,'
      '  TIPOPERENVIO,'
      '  TIPOPERCOBRANCA,'
      '  CODALTIRCOM,'
      '  DATAULTDVR,'
      '  PRAZODVR,'
      '  FLGINTCONTAB,'
      '  MARGEMDESCONTOS,'
      '  MASCTIPORESERVA,'
      '  FLGMULTIFUNDACAO,'
      '  IDMOTIVOEMPRESTI,'
      '  IDMOTIVOCONTRIBA,'
      '  IDMOTIVOFOLHABEN,'
      '  IDMOTIVOFORNPAG,'
      '  IDMOTIVOFORNCOMI,'
      '  FLGINTCONTBASS,'
      '  FLGINTCPAGAR,'
      '  FLGINTCRECEBER,'
      '  FLGINTCPAGARPREV,'
      '  FLGINTCRECEBERPR,'
      '  IDMOTIVOABONO,'
      '  IDRUBQUITAEMPREST,'
      '  IDRUBQUITAPREV,'
      '  IDRUBQUITAASSIST,'
      '  IDRUBPENSAO,'
      '  FLGMOSTRASITGERAL,'
      '  FLGCPOBUSCA,'
      '  TIPODOCBUSCA,'
      '  IDREGRAMOTIVO,'
      '  IDGRINSTR,'
      '  FLGRUBRICAAUTO,'
      '  FLGACERTARESERVA,'
      '  IDMOTIVOSALMANUT,'
      '  FLGCOBCONTAUXDOE,'
      '  IDMOTIVOAMORTIZA,'
      '  IDMOTIVOPARCELA,'
      '  IDMOTIVOQUITACAO,'
      '  FLGTIPOACERTOFL,'
      '  IDMOTIVOACERTOFL,'
      '  IDTPPGBENVITAL,'
      '  QTDDIASRETRBENEF,'
      '  IDMOTIVOCARENCIA,'
      '  PERCMINDESC,'
      '  PERCMAXDESC,'
      '  IDMOTIVOFERIAS,'
      '  IDPARAMETRO,'
      '  IDFUNDACAO, IDMOTIVOATRASO, IDMOTIVODEVOLUC,'
      '  IDGRUPORUBACERTO,'
      '  FLGCONTATEMPINSC,'
      '  FLGCOBPATROFOLHA,'
      '  FLGNAOTRAZOP, IDRGMARGEMCONSIG,'
      '  IDRGDIGMATPENS,MASCMATPENS ,FLGINCAUTMATPENS,'
      '  IDMOTIVOACERTOTP,   IDRGCONTABBENEF,  FLGACUMALTER,'
      '  FLGRETDATAANT,'
      '  FLGLIBRECALC,'
      '  FLGLIBRECALCBEN,'
      '  FLGINFCONTABINDIV,'
      '  IDMOTIVOQUITANT,'
      '  IDPESSOAINSS,'
      '  FLGRESNEGATIVA,'
      '  IDPESSOAREPASSE, 1 AS FLGINTFUNDACAO,'
      '  FLGINSCSALZERO,'
      '  FLGNAOACERTCONTDP,'
      '  IDMOTABNFOLHAFUND,'
      '  FLGATUPERCGF,'
      '  FLGCONTROLERUB'
      'FROM'
      '  PARAMAPREV'
      'WHERE'
      '  IDFUNDACAO = :IDFUNDACAO'
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 432
    Top = 1
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryDescontos: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 582
    Top = 45
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 259
    Top = 396
  end
  object qryMotivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   IDMOTIVO,DESCRICAO'
      'FROM     MOTIVO'
      'ORDER BY (DESCRICAO)')
    ValidateWithMask = True
    Left = 425
    Top = 396
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   IDREGRA,NOMEREGRA'
      'FROM     REGRA'
      'ORDER BY (NOMEREGRA)')
    ValidateWithMask = True
    Left = 134
    Top = 396
  end
  object qryTpReserva: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV,IDTIPORESERVA,NOME'
      'FROM   RESERVAXPLANO')
    ValidateWithMask = True
    Left = 93
    Top = 396
  end
  object qryRubricas: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 51
    Top = 396
  end
  object qryTipoDocPessoa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDDOCUMENTO, NOMEDOCUMENTO'
      'FROM TIPODOCPESSOA')
    ValidateWithMask = True
    Left = 300
    Top = 396
  end
  object qryProventos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPROVENTO,P.DESCRICAO '
      'FROM PROVDESC P '
      'WHERE P.FLGDESCONTO = 1 '
      'ORDER BY (P.DESCRICAO) ')
    ValidateWithMask = True
    Left = 383
    Top = 396
  end
  object qryDocumento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDDOCUMENTO, NOMEDOCUMENTO'
      'FROM TIPODOCPESSOA')
    ValidateWithMask = True
    Left = 342
    Top = 396
  end
  object qryGrau: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDGRINSTR, DESCRICAO, CODRAIS'
      'FROM'
      '  GRINSTR'
      'ORDER BY'
      '  IDGRINSTR')
    ValidateWithMask = True
    Left = 217
    Top = 396
  end
  object qryTpPagto: TwwQuery
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'SELECT IDTPPAGTOBENEFIC, NOME'
      'FROM   TPPAGTOBENEFICIO'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 25
    Top = 420
  end
  object qryGrupoRubricas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDGRUPORUBRICA, DESCRICAO'
      'FROM GRUPORUBRICA'
      'ORDER BY 2')
    ValidateWithMask = True
    Left = 176
    Top = 396
  end
  object MSIdentPESSOA: TMontaSelect
    Template.IdConsulta = 0
    Caption = '8'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.RAZAOSOCIAL'
      'PESSOA.NUMDOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome'
      'Razão Social'
      'Numero do Documento')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA'
      'PESSOA.NOME'
      'PESSOA.RAZAOSOCIAL')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '60'
      '18')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 569
    Top = 377
  end
end
