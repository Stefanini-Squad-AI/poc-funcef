inherited frmCadFilial: TfrmCadFilial
  Left = 155
  Caption = 'Cadastro de Estabelecimentos'
  ClientHeight = 655
  ClientWidth = 1054
  WindowState = wsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 1054
    Height = 569
    BorderWidth = 2
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 2
      Top = 107
      Width = 1050
      Height = 460
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos'
        'Contas Bancárias'
        'Dados para Folha'
        'Dados para FGTS'
        'Outras Guias'
        'Processos'
        'ACT')
      TabIndex = 8
      detdbGrids.Strings = (
        ''
        'dbGrdDet'
        'dbgTelefone'
        'dbgContato'
        'GrdContaBancaria_Padrao'
        ''
        ''
        ''
        'dbgrdProcessos'
        'dbgrdACT')
      inherited Dock973: TDock97 [0]
        Width = 1042
      end
      inherited Dock974: TDock97 [1]
        Left = 956
        Height = 401
      end
      inherited pgctrlDetalhe: TPageControl [2]
        Width = 952
        Height = 401
        ActivePage = tbshProcessos
        inherited tbsDocumento: TTabSheet
          Caption = 'tbsDocumento'
          inherited PgCtrlPesFisica_Padrao: TPageControl
            Width = 944
            Height = 373
          end
          inherited PnlDocumentos_Padrao: TPanel
            Width = 944
            Height = 373
            inherited pnlItemsDoc: TPanel
              Height = 371
              inherited pnlDataHabilitacao: TPanel
                Top = 325
                TabOrder = 9
              end
              inherited pnlPais: TPanel
                Top = 371
              end
              object pnlEstabelecimento: TPanel
                Left = 0
                Top = 279
                Width = 172
                Height = 46
                Align = alTop
                TabOrder = 6
                object lblEstab: TLabel
                  Left = 10
                  Top = 2
                  Width = 94
                  Height = 13
                  Caption = 'Estabelecimento'
                end
                object dbcmbEstab: TwwDBComboBox
                  Left = 11
                  Top = 17
                  Width = 150
                  Height = 21
                  ShowButton = True
                  Style = csDropDownList
                  MapList = True
                  AllowClearKey = False
                  DataField = 'TIPOESTABE'
                  DataSource = dsSubTipo
                  DropDownCount = 8
                  ItemHeight = 0
                  Items.Strings = (
                    'Matriz'#9'M'
                    'Filial'#9'F')
                  Sorted = False
                  TabOrder = 0
                  UnboundDataType = wwDefault
                end
              end
            end
            inherited pnlFoto: TPanel
              Width = 454
              Height = 371
              inherited BvlImagem: TBevel
                Height = 340
              end
              inherited PnlAssociaFoto_Padrao: TPanel
                Top = 340
                Width = 454
                inherited btnAssociarimgPessoa: TButton
                  Caption = 'Associar &Logotipo'
                end
              end
              inherited SbImagePessoa_Padrao: TScrollBox
                Width = 452
                Height = 340
              end
            end
            inherited lstDocumentos: TListView
              Height = 371
            end
          end
        end
        inherited tbsDet: TTabSheet
          Caption = 'tbsDet'
          inherited pnlControlesDet: TPanel [0]
            Width = 944
            Height = 373
            TabOrder = 1
            inherited lblPdLogradouro: TLabel
              Left = 148
            end
            inherited lblPdEstado: TLabel
              Left = 366
            end
            inherited lblPdNumero: TLabel
              Left = 602
            end
            inherited lblPdCEP: TLabel
              Left = 554
            end
            inherited lblBairro: TLabel
              Left = 333
            end
            inherited lblPdPais: TLabel
              Left = 603
            end
            object lblTipoLogradouro: TLabel [9]
              Left = 14
              Top = 46
              Width = 112
              Height = 13
              Caption = 'Tipo de Logradouro'
            end
            object lblUF: TLabel [10]
              Left = 525
              Top = 129
              Width = 17
              Height = 13
              Caption = 'UF'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblCodMuniEnd: TLabel [11]
              Left = 234
              Top = 130
              Width = 118
              Height = 13
              Caption = 'Código do Município'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            inherited dbedNomeEndereco: TDBEdit
              Width = 659
            end
            inherited dbedLogradouro: TDBEdit
              Left = 148
              Width = 444
              TabOrder = 2
            end
            inherited DBEDCOMPLEMENTO: TwwDBEdit
              Width = 307
              TabOrder = 4
            end
            inherited dbedEstado: TwwDBEdit
              Left = 366
              Enabled = False
              TabOrder = 9
            end
            inherited dbedBairro: TwwDBEdit
              Left = 333
              Width = 210
              TabOrder = 5
            end
            inherited DBNUMERO: TDBEdit
              Left = 602
              TabOrder = 3
            end
            inherited dbedCEP: TwwDBEdit
              Left = 554
              Width = 119
              TabOrder = 6
            end
            inherited dbedPais: TwwDBEdit
              Left = 603
              Enabled = False
              TabOrder = 12
            end
            inherited grpTipoEnd: TGroupBox
              Left = 747
              Height = 373
              TabOrder = 7
            end
            object dblkpTpLogradouro: TwwDBLookupCombo
              Left = 16
              Top = 60
              Width = 121
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'15'#9'Nome')
              DataField = 'IDTIPO_LOGRADOURO'
              DataSource = dsEndereco
              LookupTable = CdsTpLogradouro
              LookupField = 'IDTIPO_LOGRADOURO'
              TabOrder = 1
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
            object dbedUF: TwwDBEdit
              Left = 525
              Top = 148
              Width = 69
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'CODESTADO'
              DataSource = dsEndereco
              Enabled = False
              ReadOnly = True
              TabOrder = 10
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedCodMunicipio: TwwDBEdit
              Left = 234
              Top = 148
              Width = 123
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'CODMUNICIPIO'
              DataSource = dsEndereco
              Enabled = False
              ReadOnly = True
              TabOrder = 8
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
          inherited dbgrdDet: TwwDBGrid [1]
            Width = 944
            Height = 373
            Selected.Strings = ()
            TabOrder = 0
          end
        end
        inherited tbsTelefone: TTabSheet
          Caption = 'tbsTelefone'
          inherited SplContatos_Padrao: TSplitter
            Left = 715
            Height = 373
          end
          inherited dbgTelefone: TwwDBGrid
            Width = 715
            Height = 373
          end
          inherited Panel1: TPanel
            Width = 715
            Height = 373
            inherited DBEDDDI: TDBEdit
              TabOrder = 1
            end
            inherited DBEDDDD: TDBEdit
              TabOrder = 2
            end
            inherited DBEDNUMERO: TwwDBEdit
              TabOrder = 3
            end
            inherited GroupBox4: TGroupBox
              TabOrder = 0
            end
          end
          inherited PnlContatol_Padrao: TPanel
            Left = 718
            Height = 373
            inherited GrdExibeContatos_Padrao: TwwDBGrid
              Height = 353
            end
          end
        end
        inherited tbsContato: TTabSheet
          Caption = 'tbsContato'
          inherited SplTelefones_Padrao: TSplitter
            Left = 742
            Height = 373
          end
          inherited dbgContato: TwwDBGrid [1]
            Width = 742
            Height = 373
          end
          inherited Panel2: TPanel [2]
            Width = 742
            Height = 373
            inherited dbedcontatoemail: TDBEdit
              TabOrder = 3
            end
            inherited EdtCargo_Padrao: TDBEdit
              TabOrder = 5
            end
            inherited EdtSetor_Padrao: TDBEdit
              TabOrder = 6
            end
            inherited DbmObs_Padrao: TDBMemo
              TabOrder = 1
            end
            inherited dbedContatoNome: TDBEdit
              TabOrder = 2
            end
            inherited EdtDataNascimento_Padrao: TCMDateTimePicker
              TabOrder = 4
            end
            inherited BtnTelefones: TBitBtn
              TabOrder = 0
            end
          end
          inherited PnlTelefones_Padrao: TPanel
            Left = 745
            Height = 373
            inherited GrdTelefones_Padrao: TwwDBGrid
              Height = 361
            end
          end
        end
        inherited tbsDadosBancarios: TTabSheet
          Caption = 'tbsDadosBancarios'
          inherited GrdContaBancaria_Padrao: TwwDBGrid
            Width = 944
            Height = 373
          end
          inherited PnlDadosBancarios_Padrao: TPanel
            Width = 944
            Height = 373
          end
        end
        object tbshFolha: TTabSheet
          Caption = 'tbshFolha'
          object gbxFichas: TGroupBox
            Left = 18
            Top = 8
            Width = 185
            Height = 65
            Caption = 'Fichas de Registro'
            TabOrder = 0
            object Label2: TLabel
              Left = 9
              Top = 18
              Width = 82
              Height = 13
              Caption = 'Número Inicial'
            end
            object Label13: TLabel
              Left = 9
              Top = 42
              Width = 75
              Height = 13
              Caption = 'Número Final'
            end
            object dbedRegIni: TwwDBEdit
              Left = 105
              Top = 15
              Width = 70
              Height = 21
              DataField = 'FICHAREGINI'
              DataSource = dsSubTipo
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedRegFim: TwwDBEdit
              Left = 105
              Top = 39
              Width = 70
              Height = 21
              DataField = 'FICHAREGFIM'
              DataSource = dsSubTipo
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
          object gbxHorarios: TGroupBox
            Left = 213
            Top = 8
            Width = 435
            Height = 86
            Caption = 'Esquema de Horários'
            TabOrder = 1
            object Label15: TLabel
              Left = 8
              Top = 56
              Width = 102
              Height = 13
              Caption = 'Adic.Noturno: Fim'
            end
            object Label20: TLabel
              Left = 215
              Top = 26
              Width = 139
              Height = 13
              Caption = 'Extra Diurno Antecipado'
            end
            object Label21: TLabel
              Left = 215
              Top = 56
              Width = 170
              Height = 13
              Caption = 'Extra Diurno Após Expediente'
            end
            object Label3: TLabel
              Left = 8
              Top = 27
              Width = 116
              Height = 13
              Caption = 'Adic.Noturno: Inicío'
            end
            object wwDBEdit2: TwwDBEdit
              Left = 129
              Top = 23
              Width = 70
              Height = 21
              Hint = 'Expresso em HH:MM'
              DataField = 'ADICNOTURINI'
              DataSource = dsSubTipo
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object wwDBEdit3: TwwDBEdit
              Left = 129
              Top = 53
              Width = 70
              Height = 21
              Hint = 'Expresso em HH:MM'
              DataField = 'ADICNOTURFIM'
              DataSource = dsSubTipo
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object wwDBEdit6: TwwDBEdit
              Left = 390
              Top = 23
              Width = 35
              Height = 21
              Hint = 'Expresso em Minutos'
              DataField = 'EXTRADIURNOINI'
              DataSource = dsSubTipo
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object wwDBEdit7: TwwDBEdit
              Left = 390
              Top = 53
              Width = 35
              Height = 21
              Hint = 'Expresso em Minutos'
              DataField = 'EXTRADIURNOFIM'
              DataSource = dsSubTipo
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
          object gbxAtividade: TGroupBox
            Left = 213
            Top = 108
            Width = 435
            Height = 104
            Caption = 'Atividade'
            TabOrder = 2
            object Label25: TLabel
              Left = 11
              Top = 18
              Width = 83
              Height = 13
              Caption = 'Data de Início'
            end
            object Label26: TLabel
              Left = 11
              Top = 39
              Width = 121
              Height = 13
              Caption = 'Natureza Empresarial'
            end
            object Label27: TLabel
              Left = 47
              Top = 51
              Width = 38
              Height = 13
              Caption = '(RAIS)'
            end
            object Label43: TLabel
              Left = 11
              Top = 77
              Width = 216
              Height = 13
              Caption = 'Tipo de Sistema de Controle de Ponto'
            end
            object wwDBLookupCombo3: TwwDBLookupCombo
              Left = 141
              Top = 42
              Width = 283
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'DESCRICAO')
              DataField = 'IDNATEMPRE'
              DataSource = dsSubTipo
              LookupTable = CdsNatEmpr
              LookupField = 'IDNATEMPRE'
              Style = csDropDownList
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
            end
            object dbedDataIni: TCMDateTimePicker
              Left = 141
              Top = 15
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAINICIOATIV'
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
          end
          object dblkpcmbIsistctrlponto: TwwDBLookupCombo
            Left = 453
            Top = 180
            Width = 184
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCSISTEMACONTROLEPONTORAIS'#9'120'#9'DESCSISTEMACONTROLEPONTORAIS')
            DataField = 'IDSISTEMACONTROLEPONTORAIS'
            DataSource = dsSubTipo
            LookupTable = CdsSistCtrlPonto
            LookupField = 'IDSISTEMACONTROLEPONTORAIS'
            Style = csDropDownList
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
          end
        end
        object tbshGRE: TTabSheet
          Caption = 'tbshGRE'
          object Label30: TLabel
            Left = 9
            Top = 128
            Width = 108
            Height = 13
            Caption = 'Dia de Vencimento'
          end
          object dbgrTipEmpr: TDBRadioGroup
            Left = 240
            Top = 5
            Width = 202
            Height = 105
            Caption = 'Tipo de Empresa'
            DataField = 'INDTIPOEMPRESA'
            DataSource = dsSubTipo
            Items.Strings = (
              'Não Centralizada'
              'Centralizadora'
              'Centralizada')
            TabOrder = 1
            Values.Strings = (
              '0'
              '1'
              '2')
          end
          object dbgrOrigCGC: TDBRadioGroup
            Left = 471
            Top = 5
            Width = 202
            Height = 105
            Caption = 'Origem do CNPJ'
            DataField = 'INDORIGEMCGC'
            DataSource = dsSubTipo
            Items.Strings = (
              'Normal'
              'Por Fusão'
              'Por Incorporação'
              'Por Cisão'
              'Mudança de CEI para CNPJ')
            TabOrder = 2
            Values.Strings = (
              '0'
              '1'
              '2'
              '3'
              '4')
          end
          object dbgrCodFgts: TDBRadioGroup
            Left = 9
            Top = 5
            Width = 202
            Height = 105
            Caption = 'Indicador de Código'
            DataField = 'FLGESPFGTS'
            DataSource = dsSubTipo
            Items.Strings = (
              'Matrícula da Empresa'
              'Número do PIS')
            TabOrder = 0
            Values.Strings = (
              '0'
              '1')
          end
          object wwDBEdit11: TwwDBEdit
            Left = 141
            Top = 125
            Width = 70
            Height = 21
            DataField = 'DIAVENCGRE'
            DataSource = dsSubTipo
            TabOrder = 4
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object gbxCustosEspec: TGroupBox
            Left = 240
            Top = 114
            Width = 202
            Height = 110
            Caption = 'Custos Especiais'
            TabOrder = 3
            object Label41: TLabel
              Left = 36
              Top = 15
              Width = 31
              Height = 13
              Caption = 'Rural'
            end
            object Label42: TLabel
              Left = 36
              Top = 57
              Width = 66
              Height = 13
              Caption = 'Patrocínios'
            end
            object dbedCustoRural: TwwDBEdit
              Left = 36
              Top = 29
              Width = 130
              Height = 21
              DataField = 'CUSTORURAL'
              DataSource = dsSubTipo
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedCustoPatr: TwwDBEdit
              Left = 36
              Top = 71
              Width = 130
              Height = 21
              DataField = 'CUSTOPATROC'
              DataSource = dsSubTipo
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
        end
        object tbshGuias: TTabSheet
          Caption = 'tbshGuias'
          object gbxGRCS: TGroupBox
            Left = 350
            Top = 1
            Width = 320
            Height = 117
            Caption = 'GRCS'
            TabOrder = 1
            object Label31: TLabel
              Left = 17
              Top = 19
              Width = 54
              Height = 13
              Caption = 'Sindicato'
            end
            object Label32: TLabel
              Left = 18
              Top = 61
              Width = 108
              Height = 13
              Caption = 'Dia de Vencimento'
            end
            object Label33: TLabel
              Left = 21
              Top = 85
              Width = 95
              Height = 13
              Caption = 'Base da Receita'
            end
            object wwDBLookupCombo2: TwwDBLookupCombo
              Left = 18
              Top = 32
              Width = 283
              Height = 21
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'RAZAOSOCIAL'#9'60'#9'RAZAOSOCIAL'#9'F')
              DataField = 'IDSINDICATO'
              DataSource = dsSubTipo
              LookupTable = CdsSindicato
              LookupField = 'IDPESSOA'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
            end
            object wwDBEdit12: TwwDBEdit
              Left = 138
              Top = 56
              Width = 70
              Height = 21
              DataField = 'DIAVENCGRCS'
              DataSource = dsSubTipo
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object DBRealEdit1: TDBRealEdit
              Left = 138
              Top = 83
              Width = 158
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 2
              WordWrap = False
              IntDigits = 17
              DecDigits = 2
              NumberFormat = fFixed
              Signal = False
              DataField = 'VLRBASERECEITA'
              DataSource = dsSubTipo
            end
          end
          object gbxDARF: TGroupBox
            Left = 350
            Top = 128
            Width = 320
            Height = 105
            Caption = 'DARF'
            TabOrder = 2
            object Label36: TLabel
              Left = 17
              Top = 22
              Width = 109
              Height = 13
              Caption = 'Índice de Correção'
            end
            object Label37: TLabel
              Left = 18
              Top = 70
              Width = 108
              Height = 13
              Caption = 'Dia de Vencimento'
            end
            object wwDBLookupCombo6: TwwDBLookupCombo
              Left = 18
              Top = 35
              Width = 283
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'MOEDESC'#9'20'#9'MOEDESC')
              DataField = 'IDMOEDADARF'
              DataSource = dsSubTipo
              LookupTable = CdsMoeda
              LookupField = 'MOECODIGO'
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
            end
            object wwDBEdit13: TwwDBEdit
              Left = 138
              Top = 65
              Width = 70
              Height = 21
              DataField = 'DIAVENCDARF'
              DataSource = dsSubTipo
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
          object gbxGPS: TGroupBox
            Left = 14
            Top = 1
            Width = 320
            Height = 232
            Caption = 'GPS'
            TabOrder = 0
            object Label34: TLabel
              Left = 17
              Top = 13
              Width = 109
              Height = 13
              Caption = 'Índice de Correção'
            end
            object Label35: TLabel
              Left = 17
              Top = 49
              Width = 185
              Height = 13
              Caption = 'Seguro de Acidente do Trabalho'
            end
            object Label29: TLabel
              Left = 17
              Top = 86
              Width = 32
              Height = 13
              Caption = 'FPAS'
            end
            object Label38: TLabel
              Left = 17
              Top = 121
              Width = 143
              Height = 13
              Caption = 'Convênio Previdenciário '
            end
            object Label39: TLabel
              Left = 17
              Top = 157
              Width = 92
              Height = 13
              Caption = 'Categoria CNAE'
            end
            object Label40: TLabel
              Left = 17
              Top = 193
              Width = 62
              Height = 13
              Caption = 'Item CNAE'
            end
            object wwDBLookupCombo4: TwwDBLookupCombo
              Left = 17
              Top = 26
              Width = 283
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'MOEDESC'#9'20'#9'MOEDESC')
              DataField = 'IDMOEDAGRPS'
              DataSource = dsSubTipo
              LookupTable = CdsMoeda
              LookupField = 'MOECODIGO'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
            end
            object wwDBLookupCombo5: TwwDBLookupCombo
              Left = 17
              Top = 62
              Width = 283
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'120'#9'DESCRICAO')
              DataField = 'IDSEGACIDTRAB'
              DataSource = dsSubTipo
              LookupTable = CdsSegAcid
              LookupField = 'IDSEGACIDTRAB'
              Style = csDropDownList
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
            end
            object dblcFPAS: TwwDBLookupCombo
              Left = 17
              Top = 98
              Width = 283
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCPEQUENA'#9'120'#9'DESCPEQUENA'#9'F')
              DataField = 'IDFPAS'
              DataSource = dsSubTipo
              LookupTable = CdsFPAS
              LookupField = 'IDFPAS'
              Style = csDropDownList
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              OnCloseUp = dblcFPASCloseUp
            end
            object dblcConvPrev: TwwDBLookupCombo
              Left = 17
              Top = 133
              Width = 283
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'60'#9'DESCRICAO')
              DataField = 'IDCONVPREVID'
              DataSource = dsSubTipo
              LookupTable = CdsConvPrev
              LookupField = 'IDCONVPREVID'
              Style = csDropDownList
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
            end
            object dblcCatCNAE: TwwDBLookupCombo
              Left = 17
              Top = 170
              Width = 283
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'180'#9'DESCRICAO')
              DataField = 'IDCATCNAE'
              DataSource = dsSubTipo
              LookupTable = CdsCatCNAE
              LookupField = 'IDCATCNAE'
              Style = csDropDownList
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              OnCloseUp = dblcCatCNAECloseUp
            end
            object dblcItemCNAE: TwwDBLookupCombo
              Left = 17
              Top = 206
              Width = 283
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'120'#9'DESCRICAO')
              DataField = 'IDITEMCNAE'
              DataSource = dsSubTipo
              LookupTable = CdsItemCNAE
              LookupField = 'IDITEMCNAE'
              Style = csDropDownList
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
            end
          end
          object GroupBox1: TGroupBox
            Left = 14
            Top = 240
            Width = 657
            Height = 113
            Caption = ' eSocial '
            TabOrder = 3
            object Label4: TLabel
              Left = 17
              Top = 20
              Width = 134
              Height = 13
              Caption = 'Classificação Tributária'
            end
            object Label10: TLabel
              Left = 17
              Top = 63
              Width = 40
              Height = 13
              Caption = 'Código'
            end
            object Label12: TLabel
              Left = 65
              Top = 63
              Width = 152
              Height = 13
              Caption = 'Tipo de Lotação Tributária'
            end
            object cbxClassTri: TwwDBLookupCombo
              Left = 17
              Top = 36
              Width = 623
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'60'#9'DESCRICAO')
              DataField = 'IDCLASSTRIBUT'
              DataSource = dsSubTipo
              LookupTable = cdsClassTri
              LookupField = 'IDCLASSTRIBUT'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
            end
            object dbEdtCodLotacao: TwwDBEdit
              Left = 17
              Top = 79
              Width = 43
              Height = 21
              Color = clSilver
              DataField = 'CODLOTACAOESOCIAL'
              DataSource = dsSubTipo
              ReadOnly = True
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object edtDescCodLotacao: TEdit
              Left = 65
              Top = 79
              Width = 545
              Height = 21
              Color = clSilver
              ReadOnly = True
              TabOrder = 2
            end
            object btnProcurarLotacao: TBitBtn
              Left = 614
              Top = 79
              Width = 25
              Height = 22
              Hint = 'Buscar Tipos de Lotações Tributárias'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              OnClick = btnProcurarLotacaoClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
                77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
                77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
                077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
                FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
                F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
                7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
                777777787FFF8777777777770000777777777777888877777777}
              NumGlyphs = 2
            end
          end
        end
        object tbshProcessos: TTabSheet
          Caption = 'tbshProcessos'
          ImageIndex = 8
          object dbgrdProcessos: TwwDBGrid
            Left = 0
            Top = 0
            Width = 944
            Height = 373
            Selected.Strings = (
              'TIPO2'#9'20'#9'Tipo'
              'NUMERO'#9'21'#9'Número'
              'NOMECIDADE'#9'25'#9'Cidade'
              'UF'#9'3'#9'UF da Seção Judiciária'
              'CODMUNICIPIO'#9'10'#9'Código do Município'
              'CODIDENTVARA'#9'10'#9'Código de Ident. da Vara'
              'DATAINICIO'#9'10'#9'Data Início'
              'DATAFIM'#9'10'#9'Data Fim'
              'PROCADMJUD2'#9'3'#9'Processo Administrativo/Judicial'
              'AUTORACAO2'#9'3'#9'Contribuinte é autor da ação'
              'CODMATPROCDESC2'#9'75'#9'Matéria do Processo ou Alvará Judicial')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsProcessos
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
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
          object pgctrlProcessos: TPageControl
            Left = 0
            Top = 0
            Width = 944
            Height = 373
            ActivePage = tbsProcDados
            Align = alClient
            TabOrder = 1
            OnChange = pgctrlProcessosChange
            object tbsProcDados: TTabSheet
              Caption = 'Geral'
              object pnlFundoProcesso: TPanel
                Left = 0
                Top = 0
                Width = 936
                Height = 345
                Align = alClient
                TabOrder = 0
                object grbInfo: TGroupBox
                  Left = 0
                  Top = 5
                  Width = 720
                  Height = 258
                  Caption = 'Informações sobre o Processo'
                  TabOrder = 0
                  object lblTipo: TLabel
                    Left = 10
                    Top = 21
                    Width = 26
                    Height = 13
                    Caption = 'Tipo'
                  end
                  object lblNumero: TLabel
                    Left = 257
                    Top = 21
                    Width = 44
                    Height = 13
                    Caption = 'Número'
                  end
                  object lblUFSecaoJud: TLabel
                    Left = 257
                    Top = 69
                    Width = 133
                    Height = 13
                    Caption = 'UF da Seção Judiciária'
                  end
                  object lblCodMunicipio: TLabel
                    Left = 397
                    Top = 69
                    Width = 118
                    Height = 13
                    Caption = 'Código do Município'
                  end
                  object lblCodIdentVara: TLabel
                    Left = 562
                    Top = 69
                    Width = 143
                    Height = 13
                    Caption = 'Código de Ident. da Vara'
                  end
                  object lblExtSetenca: TLabel
                    Left = 10
                    Top = 114
                    Width = 181
                    Height = 13
                    Caption = 'Extensão da Decisão/Sentença'
                  end
                  object lblCidade: TLabel
                    Left = 10
                    Top = 69
                    Width = 40
                    Height = 13
                    Caption = 'Cidade'
                  end
                  object lbldtinicio: TLabel
                    Left = 477
                    Top = 21
                    Width = 65
                    Height = 13
                    Caption = 'Data Início'
                  end
                  object lbldtfim: TLabel
                    Left = 600
                    Top = 21
                    Width = 55
                    Height = 13
                    Caption = 'Data Fim '
                  end
                  object lblProcAdmJud: TLabel
                    Left = 360
                    Top = 114
                    Width = 275
                    Height = 13
                    Caption = 'Processo Administrativo ou Judicial (RAT / FAP)'
                  end
                  object Label6: TLabel
                    Left = 10
                    Top = 160
                    Width = 222
                    Height = 13
                    Caption = 'Matéria do Processo ou Alvará Judicial'
                  end
                  object dbedtCodIdentVara: TwwDBEdit
                    Left = 562
                    Top = 85
                    Width = 147
                    Height = 21
                    DataField = 'CODIDENTVARA'
                    DataSource = dsProcessos
                    MaxLength = 4
                    TabOrder = 7
                    UnboundDataType = wwDefault
                    WantReturns = False
                    WordWrap = False
                  end
                  object dbcmbTipo: TwwDBComboBox
                    Left = 10
                    Top = 37
                    Width = 239
                    Height = 21
                    ShowButton = True
                    Style = csDropDownList
                    MapList = True
                    AllowClearKey = True
                    AutoDropDown = True
                    DataField = 'TIPO'
                    DataSource = dsProcessos
                    DropDownCount = 8
                    ItemHeight = 0
                    Items.Strings = (
                      'Administrativo'#9'A'
                      'Judicial'#9'J'
                      'Processo FAP de exercício anterior a 2019'#9'F')
                    Sorted = False
                    TabOrder = 0
                    UnboundDataType = wwDefault
                    OnChange = dbcmbTipoChange
                  end
                  object dbcmbExtSetenca: TwwDBComboBox
                    Left = 10
                    Top = 131
                    Width = 345
                    Height = 21
                    ShowButton = True
                    Style = csDropDownList
                    MapList = True
                    AllowClearKey = True
                    AutoDropDown = True
                    DataField = 'EXTENDECISAO'
                    DataSource = dsProcessos
                    DropDownCount = 8
                    ItemHeight = 0
                    Items.Strings = (
                      'Contribuição Previdenciária Patronal'#9'1'
                      
                        'Contribuição Previdenciária Patronal + Descontada dos Segurados'#9 +
                        '2')
                    Sorted = False
                    TabOrder = 8
                    UnboundDataType = wwDefault
                    OnChange = dbcmbExtSetencaChange
                  end
                  object dbcmbCidadesProc: TwwDBLookupCombo
                    Left = 10
                    Top = 85
                    Width = 239
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'NOME'#9'40'#9)
                    DataField = 'IDCIDADES'
                    DataSource = dsProcessos
                    LookupTable = CdsCidadesPro
                    LookupField = 'IDCIDADES'
                    Style = csDropDownList
                    DropDownCount = 15
                    TabOrder = 4
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    OnExit = dbcmbCidadesProcExit
                  end
                  object edtNumero: TMaskEdit
                    Left = 257
                    Top = 37
                    Width = 210
                    Height = 21
                    TabOrder = 1
                  end
                  object dtpDataInicio: TCMDateTimePicker
                    Left = 477
                    Top = 37
                    Width = 109
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DATAINICIO'
                    DataSource = dsProcessos
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
                    DisplayFormat = 'dd/MM/yyyy'
                  end
                  object dtpDataFim: TCMDateTimePicker
                    Left = 600
                    Top = 37
                    Width = 109
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DATAFIM'
                    DataSource = dsProcessos
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
                    DisplayFormat = 'dd/MM/yyyy'
                  end
                  object cbbProcAdmJud: TwwDBComboBox
                    Left = 360
                    Top = 131
                    Width = 347
                    Height = 21
                    ShowButton = True
                    Style = csDropDownList
                    MapList = True
                    AllowClearKey = True
                    AutoDropDown = True
                    DataField = 'PROCADMJUD'
                    DataSource = dsProcessos
                    DropDownCount = 8
                    ItemHeight = 0
                    Items.Strings = (
                      'RAT'#9'1'
                      'FAP'#9'2')
                    Sorted = False
                    TabOrder = 9
                    UnboundDataType = wwDefault
                    OnChange = cbbProcAdmJudChange
                  end
                  object cmbMatProc: TComboBox
                    Left = 10
                    Top = 176
                    Width = 698
                    Height = 21
                    Style = csDropDownList
                    DropDownCount = 10
                    ItemHeight = 13
                    TabOrder = 10
                    OnChange = cmbMatProcChange
                    Items.Strings = (
                      'Exclusivamente tributária ou tributária e FGTS'
                      
                        'Exclusivamente FGTS e/ou Contribuição Social Rescisória (Lei Com' +
                        'plementar 110/2001)')
                  end
                  object edtUFSecaoJud: TEdit
                    Left = 257
                    Top = 85
                    Width = 133
                    Height = 21
                    Color = clBtnFace
                    Enabled = False
                    TabOrder = 5
                  end
                  object edtCodMunicipio: TEdit
                    Left = 397
                    Top = 85
                    Width = 157
                    Height = 21
                    Color = clBtnFace
                    Enabled = False
                    TabOrder = 6
                  end
                  object dbGrpAutorAcao: TDBRadioGroup
                    Left = 10
                    Top = 207
                    Width = 185
                    Height = 37
                    Caption = 'Contribuinte é autor da ação'
                    Columns = 2
                    DataField = 'AUTORACAO'
                    DataSource = dsProcessos
                    Items.Strings = (
                      'Não'
                      'Sim')
                    TabOrder = 11
                    TabStop = True
                    Values.Strings = (
                      'N'
                      'S')
                  end
                end
              end
            end
            object tbsIndicativoSusp: TTabSheet
              Caption = 'Indicativo de Suspensão'
              ImageIndex = 1
              object dbGrdProcessoIndSusp: TwwDBGrid
                Left = 0
                Top = 31
                Width = 936
                Height = 314
                Selected.Strings = (
                  'INDICATIVO'#9'90'#9'Indicativo de Suspensão da Exigibilidade'#9'T'
                  'DATADECISAO'#9'18'#9'Data da Decisão'#9'T'
                  'DEPOSITO'#9'3'#9'Houve Depósito do Montante Integral?'#9'T')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                DataSource = dsProcessosXIndicativoSusp
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
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
              object pnlIndSusps: TPanel
                Left = 0
                Top = 31
                Width = 936
                Height = 314
                Align = alClient
                TabOrder = 2
                object Label92: TLabel
                  Left = 10
                  Top = 6
                  Width = 234
                  Height = 13
                  Caption = 'Indicativo de Suspensão de Exigibilidade'
                end
                object Label93: TLabel
                  Left = 10
                  Top = 49
                  Width = 78
                  Height = 13
                  Hint = 'Data da decisão, sentença ou despacho administrativo'
                  Caption = 'Data Decisão'
                  ParentShowHint = False
                  ShowHint = True
                end
                object rdGrpIndDeposito: TRadioGroup
                  Left = 10
                  Top = 100
                  Width = 240
                  Height = 54
                  Caption = 'Houve Depósito do Montante Integral?'
                  Columns = 2
                  Items.Strings = (
                    'Não'
                    'Sim')
                  TabOrder = 2
                end
                object dbDtpDtDecisao: TCMDateTimePicker
                  Left = 10
                  Top = 65
                  Width = 121
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATADECISAO'
                  DataSource = dsProcessosXIndicativoSusp
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
                object dbLkpCbxIndSusp: TwwDBLookupCombo
                  Left = 10
                  Top = 22
                  Width = 612
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'100'#9'Descrição'#9'F')
                  DataField = 'IDINDICATIVOSUSP'
                  DataSource = dsProcessosXIndicativoSusp
                  LookupTable = cdsIndicativoSuspensao
                  LookupField = 'IDINDICATIVOSUSP'
                  Style = csDropDownList
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  OnChange = dbLkpCbxIndSuspChange
                end
                object DockDetIndSusp: TDock97
                  Left = 845
                  Top = 1
                  Width = 90
                  Height = 312
                  AllowDrag = False
                  BoundLines = [blLeft]
                  Position = dpRight
                  object Toolbar974: TToolbar97
                    Left = 0
                    Top = 0
                    Caption = 'tb97Detalhe'
                    DockPos = 0
                    TabOrder = 0
                    object btnDockIndSuspOK: TBitBtn
                      Left = 0
                      Top = 0
                      Width = 85
                      Height = 27
                      Caption = 'OK'
                      TabOrder = 0
                      OnClick = btnDockIndSuspOKClick
                      Glyph.Data = {
                        76010000424D7601000000000000760000002800000020000000100000000100
                        0400000000000001000000000000000000001000000000000000000000000000
                        8000008000000080800080000000800080008080000080808000C0C0C0000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                        8888888888FFFFF8888888888000008888888888F777778FF888888002222200
                        88888887788888778F88887222222222088888788888888878F887A228822222
                        208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
                        22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
                        22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
                        220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
                        2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
                        8888888778FFFF77888888888777778888888888877777888888}
                      NumGlyphs = 2
                    end
                    object btnDockIndSuspCanc: TBitBtn
                      Left = 0
                      Top = 27
                      Width = 85
                      Height = 27
                      Cancel = True
                      Caption = 'Cancelar'
                      TabOrder = 1
                      OnClick = btnDockIndSuspVoltarClick
                      Glyph.Data = {
                        76010000424D7601000000000000760000002800000020000000100000000100
                        0400000000000001000000000000000000001000000000000000000000000000
                        8000008000000080800080000000800080008080000080808000C0C0C0000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                        8888888888FFFFF8888888888000008888888888F777778FF888888009191900
                        88888887788888778F88887991919191088888788888888878F8879919191919
                        108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
                        19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
                        19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
                        190878F877787778887887917F919F71908887F88788878887F8879919191919
                        1088878F88888888878888799191919108888878FF88888F7888888779999977
                        8888888778FFFF77888888888777778888888888877777888888}
                      NumGlyphs = 2
                      Spacing = -1
                    end
                    object btnDockIndSuspVoltar: TBitBtn
                      Left = 0
                      Top = 54
                      Width = 85
                      Height = 27
                      Cancel = True
                      Caption = '&Voltar'
                      TabOrder = 2
                      OnClick = btnDockIndSuspVoltarClick
                      Glyph.Data = {
                        76010000424D7601000000000000760000002800000020000000100000000100
                        0400000000000001000000000000000000001000000010000000000000000000
                        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                        33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
                        FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                        FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                        FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                        FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                        FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
                        C8807FF7777777777FF700000000000000007777777777777777333333333333
                        3333333333333333333333333333333333333333333333333333}
                      NumGlyphs = 2
                    end
                  end
                end
              end
              object DockMonitora: TDock97
                Left = 0
                Top = 0
                Width = 936
                Height = 31
                AllowDrag = False
                BoundLines = [blTop, blBottom, blLeft, blRight]
                object ToolbarIndSusp: TToolbar97
                  Left = 0
                  Top = 0
                  Caption = 'tb97BotoesDetalhe'
                  DockPos = 0
                  TabOrder = 0
                  object toolbtnInserirIndSusp: TToolbarButton97
                    Left = 0
                    Top = 0
                    Width = 25
                    Height = 25
                    Hint = 'Inserir'
                    AllowAllUp = True
                    GroupIndex = 2
                    ImageIndex = 0
                    Images = ImlPadrao
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = toolbtnInserirIndSuspClick
                  end
                  object toolbtnAlterarIndSusp: TToolbarButton97
                    Left = 25
                    Top = 0
                    Width = 25
                    Height = 25
                    Hint = 'Alterar'
                    AllowAllUp = True
                    GroupIndex = 2
                    ImageIndex = 1
                    Images = ImlPadrao
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = toolbtnAlterarIndSuspClick
                  end
                  object toolbtnExcluirIndSusp: TToolbarButton97
                    Left = 50
                    Top = 0
                    Width = 25
                    Height = 25
                    Hint = 'Excluir'
                    AllowAllUp = True
                    ImageIndex = 2
                    Images = ImlPadrao
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = toolbtnExcluirIndSuspClick
                  end
                end
              end
            end
          end
        end
        object tbshACT: TTabSheet
          Caption = 'tbshACT'
          ImageIndex = 9
          object dbgrdACT: TwwDBGrid
            Left = 0
            Top = 0
            Width = 944
            Height = 373
            Selected.Strings = (
              'DTCOMPETENCIA'#9'12'#9'Data da Competência'
              'DTASSINATURA'#9'10'#9'Data da Assinatura'
              'TIPOACORDODESC'#9'50'#9'Tipo do Acordo')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsAcordoColetivo
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
          object pnlACT: TPanel
            Left = 0
            Top = 0
            Width = 944
            Height = 373
            Align = alClient
            TabOrder = 0
            object lbDtAcConv: TLabel
              Left = 24
              Top = 25
              Width = 109
              Height = 13
              Caption = 'Data de Assinatura'
            end
            object lblTpAcConv: TLabel
              Left = 176
              Top = 25
              Width = 92
              Height = 13
              Caption = 'Tipo de Acordo '
            end
            object Data_Assinatura: TCMDateTimePicker
              Left = 24
              Top = 40
              Width = 130
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DTASSINATURA'
              DataSource = dsAcordoColetivo
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
            object cbbTpAcConv: TwwDBComboBox
              Left = 176
              Top = 40
              Width = 281
              Height = 21
              ShowButton = True
              Style = csDropDownList
              MapList = True
              AllowClearKey = True
              DataField = 'TIPOACORDO'
              DataSource = dsAcordoColetivo
              DropDownCount = 8
              DropDownWidth = 500
              ItemHeight = 0
              Items.Strings = (
                'Acordo Coletivo de Trabalho'#9'A'
                'Legislação federal, estadual, municipal ou distrital'#9'B'
                'Convenção Coletiva de Trabalho'#9'C'
                'Sentença Normativa - Dissídio'#9'D'
                'Conversão de Licença Saúde em Acidente de Trabalho'#9'E'
                
                  'Outras verbas de natureza salarial ou não salarial devidas após ' +
                  'o desligamento'#9'F'
                
                  'Antecipação de diferenças de Acordo, Convenção ou Dissídio Colet' +
                  'ivo'#9'G'
                
                  'Recolhimento mensal de FGTS anterior ao início de obrigatoriedad' +
                  'e dos eventos periódicos'#9'H')
              Sorted = False
              TabOrder = 1
              UnboundDataType = wwDefault
            end
          end
        end
      end
    end
    inherited pnlMestre: TPanel
      Left = 2
      Top = 2
      Width = 1050
      inherited lblDocumento: TLabel
        Width = 32
        Caption = 'CNPJ'
      end
      inherited lblPdGrupo: TLabel
        Width = 63
        Caption = 'Pertence a'
      end
    end
  end
  inherited Dock972: TDock97
    Width = 1054
  end
  inherited Dock971: TDock97
    Top = 616
    Width = 1054
    inherited tb97Fundo: TToolbar97
      Left = 765
      DockPos = 765
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 210019
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 475
      DockPos = 475
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 676
    Top = 43
  end
  inherited ds: TwwDataSource
    Left = 372
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 676
    Top = 29
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 450
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    Left = 344
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Estabelecimento'
    Colunas.Strings = (
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Filial / Estab.')
    Tabelas.Strings = (
      'FILIALPESSOA'
      'PESSOA')
    CamposChave.Strings = (
      'FILIALPESSOA.IDFILIALPESSOA')
    Larguras.Strings = (
      '60')
    Left = 513
    Top = 42
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 354
    Top = 49
  end
  inherited dsDet: TwwDataSource
    Left = 400
    Top = 1
  end
  inherited dsSubTipo: TwwDataSource
    Left = 566
    Top = 636
  end
  inherited dsPessoaFisica: TwwDataSource
    Left = 1025
    Top = 237
  end
  inherited ImlDocumentos: TImageList
    Left = 676
    Top = 15
  end
  inherited dsTelefone: TwwDataSource
    Left = 825
    Top = 389
  end
  inherited dsEndereco: TwwDataSource
    Left = 1089
    Top = 353
  end
  inherited dsContato: TwwDataSource
    Left = 719
    Top = 577
  end
  inherited dsTelContato: TwwDataSource
    Left = 823
    Top = 325
  end
  inherited dsDocumento: TwwDataSource
    Left = 1019
    Top = 90
  end
  inherited dsEscolhePessoa: TwwDataSource
    Left = 957
    Top = 340
  end
  inherited dsImagem: TwwDataSource
    Left = 826
    Top = 261
  end
  inherited dsImagensDoc: TwwDataSource
    Left = 957
    Top = 291
  end
  inherited MSGrupo: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.RAZAOSOCIAL'
      'DECODE(EMPRESAPROP.NOMEEMPRESA,'#39#39','#39#39','#39'SIM'#39')')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome'
      'Razão Social'
      'Empresa Proprietária?')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'EMPRESAPROP')
    Filtro.Strings = (
      'PESSOA.TIPO = '#39'J'#39
      'PESSOA.IDPESSOA = EMPRESAPROP.IDPESSOA(+)')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '40'
      '40'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 513
    Top = 29
  end
  inherited DsNaturalidade: TwwDataSource
    Left = 1097
    Top = 405
  end
  inherited CdsDocumento: TCMClientDataSet
    Left = 963
    Top = 85
  end
  inherited CdsTipoDoc: TCMClientDataSet
    Left = 752
    Top = 43
  end
  inherited CdsTelefone: TCMClientDataSet
    Left = 825
    Top = 376
  end
  inherited CdsContato: TCMClientDataSet
    Left = 759
    Top = 576
  end
  inherited CdsTelContato: TCMClientDataSet
    Left = 823
    Top = 312
  end
  inherited CdsImagem: TCMClientDataSet
    Left = 826
    Top = 249
  end
  inherited CdsEscolhePessoa: TCMClientDataSet
    Left = 893
    Top = 335
  end
  inherited CdsImagensDoc: TCMClientDataSet
    Left = 893
    Top = 286
  end
  inherited CdsSubTipo: TCMClientDataSet
    Left = 316
    Top = 653
  end
  inherited CdsPessoaFisica: TCMClientDataSet
    Left = 1001
    Top = 528
  end
  inherited CdsCidade: TCMClientDataSet
    MasterSource = ds
    PacketRecords = 0
    Left = 752
    Top = 29
  end
  inherited CdsNaturalidade: TCMClientDataSet
    Left = 1033
    Top = 400
  end
  inherited CdsEstado: TCMClientDataSet
    Left = 752
    Top = 15
  end
  inherited MsCidades: TMontaSelect
    Left = 513
    Top = 15
  end
  inherited DsContaBancaria: TwwDataSource
    Left = 890
    Top = 82
  end
  inherited CdsContaBancaria: TCMClientDataSet
    Left = 834
    Top = 84
  end
  inherited MsBanco: TMontaSelect
    Left = 513
    Top = 1
  end
  inherited CdsBanco: TCMClientDataSet
    Left = 752
    Top = 1
  end
  inherited ppmCaixa: TPopupMenu
    Left = 676
    Top = 1
  end
  object CdsMoeda: TCMClientDataSet [44]
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsMoedaIndex'
        CaseInsFields = 'MOEDESC'
        Fields = 'MOEDESC'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsMoedaIndex'
    Params = <>
    StoreDefs = True
    Left = 790
    Top = 535
  end
  object CdsSindicato: TCMClientDataSet [45]
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'RAZAOSOCIAL'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end>
    IndexDefs = <
      item
        Name = 'CdsSindicatoIndex'
        CaseInsFields = 'RAZAOSOCIAL'
        Fields = 'RAZAOSOCIAL'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsSindicatoIndex'
    Params = <>
    StoreDefs = True
    Left = 982
    Top = 474
  end
  object CdsNatEmpr: TCMClientDataSet [46]
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsNatEmprIndex'
        CaseInsFields = 'DESCRICAO'
        Fields = 'DESCRICAO'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsNatEmprIndex'
    Params = <>
    StoreDefs = True
    Left = 1054
    Top = 476
  end
  object CdsSegAcid: TCMClientDataSet [47]
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 440
    Top = 651
  end
  object CdsCatCNAE: TCMClientDataSet [48]
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsCatCNAEIndex'
        CaseInsFields = 'DESCRICAO'
        Fields = 'DESCRICAO'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsCatCNAEIndex'
    Params = <>
    StoreDefs = True
    Left = 622
    Top = 609
  end
  object CdsFPAS: TCMClientDataSet [49]
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDFPAS'
        DataType = ftFloat
      end
      item
        Name = 'DESCRICAO'
        DataType = ftMemo
        Size = 800
      end
      item
        Name = 'PERCCONTRIBEMPRES'
        DataType = ftFloat
      end
      item
        Name = 'PERCPREVRURAL'
        DataType = ftFloat
      end
      item
        Name = 'PERCDECTERC'
        DataType = ftFloat
      end
      item
        Name = 'PERCSALFAM'
        DataType = ftFloat
      end
      item
        Name = 'PERCSALMATERN'
        DataType = ftFloat
      end
      item
        Name = 'TRGDTINCLUSAO'
        DataType = ftDateTime
      end
      item
        Name = 'TRGUSERINCLUSAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DESCPEQUENA'
        DataType = ftString
        Size = 120
      end>
    IndexDefs = <
      item
        Name = 'CdsFPASIndex'
        CaseInsFields = 'DESCPEQUENA'
        Fields = 'DESCPEQUENA'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsFPASIndex'
    Params = <>
    StoreDefs = True
    Left = 258
    Top = 653
  end
  object CdsItemCNAE: TCMClientDataSet [50]
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsItemCNAEIndex'
        CaseInsFields = 'DESCRICAO'
        Fields = 'DESCRICAO'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsItemCNAEIndex'
    Params = <>
    StoreDefs = True
    Left = 174
    Top = 652
  end
  object CdsConvPrev: TCMClientDataSet [51]
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsConvPrevIndex'
        CaseInsFields = 'DESCRICAO'
        Fields = 'DESCRICAO'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsConvPrevIndex'
    Params = <>
    StoreDefs = True
    Left = 374
    Top = 651
  end
  object CdsSistCtrlPonto: TCMClientDataSet [52]
    Aggregates = <>
    Params = <>
    Left = 854
    Top = 519
  end
  object dsSistCtrlPonto: TwwDataSource [53]
    AutoEdit = False
    DataSet = CdsSistCtrlPonto
    Left = 854
    Top = 532
  end
  object CdsProcessos: TCMClientDataSet [54]
    Aggregates = <>
    Params = <>
    Left = 890
    Top = 386
  end
  object dsProcessos: TwwDataSource [55]
    DataSet = CdsProcessos
    Left = 960
    Top = 392
  end
  object CdsCidadesPro: TCMClientDataSet [56]
    Aggregates = <>
    Params = <>
    Left = 1066
    Top = 530
  end
  object CdsTpLogradouro: TCMClientDataSet [57]
    Aggregates = <>
    Params = <>
    Left = 1114
    Top = 473
  end
  inherited CdsEndereco: TCMClientDataSet
    Left = 1033
    Top = 350
    inherited CdsEnderecoTIPOLOGRADOURO: TStringField
      Visible = True
    end
    inherited CdsEnderecoCODMUNICIPIO: TStringField
      Visible = True
    end
    inherited CdsEnderecoCODESTADO: TStringField
      Visible = True
    end
  end
  inherited CdsImagemOutro: TCMClientDataSet
    Left = 1023
    Top = 301
  end
  inherited dsImagemOutro: TwwDataSource
    Left = 1087
    Top = 299
  end
  object cdsClassTri: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsMoedaIndex'
        CaseInsFields = 'MOEDESC'
        Fields = 'MOEDESC'
        Options = [ixCaseInsensitive]
      end>
    Params = <>
    StoreDefs = True
    Left = 806
    Top = 455
  end
  object cdsIndicativoSuspensao: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsItemCNAEIndex'
        CaseInsFields = 'DESCRICAO'
        Fields = 'DESCRICAO'
        Options = [ixCaseInsensitive]
      end>
    Params = <>
    StoreDefs = True
    Left = 918
    Top = 522
  end
  object dsIndicativoSuspensao: TwwDataSource
    AutoEdit = False
    DataSet = cdsIndicativoSuspensao
    Left = 534
    Top = 676
  end
  object cdsAcordoColetivo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 896
    Top = 240
  end
  object dsAcordoColetivo: TwwDataSource
    DataSet = cdsAcordoColetivo
    Left = 952
    Top = 240
  end
  object cdsProcessosXIndicativoSusp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 172
    Top = 612
  end
  object dsProcessosXIndicativoSusp: TDataSource
    DataSet = cdsProcessosXIndicativoSusp
    Left = 264
    Top = 610
  end
  object msLotacao: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Buscar Tipos de Lotações Tributárias'
    Colunas.Strings = (
      'LOTACAOESOCIAL.CODLOTACAOESOCIAL'
      'SUBSTR(LOTACAOESOCIAL.DESCRICAO,1,255) AS DESCRICAO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'LOTACAOESOCIAL')
    CamposChave.Strings = (
      'LOTACAOESOCIAL.CODLOTACAOESOCIAL'
      'LOTACAOESOCIAL.DESCRICAO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '2'
      '255')
    OperComparador.Strings = (
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N')
    ComparaMaiuscula.Strings = (
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
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 710
    Top = 649
  end
end
