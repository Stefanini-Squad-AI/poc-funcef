inherited frmCadContasContabMT: TfrmCadContasContabMT
  Left = 339
  Top = 77
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Cadastro de Contas Contábeis'
  ClientHeight = 620
  ClientWidth = 773
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 773
    Height = 534
    object pgCtrl: TPageControl
      Left = 1
      Top = 1
      Width = 771
      Height = 532
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      OnChange = pgCtrlChange
      object TabSheet1: TTabSheet
        Caption = 'Informações Gerais'
        object Bevel1: TBevel
          Left = 4
          Top = 245
          Width = 757
          Height = 78
          Shape = bsFrame
        end
        object Label1: TLabel
          Left = 144
          Top = 2
          Width = 40
          Height = 13
          Caption = 'Código'
        end
        object lblDigito: TLabel
          Left = 294
          Top = 27
          Width = 17
          Height = 13
          AutoSize = False
        end
        object Label2: TLabel
          Left = 300
          Top = 2
          Width = 28
          Height = 13
          Caption = 'Grau'
        end
        object Label5: TLabel
          Left = 528
          Top = 2
          Width = 35
          Height = 13
          Caption = 'Grupo'
        end
        object Label3: TLabel
          Left = 656
          Top = 2
          Width = 80
          Height = 13
          Caption = 'Cód.Reduzido'
        end
        object Label4: TLabel
          Left = 199
          Top = 45
          Width = 139
          Height = 13
          Caption = 'Descrição em Português'
        end
        object Label6: TLabel
          Left = 199
          Top = 80
          Width = 152
          Height = 13
          Caption = 'Descrição em outro Idioma'
        end
        object Label8: TLabel
          Left = 543
          Top = 80
          Width = 127
          Height = 13
          Caption = 'Conta Correspondente'
        end
        object Label18: TLabel
          Left = 0
          Top = 2
          Width = 83
          Height = 13
          Caption = 'Plano Contábil'
        end
        object Label20: TLabel
          Left = 560
          Top = 201
          Width = 132
          Height = 13
          Caption = 'Rateio por Plano/Patro'
        end
        object Label17: TLabel
          Left = 14
          Top = 248
          Width = 193
          Height = 13
          Caption = 'Critério para Segreg. de Recursos'
        end
        object Label22: TLabel
          Left = 301
          Top = 248
          Width = 116
          Height = 13
          Caption = 'Programa do Critério'
        end
        object Label23: TLabel
          Left = 14
          Top = 283
          Width = 112
          Height = 13
          Caption = 'Conta Extracontábil'
        end
        object dbeCodigo: TwwDBEdit
          Left = 144
          Top = 18
          Width = 150
          Height = 21
          Color = clBtnShadow
          DataField = 'PLACONTA'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
          OnExit = dbeCodigoExit
        end
        object dbeGrau: TwwDBEdit
          Left = 302
          Top = 18
          Width = 25
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'PLAGRAU'
          DataSource = ds
          ReadOnly = True
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object grpTipo: TDBRadioGroup
          Left = 340
          Top = 3
          Width = 177
          Height = 37
          Columns = 2
          DataField = 'PLATIPO'
          DataSource = ds
          Items.Strings = (
            'Sintética'
            'Analítica')
          TabOrder = 3
          TabStop = True
          Values.Strings = (
            'S'
            'A')
          OnClick = grpTipoClick
        end
        object cmbGrp: TwwDBComboBox
          Left = 528
          Top = 18
          Width = 113
          Height = 21
          ShowButton = True
          Style = csDropDown
          MapList = True
          AllowClearKey = True
          AutoDropDown = True
          DataField = 'PLAGRUPO'
          DataSource = ds
          DropDownCount = 8
          ItemHeight = 0
          Items.Strings = (
            'Ativo'#9'A'
            'Passivo'#9'P'
            'Receita'#9'R'
            'Despesa'#9'D'
            'Custo'#9'C'
            'Outros'#9'O'
            'Estatística'#9'E'
            'Patrimônio Social'#9'S')
          Sorted = False
          TabOrder = 4
          UnboundDataType = wwDefault
          OnExit = cmbGrpExit
        end
        object dbeCodReduz: TwwDBEdit
          Left = 656
          Top = 18
          Width = 105
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'PLAREDUZ'
          DataSource = ds
          ReadOnly = True
          TabOrder = 5
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object grpNatureza: TDBRadioGroup
          Left = 0
          Top = 47
          Width = 185
          Height = 66
          Caption = ' Natureza '
          DataField = 'PLANATUREZA'
          DataSource = ds
          Items.Strings = (
            'Devedora'
            'Credora'
            'Devedora ou Credora')
          TabOrder = 6
          TabStop = True
          Values.Strings = (
            'D'
            'C'
            'N')
        end
        object dbeDescPort: TwwDBEdit
          Left = 200
          Top = 59
          Width = 560
          Height = 21
          DataField = 'PLANOME'
          DataSource = ds
          MaxLength = 80
          TabOrder = 7
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeDescOIdi: TwwDBEdit
          Left = 200
          Top = 93
          Width = 328
          Height = 21
          DataField = 'PLANOMEOUTLING'
          DataSource = ds
          TabOrder = 8
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeCorresp: TwwDBEdit
          Left = 543
          Top = 93
          Width = 217
          Height = 21
          DataField = 'PLACONCORRESP'
          DataSource = ds
          Enabled = False
          TabOrder = 9
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object GroupBox4: TGroupBox
          Left = 0
          Top = 115
          Width = 553
          Height = 126
          Caption = ' Parâmetros '
          TabOrder = 10
          object chkOrdAlf: TDBCheckBox
            Left = 7
            Top = 14
            Width = 219
            Height = 17
            Caption = 'Lista em ordem alfabética'
            DataField = 'PLAORDALF'
            DataSource = ds
            TabOrder = 0
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object chkCentCust: TDBCheckBox
            Left = 7
            Top = 32
            Width = 219
            Height = 17
            Caption = 'Obriga Centro de Custo'
            DataField = 'PLACCUST'
            DataSource = ds
            TabOrder = 1
            ValueChecked = 'S'
            ValueUnchecked = 'N'
            OnClick = chkCentCustClick
          end
          object chkAltera: TDBCheckBox
            Left = 7
            Top = 51
            Width = 259
            Height = 17
            Caption = 'Permite movimentação pela Contabilidade'
            DataField = 'PLAALTERA'
            DataSource = ds
            TabOrder = 2
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object chkInativa: TDBCheckBox
            Left = 7
            Top = 69
            Width = 227
            Height = 17
            Caption = 'Inativa'
            DataField = 'PLAINATIVA'
            DataSource = ds
            TabOrder = 3
            ValueChecked = 'I'
            ValueUnchecked = 'A'
          end
          object chkSumariza: TDBCheckBox
            Left = 276
            Top = 32
            Width = 259
            Height = 17
            Caption = 'Sumarizar Lançamentos no Diário e Razão'
            DataField = 'PLASUMARIZA'
            DataSource = ds
            TabOrder = 7
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object chkContaPadrao: TDBCheckBox
            Left = 276
            Top = 88
            Width = 227
            Height = 17
            Caption = 'Conta Padrão da Secretaria'
            DataField = 'PLASECRETARIA'
            DataSource = ds
            Enabled = False
            TabOrder = 11
            ValueChecked = 'S'
            ValueUnchecked = 'N'
            Visible = False
          end
          object chkSubconta: TDBCheckBox
            Left = 276
            Top = 14
            Width = 259
            Height = 17
            Caption = 'Obriga Sub-Conta/Contas Auxiliares'
            DataField = 'PLASUBCONTA'
            DataSource = ds
            TabOrder = 6
            ValueChecked = 'S'
            ValueUnchecked = 'N'
            OnClick = chkSubcontaClick
          end
          object chkPL: TDBCheckBox
            Left = 276
            Top = 51
            Width = 227
            Height = 17
            Caption = 'Altera Patrimônio Líquido'
            DataField = 'PLAMUTACOES'
            DataSource = ds
            TabOrder = 8
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object chkConcilia: TDBCheckBox
            Left = 7
            Top = 88
            Width = 227
            Height = 17
            Caption = 'Concilia'
            DataField = 'PLACONCILIA'
            DataSource = ds
            TabOrder = 4
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object chkBloqueia: TDBCheckBox
            Left = 276
            Top = 69
            Width = 107
            Height = 17
            Caption = 'Bloqueada até'
            DataField = 'PLABLOQUE'
            DataSource = ds
            TabOrder = 9
            ValueChecked = 'S'
            ValueUnchecked = 'N'
            OnClick = chkBloqueiaClick
          end
          object dteBloqueada: TCMDateTimePicker
            Left = 384
            Top = 66
            Width = 97
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            Color = clBtnFace
            ButtonStyle = cbsCustom
            DataField = 'PLABLOQUEDATA'
            DataSource = ds
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
            ShowButton = True
            TabOrder = 10
          end
          object dbImprimeRelatEvolu: TDBCheckBox
            Left = 7
            Top = 106
            Width = 281
            Height = 17
            Caption = 'Imprime no Rel. de Evolução das Contas'
            DataField = 'PLAIMPRELATEVOL'
            DataSource = ds
            TabOrder = 5
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object dblcComLancamento: TDBCheckBox
            Left = 276
            Top = 106
            Width = 227
            Height = 17
            Caption = 'Conta Estatística com Movimento'
            DataField = 'FLGESTATCOMLANC'
            DataSource = ds
            TabOrder = 12
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
        object rdgRateio: TDBRadioGroup
          Left = 560
          Top = 116
          Width = 201
          Height = 81
          Caption = ' Segreg. Investimento ( antiga ) '
          DataField = 'PLARATEIOAP'
          DataSource = ds
          Items.Strings = (
            'Conta para &Rateio'
            'Conta &Base de Rateio'
            'Conta &Não Processada')
          TabOrder = 11
          TabStop = True
          Values.Strings = (
            'N'
            'S'
            'R')
        end
        object dblkPlanoContabil: TCMDBLookupCombo
          Left = 0
          Top = 18
          Width = 134
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCPLANO'#9'20'#9'Descrição'
            'PLANO'#9'10'#9'Código')
          DataField = 'PLANO'
          DataSource = ds
          LookupTable = CdsPlanoContabil
          LookupField = 'PLANO'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = dblkPlanoContabilCloseUp
        end
        object cmContaSegreg: TCMProcuraMaskContabil
          Left = 4
          Top = 327
          Width = 373
          Height = 73
          Caption = ' Conta para Segregação dos Planos '
          TabOrder = 13
          MostraMensagens = True
          MostraDescricao = True
          DataSource = ds
          DataField = 'PLACONTASEGREG'
          Mensagens.EmBranco = 'Chave não pode estar em branco'
          Mensagens.NaoExiste = 'Chave não existe'
          Mensagens.Sintetica = 'Chave não pode ser sintética'
          Mensagens.Analitica = 'Chave não pode ser analítica'
          PermiteChaveInvalida = False
          PermiteChaveEmBranco = True
          AceitaTipoConta = SoAnalitica
          Plano = 0
          Status = scSoAtiva
        end
        object dblkRateioPlanoPatro: TwwDBLookupCombo
          Left = 560
          Top = 215
          Width = 201
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'60'#9'Nome do Rateio'#9'F')
          DataField = 'IDRATADMPLANPATRO'
          DataSource = ds
          LookupTable = cdsRateioPlanoPatro
          LookupField = 'IDRATADMPLANPATRO'
          DropDownWidth = 8
          TabOrder = 12
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
        object dblkSegregacao: TwwDBLookupCombo
          Left = 14
          Top = 260
          Width = 260
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'60'#9'DESCRICAO'#9'F')
          DataField = 'IDSEGREGACRITER'
          DataSource = ds
          LookupTable = cdsSegregaCriter
          LookupField = 'IDSEGREGACRITER'
          DropDownWidth = 8
          TabOrder = 14
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
        object cboPrograma: TCMDBLookupCombo
          Left = 301
          Top = 260
          Width = 260
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCPROGRAMA'#9'40'#9'Descrição'#9'F')
          DataField = 'IDPROGRAMA'
          DataSource = ds
          LookupTable = cdsPrograma
          LookupField = 'IDPROGRAMA'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 15
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object gbSegregaFDOADM: TGroupBox
          Left = 4
          Top = 401
          Width = 757
          Height = 101
          Caption = ' Segregação Fundo Administrativo '
          TabOrder = 16
          object CMContaSegregFDOAdmCred: TCMProcuraMaskContabil
            Left = 8
            Top = 23
            Width = 365
            Height = 70
            Caption = ' Conta Crédito '
            TabOrder = 0
            MostraMensagens = True
            MostraDescricao = True
            DataSource = ds
            DataField = 'SEGFDOADMCredito'
            Mensagens.EmBranco = 'Chave não pode estar em branco'
            Mensagens.NaoExiste = 'Chave não existe'
            Mensagens.Sintetica = 'Chave não pode ser sintética'
            Mensagens.Analitica = 'Chave não pode ser analítica'
            PermiteChaveInvalida = False
            PermiteChaveEmBranco = True
            AceitaTipoConta = SoAnalitica
            Plano = 0
            Status = scSoAtiva
          end
          object CMContaSegregFDOADMDeb: TCMProcuraMaskContabil
            Left = 382
            Top = 23
            Width = 371
            Height = 70
            Caption = ' Conta Débito '
            TabOrder = 1
            MostraMensagens = True
            MostraDescricao = True
            DataSource = ds
            DataField = 'SEGFDOADMDebito'
            Mensagens.EmBranco = 'Chave não pode estar em branco'
            Mensagens.NaoExiste = 'Chave não existe'
            Mensagens.Sintetica = 'Chave não pode ser sintética'
            Mensagens.Analitica = 'Chave não pode ser analítica'
            PermiteChaveInvalida = False
            PermiteChaveEmBranco = True
            AceitaTipoConta = SoAnalitica
            Plano = 0
            Status = scSoAtiva
          end
        end
        object chkUsoExcPga: TDBCheckBox
          Left = 583
          Top = 263
          Width = 74
          Height = 17
          Caption = 'Uso PGA'
          DataField = 'FLGUSOEXCPGA'
          DataSource = ds
          TabOrder = 17
          ValueChecked = 'I'
          ValueUnchecked = 'A'
        end
        object CMContaAglutinacao: TCMProcuraMaskContabil
          Left = 384
          Top = 327
          Width = 377
          Height = 73
          Caption = 'Conta para Aglutinação'
          TabOrder = 18
          MostraMensagens = True
          MostraDescricao = True
          DataSource = ds
          DataField = 'PLAAGLUTINACAO'
          Mensagens.EmBranco = 'Chave não pode estar em branco'
          Mensagens.NaoExiste = 'Chave não existe'
          Mensagens.Sintetica = 'Chave não pode ser sintética'
          Mensagens.Analitica = 'Chave não pode ser analítica'
          PermiteChaveInvalida = False
          PermiteChaveEmBranco = True
          AceitaTipoConta = Indiferente
          Plano = 0
          Status = scSoAtiva
        end
        object edtContaExtracontab: TMaskEdit
          Left = 14
          Top = 296
          Width = 260
          Height = 21
          TabOrder = 19
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Sub-Grupos && Moedas'
        object GroupBox1: TGroupBox
          Left = 16
          Top = -2
          Width = 625
          Height = 107
          Caption = ' Sub-Grupos '
          TabOrder = 0
          object lblsub1: TLabel
            Left = 16
            Top = 17
            Width = 72
            Height = 13
            Caption = 'Sub-Grupo 1'
          end
          object lblsub2: TLabel
            Left = 16
            Top = 57
            Width = 72
            Height = 13
            Caption = 'Sub-Grupo 2'
          end
          object lblsub3: TLabel
            Left = 320
            Top = 17
            Width = 72
            Height = 13
            Caption = 'Sub-Grupo 3'
          end
          object lblsub4: TLabel
            Left = 320
            Top = 57
            Width = 72
            Height = 13
            Caption = 'Sub-Grupo 4'
          end
          object dblkSubGrupo1: TwwDBLookupCombo
            Left = 16
            Top = 33
            Width = 289
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCSUBGRP'#9'25'#9'Descrição')
            DataField = 'PLASUBGR1'
            DataSource = ds
            LookupTable = CdsSubGrupo
            LookupField = 'CODSUBGRP'
            Style = csDropDownList
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
          end
          object dblkSubGrupo2: TwwDBLookupCombo
            Left = 16
            Top = 73
            Width = 289
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCSUBGRP'#9'25'#9'Descrição')
            DataField = 'PLASUBGR2'
            DataSource = ds
            LookupTable = CdsSubGrupo
            LookupField = 'CODSUBGRP'
            Style = csDropDownList
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
          end
          object dblkSubGrupo3: TwwDBLookupCombo
            Left = 320
            Top = 33
            Width = 289
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCSUBGRP'#9'25'#9'Descrição')
            DataField = 'PLASUBGR3'
            DataSource = ds
            LookupTable = CdsSubGrupo
            LookupField = 'CODSUBGRP'
            Style = csDropDownList
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
          end
          object dblkSubGrupo4: TwwDBLookupCombo
            Left = 320
            Top = 73
            Width = 289
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCSUBGRP'#9'25'#9'Descrição')
            DataField = 'PLASUBGR4'
            DataSource = ds
            LookupTable = CdsSubGrupo
            LookupField = 'CODSUBGRP'
            Style = csDropDownList
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
          end
        end
        object GroupBox5: TGroupBox
          Left = 16
          Top = 105
          Width = 625
          Height = 107
          Caption = ' Tipo de Conversão Padrão '
          TabOrder = 1
          object Label10: TLabel
            Left = 16
            Top = 16
            Width = 79
            Height = 13
            Caption = 'Moeda Oficial'
          end
          object Label11: TLabel
            Left = 16
            Top = 58
            Width = 108
            Height = 13
            Caption = 'Moeda Gerencial 1'
          end
          object Label9: TLabel
            Left = 320
            Top = 16
            Width = 108
            Height = 13
            Caption = 'Moeda Gerencial 2'
          end
          object Label12: TLabel
            Left = 320
            Top = 58
            Width = 108
            Height = 13
            Caption = 'Moeda Gerencial 3'
          end
          object dbcmbTipGer: TwwDBComboBox
            Left = 16
            Top = 74
            Width = 289
            Height = 21
            ShowButton = True
            Style = csDropDownList
            MapList = True
            AllowClearKey = True
            AutoDropDown = True
            DataField = 'PLATIPCONVGER'
            DataSource = ds
            DropDownCount = 8
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ItemHeight = 0
            Items.Strings = (
              'Não Converte'#9'N'
              'Histórico Médio'#9'H'
              'Diário'#9'D'
              'Moeda Corrente do Último Dia'#9'C'
              'Manual'#9'M')
            ParentFont = False
            Sorted = False
            TabOrder = 1
            UnboundDataType = wwDefault
          end
          object dbcmbTipOfi: TwwDBComboBox
            Left = 16
            Top = 32
            Width = 289
            Height = 21
            ShowButton = True
            Style = csDropDownList
            MapList = True
            AllowClearKey = True
            AutoDropDown = True
            DataField = 'PLATIPCONVOFICIAL'
            DataSource = ds
            DropDownCount = 8
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ItemHeight = 0
            Items.Strings = (
              'Não Converte'#9'N'
              'Histórico Médio'#9'H'
              'Diário'#9'D'
              'Moeda Corrente do Último Dia'#9'C'
              'Manual'#9'M')
            ParentFont = False
            Sorted = False
            TabOrder = 0
            UnboundDataType = wwDefault
          end
          object dbcmbTipGer2: TwwDBComboBox
            Left = 320
            Top = 32
            Width = 288
            Height = 21
            ShowButton = True
            Style = csDropDownList
            MapList = True
            AllowClearKey = True
            AutoDropDown = True
            DataField = 'PLATIPCONVGEREN1'
            DataSource = ds
            DropDownCount = 8
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ItemHeight = 0
            Items.Strings = (
              'Não Converte'#9'N'
              'Histórico Médio'#9'H'
              'Diário'#9'D'
              'Moeda Corrente do Último Dia'#9'C'
              'Manual'#9'M')
            ParentFont = False
            Sorted = False
            TabOrder = 2
            UnboundDataType = wwDefault
          end
          object dbcmbTipGer3: TwwDBComboBox
            Left = 320
            Top = 74
            Width = 289
            Height = 21
            ShowButton = True
            Style = csDropDownList
            MapList = True
            AllowClearKey = True
            AutoDropDown = True
            DataField = 'PLATIPCONVGEREN2'
            DataSource = ds
            DropDownCount = 8
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ItemHeight = 0
            Items.Strings = (
              'Não Converte'#9'N'
              'Histórico Médio'#9'H'
              'Diário'#9'D'
              'Moeda Corrente do Último Dia'#9'C'
              'Manual'#9'M')
            ParentFont = False
            Sorted = False
            TabOrder = 3
            UnboundDataType = wwDefault
          end
        end
        object gbMoedaHist: TGroupBox
          Left = 16
          Top = 212
          Width = 301
          Height = 112
          Caption = ' Moeda Histórica '
          TabOrder = 2
          object Label7: TLabel
            Left = 11
            Top = 16
            Width = 39
            Height = 13
            Caption = 'Moeda'
          end
          object cmContraPartida: TCMProcuraMaskContabil
            Left = 11
            Top = 55
            Width = 269
            Height = 51
            Caption = ' Contra Partida '
            TabOrder = 0
            MostraMensagens = True
            MostraDescricao = True
            DataSource = ds
            DataField = 'PLACONTRAPARTIDA'
            Mensagens.EmBranco = 'Chave não pode estar em branco'
            Mensagens.NaoExiste = 'Chave não existe'
            Mensagens.Sintetica = 'Chave não pode ser sintética'
            Mensagens.Analitica = 'Chave não pode ser analítica'
            PermiteChaveInvalida = False
            PermiteChaveEmBranco = True
            AceitaTipoConta = SoAnalitica
            Plano = 0
            Status = scSoAtiva
          end
          object dblkMoeda: TwwDBLookupCombo
            Left = 10
            Top = 30
            Width = 270
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MOEDESC'#9'20'#9'MOEDESC')
            DataField = 'PLAMOEDAHISTORICA'
            DataSource = ds
            LookupTable = CdsMoeda
            LookupField = 'MOECODIGO'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
          end
        end
        object gbTxJuros: TGroupBox
          Left = 340
          Top = 212
          Width = 301
          Height = 112
          Caption = ' Taxa de Juros para Correção '
          TabOrder = 3
          object lblPercJuros: TLabel
            Left = 17
            Top = 14
            Width = 62
            Height = 13
            Caption = 'Percentual'
          end
          object Label19: TLabel
            Left = 141
            Top = 38
            Width = 25
            Height = 13
            Caption = 'a.m.'
          end
          object cmContraPartidaJuros: TCMProcuraMaskContabil
            Left = 17
            Top = 55
            Width = 269
            Height = 51
            Caption = ' Contra Partida '
            TabOrder = 0
            MostraMensagens = True
            MostraDescricao = True
            DataSource = ds
            DataField = 'PLACONTRAPTXJUROS'
            Mensagens.EmBranco = 'Chave não pode estar em branco'
            Mensagens.NaoExiste = 'Chave não existe'
            Mensagens.Sintetica = 'Chave não pode ser sintética'
            Mensagens.Analitica = 'Chave não pode ser analítica'
            PermiteChaveInvalida = False
            PermiteChaveEmBranco = True
            AceitaTipoConta = SoAnalitica
            Plano = 0
            Status = scSoAtiva
          end
          object dbrePercTxJuros: TDBRealEdit
            Left = 17
            Top = 30
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 1
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'PLATXJUROS'
            DataSource = ds
          end
        end
      end
      object TabSheet4: TTabSheet
        Caption = 'Conta x C.Custo'
        object Label13: TLabel
          Left = 16
          Top = 8
          Width = 98
          Height = 13
          Caption = 'Centros de Custo'
        end
        object Label14: TLabel
          Left = 352
          Top = 8
          Width = 272
          Height = 13
          Caption = 'Centros de Custo relacionados à Conta Contábil'
        end
        object grdCCusto: TwwDBGrid
          Left = 16
          Top = 24
          Width = 289
          Height = 291
          Selected.Strings = (
            'CODEXTERNO'#9'10'#9'Código'
            'NOME'#9'21'#9'Nome')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsCCusto
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnCalcCellColors = grdCCustoCalcCellColors
          OnDblClick = btnVaiUmClick
          IndicatorColor = icBlack
          OnTopRowChanged = grdCCustoTopRowChanged
        end
        object grdContasxCC: TwwDBGrid
          Left = 400
          Top = 16
          Width = 289
          Height = 291
          Selected.Strings = (
            'CODEXTERNO'#9'10'#9'Código'
            'NOME'#9'21'#9'Nome')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Color = clBtnFace
          DataSource = dsContasxCC
          Enabled = False
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 5
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnCalcCellColors = grdContasxCCCalcCellColors
          OnDblClick = btnVaiUmClick
          IndicatorColor = icBlack
          OnTopRowChanged = grdContasxCCTopRowChanged
        end
        object btnVaiTodos: TBitBtn
          Left = 316
          Top = 104
          Width = 25
          Height = 25
          Enabled = False
          TabOrder = 1
          OnClick = btnVaiTodosClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF888888006666600
            88888887788888778F88887666666666088888788888888878F887E666666666
            608887F88F888F8887F887E6F666F6666088878878F878F8878F7E66FF66FF66
            66087F88778F778F887F7E66FFF6FFF666087F8877787778F87F7E66FFFFFFFF
            66087F8877777777887F7E66FFF6FFF666087F8877787778887F7E66FF66FF66
            660878F877887788887887E6F666F666608887F87888788887F887E666666666
            6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
            8888888778FFFF77888888888777778888888888877777888888}
          NumGlyphs = 2
        end
        object btnVaiUm: TBitBtn
          Left = 316
          Top = 136
          Width = 25
          Height = 25
          Enabled = False
          TabOrder = 2
          OnClick = btnVaiUmClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF888888006666600
            88888887788888778F88887666666666088888788888888878F887E666666666
            608887F8888F888887F887E666F66666608887888878F888878F7E6666FF6666
            66087F8888778F88887F7E6666FFF66666087F88887778F8887F7E6666FFFF66
            66087F8888777788887F7E6666FFF66666087F8888777888887F7E6666FF6666
            660878F888778888887887E666F66666608887F88878888887F887E666666666
            6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
            8888888778FFFF77888888888777778888888888877777888888}
          NumGlyphs = 2
        end
        object btnVoltaTodos: TBitBtn
          Left = 316
          Top = 208
          Width = 25
          Height = 25
          Enabled = False
          TabOrder = 4
          OnClick = btnVoltaTodosClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF888888006666600
            88888887788888778F88887666666666088888788888888878F887E666666666
            608887F8888F888F87F887E666F666F660888788887F887F878F7E666FF66FF6
            66087F88877F877F887F7E66FFF6FFF666087F88777F777F887F7E6FFFFFFFF6
            66087F877777777F887F7E66FFF6FFF666087F88777F777F887F7E666FF66FF6
            660878F8877F877F887887E666F666F6608887F88878887887F887E666666666
            6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
            8888888778FFFF77888888888777778888888888877777888888}
          NumGlyphs = 2
        end
        object btnVoltaUm: TBitBtn
          Left = 316
          Top = 176
          Width = 25
          Height = 25
          Enabled = False
          TabOrder = 3
          OnClick = btnVoltaUmClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF888888006666600
            88888887788888778F88887666666666088888788888888878F887E666666666
            608887F888888F8887F887E66666F6666088878888887F88878F7E66666FF666
            66087F8888877F88887F7E6666FFF66666087F8888777F88887F7E666FFFF666
            66087F8887777F88887F7E6666FFF66666087F8888777F88887F7E66666FF666
            660878F888877F88887887E66666F666608887F88888788887F887E666666666
            6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
            8888888778FFFF77888888888777778888888888877777888888}
          NumGlyphs = 2
        end
      end
      object TabSheet5: TTabSheet
        Caption = 'Conta x Sub-Conta'
        object Label15: TLabel
          Left = 16
          Top = 8
          Width = 66
          Height = 13
          Caption = 'Sub-Contas'
        end
        object Label16: TLabel
          Left = 352
          Top = 8
          Width = 240
          Height = 13
          Caption = 'Sub-Contas relacionadas à Conta Contábil'
        end
        object grdSubConta: TwwDBGrid
          Left = 16
          Top = 24
          Width = 289
          Height = 291
          Selected.Strings = (
            'CODSUBCONTA'#9'6'#9'Código'
            'NOMESUBCONTA'#9'25'#9'Descrição')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsSubConta
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnCalcCellColors = grdSubContaCalcCellColors
          OnDblClick = btnVaiUm2Click
          IndicatorColor = icBlack
          OnTopRowChanged = grdSubContaTopRowChanged
        end
        object grdContasxSC: TwwDBGrid
          Left = 352
          Top = 24
          Width = 289
          Height = 291
          Selected.Strings = (
            'CODSUBCONTA'#9'6'#9'Código'
            'NOMESUBCONTA'#9'25'#9'Descrição')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Color = clBtnFace
          DataSource = dsContasxCC
          Enabled = False
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 5
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnCalcCellColors = grdContasxSCCalcCellColors
          OnDblClick = btnVaiUm2Click
          IndicatorColor = icBlack
          OnTopRowChanged = grdContasxSCTopRowChanged
        end
        object btnVaiTodos2: TBitBtn
          Left = 316
          Top = 104
          Width = 25
          Height = 25
          Enabled = False
          TabOrder = 1
          OnClick = btnVaiTodos2Click
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF888888006666600
            88888887788888778F88887666666666088888788888888878F887E666666666
            608887F88F888F8887F887E6F666F6666088878878F878F8878F7E66FF66FF66
            66087F88778F778F887F7E66FFF6FFF666087F8877787778F87F7E66FFFFFFFF
            66087F8877777777887F7E66FFF6FFF666087F8877787778887F7E66FF66FF66
            660878F877887788887887E6F666F666608887F87888788887F887E666666666
            6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
            8888888778FFFF77888888888777778888888888877777888888}
          NumGlyphs = 2
        end
        object btnVaiUm2: TBitBtn
          Left = 316
          Top = 136
          Width = 25
          Height = 25
          Enabled = False
          TabOrder = 2
          OnClick = btnVaiUm2Click
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF888888006666600
            88888887788888778F88887666666666088888788888888878F887E666666666
            608887F8888F888887F887E666F66666608887888878F888878F7E6666FF6666
            66087F8888778F88887F7E6666FFF66666087F88887778F8887F7E6666FFFF66
            66087F8888777788887F7E6666FFF66666087F8888777888887F7E6666FF6666
            660878F888778888887887E666F66666608887F88878888887F887E666666666
            6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
            8888888778FFFF77888888888777778888888888877777888888}
          NumGlyphs = 2
        end
        object btnVoltaUm2: TBitBtn
          Left = 316
          Top = 176
          Width = 25
          Height = 25
          Enabled = False
          TabOrder = 3
          OnClick = btnVoltaUm2Click
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF888888006666600
            88888887788888778F88887666666666088888788888888878F887E666666666
            608887F888888F8887F887E66666F6666088878888887F88878F7E66666FF666
            66087F8888877F88887F7E6666FFF66666087F8888777F88887F7E666FFFF666
            66087F8887777F88887F7E6666FFF66666087F8888777F88887F7E66666FF666
            660878F888877F88887887E66666F666608887F88888788887F887E666666666
            6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
            8888888778FFFF77888888888777778888888888877777888888}
          NumGlyphs = 2
        end
        object btnVoltaTodos2: TBitBtn
          Left = 316
          Top = 208
          Width = 25
          Height = 25
          Enabled = False
          TabOrder = 4
          OnClick = btnVoltaTodos2Click
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF888888006666600
            88888887788888778F88887666666666088888788888888878F887E666666666
            608887F8888F888F87F887E666F666F660888788887F887F878F7E666FF66FF6
            66087F88877F877F887F7E66FFF6FFF666087F88777F777F887F7E6FFFFFFFF6
            66087F877777777F887F7E66FFF6FFF666087F88777F777F887F7E666FF66FF6
            660878F8877F877F887887E666F666F6608887F88878887887F887E666666666
            6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
            8888888778FFFF77888888888777778888888888877777888888}
          NumGlyphs = 2
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Árvore de Contas Contábeis'
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 763
          Height = 42
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object btnExpande: TSpeedButton
            Left = 8
            Top = 8
            Width = 113
            Height = 25
            Caption = 'E&xpande Contas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              88888800000000000000877777777777777087F888888888887087F8B8B008B8
              B87087FB8B800B8B8B7087F8B0000008B87087FB8000000B8B7087F8B8B008B8
              B87087FB8B800B8B8B7087FFFFFFFFFFFF7087B8B8B8B7777778887B8B8B7888
              8888888777778888888888888888888888888888888888888888}
            ParentFont = False
            OnClick = btnExpandeClick
          end
          object btnSistetiza: TSpeedButton
            Left = 128
            Top = 8
            Width = 113
            Height = 25
            Caption = 'S&intetiza Contas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              88888800000000000000877777777777777087F888888888887087F8B8B8B8B8
              B87087FB8B8B8B8B8B7087F8B0000008B87087FB8000000B8B7087F8B8B8B8B8
              B87087FB8B8B8B8B8B7087FFFFFFFFFFFF7087B8B8B8B7777778887B8B8B7888
              8888888777778888888888888888888888888888888888888888}
            ParentFont = False
            OnClick = btnSistetizaClick
          end
        end
        object treeplano: TCMTreeViewMT
          Left = 0
          Top = 42
          Width = 763
          Height = 462
          PodeNavegar = True
          DataSource = dsTreeContas
          CampoChave = 'PLACONTA'
          CampoDescricao = 'PLANOME'
          CampoTipo = 'PLATIPO'
          Align = alClient
        end
      end
      object TabSheet6: TTabSheet
        Caption = 'Detalhes'
        ImageIndex = 5
        object Label21: TLabel
          Left = 18
          Top = 32
          Width = 138
          Height = 13
          Caption = 'Descrição/Observações'
        end
        object DBMemoObs: TDBMemo
          Left = 16
          Top = 48
          Width = 521
          Height = 225
          DataField = 'OBSERVACAO'
          DataSource = ds
          TabOrder = 0
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 773
  end
  inherited Dock971: TDock97
    Top = 581
    Width = 773
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 46
    Top = 387
    TargetsData = (
      1
      3
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        ''
        'Items'
        0)
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 286
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 84
    Top = 375
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 344
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 252
    Top = 51
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PLANOCONTA.PLACONTA'
      'PLANOCONTA.PLANOME'
      'PLANOCONTA.PLANOMEOUTLING'
      'PLANOCONTA.PLACONCORRESP'
      'PLANOCONTA.PLAREDUZ'
      'PLANOCONTA.PLAINATIVA'
      'PLANOCONTA.PLANO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'N'
      'C'
      'N')
    Descricao.Strings = (
      'Cód.Conta'
      'Nome'
      'Nome em outra Língua'
      'Conta Correspondente'
      'Cód.Reduzido'
      'D/C'
      'Plano')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PLANOCONTA')
    CamposChave.Strings = (
      'PLANOCONTA.PLANO'
      'PLANOCONTA.PLACONTA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '18'
      '40'
      '40'
      '18'
      '10'
      '1'
      '10')
    AfterOpenCds = MontaSelectAfterOpenCds
    BeforeOpenCds = MontaSelectBeforeOpenCds
    Left = 496
    Top = 24
  end
  object MontaSelectConta: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PLANOCONTA.PLACONTA'
      'PLANOCONTA.PLANOME'
      'PLANOCONTA.PLAREDUZ'
      'PLANOCONTA.PLANOMEOUTLING')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Nome'
      'Código Reduzido'
      'Nome em outra língua')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PLANOCONTA')
    CamposChave.Strings = (
      'PLANOCONTA.PLACONTA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '18'
      '40'
      '10'
      '40')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      ''
      '')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      '')
    Left = 638
    Top = 17
  end
  object CdsPlanoContabil: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 288
    Top = 167
  end
  object CdsMoeda: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 425
    Top = 180
  end
  object CdsSubGrupo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 465
    Top = 88
  end
  object CdsCCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 101
    Top = 104
  end
  object dsCCusto: TwwDataSource
    DataSet = CdsCCusto
    Left = 33
    Top = 192
  end
  object dsContasxCC: TwwDataSource
    DataSet = CdsContasxCC
    Left = 497
    Top = 228
  end
  object CdsContasxCC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 497
    Top = 180
  end
  object CdsSubConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 237
    Top = 248
  end
  object dsSubConta: TwwDataSource
    DataSet = CdsSubConta
    Left = 289
    Top = 292
  end
  object CdsContasxSC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 585
    Top = 180
  end
  object dsContasxSC: TwwDataSource
    DataSet = CdsContasxSC
    Left = 585
    Top = 220
  end
  object CdsTreeContas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 89
    Top = 236
  end
  object dsTreeContas: TwwDataSource
    DataSet = CdsTreeContas
    Left = 201
    Top = 252
  end
  object cdsRateioPlanoPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 601
    Top = 276
  end
  object cdsSegregaCriter: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 153
    Top = 484
  end
  object qryMontaSelect: TCMSqlParams
    SQL.Strings = (
      '-- MANTER ESTA QUERY IDENTICA AO MONTASELECT'
      '-- RESULTA TODAS AS CONTAS PAI DA CONTA PASSADA COMO PARÂMETRO'
      'SELECT '
      '   PLANOCONTA.PLACONTA AS C0,'
      '   PLANOCONTA.PLANOME AS C1,'
      '   PLANOCONTA.PLANOMEOUTLING AS C2,'
      '   PLANOCONTA.PLACONCORRESP AS C3,'
      '   PLANOCONTA.PLAREDUZ AS C4,'
      '   PLANOCONTA.PLAINATIVA AS C5,'
      '   PLANOCONTA.PLANO AS C6,'
      '   PLANOCONTA.PLANO AS C7,'
      '   PLANOCONTA.PLACONTA AS C8'
      'FROM'
      '   PLANOCONTA'
      'WHERE'
      '   PLANOCONTA.PLACONTA = :PLACONTA'
      '   AND PLANOCONTA.PLANO = :PLANO'
      ' '
      ' ')
    ClientDataSet = cdsMontaSelect
    Left = 548
    Top = 1
  end
  object cdsMontaSelect: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 429
    Top = 8
  end
  object cdsPrograma: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 433
    Top = 344
  end
  object SqlPrograma: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   IDPROGRAMA,'
      '   DESCPROGRAMA'
      'FROM '
      '   PROGRAMA'
      'ORDER BY'
      '   2')
    ClientDataSet = cdsPrograma
    Left = 365
    Top = 336
  end
end
