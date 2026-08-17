inherited frmCadDependente: TfrmCadDependente
  Left = -4
  Top = -4
  Caption = 'Dependente'
  ClientHeight = 581
  WindowState = wsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 495
    BorderWidth = 2
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 4
      Top = 57
      Width = 796
      Height = 434
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos'
        'Titular'
        'Dados Pessoais')
      detdbGrids.Strings = (
        ''
        'dbGrdDet'
        'dbgTelefone'
        'dbgContato'
        'dbgTitular'
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 698
        Height = 375
        ActivePage = tbsDocumento
        inherited tbsDocumento: TTabSheet
          inherited PgCtrlPesFisica_Padrao: TPageControl
            Width = 690
            Height = 347
          end
          inherited PnlDocumentos_Padrao: TPanel
            Width = 690
            Height = 347
            inherited pnlItemsDoc: TPanel
              Height = 345
            end
            inherited pnlFoto: TPanel
              Width = 200
              Height = 345
              inherited Bevel1: TBevel
                Height = 314
              end
              inherited PnlAssociaFoto_Padrao: TPanel
                Top = 314
                Width = 200
                inherited btnAssociarimgPessoa: TButton
                  Left = 16
                end
              end
              inherited SbImagePessoa_Padrao: TScrollBox
                Width = 198
                Height = 314
                inherited imgPessoa: TDBImage
                  Left = 16
                end
              end
            end
            inherited lstDocumentos: TListView
              Height = 345
            end
          end
        end
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel
            Width = 690
            Height = 347
            inherited lblPdCEP: TLabel
              Width = 25
              Caption = 'CEP'
            end
            inherited dbedEstado: TwwDBEdit
              TabOrder = 8
            end
            inherited dbedPais: TwwDBEdit
              TabOrder = 9
            end
            inherited cmbCidade: TCMDBLookupCombo
              TabOrder = 6
            end
            inherited grpTipoEnd: TGroupBox
              Left = 493
              Height = 347
              TabOrder = 7
              TabStop = True
            end
            object bbtnAssocEndTit: TBitBtn
              Left = 15
              Top = 170
              Width = 210
              Height = 37
              Caption = '&Associar Endereço de Titular'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = False
              TabOrder = 10
              OnClick = bbtnAssocEndTitClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
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
          inherited dbgrdDet: TwwDBGrid
            Width = 690
            Height = 347
          end
        end
        inherited tbsTelefone: TTabSheet
          inherited dbgTelefone: TwwDBGrid
            Width = 690
            Height = 347
          end
          inherited Panel1: TPanel
            Width = 690
            Height = 347
            inherited GroupBox4: TGroupBox
              TabStop = True
            end
          end
        end
        inherited tbsContato: TTabSheet
          inherited Panel2: TPanel
            Width = 690
            Height = 347
          end
          inherited dbgContato: TwwDBGrid
            Width = 690
            Height = 347
          end
        end
        object tbsTitular: TTabSheet
          Caption = 'Titular'
          object dbgTitular: TwwDBGrid
            Left = 0
            Top = 0
            Width = 690
            Height = 347
            Selected.Strings = (
              'TITULAR'#9'34'#9'Titular'
              'TIPODEPENDENCIA'#9'10'#9'Dependência'
              'FLGCONTAIMPOSTOR'#9'16'#9'Conta para I.Renda ?'
              'FLGCONTASALARIOF'#9'18'#9'Conta para Sal.Família ?')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsDepenTit
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
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
          object pnlTitular: TPanel
            Left = 0
            Top = 0
            Width = 690
            Height = 347
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Bevel3: TBevel
              Left = 19
              Top = 103
              Width = 522
              Height = 56
            end
            object Bevel4: TBevel
              Left = 19
              Top = 180
              Width = 226
              Height = 62
            end
            object lblDependente: TLabel
              Left = 29
              Top = 112
              Width = 123
              Height = 13
              Caption = 'Tipo de Dependência'
            end
            object Label30: TLabel
              Left = 234
              Top = 112
              Width = 79
              Height = 13
              Caption = 'N° Sequência'
            end
            object dbtxtNumSequencia: TDBText
              Left = 235
              Top = 128
              Width = 82
              Height = 16
              Alignment = taCenter
              Color = clGray
              DataField = 'NUMSEQUENCIA'
              DataSource = dsDepenTit
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object bvNumSequencia: TBevel
              Left = 234
              Top = 127
              Width = 84
              Height = 19
            end
            object Label24: TLabel
              Left = 331
              Top = 112
              Width = 142
              Height = 13
              Caption = 'Situação do Dependente'
            end
            object GroupBoxTitular: TGroupBox
              Left = 19
              Top = 14
              Width = 523
              Height = 71
              Caption = 'Dados do Titular'
              TabOrder = 0
              object Label28: TLabel
                Left = 361
                Top = 19
                Width = 24
                Height = 13
                Caption = 'CPF'
              end
              object Label31: TLabel
                Left = 15
                Top = 19
                Width = 33
                Height = 13
                Caption = 'Nome'
              end
              object edNomeTitular: TEdit
                Left = 15
                Top = 34
                Width = 336
                Height = 21
                Color = clGray
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
              end
              object edCPFTitular: TEdit
                Left = 361
                Top = 34
                Width = 147
                Height = 21
                Color = clGray
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
              end
            end
            object bbtnProcurar: TBitBtn
              Left = 446
              Top = 178
              Width = 94
              Height = 37
              Hint = 'Procurar participante'
              Caption = '&Procurar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = bbtnProcurarClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
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
            object dbchkContaImpostoRenda: TDBCheckBox
              Left = 32
              Top = 190
              Width = 198
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Conta para Imposto de Renda'
              DataField = 'FLGCONTAIMPOSTOR'
              DataSource = dsDepenTit
              TabOrder = 2
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object dbchkContaSalarioFamilia: TDBCheckBox
              Left = 32
              Top = 216
              Width = 198
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Conta para Salário Família'
              DataField = 'FLGCONTASALARIOF'
              DataSource = dsDepenTit
              TabOrder = 3
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object dblkcmbDependente: TwwDBLookupCombo
              Left = 29
              Top = 127
              Width = 193
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'15'#9'DESCRICAO')
              DataField = 'IDDEPENDENCIA'
              DataSource = dsDepenTit
              LookupTable = qryDep
              LookupField = 'IDDEPENDENCIA'
              ParentFont = False
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dblkcmbSitDependente: TwwDBLookupCombo
              Left = 331
              Top = 127
              Width = 201
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'Situação do Dependente')
              DataField = 'IDSITDEPENDENTE'
              DataSource = dsSubTipo
              LookupTable = qrySitDep
              LookupField = 'IDSITDEPENDENTE'
              ParentFont = False
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
          end
        end
        object tbsPessFis: TTabSheet
          Caption = 'Dados Pessoais'
          object pnlPessFis: TPanel
            Left = 0
            Top = 0
            Width = 690
            Height = 347
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label3: TLabel
              Left = 22
              Top = 134
              Width = 82
              Height = 13
              Caption = 'Nacionalidade'
            end
            object Bevel2: TBevel
              Left = 264
              Top = 6
              Width = 297
              Height = 125
            end
            object Label17: TLabel
              Left = 283
              Top = 16
              Width = 116
              Height = 13
              Caption = 'Data de Nascimento'
            end
            object Label66: TLabel
              Left = 415
              Top = 16
              Width = 92
              Height = 13
              Caption = 'Tipo Sanguíneo'
            end
            object dbrgEstCivil: TDBRadioGroup
              Left = 22
              Top = 1
              Width = 235
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
            object dblcNacional: TwwDBLookupCombo
              Left = 22
              Top = 148
              Width = 355
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMENACIONALIDADE'#9'30'#9'Nacionalidade'#9'F'
                'NOMEPAIS'#9'30'#9'País'#9'F')
              DataField = 'IDPAIS'
              DataSource = dsPessoaFisica
              LookupTable = qryPaises
              LookupField = 'IDPAIS'
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
              OnChange = dblcNacionalChange
            end
            object gbxNaturalidade: TGroupBox
              Left = 22
              Top = 173
              Width = 355
              Height = 67
              Caption = 'Naturalidade'
              TabOrder = 2
              object Label4: TLabel
                Left = 8
                Top = 42
                Width = 40
                Height = 13
                Caption = 'Estado'
              end
              object Label65: TLabel
                Left = 8
                Top = 18
                Width = 40
                Height = 13
                Caption = 'Cidade'
              end
              object wwDBLookupCombo6: TwwDBLookupCombo
                Left = 52
                Top = 14
                Width = 293
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'50'#9'NOME'#9'F')
                DataField = 'IDCIDADES'
                DataSource = dsPessoaFisica
                LookupTable = qryCidadeNasc
                LookupField = 'IDCIDADES'
                Style = csDropDownList
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
                AllowClearKey = True
              end
              object dblcNatural: TwwDBLookupCombo
                Left = 52
                Top = 38
                Width = 293
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'CODESTADO'#9'3'#9'Sigla'
                  'NOMEESTADO'#9'30'#9'Estado')
                DataField = 'CODESTADO'
                DataSource = dsPessoaFisica
                LookupTable = qryEstadoNasc
                LookupField = 'CODESTADO'
                Options = [loColLines, loTitles]
                Style = csDropDownList
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
                AllowClearKey = True
              end
            end
            object gbxFiliacao: TGroupBox
              Left = 22
              Top = 244
              Width = 539
              Height = 67
              Caption = 'Filiação'
              TabOrder = 3
              object Label38: TLabel
                Left = 15
                Top = 18
                Width = 19
                Height = 13
                Caption = 'Pai'
              end
              object Label39: TLabel
                Left = 9
                Top = 42
                Width = 25
                Height = 13
                Caption = 'Mãe'
              end
              object wwDBEdit5: TwwDBEdit
                Left = 38
                Top = 14
                Width = 491
                Height = 21
                DataField = 'NOMEPAI'
                DataSource = dsPessoaFisica
                TabOrder = 0
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object wwDBEdit6: TwwDBEdit
                Left = 38
                Top = 38
                Width = 491
                Height = 21
                DataField = 'NOMEMAE'
                DataSource = dsPessoaFisica
                TabOrder = 1
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
            end
            object dbdtNasc: TCMDateTimePicker
              Left = 283
              Top = 30
              Width = 101
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 4
            end
            object dbcmbTipoSang: TwwDBComboBox
              Left = 415
              Top = 30
              Width = 126
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
            object dbrgrpSexo: TDBRadioGroup
              Left = 283
              Top = 59
              Width = 109
              Height = 57
              Caption = 'Sexo'
              DataField = 'SEXO'
              DataSource = dsPessoaFisica
              Items.Strings = (
                'Masculino'
                'Feminino')
              TabOrder = 6
              TabStop = True
              Values.Strings = (
                'M'
                'F')
            end
            object DBCheckBox1: TDBCheckBox
              Left = 429
              Top = 80
              Width = 112
              Height = 18
              Alignment = taLeftJustify
              Caption = 'Isento de IRRF'
              DataField = 'FLGISENTOIRRF'
              DataSource = dsPessoaFisica
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
          end
        end
      end
      inherited Dock973: TDock97
        Width = 788
      end
      inherited Dock974: TDock97
        Left = 702
        Height = 375
      end
    end
    inherited pnlMestre: TPanel
      Left = 4
      Top = 4
      Width = 796
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
  inherited Dock971: TDock97
    Top = 542
    inherited tb97Fundo: TToolbar97
      Left = 634
      DockPos = 638
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 467
      DockPos = 471
    end
  end
  inherited qry: TwwQuery
    Left = 399
    Top = 2
  end
  inherited dsDet: TwwDataSource
    Left = 602
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 764
  end
  inherited upd: TUpdateSQL
    Left = 428
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Dependentes'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO'
      'P2.NOME'
      'P2.NUMDOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome do Dependente'
      'CPF do Dependente'
      'Nome do Titular'
      'CPF do Titular')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'S'
      'S')
    Tabelas.Strings = (
      'PESSOA'
      'PESSOA P2'
      'DEPENDENTE'
      'DEPENTIT')
    CamposChave.Strings = (
      'DEPENDENTE.IDPESSOA')
    Filtro.Strings = (
      'DEPENDENTE.IDPESSOA = PESSOA.IDPESSOA'
      'DEPENDENTE.IDPESSOA = DEPENTIT.IDPESSOA'
      'DEPENTIT.IDTITULAR       = P2.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '15'
      '60'
      '15')
    Left = 523
  end
  inherited ds: TwwDataSource
    Left = 457
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 358
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 480
    Top = 84
  end
  inherited updSubTipo: TUpdateSQL
    ModifySQL.Strings = (
      'update DEPENDENTE'
      'set'
      '  IDSITDEPENDENTE = :IDSITDEPENDENTE'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into DEPENDENTE'
      '  (IDPESSOA, IDSITDEPENDENTE)'
      'values'
      '  (:IDPESSOA, :IDSITDEPENDENTE)')
    DeleteSQL.Strings = (
      'delete from DEPENDENTE'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 654
    Top = 193
  end
  inherited qrySubTipo: TwwQuery
    SQL.Strings = (
      'SELECT DEPENDENTE.IDPESSOA, DEPENDENTE.IDSITDEPENDENTE,'
      '              SITDEPENDENTE.DESCRICAO AS SITUACAODEPENDENTE'
      'FROM DEPENDENTE, SITDEPENDENTE'
      'WHERE DEPENDENTE.IDPESSOA = :IdPessoa AND'
      
        '               DEPENDENTE.IDSITDEPENDENTE = SITDEPENDENTE.IDSITD' +
        'EPENDENTE(+)')
    Left = 654
    Top = 179
  end
  inherited dsSubTipo: TwwDataSource
    Left = 654
    Top = 166
  end
  inherited dsPessoaFisica: TwwDataSource
    Left = 654
    Top = 265
  end
  inherited updPessoaFisica: TUpdateSQL
    Left = 654
    Top = 238
  end
  inherited qryPessoaFisica: TwwQuery
    AfterInsert = qryPessoaFisicaAfterInsert
    Left = 654
    Top = 251
  end
  inherited ImageList1: TImageList
    Left = 686
    Top = 15
    Bitmap = {
      494C010101000500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001001000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000186318631863186318631863
      1863186318631863186318630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000186300000000000000000000
      0000000000000000000018631863000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000018630000FF7FFF7FFF7F
      FF7FFF7FFF7F0000000000001863186300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF7F0000FF7F0000186300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F0000FF7F00000000186300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F00000000FF7F0000
      0000FF7FFF7FFF7F0000FF7F0000186300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F0000FF7F0000186300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000007C00000000FF7F00000000
      000000000000FF7F000000000000007C00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000007C0000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000007C00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000FF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7F000000000000
      FF7F00000000FF7FFF7F0000FF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000080070000000000000003000000000000
      0001000000000000801000000000000000000000000000000000000000000000
      8000000000000000800000000000000000000000000000000000000000000000
      00000000000000000000000000000000C001000000000000C001000000000000
      C007000000000000E3FF00000000000000000000000000000000000000000000
      000000000000}
  end
  inherited qryTelefone: TwwQuery
    Left = 666
    Top = 338
    Data = {
      56657220322E302C514245202D20496E74656772612056697375616C20446174
      6162617365204275696C6465722C302C2031302C20313630302C20313136342C
      2C2C2C2C0D0A202C202C202D2044697374696E637420262051756F74652C2C2C
      2C2C0D0A20202020322C202D204E756D626572206F66205461626C65732C2D31
      2C202D312C203830382C203630302C203830302C203238392C2C2C2C0D0A434D
      2E54454C454E44504553532C54454C454E44504553532C32302C2031302C2031
      33302C203133352C2C2C2C2C0D0A434D2E454E44504553532C454E4450455353
      2C3135302C2032302C203236302C203134352C2C2C2C2C0D0A20202020372C20
      2D204E756D626572206F6620436F6C756D6E732C2C2C2C2C2C0D0A494454454C
      45464F4E452C54454C454E44504553532C202020202020202020202020202020
      20202020312C20202020202C202C2C2C0D0A20202020202C202D204E756D6265
      72206F662043726974657269612C2C2C2C2C2C0D0A4944504553534F412C454E
      44504553532C20202020202020202020202020202020202020312C2020202020
      2C202C2C2C0D0A20202020312C202D204E756D626572206F6620437269746572
      69612C2C2C2C2C2C0D0A3D3A4964506573736F612C20202020362C2C2C2C2C2C
      0D0A4944454E44455245434F2C54454C454E44504553532C2020202020202020
      2020202020202020202020312C20202020202C202C2C2C0D0A20202020202C20
      2D204E756D626572206F662043726974657269612C2C2C2C2C2C0D0A4444492C
      54454C454E44504553532C20202020202020202020202020202020202020312C
      20202020202C202C2C2C0D0A20202020202C202D204E756D626572206F662043
      726974657269612C2C2C2C2C2C0D0A4444442C54454C454E44504553532C2020
      2020202020202020202020202020202020312C20202020202C202C2C2C0D0A20
      202020202C202D204E756D626572206F662043726974657269612C2C2C2C2C2C
      0D0A4E554D45524F2C54454C454E44504553532C202020202020202020202020
      20202020202020312C20202020202C202C2C2C0D0A20202020202C202D204E75
      6D626572206F662043726974657269612C2C2C2C2C2C0D0A5449504F2C54454C
      454E44504553532C20202020202020202020202020202020202020312C202020
      20202C202C2C2C0D0A20202020202C202D204E756D626572206F662043726974
      657269612C2C2C2C2C2C0D0A20202020312C202D204E756D626572206F66204A
      6F696E732C2C2C2C2C2C0D0A4944454E44455245434F2C54454C454E44504553
      532C4944454E44455245434F2C454E44504553532C202020202020202020202C
      202020202020202020202C2C0D0A0D0A2253454C4543542053746174656D656E
      74220D0A2C2C2C2C2C2C2C0D0A53454C4543540954454C454E44504553532E22
      494454454C45464F4E4522202C200D0A09454E44504553532E22494450455353
      4F4122202C200D0A0954454C454E44504553532E224944454E44455245434F22
      202C200D0A0954454C454E44504553532E2244444922202C2054454C454E4450
      4553532E2244444422202C200D0A0954454C454E44504553532E224E554D4552
      4F22202C200D0A0954454C454E44504553532E225449504F220D0A46524F4D09
      22434D222E2254454C454E4450455353222054454C454E4450455353202C2022
      434D222E22454E44504553532220454E44504553530D0A574845524509282054
      454C454E44504553532E4944454E44455245434F203D20454E44504553532E49
      44454E44455245434F20290D0A0909414E440D0A09280D0A092820454E445045
      53532E224944504553534F4122203D3A4964506573736F6120290D0A09292C2C
      2C2C2C2C2C0D0A}
  end
  inherited updTelefone: TUpdateSQL
    Left = 666
    Top = 324
  end
  inherited dsTelefone: TwwDataSource
    Left = 666
    Top = 312
  end
  inherited dsEndereco: TwwDataSource
    Left = 695
    Top = 484
  end
  inherited updEndereco: TUpdateSQL
    Left = 695
    Top = 470
  end
  inherited qryEndereco: TwwQuery
    Left = 695
    Top = 458
  end
  inherited qryContato: TwwQuery
    Left = 612
    Top = 496
    Data = {
      56657220322E302C514245202D20496E74656772612056697375616C20446174
      6162617365204275696C6465722C302C2031302C20313630302C20313136342C
      2C2C2C2C0D0A202C202C202D2044697374696E637420262051756F74652C2C2C
      2C2C0D0A20202020322C202D204E756D626572206F66205461626C65732C2D31
      2C202D312C203830382C203630302C203830302C203331302C2C2C2C0D0A434D
      2E434F4E5441544F504553532C434F4E5441544F504553532C32302C2032302C
      203133302C203134352C2C2C2C2C0D0A434D2E454E44504553532C454E445045
      53532C3135302C2032302C203236302C203134352C2C2C2C2C0D0A2020202037
      2C202D204E756D626572206F6620436F6C756D6E732C2C2C2C2C2C0D0A494443
      4F4E5441544F2C434F4E5441544F504553532C20202020202020202020202020
      202020202020312C20202020202C202C2C2C0D0A20202020202C202D204E756D
      626572206F662043726974657269612C2C2C2C2C2C0D0A4944504553534F412C
      454E44504553532C20202020202020202020202020202020202020312C202020
      20202C202C2C2C0D0A20202020312C202D204E756D626572206F662043726974
      657269612C2C2C2C2C2C0D0A3D3A4964506573736F612C20202020362C2C2C2C
      2C2C0D0A4944454E44455245434F2C434F4E5441544F504553532C2020202020
      2020202020202020202020202020312C20202020202C202C2C2C0D0A20202020
      202C202D204E756D626572206F662043726974657269612C2C2C2C2C2C0D0A4E
      4F4D452C434F4E5441544F504553532C20202020202020202020202020202020
      202020312C20202020202C202C2C2C0D0A20202020202C202D204E756D626572
      206F662043726974657269612C2C2C2C2C2C0D0A454D41494C2C434F4E544154
      4F504553532C20202020202020202020202020202020202020312C2020202020
      2C202C2C2C0D0A20202020202C202D204E756D626572206F6620437269746572
      69612C2C2C2C2C2C0D0A434152474F2C434F4E5441544F504553532C20202020
      202020202020202020202020202020312C20202020202C202C2C2C0D0A202020
      20202C202D204E756D626572206F662043726974657269612C2C2C2C2C2C0D0A
      5345544F522C434F4E5441544F504553532C2020202020202020202020202020
      2020202020312C20202020202C202C2C2C0D0A20202020202C202D204E756D62
      6572206F662043726974657269612C2C2C2C2C2C0D0A20202020312C202D204E
      756D626572206F66204A6F696E732C2C2C2C2C2C0D0A4944454E44455245434F
      2C434F4E5441544F504553532C4944454E44455245434F2C454E44504553532C
      202020202020202020202C202020202020202020202C2C0D0A0D0A2253454C45
      43542053746174656D656E74220D0A2C2C2C2C2C2C2C0D0A53454C4543540943
      4F4E5441544F504553532E224944434F4E5441544F22202C200D0A09454E4450
      4553532E224944504553534F4122202C200D0A09434F4E5441544F504553532E
      224944454E44455245434F22202C200D0A09434F4E5441544F504553532E224E
      4F4D4522202C200D0A09434F4E5441544F504553532E22454D41494C22202C20
      0D0A09434F4E5441544F504553532E22434152474F22202C200D0A09434F4E54
      41544F504553532E225345544F52220D0A46524F4D0922434D222E22434F4E54
      41544F504553532220434F4E5441544F50455353202C2022434D222E22454E44
      504553532220454E44504553530D0A5748455245092820434F4E5441544F5045
      53532E4944454E44455245434F203D20454E44504553532E4944454E44455245
      434F20290D0A0909414E440D0A09280D0A092820454E44504553532E22494450
      4553534F4122203D3A4964506573736F6120290D0A09292C2C2C2C2C2C2C0D0A}
  end
  inherited updContato: TUpdateSQL
    Left = 612
    Top = 484
  end
  inherited dsContato: TwwDataSource
    Left = 612
    Top = 472
  end
  inherited qryRamal: TwwQuery
    Left = 748
    Top = 452
    Data = {
      56657220322E302C514245202D20496E74656772612056697375616C20446174
      6162617365204275696C6465722C302C20302C20313630302C20313136342C2C
      2C2C2C0D0A202C202C202D2044697374696E637420262051756F74652C2C2C2C
      2C0D0A20202020342C202D204E756D626572206F66205461626C65732C2D312C
      202D312C203830382C203630302C203830302C203333312C2C2C2C0D0A434D2E
      434F4E5441544F504553532C434F4E5441544F504553532C3135322C2031372C
      203236322C203134322C2C2C2C2C0D0A434D2E454E44504553532C454E445045
      53532C3335312C2037362C203436312C203230312C2C2C2C2C0D0A434D2E5445
      4C434F4E5441544F2C54454C434F4E5441544F2C31312C2039382C203132332C
      203232332C2C2C2C2C0D0A434D2E54454C454E44504553532C54454C454E4450
      4553532C3134372C203135392C203235372C203238342C2C2C2C2C0D0A202020
      20362C202D204E756D626572206F6620436F6C756D6E732C2C2C2C2C2C0D0A49
      44434F4E5441544F2C54454C434F4E5441544F2C202020202020202020202020
      20202020202020312C20202020202C202C2C2C0D0A20202020202C202D204E75
      6D626572206F662043726974657269612C2C2C2C2C2C0D0A494454454C45464F
      4E452C54454C434F4E5441544F2C202020202020202020202020202020202020
      20312C20202020202C202C2C2C0D0A20202020202C202D204E756D626572206F
      662043726974657269612C2C2C2C2C2C0D0A52414D414C2C54454C434F4E5441
      544F2C20202020202020202020202020202020202020312C20202020202C202C
      2C2C0D0A20202020202C202D204E756D626572206F662043726974657269612C
      2C2C2C2C2C0D0A4E554D45524F2C54454C454E44504553532C20202020202020
      202020202020202020202020312C20202020202C202C2C2C0D0A20202020202C
      202D204E756D626572206F662043726974657269612C2C2C2C2C2C0D0A4E4F4D
      452C434F4E5441544F504553532C202020202020202020202020202020202020
      20312C20202020202C202C2C2C0D0A20202020202C202D204E756D626572206F
      662043726974657269612C2C2C2C2C2C0D0A4944504553534F412C454E445045
      53532C20202020202020202020202020202020202020202C20202020202C202C
      2C2C0D0A20202020312C202D204E756D626572206F662043726974657269612C
      2C2C2C2C2C0D0A3D3A4964506573736F612C20202020362C2C2C2C2C2C0D0A20
      202020342C202D204E756D626572206F66204A6F696E732C2C2C2C2C2C0D0A49
      44434F4E5441544F2C54454C434F4E5441544F2C4944434F4E5441544F2C434F
      4E5441544F504553532C202020202020202020202C202020202020202020202C
      2C0D0A494454454C45464F4E452C54454C434F4E5441544F2C494454454C4546
      4F4E452C54454C454E44504553532C202020202020202020202C202020202020
      202020202C2C0D0A4944454E44455245434F2C434F4E5441544F504553532C49
      44454E44455245434F2C454E44504553532C202020202020202020202C202020
      202020202020202C2C0D0A4944454E44455245434F2C54454C454E4450455353
      2C4944454E44455245434F2C454E44504553532C202020202020202020202C20
      2020202020202020202C2C0D0A0D0A2253454C4543542053746174656D656E74
      220D0A2C2C2C2C2C2C2C0D0A53454C4543540954454C434F4E5441544F2E2249
      44434F4E5441544F22202C200D0A0954454C434F4E5441544F2E22494454454C
      45464F4E4522202C200D0A0954454C434F4E5441544F2E2252414D414C22202C
      200D0A0954454C454E44504553532E224E554D45524F22202C200D0A09434F4E
      5441544F504553532E224E4F4D45220D0A46524F4D0922434D222E22434F4E54
      41544F504553532220434F4E5441544F50455353202C2022434D222E22454E44
      504553532220454E4450455353202C200D0A0922434D222E2254454C434F4E54
      41544F222054454C434F4E5441544F202C2022434D222E2254454C454E445045
      5353222054454C454E44504553530D0A574845524509282054454C434F4E5441
      544F2E4944434F4E5441544F203D20434F4E5441544F504553532E4944434F4E
      5441544F20290D0A0909414E440D0A09282054454C434F4E5441544F2E494454
      454C45464F4E45203D2054454C454E44504553532E494454454C45464F4E4520
      290D0A0909414E440D0A092820434F4E5441544F504553532E4944454E444552
      45434F203D20454E44504553532E4944454E44455245434F20290D0A0909414E
      440D0A09282054454C454E44504553532E4944454E44455245434F203D20454E
      44504553532E4944454E44455245434F20290D0A0909414E440D0A09280D0A09
      2820454E44504553532E222C2C2C2C2C2C2C0D0A4944504553534F4122203D3A
      4964506573736F6120290D0A09292C2C2C2C2C2C2C0D0A}
  end
  inherited updRamal: TUpdateSQL
    Left = 748
    Top = 440
  end
  inherited dsRamal: TwwDataSource
    Left = 748
    Top = 428
  end
  inherited qryDocumento: TwwQuery
    Left = 737
    Top = 382
  end
  inherited dsDocumento: TwwDataSource
    Left = 737
    Top = 369
  end
  inherited updDocumento: TUpdateSQL
    Left = 737
    Top = 356
  end
  inherited qryEscolhePessoa: TwwQuery
    Left = 676
    Top = 411
  end
  inherited dsEscolhePessoa: TwwDataSource
    Left = 676
    Top = 398
  end
  inherited Pessoa: TPessoa
    TipoPessoa = tpFisica
    SubTipo = stDependente
    ObrigaDocumento = False
    OnChangeSubtipo = PessoaChangeSubtipo
    OnSaveSubtipo = PessoaSaveSubtipo
    Left = 300
    Top = 8
  end
  inherited OpenPictureDialog1: TOpenPictureDialog
    Left = 686
    Top = 2
  end
  inherited qryImagem: TwwQuery
    Left = 746
    Top = 526
  end
  inherited updImagem: TUpdateSQL
    Left = 746
    Top = 513
  end
  inherited updImagensDoc: TUpdateSQL
    Left = 739
    Top = 293
  end
  inherited qryImagensDoc: TwwQuery
    Left = 739
    Top = 280
  end
  object qryDepenTit: TwwQuery [42]
    CachedUpdates = True
    AfterInsert = qryDepenTitAfterInsert
    BeforePost = qryDepenTitBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  DP.IDTITULAR, DP.IDPESSOA, DP.IDDEPENDENCIA,'
      '  DP.NUMSEQUENCIA, DP.FLGCONTAIMPOSTOR, DP.FLGCONTASALARIOF,'
      '  DP.FLGBENEFICIARIO, P.NOME AS TITULAR,'
      '  D.DESCRICAO AS TIPODEPENDENCIA'
      'FROM'
      '  PESSOA P, DEPENTIT DP, DEPEN D'
      'WHERE'
      '  (DP.IDPESSOA      = :IDPESSOA)  AND'
      '  (DP.IDTITULAR     = P.IDPESSOA) AND'
      '  (DP.IDDEPENDENCIA = D.IDDEPENDENCIA)')
    UpdateObject = updDepenTit
    ControlType.Strings = (
      'FLGBENEFICIARIO;CheckBox;1;0'
      'FLGCONTAIMPOSTOR;CheckBox;1;0'
      'FLGCONTASALARIOF;CheckBox;1;0')
    ValidateWithMask = True
    Left = 744
    Top = 215
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 10329
      end>
  end
  object updDepenTit: TUpdateSQL [43]
    ModifySQL.Strings = (
      'update "DEPENTIT"'
      'set'
      '  IDDEPENDENCIA = :IDDEPENDENCIA,'
      '  FLGCONTAIMPOSTOR = :FLGCONTAIMPOSTOR,'
      '  FLGCONTASALARIOF = :FLGCONTASALARIOF,'
      '  FLGBENEFICIARIO = :FLGBENEFICIARIO'
      'where'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into "DEPENTIT"'
      '  (IDTITULAR, IDPESSOA, IDDEPENDENCIA, NUMSEQUENCIA, '
      'FLGCONTAIMPOSTOR, '
      '   FLGCONTASALARIOF, FLGBENEFICIARIO)'
      'values'
      '  (:IDTITULAR, :IDPESSOA, :IDDEPENDENCIA, :NUMSEQUENCIA, '
      ':FLGCONTAIMPOSTOR, '
      '   :FLGCONTASALARIOF, :FLGBENEFICIARIO)')
    DeleteSQL.Strings = (
      'delete from "DEPENTIT"'
      'where'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 744
    Top = 201
  end
  object dsDepenTit: TwwDataSource [44]
    DataSet = qryDepenTit
    Left = 744
    Top = 189
  end
  object qryDep: TwwQuery [45]
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT'
      '  IDDEPENDENCIA, DESCRICAO'
      'FROM'
      '  DEPEN'
      'WHERE'
      '  (IDDEPENDENCIA <> '#39'PRP'#39')'
      'ORDER BY'
      '  DESCRICAO')
    ValidateWithMask = True
    Left = 273
    Top = 535
  end
  object qryResp: TwwQuery [46]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PF.NOME, PF.IDPESSOA'
      'FROM'
      '  PESSOA PF, FUNCIONARIO F'
      'WHERE'
      '  (F.IDEMPRESA = :IDEMPRESA) AND'
      '  (F.IDPESSOA  = PF.IDPESSOA)'
      'ORDER BY'
      '  UPPER(NOME)')
    ValidateWithMask = True
    Left = 189
    Top = 535
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
  end
  object qrySitDep: TwwQuery [47]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDSITDEPENDENTE, DESCRICAO '
      'FROM'
      '  SITDEPENDENTE'
      'ORDER BY'
      '  UPPER(DESCRICAO)')
    ValidateWithMask = True
    Left = 320
    Top = 536
  end
  object dsPaises: TwwDataSource [48]
    DataSet = qryPaises
    Left = 452
    Top = 535
  end
  inherited dsImagem: TwwDataSource
    Left = 746
    Top = 500
  end
  inherited dsImagensDoc: TwwDataSource
    Left = 739
    Top = 268
  end
  inherited qryTipoDoc: TwwQuery
    Left = 503
    Top = 524
  end
  inherited MSGrupo: TMontaSelect
    SensivelACaixa.Strings = (
      'N'
      'N')
    Left = 762
    Top = 56
  end
  object MontaSelectTitular: TMontaSelect [53]
    Template.IdConsulta = 0
    Caption = 'Seleciona Titular'
    Colunas.Strings = (
      'PESSOA.NOME'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'Matrícula'
      'CPF (ou equivalente)')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'FUNCIONARIO'
      'EMPRESAPROP')
    CamposChave.Strings = (
      'PESSOA.NOME'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'EMPRESAPROP.IDPESSOA'
      'FUNCIONARIO.IDPESSOA')
    Filtro.Strings = (
      'EMPRESAPROP.IDPESSOA = FUNCIONARIO.IDEMPRESA'
      'FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22'
      '22')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 680
    Top = 75
  end
  object qryAux: TwwQuery [54]
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ControlType.Strings = (
      'FLGBENEFICIARIO;CheckBox;1;0'
      'FLGCONTAIMPOSTOR;CheckBox;1;0'
      'FLGCONTASALARIOF;CheckBox;1;0')
    ValidateWithMask = True
    Left = 231
    Top = 535
  end
  object qryPaises: TwwQuery [55]
    Active = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDPAIS, ('#39'  '#39' || NOMENACIONALIDADE) AS NOMENACIONALIDADE'
      'FROM'
      '  PAIS')
    ValidateWithMask = True
    Left = 452
    Top = 522
  end
  object qryTitularAux: TwwQuery [56]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  F.IDPESSOA,'
      '  NVL(PF.NUMDEPIRRF,0) AS NUMDEPIRRF, DEPENDENTE.NUM_IRRF,'
      '  NVL(PF.NUMDEPSALF,0) AS NUMDEPSALF, DEPENDENTE.NUM_SAL_FAM'
      'FROM'
      '  PESSOAFISICA PF, FUNCIONARIO F,'
      '  (SELECT'
      
        '     DP.IDTITULAR, SUM(DP.FLGCONTAIMPOSTOR) NUM_IRRF, SUM(DP.FLG' +
        'CONTASALARIOF) NUM_SAL_FAM'
      '   FROM'
      '     DEPENTIT DP, DEPEN D'
      '   WHERE'
      '     (DP.IDTITULAR      = 10329) AND'
      '     (DP.IDDEPENDENCIA <> '#39'PRP'#39') AND'
      '     (DP.IDDEPENDENCIA  = D.IDDEPENDENCIA)'
      '   GROUP BY'
      '     DP.IDTITULAR) DEPENDENTE'
      'WHERE'
      '  (F.IDPESSOA = 10329)       AND'
      '  (F.IDPESSOA = PF.IDPESSOA) AND'
      '  (F.IDPESSOA = DEPENDENTE.IDTITULAR)')
    ValidateWithMask = True
    Left = 136
    Top = 534
  end
  inherited qryEstado: TwwQuery
    Left = 562
    Top = 529
    Data = {
      56657220322E302C514245202D20496E74656772612056697375616C20446174
      6162617365204275696C6465722C302C2031302C20313630302C20313136342C
      2C2C2C2C0D0A202C202C202D2044697374696E637420262051756F74652C2C2C
      2C2C0D0A20202020322C202D204E756D626572206F66205461626C65732C2D31
      2C202D312C203531382C203339352C203531302C203136392C2C2C2C0D0A4553
      5441444F2C45535441444F2C32302C2031302C203133372C203133352C2C2C2C
      2C0D0A504149532C504149532C3135372C2031302C203333312C203133352C2C
      2C2C2C0D0A20202020342C202D204E756D626572206F6620436F6C756D6E732C
      2C2C2C2C2C0D0A434F4445535441444F2C45535441444F2C2020202020202020
      2020202020202020202020312C20202020202C202C2C2C0D0A20202020202C20
      2D204E756D626572206F662043726974657269612C2C2C2C2C2C0D0A4E4F4D45
      45535441444F2C45535441444F2C202020202020202020202020202020202020
      36352C20202020202C202C2C312C0D0A20202020202C202D204E756D62657220
      6F662043726974657269612C2C2C2C2C2C0D0A4944504149532C504149532C20
      202020202020202020202020202020202020312C20202020202C202C2C2C0D0A
      20202020202C202D204E756D626572206F662043726974657269612C2C2C2C2C
      2C0D0A4E4F4D45504149532C504149532C202020202020202020202020202020
      20202020312C20202020202C202C2C2C0D0A20202020202C202D204E756D6265
      72206F662043726974657269612C2C2C2C2C2C0D0A20202020312C202D204E75
      6D626572206F66204A6F696E732C2C2C2C2C2C0D0A4944504149532C45535441
      444F2C4944504149532C504149532C202020202020202020202C202020202020
      202020202C2C0D0A0D0A2253454C4543542053746174656D656E74220D0A2C2C
      2C2C2C2C2C0D0A53454C4543540945535441444F2E22434F4445535441444F22
      202C200D0A0945535441444F2E224E4F4D4545535441444F22202C2050414953
      2E2249445041495322202C200D0A09504149532E224E4F4D4550414953220D0A
      46524F4D092245535441444F222045535441444F202C20225041495322205041
      49530D0A574845524509282045535441444F2E494450414953203D2050414953
      2E49445041495320290D0A4F524445522042590D0A0945535441444F2E224E4F
      4D4545535441444F222C2C2C2C2C2C2C0D0A}
  end
  inherited qryCidade: TwwQuery
    Left = 652
    Top = 531
  end
  object MontaSelectEndTit: TMontaSelect [59]
    Template.IdConsulta = 0
    Caption = 'Seleciona Endereço de Titular'
    Colunas.Strings = (
      'ENDPESS.LOGRADOURO'
      'ENDPESS.NUMERO'
      'ENDPESS.COMPLEMENTO'
      'ENDPESS.BAIRRO'
      'ENDPESS.CEP')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Logradouro'
      'Número'
      'Complemento'
      'Bairro'
      'CEP')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'ENDPESS')
    CamposChave.Strings = (
      'ENDPESS.NOME'
      'ENDPESS.LOGRADOURO'
      'ENDPESS.NUMERO'
      'ENDPESS.COMPLEMENTO'
      'ENDPESS.BAIRRO'
      'ENDPESS.CEP'
      'ENDPESS.IDCIDADES'
      'PESSOA.IDENDCOMERCIAL'
      'PESSOA.IDENDRESIDENCIAL'
      'PESSOA.IDENDENTREGA'
      'PESSOA.IDENDCOBRANCA'
      'PESSOA.IDENDCORRESP')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '50'
      '10'
      '40'
      '60'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = False
    Left = 568
    Top = 83
  end
  inherited dsCidade: TwwDataSource
    Left = 652
    Top = 518
  end
  inherited qryNaturalidade_Padrao: TwwQuery
    Left = 45
    Top = 533
  end
  inherited DsNaturalidade_Padrao: TwwDataSource
    Left = 45
    Top = 521
  end
  object qryCidadeNasc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  C.IDCIDADES, C.NOME'
      'FROM'
      '  CIDADES C, ESTADO E, PAIS P'
      'WHERE'
      '  (C.IDESTADO = E.IDESTADO) AND'
      '  (E.IDPAIS   = P.IDPAIS)'
      'ORDER BY'
      '  UPPER(C.NOME)')
    ValidateWithMask = True
    Left = 385
    Top = 531
  end
  object qryEstadoNasc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  ES.CODESTADO, ES.NOMEESTADO, P.IDPAIS, P.NOMEPAIS'
      'FROM'
      '  ESTADO ES, PAIS P'
      'WHERE'
      '  (P.IDPAIS = ES.IDPAIS)'
      'ORDER BY'
      '  UPPER(ES.NOMEESTADO)')
    ValidateWithMask = True
    Left = 385
    Top = 518
  end
end
