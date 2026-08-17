inherited frmCadFunc: TfrmCadFunc
  Left = 342
  Top = 150
  Caption = 'Cadastro de Pessoal'
  ClientHeight = 665
  ClientWidth = 1273
  PixelsPerInch = 96
  TextHeight = 13
  object Label17: TLabel [0]
    Left = 571
    Top = 305
    Width = 25
    Height = 13
    Caption = 'Pais'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited pnlFundo: TPanel
    Width = 1273
    Height = 579
    BorderWidth = 2
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 2
      Top = 55
      Width = 1269
      Height = 522
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos'
        'Contas Bancárias'
        'Dados Pessoais'
        'Dependentes'
        'Situação Funcional'
        'Outros Dados'
        'Últimos Empregos'
        'Benefícios'
        'eSocial'
        'Rescisão'
        'Contrato Temporário'
        'Processos')
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
        ''
        'dbgrUltEmpr'
        ''
        ''
        ''
        ''
        'dbgrdProcessos')
      inherited pgctrlDetalhe: TPageControl
        Width = 1171
        Height = 463
        ActivePage = tbsBeneficios
        inherited tbsDocumento: TTabSheet
          Caption = 'tbsDocumento'
          inherited PgCtrlPesFisica_Padrao: TPageControl
            Width = 1163
            Height = 435
            ActivePage = TbsDadosPessoais_Padrao
          end
          inherited PnlDocumentos_Padrao: TPanel
            Width = 1163
            Height = 435
            inherited pnlItemsDoc: TPanel
              Height = 433
              inherited pnlOrgao: TPanel [0]
                Top = 96
              end
              inherited pnlUF: TPanel [1]
                Top = 142
              end
              inherited pnlEmissao: TPanel
                Top = 188
                inherited EdtDataEmissao_Padao: TCMDateTimePicker
                  DisplayFormat = 'dd/MM/yyyy'
                end
              end
              inherited pnlNomeDoc: TPanel [3]
              end
              inherited pnlNumDoc: TPanel
                Height = 29
              end
              inherited PnlValidade: TPanel
                Top = 280
                inherited EdtDataValidade_Padrao: TCMDateTimePicker
                  DisplayFormat = 'dd/MM/yyyy'
                end
              end
              inherited pnlDataHabilitacao: TPanel
                Top = 372
                TabOrder = 9
                inherited cbxDataHabilitacao: TCMDateTimePicker
                  DisplayFormat = 'dd/MM/yyyy'
                end
              end
              inherited pnlCategoria: TPanel
                Top = 234
              end
              inherited pnlPais: TPanel
                Top = 326
              end
              object pnlTipoDocumento: TPanel
                Left = 0
                Top = 50
                Width = 172
                Height = 46
                Align = alTop
                Caption = 'pnlTipoDocumento'
                TabOrder = 6
                Visible = False
                object LbTpDocumento: TLabel
                  Left = 10
                  Top = 3
                  Width = 94
                  Height = 13
                  Caption = 'Tipo Documento'
                end
                object dbcmbTipoDocumento: TCMDBLookupCombo
                  Left = 10
                  Top = 18
                  Width = 148
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'10'#9'Tipo'
                    'MASCARA'#9'10'#9'Mascara')
                  DataField = 'IDTIPODOCPESSOAXMASC'
                  DataSource = dsDocumento
                  LookupTable = CdsTipoDocumento
                  LookupField = 'IDTIPODOCPESSOAXMASC'
                  Options = [loTitles]
                  Style = csDropDownList
                  ParentFont = False
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  UseTFields = False
                  AllowClearKey = True
                  ShowMatchText = True
                  OnChange = dbcmbTipoDocumentoChange
                end
              end
            end
            inherited pnlFoto: TPanel
              Width = 673
              Height = 433
              inherited BvlImagem: TBevel
                Height = 404
              end
              object Bevel1: TBevel [1]
                Left = 0
                Top = 0
                Width = 50
                Height = 316
              end
              inherited PnlAssociaFoto_Padrao: TPanel
                Top = 404
                Width = 673
                Height = 29
                inherited btnAssociarimgPessoa: TButton
                  Top = 2
                end
              end
              inherited SbImagePessoa_Padrao: TScrollBox
                Width = 671
                Height = 404
                inherited imgPessoa: TDBImage
                  Left = 44
                  Width = 169
                  Height = 193
                end
              end
            end
            inherited lstDocumentos: TListView
              Height = 433
            end
          end
        end
        inherited tbsDet: TTabSheet
          Caption = 'tbsDet'
          inherited dbgrdDet: TwwDBGrid
            Width = 1163
            Height = 435
          end
          inherited pnlControlesDet: TPanel
            Width = 1163
            Height = 435
            inherited lblPdLogradouro: TLabel
              Left = 148
            end
            inherited lblPdEstado: TLabel
              Left = 368
            end
            inherited lblPdNumero: TLabel
              Left = 602
            end
            inherited lblPdCEP: TLabel
              Left = 554
              Width = 25
              Caption = 'CEP'
            end
            inherited lblBairro: TLabel
              Left = 334
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
              Left = 523
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
            object lblCodMunicipio: TLabel [11]
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
              Left = 367
              Width = 146
              Enabled = False
              TabOrder = 8
            end
            inherited dbedBairro: TwwDBEdit
              Left = 333
              Width = 210
              TabOrder = 5
            end
            inherited DBNUMERO: TDBEdit
              Left = 602
              TabOrder = 3
              OnKeyPress = DBNUMEROKeyPress
            end
            inherited dbedCEP: TwwDBEdit
              Left = 554
              Width = 119
              TabOrder = 6
              OnKeyPress = DBNUMEROKeyPress
            end
            inherited dbedPais: TwwDBEdit
              Left = 601
              Enabled = False
              TabOrder = 10
            end
            inherited grpTipoEnd: TGroupBox
              Left = 966
              Height = 435
              TabOrder = 11
              TabStop = True
            end
            inherited CmpCidades: TCMProcura
              OnApertouBotao = CmpCidadesApertouBotao
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
              LookupTable = cdsTpLogradouro
              LookupField = 'IDTIPO_LOGRADOURO'
              TabOrder = 1
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
            object dbedUF: TwwDBEdit
              Left = 523
              Top = 148
              Width = 69
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'CODESTADO'
              DataSource = dsEndereco
              Enabled = False
              ReadOnly = True
              TabOrder = 9
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
              TabOrder = 7
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbchkEndAtivo: TDBCheckBox
              Left = 16
              Top = 184
              Width = 97
              Height = 17
              Caption = 'Ativo'
              DataField = 'FLGATIVO'
              DataSource = dsEndereco
              TabOrder = 13
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
          end
        end
        inherited tbsTelefone: TTabSheet
          Caption = 'tbsTelefone'
          inherited SplContatos_Padrao: TSplitter
            Left = 934
            Height = 435
          end
          inherited dbgTelefone: TwwDBGrid
            Width = 934
            Height = 435
            Selected.Strings = ()
          end
          inherited Panel1: TPanel
            Width = 934
            Height = 435
            inherited GroupBox4: TGroupBox
              TabStop = True
            end
            object dbchkTelFlgAtivo: TDBCheckBox
              Left = 16
              Top = 144
              Width = 97
              Height = 17
              Caption = 'Ativo'
              DataField = 'FLGATIVO'
              DataSource = dsTelefone
              TabOrder = 5
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
          end
          inherited PnlContatol_Padrao: TPanel
            Left = 937
            Height = 435
            inherited LblContatos_Padrao: TLabel
              Width = 226
            end
            inherited GrdExibeContatos_Padrao: TwwDBGrid
              Height = 422
            end
          end
        end
        inherited tbsContato: TTabSheet
          Caption = 'tbsContato'
          inherited SplTelefones_Padrao: TSplitter
            Left = 961
            Height = 435
          end
          inherited dbgContato: TwwDBGrid [1]
            Width = 961
            Height = 435
            Selected.Strings = (
              'NOME'#9'25'#9'Nome'
              'CARGO'#9'10'#9'Cargo'#9'No'
              'SETOR'#9'10'#9'Setor'#9'No'
              'Telefone'#9'20'#9'Telefone'
              'flgAtivo'#9'10'#9'Ativo')
          end
          inherited Panel2: TPanel [2]
            Width = 961
            Height = 435
            object dbchkContFlgAtivo: TDBCheckBox
              Left = 8
              Top = 144
              Width = 97
              Height = 17
              Caption = 'Ativo'
              DataField = 'FLGATIVO'
              DataSource = dsContato
              TabOrder = 7
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
          end
          inherited PnlTelefones_Padrao: TPanel
            Left = 964
            Height = 435
            inherited LblTelefones_Padrao: TLabel
              Width = 199
            end
            inherited GrdTelefones_Padrao: TwwDBGrid
              Height = 422
            end
          end
        end
        inherited tbsDadosBancarios: TTabSheet
          Caption = 'tbsDadosBancarios'
          inherited GrdContaBancaria_Padrao: TwwDBGrid
            Width = 1163
            Height = 435
            Selected.Strings = (
              'NOMEBANCO'#9'30'#9'Banco'
              'NUMBANCO'#9'8'#9'Num.'
              'NUMAGENCIA'#9'15'#9'Num. Agência'
              'NOMEAGENCIA'#9'25'#9'Nome Agência'
              'CONTACORRENTE'#9'15'#9'Conta'
              'TPCONTA'#9'15'#9'Tipo'
              'PREF'#9'15'#9'Pref.'
              'INATIVA'#9'15'#9'Inativa')
          end
          inherited PnlDadosBancarios_Padrao: TPanel
            Width = 1163
            Height = 435
            inherited dbedConta: TwwDBEdit
              OnExit = dbedContaExit
            end
            inherited chb_ContaInativa: TDBCheckBox
              OnClick = chb_ContaInativaClick
            end
          end
        end
        object tbsDadosPess: TTabSheet
          Caption = 'tbsDadosPess'
          object pgctrlDadosPess: TPageControl
            Left = 0
            Top = 0
            Width = 1163
            Height = 435
            ActivePage = tbshGeral
            Align = alClient
            TabOrder = 0
            object tbshGeral: TTabSheet
              Caption = 'Geral'
              object Label2: TLabel
                Left = 7
                Top = 5
                Width = 98
                Height = 13
                Caption = 'Data Nascimento'
              end
              object Label15: TLabel
                Left = 116
                Top = 5
                Width = 64
                Height = 13
                Caption = 'Raça / Cor'
              end
              object Label18: TLabel
                Left = 7
                Top = 47
                Width = 103
                Height = 13
                Caption = 'Grau de Instrução'
              end
              object Label20: TLabel
                Left = 267
                Top = 46
                Width = 53
                Height = 13
                Caption = 'Profissão'
              end
              object Label34: TLabel
                Left = 526
                Top = 49
                Width = 54
                Height = 13
                Caption = 'Sindicato'
              end
              object Label69: TLabel
                Left = 7
                Top = 88
                Width = 82
                Height = 13
                Caption = 'Nacionalidade'
              end
              object lblEstCivil: TLabel
                Left = 267
                Top = 5
                Width = 68
                Height = 13
                Caption = 'Estado Civil'
              end
              object Label3: TLabel
                Left = 267
                Top = 87
                Width = 40
                Height = 13
                Caption = 'Estado'
              end
              object Label65: TLabel
                Left = 526
                Top = 92
                Width = 40
                Height = 13
                Caption = 'Cidade'
              end
              object dbrgContrPrev: TDBRadioGroup
                Left = 118
                Top = 129
                Width = 142
                Height = 62
                Caption = 'Isento de'
                Columns = 2
                DataField = 'FLGISENTOCONTRPREVID'
                DataSource = dsPessoaFisica
                Items.Strings = (
                  'Sim'
                  'Não')
                TabOrder = 11
                TabStop = True
                Values.Strings = (
                  '1'
                  '0')
                OnChange = dbrgContrPrevChange
              end
              object gbxDepend: TGroupBox
                Left = 7
                Top = 306
                Width = 253
                Height = 70
                Caption = 'Qtde.Dependentes'
                TabOrder = 16
                TabStop = True
                object Label40: TLabel
                  Left = 188
                  Top = 21
                  Width = 30
                  Height = 13
                  Caption = 'Total'
                end
                object Label41: TLabel
                  Left = 10
                  Top = 23
                  Width = 46
                  Height = 13
                  Caption = 'I.Renda'
                end
                object Label42: TLabel
                  Left = 102
                  Top = 22
                  Width = 50
                  Height = 13
                  Caption = 'Sal.Fam.'
                end
                object dbedQtdIR: TwwDBEdit
                  Left = 10
                  Top = 38
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
                  Left = 102
                  Top = 37
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
                  Left = 188
                  Top = 36
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
                Left = 7
                Top = 130
                Width = 106
                Height = 103
                Caption = 'Sexo'
                DataField = 'SEXO'
                DataSource = dsPessoaFisica
                Items.Strings = (
                  'Masculino'
                  'Feminino')
                TabOrder = 10
                TabStop = True
                Values.Strings = (
                  'M'
                  'F')
              end
              object dbedDatNasc: TCMDateTimePicker
                Left = 7
                Top = 22
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
                TabOrder = 0
                DisplayFormat = 'dd/MM/yyyy'
              end
              object cmbRaca: TComboBox
                Left = 116
                Top = 22
                Width = 141
                Height = 21
                Style = csDropDownList
                ItemHeight = 13
                TabOrder = 1
                Items.Strings = (
                  'Branca'
                  'Negra'
                  'Amarela'
                  'Parda'
                  'Indígena')
              end
              object dblckNacional: TwwDBLookupCombo
                Left = 7
                Top = 105
                Width = 250
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOMENACIONALIDADE'#9'30'#9'Nacionalidade'#9'F'
                  'NOMEPAIS'#9'30'#9'País'#9'F')
                DataField = 'IDPAIS'
                DataSource = dsPessoaFisica
                LookupTable = CdsPaises
                LookupField = 'IDPAIS'
                Style = csDropDownList
                TabOrder = 7
                AutoDropDown = True
                ShowButton = True
                UseTFields = False
                AllowClearKey = True
                OnChange = dblckNacionalChange
              end
              object dblckGrauInstr: TwwDBLookupCombo
                Left = 7
                Top = 64
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
                DropDownCount = 10
                TabOrder = 4
                AutoDropDown = True
                ShowButton = True
                UseTFields = False
                AllowClearKey = True
              end
              object dblckProfissao: TwwDBLookupCombo
                Left = 267
                Top = 62
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
                TabOrder = 5
                AutoDropDown = True
                ShowButton = True
                UseTFields = False
                AllowClearKey = True
              end
              object dblckSindi: TwwDBLookupCombo
                Left = 526
                Top = 62
                Width = 295
                Height = 21
                DropDownAlignment = taRightJustify
                Selected.Strings = (
                  'NOME'#9'60'#9'NOME')
                DataField = 'IDSINDICATO'
                DataSource = dsPessoaFisica
                LookupTable = CdsSindicato
                LookupField = 'IDPESSOA'
                Style = csDropDownList
                TabOrder = 6
                AutoDropDown = True
                ShowButton = True
                UseTFields = False
                AllowClearKey = True
              end
              object gbxFiliacao: TGroupBox
                Left = 7
                Top = 238
                Width = 814
                Height = 67
                Caption = 'Filiação'
                TabOrder = 15
                TabStop = True
                object Label38: TLabel
                  Left = 12
                  Top = 18
                  Width = 19
                  Height = 13
                  Caption = 'Pai'
                end
                object Label39: TLabel
                  Left = 9
                  Top = 39
                  Width = 25
                  Height = 13
                  Caption = 'Mãe'
                end
                object wwDBEdit2: TwwDBEdit
                  Left = 36
                  Top = 14
                  Width = 769
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
                  Top = 38
                  Width = 769
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
                Left = 267
                Top = 129
                Width = 554
                Height = 104
                Caption = 'Tipo de Deficiência'
                TabOrder = 14
                TabStop = True
                object lblObsTd: TLabel
                  Left = 8
                  Top = 39
                  Width = 31
                  Height = 13
                  Caption = 'Obs.:'
                  Visible = False
                end
                object dbcmbDeficFis: TwwDBComboBox
                  Left = 8
                  Top = 16
                  Width = 153
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
                    'Intelectual (Mental)'#9'5'
                    'Múltipla'#9'6'
                    'Reabilitado'#9'7')
                  Sorted = False
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  OnChange = dbcmbDeficFisChange
                end
                object dbmmoObsTd: TDBMemo
                  Left = 8
                  Top = 53
                  Width = 537
                  Height = 42
                  DataField = 'Obs'
                  DataSource = dsPessoaFisica
                  TabOrder = 1
                  Visible = False
                end
              end
              object dblckEstCivil: TwwDBLookupCombo
                Left = 267
                Top = 22
                Width = 249
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'20'#9'DESCRICAO'#9'F')
                DataField = 'ESTCIVIL'
                DataSource = dsPessoaFisica
                LookupTable = CdsEstCivil
                LookupField = 'ESTCIVIL'
                Style = csDropDownList
                TabOrder = 2
                AutoDropDown = True
                ShowButton = True
                UseTFields = False
                AllowClearKey = False
                OnChange = dblckEstCivilChange
              end
              object dblckNatural: TwwDBLookupCombo
                Left = 267
                Top = 104
                Width = 249
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'CODESTADO'#9'3'#9'Sigla'
                  'NOMEESTADO'#9'30'#9'Estado')
                DataField = 'CODESTADO'
                DataSource = dsPessoaFisica
                LookupTable = CdsEstadoNasc
                LookupField = 'CODESTADO'
                Options = [loColLines, loTitles]
                Style = csDropDownList
                TabOrder = 8
                AutoDropDown = True
                ShowButton = True
                UseTFields = False
                AllowClearKey = True
              end
              object dblckCidadeNasc: TwwDBLookupCombo
                Left = 526
                Top = 104
                Width = 295
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'50'#9'NOME'#9'F')
                DataField = 'IDCIDADES'
                DataSource = dsPessoaFisica
                LookupTable = CdsCidadeNasc
                LookupField = 'IDCIDADES'
                Style = csDropDownList
                TabOrder = 9
                AutoDropDown = True
                ShowButton = True
                UseTFields = False
                AllowClearKey = True
              end
              object dbrgIsento: TDBRadioGroup
                Left = 118
                Top = 193
                Width = 143
                Height = 40
                Caption = 'Isento de I.Renda'
                Columns = 2
                DataField = 'FLGISENTOIRRF'
                DataSource = dsPessoaFisica
                Items.Strings = (
                  'Sim'
                  'Não')
                TabOrder = 13
                TabStop = True
                Values.Strings = (
                  '1'
                  '0')
                OnChange = dbrgIsentoChange
              end
              object dbrgrpUNIAOESTAVEL: TDBRadioGroup
                Left = 526
                Top = 13
                Width = 291
                Height = 29
                Caption = 'Possui união estável?'
                Columns = 2
                DataField = 'UNIAOESTAVEL'
                DataSource = dsPessoaFisica
                Enabled = False
                Items.Strings = (
                  'Sim'
                  'Não')
                TabOrder = 3
                TabStop = True
                Values.Strings = (
                  'S'
                  'N')
                OnChange = dbrgContrPrevChange
              end
              object Panel7: TPanel
                Left = 125
                Top = 140
                Width = 129
                Height = 14
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = 'Contr. Previdenciária'
                TabOrder = 12
              end
              object dbrgrpBenefPrev: TDBRadioGroup
                Left = 267
                Top = 306
                Width = 554
                Height = 70
                Caption = 
                  'Recebe o Benefício Previdenciário de aposentadoria por tempo de ' +
                  'contribuição ou idade? '
                Columns = 2
                DataField = 'RECEBENEFCONTRIB_IDADE'
                DataSource = dsPessoaFisica
                Items.Strings = (
                  'Sim'
                  'Não')
                TabOrder = 17
                TabStop = True
                Values.Strings = (
                  'S'
                  'N')
              end
            end
            object tbshEstrangeiro: TTabSheet
              Caption = 'Estrangeiro'
              OnEnter = tbshEstrangeiroEnter
              object Label4: TLabel
                Left = 5
                Top = 5
                Width = 94
                Height = 13
                Caption = 'Ano de chegada'
              end
              object Label67: TLabel
                Left = 290
                Top = 113
                Width = 74
                Height = 13
                Caption = 'Número RNE'
              end
              object Label68: TLabel
                Left = 419
                Top = 113
                Width = 82
                Height = 13
                Caption = 'Registro Geral'
              end
              object lblTempoResidencia: TLabel
                Left = 128
                Top = 5
                Width = 106
                Height = 13
                Caption = 'Tempo Residência'
              end
              object lblCondicaoIngresso: TLabel
                Left = 290
                Top = 5
                Width = 106
                Height = 13
                Caption = 'Condição Ingresso'
              end
              object dbspedDataCheg: TCMDateTimePicker
                Left = 5
                Top = 19
                Width = 100
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'ANOCHEGADA'
                DataSource = dsEstrangeiro
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
                DisplayFormat = 'dd/MM/yyyy'
              end
              object GroupBox2: TGroupBox
                Left = 5
                Top = 49
                Width = 280
                Height = 109
                Caption = 'Filiação'
                TabOrder = 1
                TabStop = True
                object Label5: TLabel
                  Left = 12
                  Top = 16
                  Width = 122
                  Height = 13
                  Caption = 'Nacionalidade do Pai'
                end
                object Label6: TLabel
                  Left = 12
                  Top = 64
                  Width = 128
                  Height = 13
                  Caption = 'Nacionalidade da Mãe'
                end
                object dblckNacionalidadePai: TwwDBLookupCombo
                  Left = 12
                  Top = 30
                  Width = 254
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOMENACIONALIDADE'#9'30'#9'Nacionalidade'#9'F'
                    'NOMEPAIS'#9'30'#9'País'#9'F')
                  DataField = 'IDNACIONPAI'
                  DataSource = dsEstrangeiro
                  LookupTable = CdsPaises
                  LookupField = 'IDPAIS'
                  Options = [loColLines, loTitles]
                  Style = csDropDownList
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  UseTFields = False
                  AllowClearKey = True
                end
                object dblckNacionalidadeMae: TwwDBLookupCombo
                  Left = 12
                  Top = 78
                  Width = 254
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOMENACIONALIDADE'#9'30'#9'Nacionalidade'#9'F'
                    'NOMEPAIS'#9'30'#9'País'#9'F')
                  DataField = 'IDNACIONMAE'
                  DataSource = dsEstrangeiro
                  LookupTable = CdsPaises
                  LookupField = 'IDPAIS'
                  Options = [loColLines, loTitles]
                  Style = csDropDownList
                  TabOrder = 1
                  AutoDropDown = True
                  ShowButton = True
                  UseTFields = False
                  AllowClearKey = True
                end
              end
              object wwDBEdit4: TwwDBEdit
                Left = 290
                Top = 127
                Width = 126
                Height = 21
                DataField = 'MOD19NUMERO'
                DataSource = dsEstrangeiro
                TabOrder = 4
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
                OnKeyPress = dbedDecrNaturKeyPress
              end
              object wwDBEdit5: TwwDBEdit
                Left = 419
                Top = 127
                Width = 126
                Height = 21
                DataField = 'MOD19REGISTRO'
                DataSource = dsEstrangeiro
                TabOrder = 5
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
                OnKeyPress = dbedDecrNaturKeyPress
              end
              object dbrgrpFLGCASADOBRASILEIRO: TDBRadioGroup
                Left = 5
                Top = 163
                Width = 280
                Height = 33
                Caption = 'Casado com Brasileiro(a)'
                Columns = 2
                DataField = 'FLGCASADOBRASILEIRO'
                DataSource = dsEstrangeiro
                Items.Strings = (
                  'Sim'
                  'Não')
                TabOrder = 2
                TabStop = True
                Values.Strings = (
                  '1'
                  '0')
              end
              object dbrgrpFLGFILHOSBRASILEIROS: TDBRadioGroup
                Left = 290
                Top = 163
                Width = 258
                Height = 33
                Caption = 'Possui Filhos Brasileiros'
                Columns = 2
                DataField = 'FLGFILHOSBRASILEIROS'
                DataSource = dsEstrangeiro
                Items.Strings = (
                  'Sim'
                  'Não')
                TabOrder = 6
                TabStop = True
                Values.Strings = (
                  '1'
                  '0')
              end
              object grbNatur: TGroupBox
                Left = 290
                Top = 49
                Width = 258
                Height = 59
                Caption = 'Naturalizado?'
                TabOrder = 3
                TabStop = True
                object Label7: TLabel
                  Left = 121
                  Top = 16
                  Width = 128
                  Height = 13
                  Caption = 'Decreto Naturalização'
                end
                object dbrgNatur: TDBRadioGroup
                  Left = 6
                  Top = 17
                  Width = 107
                  Height = 34
                  Columns = 2
                  DataField = 'FLGNATURALIZADO'
                  DataSource = dsEstrangeiro
                  Items.Strings = (
                    'Sim'
                    'Não')
                  TabOrder = 0
                  TabStop = True
                  Values.Strings = (
                    '1'
                    '0')
                  OnChange = dbrgNaturChange
                end
                object dbedDecrNatur: TwwDBEdit
                  Left = 121
                  Top = 30
                  Width = 130
                  Height = 21
                  DataField = 'DECRETONATURALIZACAO'
                  DataSource = dsEstrangeiro
                  TabOrder = 1
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                  OnKeyPress = dbedDecrNaturKeyPress
                end
              end
              object cbbtempo_residencia: TwwDBComboBox
                Left = 128
                Top = 19
                Width = 157
                Height = 21
                ShowButton = True
                Style = csDropDownList
                MapList = True
                AllowClearKey = True
                DataField = 'tempo_residencia'
                DataSource = dsEstrangeiro
                DropDownCount = 8
                ItemHeight = 0
                Items.Strings = (
                  'Prazo indeterminado'#9'1'
                  'Prazo determinado'#9'2')
                Sorted = False
                TabOrder = 7
                UnboundDataType = wwDefault
              end
              object cbbCondicaoIngresso: TwwDBComboBox
                Left = 290
                Top = 19
                Width = 258
                Height = 21
                ShowButton = True
                Style = csDropDownList
                MapList = True
                AllowClearKey = True
                DataField = 'condicao_ingresso'
                DataSource = dsEstrangeiro
                DropDownCount = 8
                DropDownWidth = 500
                ItemHeight = 0
                Items.Strings = (
                  'Refugiado'#9'1'
                  'Solicitante de refúgio'#9'2'
                  'Permanência no Brasil em razão de reunião familiar'#9'3'
                  'Beneficiado pelo acordo entre países do Mercosul'#9'4'
                  
                    'Dependente de agente diplomático e/ou consular de países que man' +
                    'têm acordo de reciprocidade para o exercício de atividade remune' +
                    'rada no Brasil'#9'5'
                  
                    'Beneficiado pelo Tratado de Amizade, Cooperação e Consulta entre' +
                    ' a República Federativa do Brasil e a República Portuguesa'#9'6'
                  'Outra condição'#9'7')
                Sorted = False
                TabOrder = 8
                UnboundDataType = wwDefault
              end
            end
          end
        end
        object tbshDependentes: TTabSheet
          Caption = 'tbshDependentes'
          object dbgrdDepen: TwwDBGrid
            Left = 0
            Top = 0
            Width = 1163
            Height = 435
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsDependentes
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap]
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
        object tbsSitFunc: TTabSheet
          Caption = 'tbsSitFunc'
          object gbxCargo2: TGroupBox
            Left = 381
            Top = 199
            Width = 354
            Height = 73
            Caption = 'Cargo Alternativo (Função ou  Equivalente)'
            TabOrder = 5
            object Label72: TLabel
              Left = 12
              Top = 48
              Width = 111
              Height = 13
              Caption = 'Data de Efetivação'
            end
            object Label73: TLabel
              Left = 261
              Top = 48
              Width = 32
              Height = 13
              Caption = 'Nível'
            end
            object dblckCargo2: TwwDBLookupCombo
              Left = 12
              Top = 17
              Width = 334
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'TITULO'#9'30'#9'TITULO')
              DataField = 'IDFUNCAO'
              DataSource = dsSubTipo
              LookupTable = CdsCargo2
              LookupField = 'IDCARGO'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              OnChange = dblckCargo2Change
            end
            object dbedCargo2: TCMDateTimePicker
              Left = 132
              Top = 44
              Width = 121
              Height = 21
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
              ShowButton = True
              TabOrder = 1
              DisplayFormat = 'dd/MM/yyyy'
            end
            object dbspeStep2: TwwDBSpinEdit
              Left = 303
              Top = 44
              Width = 43
              Height = 21
              Increment = 1
              MaxValue = 20
              MinValue = 1
              DataField = 'NIVELINDIV2'
              DataSource = dsSubTipo
              TabOrder = 2
              UnboundDataType = wwDefault
              OnChange = dbspeStep2Change
            end
          end
          object gbxIdent: TGroupBox
            Left = 13
            Top = -1
            Width = 361
            Height = 274
            Caption = 'Identificação'
            TabOrder = 0
            object Label35: TLabel
              Left = 10
              Top = 21
              Width = 55
              Height = 13
              Caption = 'Matrícula'
            end
            object Label21: TLabel
              Left = 202
              Top = 21
              Width = 54
              Height = 13
              Caption = 'Admissão'
            end
            object Label36: TLabel
              Left = 9
              Top = 41
              Width = 110
              Height = 13
              Caption = 'Situação Funcional'
            end
            object Label31: TLabel
              Left = 9
              Top = 154
              Width = 114
              Height = 13
              Caption = 'Horário de Trabalho'
            end
            object Label37: TLabel
              Left = 9
              Top = 192
              Width = 134
              Height = 13
              Caption = 'Fonte de Recrutamento'
            end
            object Label55: TLabel
              Left = 250
              Top = 156
              Width = 101
              Height = 13
              Caption = 'Data Ref. Horário'
            end
            object Label25: TLabel
              Left = 9
              Top = 79
              Width = 83
              Height = 13
              Caption = 'Motivo Oficial '
            end
            object Label13: TLabel
              Left = 9
              Top = 116
              Width = 97
              Height = 13
              Caption = 'Motivo Gerencial'
            end
            object lbl1: TLabel
              Left = 9
              Top = 229
              Width = 106
              Height = 13
              Caption = 'Número do Crachá'
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
              DisplayFormat = 'dd/MM/yyyy'
            end
            object dblckSitFunc: TwwDBLookupCombo
              Left = 9
              Top = 56
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
              DropDownCount = 15
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              OnChange = dblckSitFuncChange
            end
            object dblckHorario: TwwDBLookupCombo
              Left = 9
              Top = 169
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
              DropDownCount = 10
              TabOrder = 6
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
            end
            object dblckFonte: TwwDBLookupCombo
              Left = 9
              Top = 206
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
              TabOrder = 8
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
            end
            object dbedDatRefHor: TCMDateTimePicker
              Left = 250
              Top = 169
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
              TabOrder = 7
              DisplayFormat = 'dd/MM/yyyy'
            end
            object dblckMotivo1: TwwDBLookupCombo
              Left = 9
              Top = 93
              Width = 342
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
              DropDownCount = 12
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
            end
            object dblckMotivo2: TwwDBLookupCombo
              Left = 9
              Top = 131
              Width = 342
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
              DropDownCount = 12
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
              Top = 152
              Width = 97
              Height = 17
              Caption = 'Marca Ponto'
              DataField = 'FLGMARCAPONTO'
              DataSource = dsSubTipo
              TabOrder = 5
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object edtNUMEROCRACHA: TwwDBEdit
              Left = 9
              Top = 244
              Width = 125
              Height = 21
              DataField = 'NUMCRACHA'
              DataSource = dsSubTipo
              TabOrder = 9
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnExit = dbedMatricExit
            end
          end
          object gbxContr: TGroupBox
            Left = 381
            Top = -1
            Width = 354
            Height = 126
            Caption = 'Contrato de Trabalho'
            TabOrder = 3
            object dbrgTipContra: TDBRadioGroup
              Left = 8
              Top = 11
              Width = 126
              Height = 110
              DataField = 'TIPOCONTRATO'
              DataSource = dsSubTipo
              Items.Strings = (
                'Efetivo'
                'LEF'
                'Terceirizado'
                'Estagiário'
                'Cessão'
                'Prop/Dir s/ Vinc'
                'Autônomo')
              TabOrder = 1
              Values.Strings = (
                'E'
                'S'
                'T'
                'G'
                '3'
                'P'
                'A')
              OnChange = dbrgTipContraChange
            end
            object gbxContrato: TGroupBox
              Left = 140
              Top = 11
              Width = 204
              Height = 110
              Caption = 'Prazo Det. ou Experiência'
              TabOrder = 0
              object lblFinal: TLabel
                Left = 6
                Top = 86
                Width = 28
                Height = 13
                Caption = 'Final'
              end
              object Label43: TLabel
                Left = 6
                Top = 21
                Width = 49
                Height = 13
                Caption = 'Duração'
              end
              object Label47: TLabel
                Left = 6
                Top = 52
                Width = 70
                Height = 13
                Caption = 'Prorrogação'
              end
              object lblTipoDuracaoContr: TLabel
                Left = 6
                Top = 36
                Width = 70
                Height = 13
                AutoSize = False
                Caption = '(Dias)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object dbedFinalContr: TCMDateTimePicker
                Left = 78
                Top = 81
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
                TabOrder = 2
                DisplayFormat = 'dd/MM/yyyy'
                OnExit = dbedFinalContrExit
              end
              object dbedDuracaoContr: TwwDBEdit
                Left = 78
                Top = 18
                Width = 100
                Height = 21
                DataField = 'DURACAOCONTRATO'
                DataSource = dsSubTipo
                TabOrder = 0
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
                OnExit = dbedDuracaoContrExit
              end
              object dbedProrr: TwwDBEdit
                Left = 78
                Top = 49
                Width = 100
                Height = 21
                AutoSize = False
                DataField = 'PRORROGCONTRATO'
                DataSource = dsSubTipo
                TabOrder = 1
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
                OnExit = dbedDuracaoContrExit
              end
            end
          end
          object gbxDeslig: TGroupBox
            Left = 13
            Top = 386
            Width = 361
            Height = 45
            Caption = 'Desligamento ou Afastamento'
            TabOrder = 1
            object Label23: TLabel
              Left = 7
              Top = 19
              Width = 59
              Height = 13
              Caption = 'Data Efet.'
            end
            object Label24: TLabel
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
              DisplayFormat = 'dd/MM/yyyy'
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
              DisplayFormat = 'dd/MM/yyyy'
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
          object gbxSalar: TGroupBox
            Left = 381
            Top = 273
            Width = 354
            Height = 70
            Caption = 'Salário'
            TabOrder = 7
            object Label50: TLabel
              Left = 12
              Top = 21
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object Label51: TLabel
              Left = 12
              Top = 46
              Width = 55
              Height = 13
              Caption = 'Data Efet'
            end
            object dbedSalario: TDBRealEdit
              Left = 81
              Top = 17
              Width = 93
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 0
              WordWrap = False
              OnChange = dbedSalarioChange
              OnEnter = dbedSalarioEnter
              IntDigits = 12
              DecDigits = 2
              NumberFormat = fFixed
              Signal = False
              DataField = 'SALARIOATUAL'
              DataSource = dsSubTipo
            end
            object dbedDatSalar: TCMDateTimePicker
              Left = 81
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
              DisplayFormat = 'dd/MM/yyyy'
            end
            object dbrgTipoSalar: TDBRadioGroup
              Left = 183
              Top = 7
              Width = 161
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
            Left = 13
            Top = 273
            Width = 360
            Height = 112
            Caption = 'Lotação'
            TabOrder = 2
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
              TabOrder = 2
            end
            object dblckEstab: TwwDBLookupCombo
              Left = 65
              Top = 11
              Width = 287
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
            object dblckChefe: TwwDBLookupCombo
              Left = 65
              Top = 83
              Width = 288
              Height = 21
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'NOME'#9'60'#9'NOME'
                'TITULO'#9'30'#9'TITULO')
              DataField = 'IDCHEFE'
              DataSource = dsSubTipo
              LookupTable = CdsChefe
              LookupField = 'IDPESSOA'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
            end
            object edNomeCCusto: TEdit
              Left = 262
              Top = 59
              Width = 30
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
              TabOrder = 4
              Visible = False
            end
            object dblckCCusto: TwwDBLookupCombo
              Left = 65
              Top = 35
              Width = 287
              Height = 21
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Nome'
                'ATIVO'#9'6'#9'Ativo?'#9'F')
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
              AllowClearKey = False
              OnChange = dblckCCustoChange
              OnCloseUp = dblckCCustoCloseUp
            end
          end
          object gbxCargo1: TGroupBox
            Left = 381
            Top = 125
            Width = 354
            Height = 72
            Caption = 'Cargo Oficial (ou Básico)'
            TabOrder = 4
            object Label71: TLabel
              Left = 12
              Top = 48
              Width = 111
              Height = 13
              Caption = 'Data de Efetivação'
            end
            object Label74: TLabel
              Left = 261
              Top = 48
              Width = 32
              Height = 13
              Caption = 'Nível'
            end
            object dblckCargo1: TwwDBLookupCombo
              Left = 12
              Top = 17
              Width = 335
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
              ShowButton = False
              UseTFields = False
              AllowClearKey = True
              OnChange = dblckCargo1Change
            end
            object dbedCargo1: TCMDateTimePicker
              Left = 132
              Top = 44
              Width = 121
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
              DisplayFormat = 'dd/MM/yyyy'
            end
            object dbspeStep1: TwwDBSpinEdit
              Left = 303
              Top = 44
              Width = 43
              Height = 21
              Increment = 1
              MaxValue = 20
              MinValue = 1
              DataField = 'NIVELINDIV1'
              DataSource = dsSubTipo
              TabOrder = 2
              UnboundDataType = wwDefault
              OnChange = dbspeStep1Change
            end
          end
          object gbxFuncao: TGroupBox
            Left = 381
            Top = 341
            Width = 354
            Height = 44
            Caption = 'Função'
            TabOrder = 8
            object Label75: TLabel
              Left = 180
              Top = 17
              Width = 55
              Height = 13
              Caption = 'Data Efet'
            end
            object Label76: TLabel
              Left = 12
              Top = 18
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object dbedDataFuncao: TCMDateTimePicker
              Left = 249
              Top = 13
              Width = 93
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAFUNCAO'
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
              DisplayFormat = 'dd/MM/yyyy'
            end
            object dbedFuncao: TDBRealEdit
              Left = 81
              Top = 13
              Width = 93
              Height = 21
              Alignment = taRightJustify
              Enabled = False
              Lines.Strings = (
                '0,00')
              TabOrder = 0
              WordWrap = False
              OnChange = dbedSalarioChange
              IntDigits = 12
              DecDigits = 2
              NumberFormat = fFixed
              Signal = False
              DataField = 'VLRFUNCAO'
              DataSource = dsSubTipo
            end
          end
          object gbxSalarioFuncao: TGroupBox
            Left = 381
            Top = 386
            Width = 354
            Height = 45
            Caption = 'Salário  + Função'
            TabOrder = 9
            object Label78: TLabel
              Left = 12
              Top = 18
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object dbedVlrSalarioFuncao: TDBRealEdit
              Left = 81
              Top = 16
              Width = 93
              Height = 21
              Alignment = taRightJustify
              Enabled = False
              Lines.Strings = (
                '0,00')
              TabOrder = 0
              WordWrap = False
              IntDigits = 12
              DecDigits = 2
              NumberFormat = fFixed
              Signal = False
              DataField = 'VLRSALARIOFUNCAO'
              DataSource = dsSubTipo
            end
          end
          object pnlAlteraSal: TPanel
            Left = 254
            Top = 237
            Width = 179
            Height = 68
            TabOrder = 6
            Visible = False
            object tbbtnConfInfo: TToolbarButton97
              Left = 146
              Top = 7
              Width = 25
              Height = 25
              Hint = 'Confirmar Informação'
              AllowAllUp = True
              GroupIndex = 2
              Default = True
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
              ImageIndex = 0
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = tbbtnConfInfoClick
            end
            object tbbtnCancelInfo: TToolbarButton97
              Left = 146
              Top = 36
              Width = 25
              Height = 25
              Hint = 'Cancelar Informação'
              AllowAllUp = True
              Cancel = True
              GroupIndex = 2
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
              ImageIndex = 0
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = tbbtnCancelInfoClick
            end
            object Bevel2: TBevel
              Left = 135
              Top = 2
              Width = 4
              Height = 64
            end
            object rgInformaSalario: TRadioGroup
              Left = 8
              Top = 4
              Width = 120
              Height = 31
              Caption = 'Informa Salário ?'
              Columns = 2
              ItemIndex = 0
              Items.Strings = (
                'Valor'
                'Faixa')
              TabOrder = 0
              TabStop = True
              OnClick = rgInformaSalarioClick
            end
            object cmbSteps: TComboBox
              Left = 8
              Top = 39
              Width = 120
              Height = 21
              Style = csDropDownList
              Enabled = False
              ItemHeight = 13
              TabOrder = 1
              OnChange = cmbStepsChange
            end
          end
          object grbInfoEstagio: TGroupBox
            Left = 744
            Top = -1
            Width = 329
            Height = 274
            Caption = 'Informações do Estágiário e Aprendiz'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 10
            object lblNaturEstagio: TLabel
              Left = 8
              Top = 20
              Width = 102
              Height = 13
              Caption = 'Natureza Estágio:'
              Enabled = False
            end
            object lblNivelEstag: TLabel
              Left = 8
              Top = 50
              Width = 32
              Height = 13
              Caption = 'Nível'
              Enabled = False
            end
            object lblAreaAtu: TLabel
              Left = 8
              Top = 80
              Width = 96
              Height = 13
              Caption = 'Área de Atuação'
              Enabled = False
            end
            object lblNumApolSeguro: TLabel
              Left = 8
              Top = 110
              Width = 141
              Height = 13
              Caption = 'Nº da Apólice de Seguro'
              Enabled = False
            end
            object lblInsEnsino: TLabel
              Left = 7
              Top = 140
              Width = 120
              Height = 13
              Caption = 'Instituição de Ensino'
              Enabled = False
            end
            object lblAgenIntegracao: TLabel
              Left = 8
              Top = 170
              Width = 124
              Height = 13
              Caption = 'Agente de Integração'
              Enabled = False
            end
            object sbtnInsEnsino: TSpeedButton
              Left = 294
              Top = 132
              Width = 25
              Height = 23
              Enabled = False
              Glyph.Data = {
                42010000424D4201000000000000760000002800000011000000110000000100
                040000000000CC00000000000000000000001000000010000000000000000000
                BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                DDDDD0000000DDDDD000DDDDD000D0000000DDDDD070DDDDD070D0000000DDDD
                D0008DDD8000D0000000DDDDD00000000000D0000000D444407000070000D000
                0000D4FFF07000070000D0000000D4F8800000000000D0000000D4FFFF000070
                000DD0000000D4F88F80088F00DDD0000000D4FFFFF00FFF00DDD0000000D4F8
                8F80088F00DDD0000000D4FFFFFFFFFF4DDDD0000000D444444444444DDDD000
                0000D474474474474DDDD0000000D444444444444DDDD0000000DDDDDDDDDDDD
                DDDDD0000000}
              OnClick = sbtnInsEnsinoClick
            end
            object sbtnAgenIntegracao: TSpeedButton
              Left = 294
              Top = 163
              Width = 25
              Height = 23
              Enabled = False
              Glyph.Data = {
                42010000424D4201000000000000760000002800000011000000110000000100
                040000000000CC00000000000000000000001000000010000000000000000000
                BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                DDDDD0000000DDDDD000DDDDD000D0000000DDDDD070DDDDD070D0000000DDDD
                D0008DDD8000D0000000DDDDD00000000000D0000000D444407000070000D000
                0000D4FFF07000070000D0000000D4F8800000000000D0000000D4FFFF000070
                000DD0000000D4F88F80088F00DDD0000000D4FFFFF00FFF00DDD0000000D4F8
                8F80088F00DDD0000000D4FFFFFFFFFF4DDDD0000000D444444444444DDDD000
                0000D474474474474DDDD0000000D444444444444DDDD0000000DDDDDDDDDDDD
                DDDDD0000000}
              OnClick = sbtnAgenIntegracaoClick
            end
            object rbObrigatorio: TRadioButton
              Left = 120
              Top = 20
              Width = 87
              Height = 17
              Caption = 'Obrigatório'
              Enabled = False
              TabOrder = 0
            end
            object rbNObrigatorio: TRadioButton
              Left = 208
              Top = 20
              Width = 113
              Height = 17
              Caption = 'Não Obrigatório'
              Enabled = False
              TabOrder = 1
            end
            object grbSpVisorEstag: TGroupBox
              Left = 9
              Top = 197
              Width = 310
              Height = 69
              Caption = 'Supervisor do Estágio '
              Enabled = False
              TabOrder = 7
              object lblNomeSpVisorEstag: TLabel
                Left = 8
                Top = 22
                Width = 33
                Height = 13
                Caption = 'Nome'
                Enabled = False
              end
              object lblCPFspVisorEstag: TLabel
                Left = 17
                Top = 46
                Width = 24
                Height = 13
                Caption = 'CPF'
                Enabled = False
              end
              object sbtnSupervisor: TSpeedButton
                Left = 281
                Top = 16
                Width = 25
                Height = 23
                Enabled = False
                Glyph.Data = {
                  42010000424D4201000000000000760000002800000011000000110000000100
                  040000000000CC00000000000000000000001000000010000000000000000000
                  BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                  DDDDD0000000DDDDD000DDDDD000D0000000DDDDD070DDDDD070D0000000DDDD
                  D0008DDD8000D0000000DDDDD00000000000D0000000D444407000070000D000
                  0000D4FFF07000070000D0000000D4F8800000000000D0000000D4FFFF000070
                  000DD0000000D4F88F80088F00DDD0000000D4FFFFF00FFF00DDD0000000D4F8
                  8F80088F00DDD0000000D4FFFFFFFFFF4DDDD0000000D444444444444DDDD000
                  0000D474474474474DDDD0000000D444444444444DDDD0000000DDDDDDDDDDDD
                  DDDDD0000000}
                OnClick = sbtnSupervisorClick
              end
              object dbedtNomeSprvisor: TwwDBEdit
                Left = 45
                Top = 17
                Width = 232
                Height = 21
                DataField = 'NOMESV'
                DataSource = dsEstagiario
                Enabled = False
                ReadOnly = True
                TabOrder = 0
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dbedtCPFspvisor: TwwDBEdit
                Left = 45
                Top = 41
                Width = 233
                Height = 21
                DataField = 'CNPJSV'
                DataSource = dsEstagiario
                Enabled = False
                ReadOnly = True
                TabOrder = 1
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
            end
            object dbedtAreaAtu: TwwDBEdit
              Left = 110
              Top = 75
              Width = 210
              Height = 21
              DataField = 'AREAATUACAO'
              DataSource = dsEstagiario
              Enabled = False
              TabOrder = 3
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedtNumApolSeguro: TwwDBEdit
              Left = 152
              Top = 103
              Width = 168
              Height = 21
              DataField = 'NUMAPOLSEGURO'
              DataSource = dsEstagiario
              Enabled = False
              TabOrder = 4
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedtInsEnsino: TwwDBEdit
              Left = 135
              Top = 134
              Width = 157
              Height = 21
              DataField = 'NOMEIE'
              DataSource = dsEstagiario
              Enabled = False
              ReadOnly = True
              TabOrder = 5
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedtAgenIntegracao: TwwDBEdit
              Left = 135
              Top = 165
              Width = 157
              Height = 21
              DataField = 'NOMEAI'
              DataSource = dsEstagiario
              Enabled = False
              ReadOnly = True
              TabOrder = 6
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbcmbNivelEstag: TwwDBComboBox
              Left = 48
              Top = 45
              Width = 273
              Height = 21
              ShowButton = True
              Style = csDropDownList
              MapList = True
              AllowClearKey = False
              DataField = 'NIVEL'
              DataSource = dsEstagiario
              DropDownCount = 8
              Enabled = False
              ItemHeight = 0
              Items.Strings = (
                'Fundamental'#9'1'
                'Médio'#9'2'
                'Formação Profissional'#9'3'
                'Superior'#9'4'
                'Especial'#9'8'
                'Mãe Social (Lei 7644, de 1987)'#9'9')
              Sorted = False
              TabOrder = 2
              UnboundDataType = wwDefault
            end
          end
          object grbCessaoTrab: TGroupBox
            Left = 744
            Top = 273
            Width = 329
            Height = 158
            Caption = 'Informação Origem Cessão do Trabalhador '
            Enabled = False
            TabOrder = 11
            object lblCNPJEmpCed: TLabel
              Left = 50
              Top = 53
              Width = 32
              Height = 13
              Caption = 'CNPJ'
              Enabled = False
            end
            object lblDtAdmisCessao: TLabel
              Left = 11
              Top = 106
              Width = 71
              Height = 13
              Caption = 'Dt Admissão'
              Enabled = False
            end
            object lblCodEsocial: TLabel
              Left = 27
              Top = 26
              Width = 55
              Height = 13
              Hint = 'Tabela 01 eSocial'
              Caption = 'Categoria'
              Enabled = False
              ParentShowHint = False
              ShowHint = True
            end
            object lblMatriculaCessao: TLabel
              Left = 29
              Top = 79
              Width = 53
              Height = 13
              Caption = 'Matricula'
              Enabled = False
              ParentShowHint = False
              ShowHint = False
            end
            object dbedtCNPJEmpCed: TwwDBEdit
              Left = 93
              Top = 49
              Width = 151
              Height = 21
              DataField = 'CNPJ'
              DataSource = dsDadosCessao
              Enabled = False
              MaxLength = 14
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedDtAdmisCes: TCMDateTimePicker
              Left = 93
              Top = 102
              Width = 111
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAADMISSAO'
              DataSource = dsDadosCessao
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
              TabOrder = 3
              DisplayFormat = 'dd/MM/yyyy'
            end
            object edtCodEsocial: TwwDBEdit
              Left = 93
              Top = 22
              Width = 111
              Height = 21
              Hint = 'Tabela 01 eSocial'
              DataField = 'CODIGOESOCIAL'
              DataSource = dsDadosCessao
              Enabled = False
              MaxLength = 3
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnExit = dbedDuracaoContrExit
            end
            object edtMatriculaCessao: TwwDBEdit
              Left = 93
              Top = 75
              Width = 111
              Height = 21
              DataField = 'MATRICULA'
              DataSource = dsDadosCessao
              Enabled = False
              ParentShowHint = False
              ShowHint = False
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnExit = dbedDuracaoContrExit
            end
          end
        end
        object tbshOutros: TTabSheet
          Caption = 'tbshOutros'
          object Label44: TLabel
            Left = 7
            Top = 11
            Width = 165
            Height = 13
            Caption = 'Vínculo Empregatício (RAIS)'
          end
          object Label45: TLabel
            Left = 7
            Top = 35
            Width = 178
            Height = 13
            Caption = 'Movimento Contratual (CAGED)'
          end
          object Label46: TLabel
            Left = 7
            Top = 59
            Width = 116
            Height = 13
            Caption = 'Tipo de Trabalhador'
          end
          object dblckVincEmpr: TwwDBLookupCombo
            Left = 198
            Top = 9
            Width = 575
            Height = 21
            DropDownAlignment = taRightJustify
            Selected.Strings = (
              'DESCRICAO'#9'50'#9'DESCRICAO')
            DataField = 'IDVINCEMPREG'
            DataSource = dsSubTipo
            LookupTable = CdsVincEmpr
            LookupField = 'IDVINCEMPREG'
            Style = csDropDownList
            DropDownCount = 15
            DropDownWidth = 700
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
          end
          object dblckMovContrCAGED: TwwDBLookupCombo
            Left = 198
            Top = 33
            Width = 575
            Height = 21
            DropDownAlignment = taRightJustify
            Selected.Strings = (
              'DESCRICAO'#9'50'#9'DESCRICAO')
            DataField = 'IDMOVCONTRCAGED'
            DataSource = dsSubTipo
            LookupTable = CdsMovContrCAGED
            LookupField = 'IDMOVCONTRCAGED'
            Style = csDropDownList
            DropDownCount = 15
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
            OnChange = dblckSitFuncChange
          end
          object dblckTipoTrab: TwwDBLookupCombo
            Left = 198
            Top = 57
            Width = 575
            Height = 21
            DropDownAlignment = taRightJustify
            Selected.Strings = (
              'DESCRICAO'#9'50'#9'DESCRICAO')
            DataField = 'IDTIPOTRAB'
            DataSource = dsSubTipo
            LookupTable = CdsTipoTrab
            LookupField = 'IDTIPOTRAB'
            Style = csDropDownList
            DropDownCount = 10
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
          end
          object gbxFGTS: TGroupBox
            Left = 6
            Top = 91
            Width = 502
            Height = 182
            Caption = 'FGTS - Fundo de Garantia por Tempo de Serviço'
            TabOrder = 3
            object lblDatOpc: TLabel
              Left = 369
              Top = 16
              Width = 87
              Height = 13
              Caption = 'Data de Opção'
            end
            object Label48: TLabel
              Left = 12
              Top = 57
              Width = 127
              Height = 13
              AutoSize = False
              Caption = 'Quantidade de Contas'
            end
            object Label49: TLabel
              Left = 265
              Top = 58
              Width = 98
              Height = 13
              Caption = 'Valor Depositado'
            end
            object Label11: TLabel
              Left = 12
              Top = 83
              Width = 127
              Height = 13
              AutoSize = False
              Caption = 'Banco'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label58: TLabel
              Left = 12
              Top = 108
              Width = 127
              Height = 13
              AutoSize = False
              Caption = 'Agência'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object spbtProcuraAgenciaFGTS: TSpeedButton
              Left = 243
              Top = 103
              Width = 27
              Height = 23
              Hint = 'Procurar Agência para o FGTS'
              Glyph.Data = {
                42010000424D4201000000000000760000002800000011000000110000000100
                040000000000CC00000000000000000000001000000010000000000000000000
                BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                DDDDD0000000DDDDD000DDDDD000D0000000DDDDD070DDDDD070D0000000DDDD
                D0008DDD8000D0000000DDDDD00000000000D0000000D444407000070000D000
                0000D4FFF07000070000D0000000D4F8800000000000D0000000D4FFFF000070
                000DD0000000D4F88F80088F00DDD0000000D4FFFFF00FFF00DDD0000000D4F8
                8F80088F00DDD0000000D4FFFFFFFFFF4DDDD0000000D444444444444DDDD000
                0000D474474474474DDDD0000000D444444444444DDDD0000000DDDDDDDDDDDD
                DDDDD0000000}
              ParentShowHint = False
              ShowHint = True
              OnClick = spbtProcuraAgenciaSalarioClick
            end
            object Label59: TLabel
              Left = 279
              Top = 108
              Width = 99
              Height = 13
              Caption = 'Número da Conta'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label56: TLabel
              Left = 12
              Top = 132
              Width = 127
              Height = 13
              AutoSize = False
              Caption = 'Categoria Empregado'
            end
            object Label57: TLabel
              Left = 12
              Top = 157
              Width = 127
              Height = 13
              AutoSize = False
              Caption = 'Situação de Risco'
            end
            object rgFGTSopcao: TDBRadioGroup
              Left = 12
              Top = 13
              Width = 325
              Height = 37
              Columns = 3
              DataField = 'FLGTIPOFGTS'
              DataSource = dsSubTipo
              Items.Strings = (
                'Optante'
                'Não Optante'
                'Retratação')
              TabOrder = 0
              TabStop = True
              Values.Strings = (
                '1'
                '2'
                '3')
              OnClick = rgFGTSopcaoClick
            end
            object dbedDatOpc: TCMDateTimePicker
              Left = 369
              Top = 29
              Width = 121
              Height = 21
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
              ShowButton = True
              TabOrder = 1
              DisplayFormat = 'dd/MM/yyyy'
            end
            object dbedContas: TwwDBEdit
              Left = 144
              Top = 54
              Width = 60
              Height = 21
              DataField = 'QUANTIDADEFGTS'
              DataSource = dsSubTipo
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedValFG: TDBRealEdit
              Left = 369
              Top = 54
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 3
              WordWrap = False
              IntDigits = 17
              DecDigits = 2
              NumberFormat = fFixed
              Signal = False
              DataField = 'VALORFGTS'
              DataSource = dsSubTipo
            end
            object dblckBancoFGTS: TwwDBLookupCombo
              Left = 143
              Top = 79
              Width = 346
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'RAZAOSOCIAL'#9'60'#9'RAZAOSOCIAL'#9'F')
              LookupTable = CdsBanco
              LookupField = 'IDPESSOA'
              Style = csDropDownList
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              OrderByDisplay = False
              UseTFields = False
              AllowClearKey = True
              ShowMatchText = True
            end
            object mskedNumAgenciaFGTS: TMaskEdit
              Left = 144
              Top = 104
              Width = 95
              Height = 21
              TabOrder = 5
              OnEnter = mskedNumAgenciaSalarioEnter
              OnExit = mskedNumAgenciaSalarioExit
            end
            object mskedNumContaFGTS: TMaskEdit
              Left = 383
              Top = 104
              Width = 106
              Height = 21
              TabOrder = 6
              OnExit = mskedNumContaSalarioExit
            end
            object dblckCatEmpr: TwwDBLookupCombo
              Left = 144
              Top = 129
              Width = 346
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'DESCRICAO')
              DataField = 'IDCATEMPRGRE'
              DataSource = dsSubTipo
              LookupTable = CdsCatEmpr
              LookupField = 'IDCATEMPRGRE'
              Style = csDropDownList
              TabOrder = 7
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
            end
            object dblckSitRisco: TwwDBLookupCombo
              Left = 144
              Top = 154
              Width = 346
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'80'#9'Descrição')
              DataField = 'IDSITRISCO'
              DataSource = dsSubTipo
              LookupTable = CdsSitRisco
              LookupField = 'IDSITRISCO'
              Style = csDropDownList
              TabOrder = 8
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              OnChange = dblckSitRiscoChange
            end
          end
          object gbxContaSal: TGroupBox
            Left = 514
            Top = 91
            Width = 259
            Height = 104
            Caption = 'Conta Salário'
            TabOrder = 4
            object spbtProcuraAgenciaSalario: TSpeedButton
              Left = 108
              Top = 70
              Width = 25
              Height = 23
              Hint = 'Procurar Agência da Conta Salário'
              Glyph.Data = {
                42010000424D4201000000000000760000002800000011000000110000000100
                040000000000CC00000000000000000000001000000010000000000000000000
                BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                DDDDD0000000DDDDD000DDDDD000D0000000DDDDD070DDDDD070D0000000DDDD
                D0008DDD8000D0000000DDDDD00000000000D0000000D444407000070000D000
                0000D4FFF07000070000D0000000D4F8800000000000D0000000D4FFFF000070
                000DD0000000D4F88F80088F00DDD0000000D4FFFFF00FFF00DDD0000000D4F8
                8F80088F00DDD0000000D4FFFFFFFFFF4DDDD0000000D444444444444DDDD000
                0000D474474474474DDDD0000000D444444444444DDDD0000000DDDDDDDDDDDD
                DDDDD0000000}
              ParentShowHint = False
              ShowHint = True
              OnClick = spbtProcuraAgenciaSalarioClick
            end
            object lblNumConta: TLabel
              Left = 136
              Top = 56
              Width = 99
              Height = 13
              Caption = 'Número da Conta'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblBanco: TLabel
              Left = 9
              Top = 16
              Width = 37
              Height = 13
              Caption = 'Banco'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblAgencia: TLabel
              Left = 9
              Top = 56
              Width = 47
              Height = 13
              Caption = 'Agência'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dblckBancoSalario: TwwDBLookupCombo
              Left = 9
              Top = 30
              Width = 231
              Height = 21
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'RAZAOSOCIAL'#9'60'#9'RAZAOSOCIAL'#9'F')
              LookupTable = CdsBanco
              LookupField = 'IDPESSOA'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              OrderByDisplay = False
              UseTFields = False
              AllowClearKey = True
              ShowMatchText = True
              OnEnter = dblckBancoSalarioEnter
              OnExit = dblckBancoSalarioExit
            end
            object mskedNumAgenciaSalario: TMaskEdit
              Left = 9
              Top = 71
              Width = 95
              Height = 21
              TabOrder = 1
              OnEnter = mskedNumAgenciaSalarioEnter
              OnExit = mskedNumAgenciaSalarioExit
            end
            object mskedNumContaSalario: TMaskEdit
              Left = 136
              Top = 71
              Width = 104
              Height = 21
              TabOrder = 2
              OnEnter = mskedNumContaSalarioEnter
              OnExit = mskedNumContaSalarioExit
            end
          end
          object gbxOpcoes: TGroupBox
            Left = 514
            Top = 196
            Width = 259
            Height = 77
            Caption = 'Opções'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 5
            object Label33: TLabel
              Left = 9
              Top = 16
              Width = 37
              Height = 13
              Caption = 'Ticket'
            end
            object Label60: TLabel
              Left = 96
              Top = 16
              Width = 60
              Height = 13
              Caption = 'Perc. REB'
            end
            object Label30: TLabel
              Left = 176
              Top = 16
              Width = 70
              Height = 13
              Caption = 'Data Assoc.'
            end
            object edOpcaoTicket: TEdit
              Left = 8
              Top = 32
              Width = 81
              Height = 21
              TabOrder = 0
            end
            object edOpcoesPerc: TEdit
              Left = 96
              Top = 32
              Width = 73
              Height = 21
              TabOrder = 1
            end
            object edOpcoesDataAssoc: TEdit
              Left = 176
              Top = 32
              Width = 75
              Height = 21
              TabOrder = 2
            end
          end
          object GroupBox1: TGroupBox
            Left = 6
            Top = 281
            Width = 503
            Height = 66
            Caption = 'Informações de Múltiplos Vínculos'
            TabOrder = 6
            object Label28: TLabel
              Left = 7
              Top = 16
              Width = 231
              Height = 13
              Caption = 'Desconto da contribuição previdenciária'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object cbbDESCCONTRIBPREV: TwwDBComboBox
              Left = 8
              Top = 32
              Width = 481
              Height = 21
              ShowButton = True
              Style = csDropDown
              MapList = True
              AllowClearKey = False
              DataField = 'DESCCONTRIBPREV'
              DataSource = dsPessoaFisica
              DropDownCount = 8
              DropDownWidth = 700
              ItemHeight = 0
              Items.Strings = (
                
                  'O declarante aplica a(s) alíquota(s) de desconto do segurado sob' +
                  're a remuneração por ele informada '#9'1'
                
                  'O declarante aplica a(s) alíquota(s) de desconto do segurado sob' +
                  're a diferença entre o limite máximo do salário de contribuição ' +
                  'e a remuneração de outra(s) empresa(s) para as quais o trabalhad' +
                  'or informou que houve o desconto'#9'2'
                
                  'O declarante não realiza desconto do segurado, uma vez que houve' +
                  ' desconto sobre o limite máximo de salário de contribuição em ou' +
                  'tra(s) empresa(s)'#9'3')
              Sorted = False
              TabOrder = 0
              UnboundDataType = wwDefault
              OnChange = cbbDESCCONTRIBPREVChange
            end
          end
        end
        object tbsUltEmpr: TTabSheet
          Caption = 'tbsUltEmpr'
          object dbgrUltEmpr: TwwDBGrid
            Left = 0
            Top = 0
            Width = 1163
            Height = 435
            Selected.Strings = (
              'NUMSEQ'#9'10'#9'Num.Seq.'
              'EMPRESA'#9'40'#9'Empresa'
              'CNPJ'#9'30'#9'CNPJ'
              'MATRICULA'#9'15'#9'Matrícula'
              'DAT_ADMIS'#9'10'#9'Admissão'
              'DATADEM'#9'10'#9'Demissão'
              'ULTSALARIO'#9'10'#9'Ult.Salário'
              'CARGO'#9'30'#9'Cargo'
              'DESCMOTIVO'#9'40'#9'Motivo da Saída')
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
            Width = 1163
            Height = 435
            Align = alClient
            BevelOuter = bvNone
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
              Top = 121
              Width = 136
              Height = 13
              Caption = 'Cargo (da nossa tabela)'
            end
            object Label22: TLabel
              Left = 376
              Top = 121
              Width = 90
              Height = 13
              Caption = 'Título do Cargo'
            end
            object Label61: TLabel
              Left = 32
              Top = 182
              Width = 66
              Height = 13
              Caption = 'Data Inicial'
            end
            object Label62: TLabel
              Left = 230
              Top = 182
              Width = 59
              Height = 13
              Caption = 'Data Final'
            end
            object Label63: TLabel
              Left = 376
              Top = 182
              Width = 79
              Height = 13
              Caption = 'Último Salário'
            end
            object Label64: TLabel
              Left = 32
              Top = 238
              Width = 95
              Height = 13
              Caption = 'Motivo da Saída'
            end
            object lblCNPJUltEmp: TLabel
              Left = 32
              Top = 77
              Width = 32
              Height = 13
              Caption = 'CNPJ'
            end
            object lblMatUltEmp: TLabel
              Left = 376
              Top = 77
              Width = 55
              Height = 13
              Caption = 'Matrícula'
            end
            object dblckUltCargo: TwwDBLookupCombo
              Left = 32
              Top = 136
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
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              OnCloseUp = dblckUltCargoCloseUp
            end
            object dbedUltAdm: TCMDateTimePicker
              Left = 32
              Top = 197
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
              TabOrder = 6
              DisplayFormat = 'dd/MM/yyyy'
            end
            object dbedUltDem: TCMDateTimePicker
              Left = 229
              Top = 197
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
              TabOrder = 7
              DisplayFormat = 'dd/MM/yyyy'
            end
            object dbedUltSal: TDBRealEdit
              Left = 376
              Top = 197
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 8
              WordWrap = False
              IntDigits = 12
              DecDigits = 2
              NumberFormat = fFixed
              Signal = False
              DataField = 'ULTSALARIO'
              DataSource = dsUltEmpr
            end
            object dblckUltMotivo: TwwDBLookupCombo
              Left = 33
              Top = 253
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
              TabOrder = 9
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
            end
            object dbedUltCargo: TwwDBEdit
              Left = 376
              Top = 136
              Width = 300
              Height = 21
              DataField = 'CARGO'
              DataSource = dsUltEmpr
              TabOrder = 5
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
              DataSource = dsUltEmpr
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
              DataSource = dsUltEmpr
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedtCNPJUltEmp: TwwDBEdit
              Left = 32
              Top = 93
              Width = 299
              Height = 21
              DataField = 'CNPJ'
              DataSource = dsUltEmpr
              MaxLength = 14
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedtMatUltEmp: TwwDBEdit
              Left = 376
              Top = 93
              Width = 300
              Height = 21
              DataField = 'MATRICULA'
              DataSource = dsUltEmpr
              TabOrder = 3
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
        end
        object tbsBeneficios: TTabSheet
          Caption = 'tbsBeneficios'
          ImageIndex = 11
          object GBoxTipoBeneficios: TGroupBox
            Left = 2
            Top = 16
            Width = 215
            Height = 118
            Caption = 'Tipos de Benefícios'
            TabOrder = 0
            object ChkLBoxTipoBen: TCheckListBox
              Left = 8
              Top = 20
              Width = 201
              Height = 78
              BorderStyle = bsNone
              Color = clBtnFace
              Ctl3D = False
              ItemHeight = 22
              ParentCtl3D = False
              Style = lbOwnerDrawFixed
              TabOrder = 0
            end
          end
          object GBoxDepend1: TGroupBox
            Left = 672
            Top = 16
            Width = 273
            Height = 118
            Caption = 'Qtde.Dependentes'
            TabOrder = 1
            object lblPSaude: TLabel
              Left = 8
              Top = 29
              Width = 110
              Height = 13
              Caption = 'Assistência Médica'
            end
            object lblPOdont: TLabel
              Left = 8
              Top = 59
              Width = 144
              Height = 13
              Caption = 'Assistência Odontológica'
            end
            object lblPmedic: TLabel
              Left = 8
              Top = 87
              Width = 145
              Height = 13
              Caption = 'Assistência Farmacêutica'
            end
            object dBEditQtdPSaude: TwwDBEdit
              Left = 199
              Top = 26
              Width = 50
              Height = 21
              DataField = 'QtePlanoSaude'
              DataSource = dsPlanos
              Enabled = False
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dBEditQtdPOdont: TwwDBEdit
              Left = 199
              Top = 56
              Width = 50
              Height = 21
              DataField = 'QtePlanoOdonto'
              DataSource = dsPlanos
              Enabled = False
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dBEditQtdPMedic: TwwDBEdit
              Left = 199
              Top = 85
              Width = 50
              Height = 21
              DataField = 'QtePlanoMedic'
              DataSource = dsPlanos
              Enabled = False
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
          object grpSinPercAl: TGroupBox
            Left = 223
            Top = 16
            Width = 440
            Height = 233
            Caption = 'Rateio Auxílio Alimentação'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            object lblPercAlim: TLabel
              Left = 8
              Top = 19
              Width = 70
              Height = 13
              Caption = 'Alimentação'
            end
            object lblPercRefe: TLabel
              Left = 96
              Top = 19
              Width = 52
              Height = 13
              Caption = 'Refeição'
            end
            object lblsinalpercalimentacao: TLabel
              Left = 65
              Top = 37
              Width = 10
              Height = 13
              Caption = '%'
            end
            object lblsinalpercrefeicao: TLabel
              Left = 153
              Top = 37
              Width = 10
              Height = 13
              Caption = '%'
            end
            object dbePercRatAliment: TwwDBEdit
              Left = 8
              Top = 33
              Width = 50
              Height = 21
              DataField = 'PERCRATALIMENTACAO'
              DataSource = dsSubTipo
              Enabled = False
              MaxLength = 5
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnChange = ValidaPercRateio
              OnClick = dbePercRatAlimentClick
              OnEnter = dbePercRatAlimentEnter
              OnKeyPress = ValidaKeyPercRateio
            end
            object dbePercRatRefei: TwwDBEdit
              Left = 96
              Top = 33
              Width = 50
              Height = 21
              DataField = 'PercRatRefeicao'
              DataSource = dsSubTipo
              Enabled = False
              MaxLength = 5
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnChange = ValidaPercRateio
              OnClick = dbePercRatRefeiClick
              OnEnter = dbePercRatRefeiEnter
              OnKeyPress = ValidaKeyPercRateio
            end
            object pnlHistAlter: TPanel
              Left = 8
              Top = 72
              Width = 425
              Height = 153
              TabOrder = 2
              object lblHistAlter: TLabel
                Left = 136
                Top = 9
                Width = 133
                Height = 13
                Caption = 'Histórico de Alterações'
              end
              object cbbAnoHistAlter: TComboBox
                Left = 8
                Top = 5
                Width = 73
                Height = 21
                Enabled = False
                ItemHeight = 13
                TabOrder = 0
                Text = 'cbbAnoHistAlter'
                OnChange = cbbAnoHistAlterChange
              end
              object dbgrdHistAlter: TwwDBGrid
                Left = 8
                Top = 31
                Width = 409
                Height = 112
                Selected.Strings = (
                  'DATAHORA'#9'18'#9'Data/Hora'
                  'USUARIO'#9'18'#9'Usuário'
                  'PERC_ALIMENTACAO'#9'6'#9'Aliment.'
                  'PERC_REFEICAO'#9'6'#9'Refeição')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                DataSource = dsGridHistAlterBenef
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
                ReadOnly = True
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
          object GroupBox5: TGroupBox
            Left = 672
            Top = 144
            Width = 273
            Height = 57
            Caption = ' Seguro de Vida em Grupo '
            TabOrder = 3
          end
          object DBCheckBox1: TDBCheckBox
            Left = 680
            Top = 168
            Width = 257
            Height = 17
            Caption = 'Optante pelo Seguro de vida em Grupo?'
            DataField = 'FLG_OPT_SEGUROVIDA_GRUPO'
            DataSource = dsSubTipo
            TabOrder = 4
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
        object tbsheSocial: TTabSheet
          Caption = 'tbshEsocial'
          ImageIndex = 11
          object grbCategTrab: TGroupBox
            Left = 12
            Top = 9
            Width = 629
            Height = 105
            Caption = 'Categoria de Trabalhadores'
            TabOrder = 0
            object Label77: TLabel
              Left = 13
              Top = 17
              Width = 111
              Height = 13
              Caption = 'Grupo de Categoria'
            end
            object lblDescCateg: TLabel
              Left = 12
              Top = 58
              Width = 134
              Height = 13
              Caption = 'Descrição da Categoria'
            end
            object dbcmbDescCateg: TwwDBLookupCombo
              Left = 13
              Top = 72
              Width = 596
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'170'#9)
              DataField = 'IDCATEGTRABAESOCIAL'
              DataSource = dsSubTipo
              LookupTable = CdsDescCateg
              LookupField = 'IDCATEGTRABAESOCIAL'
              Style = csDropDownList
              TabOrder = 1
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
            object cmbGrupoCateg: TComboBox
              Left = 13
              Top = 32
              Width = 596
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              OnChange = cmbGrupoCategChange
            end
          end
          object GroupBox3: TGroupBox
            Left = 11
            Top = 125
            Width = 630
            Height = 65
            Caption = 'Grau de Exposição a Agentes Nocivos'
            TabOrder = 1
            object Label80: TLabel
              Left = 14
              Top = 17
              Width = 58
              Height = 13
              Caption = 'Descrição'
            end
            object dbcmbDescGrauExp: TwwDBLookupCombo
              Left = 14
              Top = 31
              Width = 595
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'150'#9)
              DataField = 'IDGRAUEXPAGENTESOCIAL'
              DataSource = dsSubTipo
              LookupTable = CdsGrauExpAgenNoc
              LookupField = 'IDGRAUEXPAGENTESOCIAL'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
          end
        end
        object tbsRescisao: TTabSheet
          Caption = 'tbsRescisao'
          ImageIndex = 12
          object pnlRecisaoContrato: TPanel
            Left = 0
            Top = 0
            Width = 353
            Height = 435
            Align = alLeft
            Locked = True
            TabOrder = 0
            object grpRecisao: TGroupBox
              Left = 0
              Top = 13
              Width = 283
              Height = 269
              Caption = '  Rescisão do Contrato de Trabalho'
              TabOrder = 0
              object lblDtHomolog: TLabel
                Left = 5
                Top = 32
                Width = 127
                Height = 13
                Caption = 'Data de Homologação'
              end
              object lblSituacao: TLabel
                Left = 5
                Top = 72
                Width = 51
                Height = 13
                Caption = 'Situação'
              end
              object lblDesRessalva: TLabel
                Left = 5
                Top = 112
                Width = 132
                Height = 13
                Caption = 'Descrição da Ressalva'
              end
              object cbbSituacaoRecisao: TwwDBComboBox
                Left = 59
                Top = 70
                Width = 107
                Height = 21
                ShowButton = True
                Style = csDropDown
                MapList = True
                AllowClearKey = False
                DataField = 'SITRECISAO'
                DataSource = dsSubTipo
                DropDownCount = 8
                ItemHeight = 0
                Items.Strings = (
                  'HOMOLOGADO'#9'H'
                  'NÃO HOMOLOGADO'#9'N')
                Sorted = False
                TabOrder = 0
                UnboundDataType = wwDefault
              end
              object dbmDescRessalva: TDBMemo
                Left = 5
                Top = 129
                Width = 257
                Height = 126
                DataField = 'DESCRESSALVA'
                DataSource = dsSubTipo
                Enabled = False
                TabOrder = 1
              end
              object tmpDtHomologacao: TCMDateTimePicker
                Left = 142
                Top = 30
                Width = 110
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
                TabOrder = 2
                DisplayFormat = 'dd/MM/yyyy'
              end
              object chkRessalva: TDBCheckBox
                Left = 176
                Top = 72
                Width = 97
                Height = 17
                Caption = 'Ressalva'
                DataField = 'FLGRESSALVA'
                DataSource = dsSubTipo
                TabOrder = 3
                ValueChecked = '1'
                ValueUnchecked = '0'
                OnClick = chkRessalvaClick
              end
            end
          end
          object pnlRecisaoImagem: TPanel
            Left = 353
            Top = 0
            Width = 810
            Height = 435
            Align = alClient
            TabOrder = 1
            object pnlRecBotoes: TPanel
              Left = 1
              Top = 405
              Width = 808
              Height = 29
              Align = alBottom
              BevelInner = bvRaised
              BevelOuter = bvLowered
              Ctl3D = True
              Locked = True
              ParentCtl3D = False
              TabOrder = 0
              OnResize = PnlAssociaFoto_PadraoResize
              object btnAssociaRecisao: TButton
                Left = 473
                Top = 2
                Width = 143
                Height = 26
                Caption = 'Associar foto'
                TabOrder = 0
                OnClick = btnAssociaRecisaoClick
              end
              object btnImprimirTermo: TBitBtn
                Left = 624
                Top = 1
                Width = 92
                Height = 27
                Cancel = True
                Caption = ' &Imprimir'
                TabOrder = 1
                OnClick = btnImprimirTermoClick
                Glyph.Data = {
                  DE010000424DDE01000000000000760000002800000024000000120000000100
                  0400000000006801000000000000000000001000000010000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888880008
                  8888888888888F7778FF8888000088888800877008888888888F7787F778FF88
                  0000888800880007700888888F778F7778F778FF000088008800877007700888
                  778F7787F778F778000080880088877770077087FF778887F88778F700008700
                  888887777770008777888887FF888777000080888888F77777777087F8888F77
                  78FF88870000878888FF888777777087F88F77888778FF8700008788FF888888
                  87777087FF778888888778F7000087FF88899888888770877788888888888777
                  000087888AA88888808880878FF8888888FFF8F700008877F888888FF0877888
                  778FF88FF77787780000888877F87FFFFF08888888778F77788878F800008888
                  88777FFFFFF088888888777FF888878F00008888888877FFFFFF008888888877
                  8F888F77000088888888887FFF7788888888888878FF77880000888888888887
                  7788888888888888877788880000888888888888888888888888888888888888
                  0000}
                NumGlyphs = 2
                Spacing = 2
              end
            end
            object scrbxTermo: TScrollBox
              Left = 1
              Top = 1
              Width = 808
              Height = 404
              Align = alClient
              BorderStyle = bsNone
              Color = clAppWorkSpace
              ParentColor = False
              TabOrder = 1
              object dbimgTermoHomolog: TDBImage
                Left = 16
                Top = 16
                Width = 145
                Height = 145
                BorderStyle = bsNone
                Color = clAppWorkSpace
                DataField = 'IMAGEM'
                DataSource = dsImagemOutro
                TabOrder = 0
              end
            end
          end
        end
        object tbsContratoTemp: TTabSheet
          Caption = 'tbsContratoTemp'
          ImageIndex = 13
          object grbCargo: TGroupBox
            Left = 1
            Top = 0
            Width = 329
            Height = 73
            Caption = 'Cargo'
            TabOrder = 0
            object lblNivel: TLabel
              Left = 8
              Top = 48
              Width = 32
              Height = 13
              Caption = 'Nível'
            end
            object dblckCargoCTemp: TwwDBLookupCombo
              Left = 8
              Top = 20
              Width = 313
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'TITULO'#9'30'#9'TITULO')
              DataField = 'IDCARGO'
              DataSource = dsContratoTemp
              LookupTable = CdsCargo
              LookupField = 'IDCARGO'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
              OnChange = dblckCargoCTempChange
            end
            object dbspinedtNivel: TwwDBSpinEdit
              Left = 44
              Top = 44
              Width = 42
              Height = 21
              Increment = 1
              MaxValue = 20
              DataField = 'NIVELINDIV1'
              DataSource = dsContratoTemp
              TabOrder = 1
              UnboundDataType = wwDefault
              OnChange = dbspinedtNivelChange
            end
          end
          object grbPrazo: TGroupBox
            Left = 338
            Top = 0
            Width = 289
            Height = 105
            Caption = 'Prazo'
            TabOrder = 1
            object lblDuracao: TLabel
              Left = 8
              Top = 16
              Width = 49
              Height = 13
              Caption = 'Duração'
            end
            object Label10: TLabel
              Left = 8
              Top = 32
              Width = 27
              Height = 13
              Caption = '(Dias)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object lblPrevTermino: TLabel
              Left = 8
              Top = 52
              Width = 113
              Height = 13
              Caption = 'Previsão de término'
            end
            object lblPrevAviso: TLabel
              Left = 8
              Top = 77
              Width = 141
              Height = 13
              Caption = 'Previsão de aviso prévio'
            end
            object dtPrevTerm: TCMDateTimePicker
              Left = 152
              Top = 47
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'PREVISAOTERMINO'
              DataSource = dsContratoTemp
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
              DisplayFormat = 'dd/MM/yyyy'
              OnExit = dtPrevTermExit
            end
            object dtPrevAviso: TCMDateTimePicker
              Left = 152
              Top = 72
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'PREVISAOAVISOPREV'
              DataSource = dsContratoTemp
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
            object dbedtDuracao: TwwDBEdit
              Left = 152
              Top = 20
              Width = 121
              Height = 21
              DataField = 'DURACAOCONTRATO'
              DataSource = dsContratoTemp
              TabOrder = 0
              UnboundDataType = wwDefault
              UnboundAlignment = taRightJustify
              WantReturns = False
              WordWrap = False
              OnExit = dbedtDuracaoExit
              OnKeyPress = dbedtDuracaoKeyPress
            end
          end
          object grbSituacao: TGroupBox
            Left = 635
            Top = 0
            Width = 185
            Height = 89
            Caption = 'Situação'
            TabOrder = 2
            Visible = False
            object rbAtivo: TRadioButton
              Left = 8
              Top = 16
              Width = 113
              Height = 17
              Caption = 'Ativo'
              TabOrder = 0
            end
            object rbDesligado: TRadioButton
              Left = 8
              Top = 40
              Width = 113
              Height = 17
              Caption = 'Desligado'
              TabOrder = 1
            end
            object rbEfetivado: TRadioButton
              Left = 8
              Top = 64
              Width = 113
              Height = 17
              Caption = 'Efetivado'
              TabOrder = 2
            end
          end
          object grbDataDesligEfetiv: TGroupBox
            Left = 828
            Top = 0
            Width = 281
            Height = 57
            Caption = 'Data de desligamento ou efetivação'
            TabOrder = 3
            object dtDesligEfeitv: TCMDateTimePicker
              Left = 8
              Top = 24
              Width = 145
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATADESL_EFET'
              DataSource = dsContratoTemp
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
              DisplayFormat = 'dd/MM/yyyy'
            end
          end
          object grbSalario: TGroupBox
            Left = 1
            Top = 75
            Width = 185
            Height = 49
            Caption = 'Salário'
            TabOrder = 4
            object lblValorSal: TLabel
              Left = 16
              Top = 24
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object dbedtSalario: TwwDBEdit
              Left = 53
              Top = 20
              Width = 121
              Height = 21
              DataField = 'SALARIOATUAL'
              DataSource = dsContratoTemp
              Enabled = False
              TabOrder = 0
              UnboundDataType = wwDefault
              UnboundAlignment = taRightJustify
              WantReturns = False
              WordWrap = False
            end
          end
          object grbSub: TGroupBox
            Left = 1
            Top = 125
            Width = 936
            Height = 160
            Caption = 'Substitutos'
            TabOrder = 5
            object dbgrdSub: TwwDBGrid
              Left = 2
              Top = 45
              Width = 843
              Height = 113
              Selected.Strings = (
                'MATRICULA'#9'10'#9'Mat. Substituído'
                'NOME'#9'40'#9'Substituído'
                'MOTIVO'#9'15'#9'Motivo'
                'NOMECENTROCUSTO'#9'15'#9'C. Custo'
                'DIRETORIA'#9'15'#9'Diretoria'
                'DATAINICIO'#9'15'#9'Data Início'
                'DATAFIM'#9'15'#9'Data Fim')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsContratoTempSubst
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
              ReadOnly = True
              TabOrder = 3
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
            object pnlSub: TPanel
              Left = 2
              Top = 45
              Width = 843
              Height = 113
              Align = alClient
              TabOrder = 1
              object lblMatSub: TLabel
                Left = 8
                Top = 11
                Width = 55
                Height = 13
                Caption = 'Matrícula'
              end
              object lblSubst: TLabel
                Left = 134
                Top = 11
                Width = 66
                Height = 13
                Caption = 'Substituído'
              end
              object sbtnProcurarSub: TSpeedButton
                Left = 372
                Top = 5
                Width = 25
                Height = 23
                Glyph.Data = {
                  42010000424D4201000000000000760000002800000011000000110000000100
                  040000000000CC00000000000000000000001000000010000000000000000000
                  BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                  DDDDD0000000DDDDD000DDDDD000D0000000DDDDD070DDDDD070D0000000DDDD
                  D0008DDD8000D0000000DDDDD00000000000D0000000D444407000070000D000
                  0000D4FFF07000070000D0000000D4F8800000000000D0000000D4FFFF000070
                  000DD0000000D4F88F80088F00DDD0000000D4FFFFF00FFF00DDD0000000D4F8
                  8F80088F00DDD0000000D4FFFFFFFFFF4DDDD0000000D444444444444DDDD000
                  0000D474474474474DDDD0000000D444444444444DDDD0000000DDDDDDDDDDDD
                  DDDDD0000000}
                OnClick = sbtnProcurarSubClick
              end
              object grbLotacao: TGroupBox
                Left = 208
                Top = 32
                Width = 321
                Height = 59
                Caption = 'Lotação'
                TabOrder = 3
                object lblCCustoSub: TLabel
                  Left = 8
                  Top = 15
                  Width = 49
                  Height = 13
                  Caption = 'C. Custo'
                end
                object lblDirSub: TLabel
                  Left = 8
                  Top = 38
                  Width = 49
                  Height = 13
                  Caption = 'Diretoria'
                end
                object dblckCentCustoCTemp: TwwDBLookupCombo
                  Left = 64
                  Top = 9
                  Width = 249
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'30'#9'Nome'
                    'ATIVO'#9'6'#9'Ativo?'#9'F')
                  DataField = 'CODCENTROCUSTO'
                  DataSource = dsContratoTempSubst
                  LookupTable = CdsCCusto
                  LookupField = 'CODCENTROCUSTO'
                  Options = [loTitles]
                  Style = csDropDownList
                  TabOrder = 0
                  AutoDropDown = False
                  ShowButton = True
                  AllowClearKey = False
                  OnChange = dblckCentCustoCTempChange
                end
                object dbedtDir: TwwDBEdit
                  Left = 64
                  Top = 33
                  Width = 249
                  Height = 21
                  DataField = 'DIRETORIA'
                  DataSource = dsContratoTempSubst
                  Enabled = False
                  TabOrder = 1
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
              end
              object grbPeriodo: TGroupBox
                Left = 537
                Top = 32
                Width = 176
                Height = 65
                Caption = 'Período'
                TabOrder = 4
                object lblInicioSubst: TLabel
                  Left = 8
                  Top = 16
                  Width = 34
                  Height = 13
                  Caption = 'Início'
                end
                object lblFimSubst: TLabel
                  Left = 10
                  Top = 41
                  Width = 20
                  Height = 13
                  Caption = 'Fim'
                end
                object dtInicio: TCMDateTimePicker
                  Left = 56
                  Top = 11
                  Width = 105
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATAINICIO'
                  DataSource = dsContratoTempSubst
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
                  DisplayFormat = 'dd/MM/yyyy'
                  OnExit = dtInicioExit
                end
                object dtFim: TCMDateTimePicker
                  Left = 56
                  Top = 37
                  Width = 105
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATAFIM'
                  DataSource = dsContratoTempSubst
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
                  DisplayFormat = 'dd/MM/yyyy'
                end
              end
              object grbMotivo: TGroupBox
                Left = 8
                Top = 32
                Width = 193
                Height = 69
                Caption = 'Motivo da substituição'
                TabOrder = 2
                object rbAuxDoenca: TRadioButton
                  Left = 8
                  Top = 16
                  Width = 113
                  Height = 17
                  Caption = 'Auxílio doença'
                  Checked = True
                  TabOrder = 0
                  TabStop = True
                end
                object rbAuxDoencaAcid: TRadioButton
                  Left = 8
                  Top = 33
                  Width = 177
                  Height = 17
                  Caption = 'Auxílio doença acidentário'
                  TabOrder = 1
                end
                object rbLicencaMaternidade: TRadioButton
                  Left = 8
                  Top = 49
                  Width = 153
                  Height = 17
                  Caption = 'Licença maternidade'
                  TabOrder = 2
                end
              end
              object dbedtSubstituido: TwwDBEdit
                Left = 203
                Top = 6
                Width = 166
                Height = 21
                DataField = 'NOME'
                DataSource = dsContratoTempSubst
                Enabled = False
                TabOrder = 1
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dbedtMatriculaSub: TwwDBEdit
                Left = 67
                Top = 6
                Width = 62
                Height = 21
                DataField = 'MATRICULA'
                DataSource = dsContratoTempSubst
                Enabled = False
                TabOrder = 0
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
            end
            object Panel9: TPanel
              Left = 2
              Top = 15
              Width = 932
              Height = 30
              Align = alTop
              BevelInner = bvLowered
              BevelOuter = bvLowered
              TabOrder = 0
              object dckBtnsInsAlt: TDock97
                Left = 2
                Top = 2
                Width = 928
                Height = 29
                object Toolbar976: TToolbar97
                  Left = 0
                  Top = 0
                  Caption = 'Toolbar972'
                  DockPos = 0
                  DragHandleStyle = dhNone
                  TabOrder = 0
                  object btnInsertCTempSub: TToolbarButton97
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
                    OnClick = btnInsertCTempSubClick
                  end
                  object btnAlterarCTempSub: TToolbarButton97
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
                    OnClick = btnAlterarCTempSubClick
                  end
                end
              end
            end
            object dckbtnsSub: TDock97
              Left = 845
              Top = 45
              Width = 89
              Height = 113
              Position = dpRight
              Visible = False
              object Toolbar977: TToolbar97
                Left = 0
                Top = 0
                Caption = 'Toolbar977'
                DockPos = 0
                DragHandleStyle = dhNone
                TabOrder = 0
                object btnOkDetSub: TBitBtn
                  Left = 0
                  Top = 0
                  Width = 85
                  Height = 27
                  Caption = 'OK'
                  TabOrder = 0
                  OnClick = btnOkDetSubClick
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
                object btnCancelarDetSub: TBitBtn
                  Left = 0
                  Top = 27
                  Width = 85
                  Height = 27
                  Cancel = True
                  Caption = 'Cancelar'
                  TabOrder = 1
                  OnClick = btnCancelarDetSubClick
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
                object btnVoltarDetSub: TBitBtn
                  Left = 0
                  Top = 54
                  Width = 85
                  Height = 27
                  Cancel = True
                  Caption = '&Voltar'
                  TabOrder = 2
                  OnClick = btnVoltarDetSubClick
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
          object grbObservacoes: TGroupBox
            Left = 2
            Top = 287
            Width = 935
            Height = 160
            Caption = 'Observações'
            TabOrder = 6
            object dbgrdObs: TwwDBGrid
              Left = 2
              Top = 45
              Width = 842
              Height = 113
              Selected.Strings = (
                'DATAOBSERV'#9'15'#9'Data'
                'OBSERVACAO2'#9'120'#9'Observação')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsContratoTempObs
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
              OnDblClick = dbgrdObsDblClick
              IndicatorColor = icBlack
            end
            object pnlObs: TPanel
              Left = 2
              Top = 45
              Width = 842
              Height = 113
              Align = alClient
              TabOrder = 2
              object lblDataObs: TLabel
                Left = 9
                Top = 8
                Width = 28
                Height = 13
                Caption = 'Data'
              end
              object lblObservacoes: TLabel
                Left = 9
                Top = 30
                Width = 75
                Height = 13
                Caption = 'Observações'
              end
              object dtDataObs: TCMDateTimePicker
                Left = 42
                Top = 3
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATAOBSERV'
                DataSource = dsContratoTempObs
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
                DisplayFormat = 'dd/MM/yyyy'
              end
              object dbmmoObs: TDBMemo
                Left = 8
                Top = 46
                Width = 826
                Height = 60
                DataField = 'OBSERVACAO'
                DataSource = dsContratoTempObs
                MaxLength = 450
                TabOrder = 1
              end
            end
            object Panel6: TPanel
              Left = 2
              Top = 15
              Width = 931
              Height = 30
              Align = alTop
              BevelInner = bvLowered
              BevelOuter = bvLowered
              TabOrder = 1
              object dckObs: TDock97
                Left = 2
                Top = 2
                Width = 927
                Height = 29
                object Toolbar973: TToolbar97
                  Left = 0
                  Top = 0
                  Caption = 'Toolbar972'
                  DockPos = 0
                  DragHandleStyle = dhNone
                  TabOrder = 0
                  object btnAltCTempObs: TToolbarButton97
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
                    OnClick = btnAltCTempObsClick
                  end
                  object btnInsertCTempObs: TToolbarButton97
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
                    OnClick = btnInsertCTempObsClick
                  end
                end
              end
            end
            object dckBtnsObs: TDock97
              Left = 844
              Top = 45
              Width = 89
              Height = 113
              Position = dpRight
              Visible = False
              object Toolbar972: TToolbar97
                Left = 0
                Top = 0
                Caption = 'Toolbar977'
                DockPos = 0
                DragHandleStyle = dhNone
                TabOrder = 0
                object btnOkObs: TBitBtn
                  Left = 0
                  Top = 0
                  Width = 85
                  Height = 27
                  Caption = 'OK'
                  TabOrder = 0
                  OnClick = btnOkObsClick
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
                object btnCancelarObs: TBitBtn
                  Left = 0
                  Top = 27
                  Width = 85
                  Height = 27
                  Cancel = True
                  Caption = 'Cancelar'
                  TabOrder = 1
                  OnClick = btnCancelarObsClick
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
                object btnVoltarObs: TBitBtn
                  Left = 0
                  Top = 54
                  Width = 85
                  Height = 27
                  Cancel = True
                  Caption = '&Voltar'
                  TabOrder = 2
                  OnClick = btnVoltarObsClick
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
        end
        object tbsProcessos: TTabSheet
          Caption = 'tbsProcessos'
          ImageIndex = 14
          object dbgrdProcessos: TwwDBGrid
            Left = 0
            Top = 0
            Width = 1163
            Height = 435
            Selected.Strings = (
              'TIPODEPROC'#9'10'#9'Tipo'
              'NUMERO'#9'10'#9'Número'
              'nomecidade'#9'10'#9'Cidade'
              'uf'#9'10'#9'UF Seção Judiciária'
              'CODMUNICIPIO'#9'10'#9'Cód. Município'
              'CODIDENTVARA'#9'10'#9'Cód. da Vara'
              'DATAINICIO'#9'10'#9'Data Início'
              'DATAFIM'#9'10'#9'Data Fim'
              'contriabrandec'#9'10'#9'Contribuição abrangida pela Decisão'
              'autorac'#9'10'#9'Autor da ação'
              'CODMATPROCDESC'#9'10'#9'Matéria do Processo ou Alvará Judicial')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsProcessos
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
          object pgcProcessos: TPageControl
            Left = 0
            Top = 51
            Width = 1240
            Height = 357
            ActivePage = tbsProcDados
            TabOrder = 1
            OnChange = pgcProcessosChange
            object tbsProcDados: TTabSheet
              Caption = 'Geral'
              object grpInfos: TGroupBox
                Left = 0
                Top = 4
                Width = 737
                Height = 215
                Caption = 'Informações do Processo'
                TabOrder = 0
                object Label27: TLabel
                  Left = 10
                  Top = 23
                  Width = 26
                  Height = 13
                  Caption = 'Tipo'
                end
                object Label52: TLabel
                  Left = 278
                  Top = 23
                  Width = 44
                  Height = 13
                  Caption = 'Número'
                end
                object Label79: TLabel
                  Left = 10
                  Top = 66
                  Width = 40
                  Height = 13
                  Caption = 'Cidade'
                end
                object Label81: TLabel
                  Left = 276
                  Top = 66
                  Width = 133
                  Height = 13
                  Caption = 'UF da Seção Judiciária'
                end
                object Label82: TLabel
                  Left = 418
                  Top = 66
                  Width = 118
                  Height = 13
                  Caption = 'Código do Município'
                end
                object Label83: TLabel
                  Left = 574
                  Top = 66
                  Width = 143
                  Height = 13
                  Caption = 'Código de Ident. da Vara'
                end
                object Label66: TLabel
                  Left = 476
                  Top = 23
                  Width = 65
                  Height = 13
                  Caption = 'Data Início'
                end
                object Label84: TLabel
                  Left = 606
                  Top = 23
                  Width = 51
                  Height = 13
                  Caption = 'Data Fim'
                end
                object Label86: TLabel
                  Left = 10
                  Top = 112
                  Width = 208
                  Height = 13
                  Caption = 'Contribuição abrangida pela decisão'
                end
                object Label70: TLabel
                  Left = 362
                  Top = 112
                  Width = 117
                  Height = 13
                  Caption = 'Matéria do Processo'
                end
                object dblkpcbbIDCIDADES: TwwDBLookupCombo
                  Left = 10
                  Top = 82
                  Width = 260
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'CIDADE'#9'30'#9'CIDADE')
                  DataField = 'IDCIDADES'
                  DataSource = dsProcessos
                  LookupTable = CdsCidadeMunicipio
                  LookupField = 'idcidades'
                  Style = csDropDownList
                  DropDownCount = 15
                  TabOrder = 4
                  AutoDropDown = True
                  ShowButton = True
                  UseTFields = False
                  AllowClearKey = True
                  OnExit = dblkpcbbIDCIDADESExit
                end
                object edtCODIDENTVARA: TwwDBEdit
                  Left = 574
                  Top = 82
                  Width = 152
                  Height = 21
                  DataField = 'CODIDENTVARA'
                  DataSource = dsProcessos
                  MaxLength = 4
                  TabOrder = 7
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                  OnExit = dbedMatricExit
                end
                object edtDataFim: TCMDateTimePicker
                  Left = 606
                  Top = 39
                  Width = 120
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
                object edtDataInicio: TCMDateTimePicker
                  Left = 476
                  Top = 39
                  Width = 120
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
                object dbrgrpAUTORACAO: TDBRadioGroup
                  Left = 10
                  Top = 159
                  Width = 187
                  Height = 43
                  Caption = 'Contribuinte é autor da ação'
                  Columns = 2
                  DataField = 'AUTORACAO'
                  DataSource = dsProcessos
                  Items.Strings = (
                    'Não'
                    'Sim')
                  TabOrder = 10
                  TabStop = True
                  Values.Strings = (
                    'N'
                    'S')
                  OnChange = dbrgrpAUTORACAOChange
                end
                object cbbTipoProc: TComboBox
                  Left = 10
                  Top = 39
                  Width = 260
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 13
                  TabOrder = 0
                  OnChange = cbbTipoProcChange
                  Items.Strings = (
                    'Administrativo'
                    'Judicial'
                    'Processo FAP de exercício anterior a 2019')
                end
                object edtUFSecaoJud: TEdit
                  Left = 276
                  Top = 82
                  Width = 135
                  Height = 21
                  Color = clBtnFace
                  Enabled = False
                  ReadOnly = True
                  TabOrder = 5
                end
                object edtCodMunicipio: TEdit
                  Left = 418
                  Top = 82
                  Width = 150
                  Height = 21
                  Color = clBtnFace
                  Enabled = False
                  ReadOnly = True
                  TabOrder = 6
                end
                object cbbCONTRIABRANDECISAO: TComboBox
                  Left = 10
                  Top = 129
                  Width = 345
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 13
                  TabOrder = 8
                  OnChange = cbbCONTRIABRANDECISAOChange
                  Items.Strings = (
                    'IRRF'
                    'Contribuições sociais do trabalhador')
                end
                object edtNumeroProc: TMaskEdit
                  Left = 278
                  Top = 39
                  Width = 191
                  Height = 21
                  TabOrder = 1
                end
                object cmbMatProc: TComboBox
                  Left = 362
                  Top = 129
                  Width = 364
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 13
                  TabOrder = 9
                  OnChange = cmbMatProcChange
                  Items.Strings = (
                    'Exclusivamente tributária ou tributária e FGTS'
                    
                      'Exclusivamente FGTS e/ou Contribuição Social Rescisória (Lei Com' +
                      'plementar 110/2001)')
                end
              end
            end
            object tbsIndicativoSusp: TTabSheet
              Caption = 'Indicativo de Suspensão'
              ImageIndex = 1
              object dbGrdProcessoIndSusp: TwwDBGrid
                Left = 0
                Top = 31
                Width = 1232
                Height = 298
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
                Width = 1232
                Height = 298
                Align = alClient
                TabOrder = 2
                object Label92: TLabel
                  Left = 9
                  Top = 15
                  Width = 234
                  Height = 13
                  Caption = 'Indicativo de Suspensão de Exigibilidade'
                end
                object Label93: TLabel
                  Left = 9
                  Top = 58
                  Width = 96
                  Height = 13
                  Caption = 'Data de Decisão'
                end
                object rdGrpIndDeposito: TRadioGroup
                  Left = 8
                  Top = 109
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
                  Left = 9
                  Top = 74
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
                  Left = 9
                  Top = 31
                  Width = 612
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'100'#9'Descrição'#9'F')
                  DataField = 'IDINDICATIVOSUSP'
                  DataSource = dsProcessosXIndicativoSusp
                  LookupTable = CdsIndicativoSusp
                  LookupField = 'IDINDICATIVOSUSP'
                  TabOrder = 0
                  AutoDropDown = False
                  ShowButton = True
                  AllowClearKey = False
                  OnChange = dbLkpCbxIndSuspChange
                end
                object DockDetIndSusp: TDock97
                  Left = 1141
                  Top = 1
                  Width = 90
                  Height = 296
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
                Width = 1232
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
      end
      inherited Dock973: TDock97
        Width = 1261
      end
      inherited Dock974: TDock97
        Left = 1175
        Height = 463
      end
    end
    inherited pnlMestre: TPanel
      Left = 2
      Top = 2
      Width = 1269
      Height = 53
      inherited lblNome: TLabel
        Left = 155
        Width = 33
        Caption = 'Nome'
      end
      inherited lblDocumento: TLabel
        Width = 24
        Caption = 'CPF'
      end
      inherited lblEMail: TLabel
        Left = 454
        Width = 104
        Caption = 'E-mail Corporativo'
      end
      inherited LblHomePage_Padrao: TLabel
        Left = 821
      end
      inherited lblMsg: TLabel
        Left = 1026
        Top = 28
      end
      object lblEmailPessoal: TLabel [7]
        Left = 633
        Top = 8
        Width = 83
        Height = 13
        Caption = 'E-mail Pessoal'
      end
      inherited dbedNomeFantasia: TDBEdit
        Left = 155
      end
      inherited dbedemail: TwwDBEdit
        Left = 454
        Width = 169
      end
      inherited DbeHomePage_Padrao: TwwDBEdit
        Left = 821
      end
      object dbedtEmailPessoal: TwwDBEdit
        Left = 633
        Top = 23
        Width = 178
        Height = 21
        DataField = 'EMAILFUNCEF'
        DataSource = dsPessoaFisica
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
  end
  inherited Dock972: TDock97
    Width = 1273
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
    Top = 626
    Width = 1273
    inherited tb97Fundo: TToolbar97
      Left = 640
      DockPos = 640
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 471
      DockPos = 471
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 725
    Top = 55
    TargetsData = (
      1
      1
      (
        ''
        'EditorCaption'
        0))
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 372
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 725
    Top = 43
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 512
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    AfterInsert = CdsAfterInsert
    Left = 344
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Funcionários'
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
      'PESSOA'
      'FUNCIONARIO'
      'CARGO'
      'SITFUNC')
    CamposChave.Strings = (
      'FUNCIONARIO.IDPESSOA'
      'FUNCIONARIO.MATRICULA')
    Filtro.Strings = (
      'CARGO.IDCARGO        = FUNCIONARIO.IDCARGO'
      'FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA'
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
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      '')
    Left = 633
    Top = 14
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 488
    Top = 65
  end
  inherited dsDet: TwwDataSource
    Left = 400
    Top = 1
  end
  inherited dsSubTipo: TwwDataSource
    OnStateChange = dsSubTipoStateChange
    Left = 448
    Top = 15
  end
  inherited dsPessoaFisica: TwwDataSource
    Left = 1139
    Top = 538
  end
  inherited ImlDocumentos: TImageList
    Left = 725
    Top = 29
  end
  inherited dsTelefone: TwwDataSource
    Left = 1296
    Top = 591
  end
  inherited dsEndereco: TwwDataSource
    Left = 1229
    Top = 591
  end
  inherited dsContato: TwwDataSource
    Left = 1315
    Top = 167
  end
  inherited dsTelContato: TwwDataSource
    Left = 593
    Top = 422
  end
  inherited dsDocumento: TwwDataSource
    Left = 1263
    Top = 210
  end
  inherited dsEscolhePessoa: TwwDataSource
    Left = 1208
    Top = 508
  end
  inherited dsImagem: TwwDataSource
    Left = 1253
    Top = 422
  end
  inherited dsImagensDoc: TwwDataSource
    Left = 1248
    Top = 303
  end
  inherited MSGrupo: TMontaSelect
    Left = 633
    Top = 1
  end
  inherited DsNaturalidade: TwwDataSource
    Left = 1353
    Top = 405
  end
  inherited CdsDocumento: TCMClientDataSet
    Left = 1263
    Top = 225
  end
  inherited CdsTipoDoc: TCMClientDataSet
    Left = 1161
    Top = 465
  end
  inherited CdsTelefone: TCMClientDataSet
    Left = 552
    Top = 370
    object CdsTelefoneFLGATIVO: TStringField
      DisplayLabel = 'Ativo'
      DisplayWidth = 10
      FieldName = 'FLGATIVO'
      OnGetText = CdsTelefoneFLGATIVOGetText
      FixedChar = True
      Size = 1
    end
  end
  inherited CdsContato: TCMClientDataSet
    Left = 643
    Top = 274
    object CdsContatoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 50
    end
    object CdsContatoCARGO: TStringField
      DisplayLabel = 'Cargo'
      FieldName = 'CARGO'
      Size = 30
    end
    object CdsContatoSETOR: TStringField
      DisplayLabel = 'Setor'
      FieldName = 'SETOR'
      Size = 30
    end
    object CdsContatoFLGATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'FLGATIVO'
      OnGetText = CdsContatoFLGATIVOGetText
      FixedChar = True
      Size = 1
    end
    object CdsContatoIDCONTATO: TFloatField
      FieldName = 'IDCONTATO'
    end
    object CdsContatoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object CdsContatoIDENDERECO: TFloatField
      FieldName = 'IDENDERECO'
    end
    object CdsContatoEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 40
    end
    object CdsContatoNASCIMENTO: TDateTimeField
      FieldName = 'NASCIMENTO'
    end
    object CdsContatoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 500
    end
  end
  inherited CdsTelContato: TCMClientDataSet
    Left = 841
    Top = 665
  end
  inherited CdsImagem: TCMClientDataSet
    Left = 1253
    Top = 409
  end
  inherited CdsEscolhePessoa: TCMClientDataSet
    Left = 1208
    Top = 495
  end
  inherited CdsImagensDoc: TCMClientDataSet
    Left = 1248
    Top = 291
  end
  inherited CdsSubTipo: TCMClientDataSet
    AfterScroll = CdsSubTipoAfterScroll
    Left = 448
    Top = 1
  end
  inherited CdsPessoaFisica: TCMClientDataSet
    AfterScroll = CdsPessoaFisicaAfterScroll
    Left = 1139
    Top = 524
  end
  inherited CdsCidade: TCMClientDataSet
    Left = 1209
    Top = 364
  end
  inherited CdsNaturalidade: TCMClientDataSet
    Left = 1353
    Top = 420
  end
  inherited CdsEstado: TCMClientDataSet
    Left = 1161
    Top = 351
  end
  inherited MsCidades: TMontaSelect
    Left = 573
    Top = 29
  end
  object opndArqBmp: TOpenPictureDialog [40]
    Filter = 
      'All (*.bmp;*.ico;*.emf;*.wmf)|*.bmp;*.ico;*.emf;*.wmf|Bitmaps (*' +
      '.bmp)|*.bmp|Icons (*.ico)|*.ico|Enhanced Metafiles (*.emf)|*.emf' +
      '|Metafiles (*.wmf)|*.wmf'
    Left = 725
    Top = 15
  end
  object dsUltEmpr: TwwDataSource [41]
    AutoEdit = False
    DataSet = CdsUltEmpr
    Left = 1316
    Top = 501
  end
  object dsDependentes: TwwDataSource [42]
    AutoEdit = False
    DataSet = CdsDependentes
    Left = 1360
    Top = 315
  end
  inherited DsContaBancaria: TwwDataSource
    Left = 1126
    Top = 408
  end
  inherited CdsContaBancaria: TCMClientDataSet
    Left = 1127
    Top = 362
  end
  inherited MsBanco: TMontaSelect
    Left = 573
    Top = 15
  end
  inherited CdsBanco: TCMClientDataSet
    Left = 1297
    Top = 370
  end
  object dsEstrangeiro: TwwDataSource [47]
    AutoEdit = False
    DataSet = CdsEstrangeiro
    Left = 505
    Top = 467
  end
  object msAgencia: TMontaSelect [48]
    Template.IdConsulta = 0
    Caption = 'Seleciona Agência'
    Colunas.Strings = (
      'BANCO.NUMBANCO'
      'AGENCIABANCARIA.NUMAGENCIA'
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nº do Banco'
      'Nº da Agência'
      'Nome da Agência')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'AGENCIABANCARIA'
      'BANCO')
    CamposChave.Strings = (
      'AGENCIABANCARIA.NUMAGENCIA'
      'AGENCIABANCARIA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '15'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
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
    Left = 573
    Top = 1
  end
  object CdsUltEmpr: TCMClientDataSet [49]
    Aggregates = <>
    Params = <>
    Left = 1288
    Top = 459
  end
  object CdsMotivo: TCMClientDataSet [50]
    Aggregates = <>
    Params = <>
    Left = 1234
    Top = 315
  end
  object CdsPaises: TCMClientDataSet [51]
    Aggregates = <>
    Params = <>
    Left = 1234
    Top = 302
  end
  object CdsCidadeNasc: TCMClientDataSet [52]
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 1234
    Top = 289
  end
  object CdsEstadoNasc: TCMClientDataSet [53]
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 1234
    Top = 239
  end
  object CdsCCusto: TCMClientDataSet [54]
    Aggregates = <>
    Params = <>
    Left = 1234
    Top = 226
  end
  object CdsSitFunc: TCMClientDataSet [55]
    Aggregates = <>
    Params = <>
    Left = 1234
    Top = 212
  end
  object CdsParamRH: TCMClientDataSet [56]
    Aggregates = <>
    Params = <>
    Left = 1234
    Top = 198
  end
  object CdsCargo: TCMClientDataSet [57]
    Aggregates = <>
    Params = <>
    Left = 1234
    Top = 185
  end
  object CdsChefe: TCMClientDataSet [58]
    Aggregates = <>
    Params = <>
    Left = 802
    Top = 684
  end
  object CdsSindicato: TCMClientDataSet [59]
    Aggregates = <>
    Params = <>
    Left = 858
    Top = 675
  end
  object CdsGrauInstr: TCMClientDataSet [60]
    Aggregates = <>
    Params = <>
    Left = 894
    Top = 657
  end
  object CdsProfissao: TCMClientDataSet [61]
    Aggregates = <>
    Params = <>
    Left = 1178
    Top = 708
  end
  object CdsFonteRecr: TCMClientDataSet [62]
    Aggregates = <>
    Params = <>
    Left = 1082
    Top = 695
  end
  object CdsEstab: TCMClientDataSet [63]
    Aggregates = <>
    Params = <>
    Left = 1146
    Top = 682
  end
  object CdsHorario: TCMClientDataSet [64]
    Aggregates = <>
    Params = <>
    Left = 982
    Top = 612
  end
  object CdsVincEmpr: TCMClientDataSet [65]
    Aggregates = <>
    Params = <>
    Left = 958
    Top = 602
  end
  object CdsMovContrCAGED: TCMClientDataSet [66]
    Aggregates = <>
    Params = <>
    Left = 522
    Top = 584
  end
  object CdsTipoTrab: TCMClientDataSet [67]
    Aggregates = <>
    Params = <>
    Left = 1082
    Top = 626
  end
  object CdsSitRisco: TCMClientDataSet [68]
    Aggregates = <>
    Params = <>
    Left = 1122
    Top = 482
  end
  object CdsCatEmpr: TCMClientDataSet [69]
    Aggregates = <>
    Params = <>
    Left = 610
    Top = 557
  end
  object CdsFaixaSal: TCMClientDataSet [70]
    Aggregates = <>
    Params = <>
    Left = 610
    Top = 547
  end
  object CdsEstrangeiro: TCMClientDataSet [71]
    Aggregates = <>
    Params = <>
    Left = 505
    Top = 421
  end
  object CdsDependentes: TCMClientDataSet [72]
    Aggregates = <>
    Params = <>
    Left = 1040
    Top = 406
    object CdsDependentesNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 55
      FieldName = 'NOME'
      Size = 55
    end
    object CdsDependentesDESCRICAO: TStringField
      DisplayLabel = 'Tipo de Dependência'
      FieldName = 'DESCRICAO'
    end
    object CdsDependentesDATANASC: TDateTimeField
      DisplayLabel = 'Data de Nascimento'
      FieldName = 'DATANASC'
    end
    object CdsDependentesFLGCONTAIMPOSTOR: TStringField
      DisplayLabel = 'Imposto de Renda'
      DisplayWidth = 15
      FieldName = 'FLGCONTAIMPOSTOR'
      FixedChar = True
    end
    object CdsDependentesFLGCONTASALARIOF: TStringField
      DisplayLabel = 'Salário Família'
      DisplayWidth = 15
      FieldName = 'FLGCONTASALARIOF'
      FixedChar = True
      Size = 18
    end
    object CdsDependentesDATACADASTRO: TDateTimeField
      DisplayLabel = 'Data Inclusão'
      DisplayWidth = 13
      FieldName = 'DATACADASTRO'
    end
    object CdsDependentesFIMIMPOSTOR: TDateTimeField
      DisplayLabel = 'Data Exclusão'
      DisplayWidth = 13
      FieldName = 'FIMIMPOSTOR'
    end
    object CdsDependentesSITDEPENDENTE: TStringField
      DisplayLabel = 'Situação'
      FieldName = 'SITDEPENDENTE'
    end
    object CdsDependentesATIVO: TStringField
      DisplayLabel = 'Ativo'
      DisplayWidth = 10
      FieldName = 'ATIVO'
      FixedChar = True
      Size = 10
    end
  end
  object CdsCargo2: TCMClientDataSet [73]
    Aggregates = <>
    Params = <>
    Left = 1190
    Top = 421
  end
  object dsCargo2: TwwDataSource [74]
    DataSet = CdsCargo2
    Left = 1192
    Top = 371
  end
  object dsCargo1: TwwDataSource [75]
    DataSet = CdsCargo
    Left = 1112
    Top = 379
  end
  object CdsTipoDocumento: TCMClientDataSet [76]
    Aggregates = <>
    Params = <>
    Left = 1184
    Top = 572
  end
  object dsTipoDocumento: TwwDataSource [77]
    DataSet = CdsTipoDocumento
    Left = 1183
    Top = 627
  end
  object dsPlanos: TwwDataSource [78]
    AutoEdit = False
    DataSet = cdsPlanos
    Left = 984
    Top = 627
  end
  object cdsPlanos: TCMClientDataSet [79]
    Aggregates = <>
    Params = <>
    Left = 1164
    Top = 506
  end
  object dsTipoBen: TwwDataSource [80]
    DataSet = CdsTipoBen
    Left = 1226
    Top = 325
  end
  object CdsTipoBen: TCMClientDataSet [81]
    Aggregates = <>
    Params = <>
    Left = 1224
    Top = 344
  end
  object CdsTipoBenSal: TCMClientDataSet [82]
    Aggregates = <>
    Params = <>
    Left = 1280
    Top = 332
  end
  object dsTipoBenSal: TwwDataSource [83]
    DataSet = CdsTipoBenSal
    Left = 1282
    Top = 321
  end
  object cdsTpLogradouro: TCMClientDataSet [84]
    Aggregates = <>
    Params = <>
    Left = 854
    Top = 685
  end
  object CdsEstagiario: TCMClientDataSet [85]
    Aggregates = <>
    Params = <>
    Left = 1018
    Top = 701
  end
  object dsEstagiario: TwwDataSource [86]
    AutoEdit = False
    DataSet = CdsEstagiario
    Left = 1164
    Top = 619
  end
  object CdsDadosCessao: TCMClientDataSet [87]
    Aggregates = <>
    Params = <>
    Left = 1258
    Top = 401
  end
  object dsDadosCessao: TwwDataSource [88]
    AutoEdit = False
    DataSet = CdsDadosCessao
    Left = 1260
    Top = 383
  end
  object msInsEnsino: TMontaSelect [89]
    Template.IdConsulta = 0
    Caption = 'Seleciona Instituição de Ensino'
    Colunas.Strings = (
      'P.NOME'
      'P.NUMDOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome'
      'CNPJ')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA P'
      'INSTITUICAOENSINO IE')
    CamposChave.Strings = (
      'IE.IDINSTITUICAOENSINO'
      'P.NOME')
    Filtro.Strings = (
      'P.IDPESSOA = IE.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '18')
    OperComparador.Strings = (
      '0'
      '0')
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
    Left = 858
    Top = 14
  end
  object msAgenteInt: TMontaSelect [90]
    Template.IdConsulta = 0
    Caption = 'Seleciona Agente de Integração'
    Colunas.Strings = (
      'P.NOME'
      'P.NUMDOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome'
      'CNPJ')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA P'
      'AGENTEINT AI')
    CamposChave.Strings = (
      'AI.IDAGENTEINT'
      'P.NOME')
    Filtro.Strings = (
      'P.IDPESSOA = AI.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '20'
      '18')
    OperComparador.Strings = (
      '-1'
      '-1')
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
    Left = 954
    Top = 38
  end
  object msSupervisor: TMontaSelect [91]
    Template.IdConsulta = 0
    Caption = 'Seleciona Supervisor do Estágio'
    Colunas.Strings = (
      'P.NOME'
      'P.NUMDOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome'
      'CPF')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA P'
      'PESSOAFISICA PF')
    CamposChave.Strings = (
      'P.IDPESSOA'
      'P.NOME'
      'P.NUMDOCUMENTO')
    Filtro.Strings = (
      'P.IDPESSOA = PF.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '18')
    OperComparador.Strings = (
      '0'
      '0')
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
    Left = 1059
    Top = 41
  end
  object CdsGrupoCateg: TCMClientDataSet [92]
    Aggregates = <>
    Params = <>
    Left = 638
    Top = 582
  end
  object CdsDescCateg: TCMClientDataSet [93]
    Aggregates = <>
    Params = <>
    Left = 1242
    Top = 242
  end
  object CdsGrauExpAgenNoc: TCMClientDataSet [94]
    Aggregates = <>
    Params = <>
    Left = 1250
    Top = 202
  end
  object dsGrupoCateg: TDataSource [95]
    Left = 636
    Top = 600
  end
  object dsDescCateg: TDataSource [96]
    Left = 1240
    Top = 260
  end
  object dsGrauExpAgenNoc: TDataSource [97]
    Left = 1248
    Top = 220
  end
  inherited ppmCaixa: TPopupMenu
    Left = 725
    Top = 1
  end
  inherited CdsEndereco: TCMClientDataSet
    Left = 676
    Top = 282
    inherited CdsEnderecoTIPOLOGRADOURO: TStringField
      Visible = True
    end
    inherited CdsEnderecoCODMUNICIPIO: TStringField
      Visible = True
    end
    inherited CdsEnderecoCODESTADO: TStringField
      Visible = True
    end
    object CdsEnderecoFLGATIVO: TStringField
      DisplayLabel = 'Ativo'
      DisplayWidth = 10
      FieldName = 'FLGATIVO'
      OnGetText = CdsEnderecoFLGATIVOGetText
      FixedChar = True
      Size = 1
    end
  end
  inherited CdsImagemOutro: TCMClientDataSet
    AfterScroll = CdsImagemOutroAfterScroll
    Left = 1239
    Top = 229
  end
  inherited dsImagemOutro: TwwDataSource
    Left = 1239
    Top = 251
  end
  inherited CdsPais: TCMClientDataSet
    Left = 497
    Top = 209
  end
  object msProcesso: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'P.NUMERO'
      'DECODE(P.TIPO, '#39'A'#39', '#39'ADMINISTRATIVO'#39', '#39'JUDICIAL'#39')')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Número do Processo'
      'Tipo do Processo')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PROCESSOS P')
    CamposChave.Strings = (
      'P.IDPROCESSO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '30'
      '10')
    OperComparador.Strings = (
      '1'
      '0')
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
    Left = 804
    Top = 19
  end
  object rpTermo: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 1144
    Top = 260
    Version = '7.04'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 127529
      mmPrintPosition = 0
      object pmgTermo: TppImage
        UserName = 'pmgTermo'
        AutoSize = True
        MaintainAspectRatio = False
        mmHeight = 13229
        mmLeft = 2117
        mmTop = 2910
        mmWidth = 13229
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
  end
  object dsEstCivil: TwwDataSource
    DataSet = CdsEstCivil
    Left = 1185
    Top = 221
  end
  object CdsEstCivil: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1183
    Top = 208
  end
  object cdsDiretoria: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1184
    Top = 302
  end
  object dsContratoTemp: TwwDataSource
    AutoEdit = False
    DataSet = cdsContratoTemp
    OnStateChange = dsSubTipoStateChange
    Left = 1260
    Top = 512
  end
  object cdsContratoTemp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1260
    Top = 497
  end
  object cdsContratoTempSubst: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1248
    Top = 305
  end
  object dsContratoTempSubst: TwwDataSource
    AutoEdit = False
    DataSet = cdsContratoTempSubst
    OnStateChange = dsSubTipoStateChange
    Left = 1248
    Top = 320
  end
  object cdsContratoTempObs: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1376
    Top = 549
  end
  object dsContratoTempObs: TwwDataSource
    AutoEdit = False
    DataSet = cdsContratoTempObs
    OnStateChange = dsSubTipoStateChange
    Left = 1376
    Top = 564
  end
  object CmeCTempSubst: TCmEventosCadastro
    Operacao = opVazio
    RepetirInsert = True
    OnInsert = CmeCTempSubstInsert
    OnEdit = CmeCTempSubstEdit
    OnConfirma = CmeCTempSubstConfirma
    OnAtualizaBotoes = CmeCTempSubstAtualizaBotoes
    DataSource = dsContratoTempSubst
    OpenDsAutomatico = False
    BeforeConfirma = CmeCTempSubstBeforeConfirma
    Left = 1247
    Top = 580
  end
  object CmeCTempObs: TCmEventosCadastro
    Operacao = opVazio
    RepetirInsert = True
    OnInsert = CmeCTempObsInsert
    OnEdit = CmeCTempObsEdit
    OnCancel = CmeCTempObsCancel
    OnConfirma = CmeCTempObsConfirma
    OnAtualizaBotoes = CmeCTempObsAtualizaBotoes
    OpenDsAutomatico = False
    Left = 1363
    Top = 616
  end
  object msCTempSub: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
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
      'PESSOA'
      'FUNCIONARIO'
      'CARGO'
      'SITFUNC')
    CamposChave.Strings = (
      'FUNCIONARIO.IDPESSOA'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NOME')
    Filtro.Strings = (
      'CARGO.IDCARGO        = FUNCIONARIO.IDCARGO'
      'FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA'
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
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
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
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      '')
    Left = 689
    Top = 65534
  end
  object CdsProcessos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterInsert = CdsProcessosAfterInsert
    BeforePost = CdsProcessosBeforePost
    Left = 1071
    Top = 216
  end
  object dsProcessos: TwwDataSource
    DataSet = CdsProcessos
    Left = 1073
    Top = 229
  end
  object CdsIndicativoSusp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1015
    Top = 288
  end
  object CdsCidadeMunicipio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 929
    Top = 316
  end
  object CdsVerificaProcContr: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1122
    Top = 22
  end
  object dsUltEmprGrid: TwwDataSource
    AutoEdit = False
    DataSet = CdsUltEmprGrid
    Left = 1226
    Top = 502
  end
  object CdsUltEmprGrid: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1162
    Top = 182
  end
  object CdsHistAlterBenef: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 978
    Top = 262
  end
  object dsHistAlter: TDataSource
    DataSet = CdsHistAlterBenef
    Left = 978
    Top = 318
  end
  object CdsAnoAlteraHist: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1026
    Top = 262
  end
  object dsAnoAlteraHist: TDataSource
    DataSet = CdsAnoAlteraHist
    Left = 1034
    Top = 318
  end
  object CdsGridHistAlterBenef: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 914
    Top = 262
  end
  object dsGridHistAlterBenef: TDataSource
    DataSet = CdsGridHistAlterBenef
    Left = 914
    Top = 318
  end
  object dsProcessosXIndicativoSusp: TDataSource
    DataSet = cdsProcessosXIndicativoSusp
    Left = 810
    Top = 303
  end
  object cdsProcessosXIndicativoSusp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 826
    Top = 251
  end
end
