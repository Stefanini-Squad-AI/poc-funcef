inherited frmCadDependente: TfrmCadDependente
  Left = 99
  Top = 221
  HelpContext = 210009
  Caption = 'Cadastro de Dependentes '
  ClientHeight = 641
  ClientWidth = 1344
  WindowState = wsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 1344
    Height = 555
    BorderWidth = 2
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 2
      Top = 55
      Width = 1340
      Height = 498
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos'
        'Contas Bancárias'
        'Dados Pessoais'
        'Titular')
      TabIndex = 5
      detdbGrids.Strings = (
        ''
        'dbGrdDet'
        'dbgTelefone'
        'dbgContato'
        'GrdContaBancaria_Padrao'
        ''
        'dbgTitular')
      inherited pgctrlDetalhe: TPageControl
        Width = 1242
        Height = 439
        ActivePage = tbsPessFis
        inherited tbsDocumento: TTabSheet
          Caption = 'tbsDocumento'
          inherited PgCtrlPesFisica_Padrao: TPageControl
            Width = 1234
            Height = 411
          end
          inherited PnlDocumentos_Padrao: TPanel
            Width = 1234
            Height = 411
            inherited pnlItemsDoc: TPanel
              Height = 409
              inherited pnlOrgao: TPanel
                Top = 95
              end
              inherited pnlEmissao: TPanel
                Top = 187
              end
              inherited pnlUF: TPanel
                Top = 141
              end
              inherited PnlValidade: TPanel
                Top = 233
              end
              inherited pnlDataHabilitacao: TPanel
                Top = 325
              end
              inherited pnlCategoria: TPanel
                Top = 279
              end
              inherited pnlPais: TPanel
                Top = 371
              end
              object pnlTipoDocumento: TPanel
                Left = 0
                Top = 49
                Width = 172
                Height = 46
                Align = alTop
                Caption = 'pnlTipoDocumento'
                TabOrder = 9
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
              Width = 744
              Height = 409
              inherited BvlImagem: TBevel
                Height = 378
              end
              inherited PnlAssociaFoto_Padrao: TPanel
                Top = 378
                Width = 744
                inherited btnAssociarimgPessoa: TButton
                  Left = 16
                end
              end
              inherited SbImagePessoa_Padrao: TScrollBox
                Width = 742
                Height = 378
                inherited imgPessoa: TDBImage
                  Left = 16
                end
              end
            end
            inherited lstDocumentos: TListView
              Height = 409
            end
          end
        end
        inherited tbsDet: TTabSheet
          Caption = 'tbsDet'
          inherited dbgrdDet: TwwDBGrid
            Width = 1234
            Height = 411
          end
          inherited pnlControlesDet: TPanel
            Width = 1234
            Height = 411
            inherited lblPdCEP: TLabel
              Width = 25
              Caption = 'CEP'
            end
            inherited grpTipoEnd: TGroupBox
              Left = 1037
              Height = 411
              TabOrder = 10
              TabStop = True
            end
            inherited CmpCidades: TCMProcura
              OnApertouBotao = CmpCidadesApertouBotao
            end
            object bbtnAssocEndTit: TBitBtn
              Left = 15
              Top = 178
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
              TabOrder = 8
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
            object dbchkEnderecoFLGATIVO: TDBCheckBox
              Left = 240
              Top = 190
              Width = 97
              Height = 17
              Caption = 'Ativo'
              DataField = 'FLGATIVO'
              DataSource = dsEndereco
              TabOrder = 9
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
          end
        end
        inherited tbsTelefone: TTabSheet
          Caption = 'tbsTelefone'
          inherited SplContatos_Padrao: TSplitter
            Left = 1005
            Height = 411
          end
          inherited dbgTelefone: TwwDBGrid
            Width = 1005
            Height = 411
          end
          inherited Panel1: TPanel
            Width = 1005
            Height = 411
            inherited GroupBox4: TGroupBox
              TabStop = True
            end
            object dbchkTelFLGATIVO: TDBCheckBox
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
            Left = 1008
            Height = 411
            inherited GrdExibeContatos_Padrao: TwwDBGrid
              Height = 398
            end
          end
        end
        inherited tbsContato: TTabSheet
          Caption = 'tbsContato'
          inherited SplTelefones_Padrao: TSplitter
            Left = 1032
            Height = 411
          end
          inherited dbgContato: TwwDBGrid [1]
            Width = 1032
            Height = 411
            Selected.Strings = (
              'NOME'#9'25'#9'Nome'
              'CARGO'#9'10'#9'Cargo'#9'No'
              'SETOR'#9'10'#9'Setor'#9'No'
              'Telefone'#9'20'#9'Telefone'
              'flgAtivo'#9'10'#9'Ativo')
          end
          inherited Panel2: TPanel [2]
            Width = 1032
            Height = 411
            object dbchkConttFLGATIVO: TDBCheckBox
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
            Left = 1035
            Height = 411
            inherited GrdTelefones_Padrao: TwwDBGrid
              Height = 398
            end
          end
        end
        inherited tbsDadosBancarios: TTabSheet
          Caption = 'tbsDadosBancarios'
          inherited GrdContaBancaria_Padrao: TwwDBGrid
            Width = 1234
            Height = 411
          end
          inherited PnlDadosBancarios_Padrao: TPanel
            Width = 1234
            Height = 411
            inherited RgTipoConta: TDBRadioGroup
              TabStop = True
            end
          end
        end
        object tbsPessFis: TTabSheet
          Caption = 'tbsPessFis'
          object pnlPessFis: TPanel
            Left = 0
            Top = 0
            Width = 1234
            Height = 411
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object lblEstCivil: TLabel
              Left = 284
              Top = 16
              Width = 68
              Height = 13
              Caption = 'Estado Civil'
            end
            object Label66: TLabel
              Left = 138
              Top = 16
              Width = 92
              Height = 13
              Caption = 'Tipo Sanguíneo'
            end
            object Label17: TLabel
              Left = 9
              Top = 16
              Width = 98
              Height = 13
              Caption = 'Data Nascimento'
            end
            object gbxFiliacao: TGroupBox
              Left = 9
              Top = 364
              Width = 562
              Height = 67
              Caption = 'Filiação'
              TabOrder = 12
              TabStop = True
              object Label38: TLabel
                Left = 16
                Top = 18
                Width = 19
                Height = 13
                Caption = 'Pai'
              end
              object Label39: TLabel
                Left = 10
                Top = 42
                Width = 25
                Height = 13
                Caption = 'Mãe'
              end
              object wwDBEdit5: TwwDBEdit
                Left = 48
                Top = 14
                Width = 505
                Height = 21
                DataField = 'NOMEPAI'
                DataSource = dsPessoaFisica
                TabOrder = 0
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object wwDBEdit6: TwwDBEdit
                Left = 48
                Top = 38
                Width = 505
                Height = 21
                DataField = 'NOMEMAE'
                DataSource = dsPessoaFisica
                TabOrder = 1
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
            end
            object cmbEstCivil: TwwDBLookupCombo
              Left = 284
              Top = 30
              Width = 279
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
              AllowClearKey = True
              OnChange = cmbEstCivilChange
            end
            object dbrgUniaoEstavel: TDBRadioGroup
              Left = 284
              Top = 62
              Width = 279
              Height = 43
              Caption = 'Possui União Estável'
              Columns = 2
              DataField = 'UNIAOESTAVEL'
              DataSource = dsPessoaFisica
              Items.Strings = (
                'Sim'
                'Não')
              TabOrder = 4
              TabStop = True
              Values.Strings = (
                'S'
                'N')
            end
            object grpPlanoODonto: TGroupBox
              Left = 9
              Top = 62
              Width = 261
              Height = 83
              TabOrder = 3
              TabStop = True
              object lblDataInclusaoOdont: TLabel
                Left = 12
                Top = 36
                Width = 98
                Height = 13
                Caption = 'Data de Inclusão'
              end
              object lblDataExclusaoOdonto: TLabel
                Left = 139
                Top = 36
                Width = 101
                Height = 13
                Caption = 'Data de Exclusão'
              end
              object dbdtInclusaoOdont: TCMDateTimePicker
                Left = 12
                Top = 50
                Width = 105
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATA'
                DataSource = DsLogContrDepenIncOdont
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
                TabOrder = 1
              end
              object dbdtExclusaoOdont: TCMDateTimePicker
                Left = 139
                Top = 50
                Width = 101
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATA'
                DataSource = DsLogContrDepenExcOdont
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
                TabOrder = 2
              end
              object dbPlanoOdonto: TdxCheckEdit
                Left = 8
                Top = 11
                Width = 138
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                Alignment = taLeftJustify
                Caption = 'Plano Odontológico'
                StoredValues = 1
              end
            end
            object grpPlanoSaude: TGroupBox
              Left = 9
              Top = 150
              Width = 261
              Height = 82
              ParentShowHint = False
              ShowHint = True
              TabOrder = 6
              TabStop = True
              object lblDataInclusaoSaude: TLabel
                Left = 10
                Top = 32
                Width = 98
                Height = 13
                Caption = 'Data de Inclusão'
              end
              object lblDataExclusaoSaude: TLabel
                Left = 142
                Top = 32
                Width = 101
                Height = 13
                Caption = 'Data de Exclusão'
              end
              object dbdtInclusaoSaud: TCMDateTimePicker
                Left = 10
                Top = 48
                Width = 105
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATA'
                DataSource = DsLogContrDepenIncSaud
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
                PopupMenu = ppmCaixa
                ShowButton = True
                TabOrder = 1
              end
              object dbdtExclusaoSaud: TCMDateTimePicker
                Left = 142
                Top = 48
                Width = 101
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATA'
                DataSource = DsLogContrDepenExcSaud
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
                TabOrder = 2
              end
              object dbPlanoSaude: TdxCheckEdit
                Left = 6
                Top = 10
                Width = 116
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                Alignment = taLeftJustify
                Caption = 'Plano de Saúde'
                StoredValues = 1
              end
            end
            object dbcmbTipoSang: TwwDBComboBox
              Left = 138
              Top = 30
              Width = 132
              Height = 21
              ShowButton = True
              Style = csDropDownList
              MapList = False
              AllowClearKey = True
              AutoDropDown = True
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
              TabOrder = 1
              UnboundDataType = wwDefault
            end
            object DBCheckBox1: TDBCheckBox
              Left = 284
              Top = 185
              Width = 112
              Height = 18
              Caption = 'Isento de IRRF'
              DataField = 'FLGISENTOIRRF'
              DataSource = dsPessoaFisica
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
            object DBCheckBox2: TDBCheckBox
              Left = 284
              Top = 158
              Width = 117
              Height = 18
              Caption = 'Deficiente Físico'
              DataField = 'FLGDEFICIENTE'
              DataSource = dsPessoaFisica
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 7
              ValueChecked = '1'
              ValueUnchecked = '2'
            end
            object dbrgrpSexo: TDBRadioGroup
              Left = 284
              Top = 106
              Width = 279
              Height = 38
              Caption = 'Sexo'
              Columns = 2
              DataField = 'SEXO'
              DataSource = dsPessoaFisica
              Items.Strings = (
                'Masculino'
                'Feminino')
              TabOrder = 5
              TabStop = True
              Values.Strings = (
                'M'
                'F')
            end
            object dbdtNasc: TCMDateTimePicker
              Left = 9
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
              PopupMenu = ppmCaixa
              ShowButton = True
              TabOrder = 0
            end
            object Panel4: TPanel
              Left = 284
              Top = 243
              Width = 287
              Height = 117
              BevelInner = bvRaised
              BevelOuter = bvLowered
              TabOrder = 11
              TabStop = True
              object Label3: TLabel
                Left = 9
                Top = 5
                Width = 82
                Height = 13
                Caption = 'Nacionalidade'
              end
              object dblcNacional: TwwDBLookupCombo
                Left = 9
                Top = 20
                Width = 272
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
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                OnChange = dblcNacionalChange
              end
              object gbxNaturalidade: TGroupBox
                Left = 4
                Top = 46
                Width = 279
                Height = 67
                Caption = 'Naturalidade'
                TabOrder = 1
                TabStop = True
                object Label4: TLabel
                  Left = 3
                  Top = 42
                  Width = 40
                  Height = 13
                  Caption = 'Estado'
                end
                object Label65: TLabel
                  Left = 3
                  Top = 18
                  Width = 40
                  Height = 13
                  Caption = 'Cidade'
                end
                object wwDBLookupCombo6: TwwDBLookupCombo
                  Left = 46
                  Top = 14
                  Width = 227
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
                  AllowClearKey = True
                end
                object dblcNatural: TwwDBLookupCombo
                  Left = 46
                  Top = 38
                  Width = 227
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
                  TabOrder = 1
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                end
              end
            end
            object GroupBox1: TGroupBox
              Left = 9
              Top = 238
              Width = 261
              Height = 122
              TabOrder = 10
              TabStop = True
              object Label6: TLabel
                Left = 8
                Top = 32
                Width = 98
                Height = 13
                Caption = 'Data de Inclusão'
              end
              object Label7: TLabel
                Left = 142
                Top = 32
                Width = 101
                Height = 13
                Caption = 'Data de Exclusão'
              end
              object lblPercentual: TLabel
                Left = 8
                Top = 76
                Width = 62
                Height = 13
                Caption = 'Percentual'
              end
              object dbdtInclusaoAlimen: TCMDateTimePicker
                Left = 8
                Top = 48
                Width = 105
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATA'
                DataSource = DsLogContrDepenIncAlimen
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
                PopupMenu = ppmCaixa
                ShowButton = True
                TabOrder = 1
              end
              object dbdtExclusaoAlimen: TCMDateTimePicker
                Left = 142
                Top = 48
                Width = 101
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATA'
                DataSource = DsLogContrDepenExcAlimen
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
                TabOrder = 2
              end
              object dbPensaoAliment: TdxCheckEdit
                Left = 8
                Top = 10
                Width = 219
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                Alignment = taLeftJustify
                Caption = 'Pensão Alimentícia'
                StoredValues = 1
              end
              object dbPercAlimen: TRealEdit
                Left = 8
                Top = 91
                Width = 67
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0,00')
                TabOrder = 3
                WordWrap = False
                IntDigits = 3
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
              end
            end
            object dbFLGPLMEDICAMENTO: TdxCheckEdit
              Left = 281
              Top = 210
              Width = 138
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 9
              Alignment = taLeftJustify
              Caption = 'Plano Medicamento'
              StoredValues = 1
            end
          end
        end
        object tbsTitular: TTabSheet
          Caption = 'tbsTitular'
          object dbgTitular: TwwDBGrid
            Left = 0
            Top = 0
            Width = 1234
            Height = 411
            ControlType.Strings = (
              'FLGCONTAIMPOSTOR;CheckBox;1;0'
              'FLGCONTASALARIOF;CheckBox;1;0')
            Selected.Strings = (
              'TITULAR'#9'40'#9'Titular'
              'TIPODEPENDENCIA'#9'18'#9'Dependência'
              'TIPODEPENDENTELEGAL'#9'30'#9'Dependente Legal'
              'FLGCONTAIMPOSTOR'#9'8'#9'I.Renda?'#9'F'
              'FLGCONTASALARIOF'#9'11'#9'Sal.Família?'
              'FIMIMPOSTOR'#9'11'#9'Cessação IR'
              'DATACADASTRO'#9'11'#9'  Inclusão')
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
            Width = 1234
            Height = 411
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Bevel4: TBevel
              Left = 24
              Top = 179
              Width = 226
              Height = 55
            end
            object dbtxtNumSequencia: TDBText
              Left = 24
              Top = 111
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
            object Label2: TLabel
              Left = 261
              Top = 187
              Width = 98
              Height = 13
              Caption = 'Data de Inclusão'
            end
            object Label5: TLabel
              Left = 373
              Top = 187
              Width = 104
              Height = 13
              Caption = 'Data Cessação IR'
            end
            object lblDependente: TLabel
              Left = 117
              Top = 93
              Width = 123
              Height = 13
              Caption = 'Tipo de Dependência'
            end
            object Label30: TLabel
              Left = 24
              Top = 93
              Width = 79
              Height = 13
              Caption = 'N° Sequência'
            end
            object bvNumSequencia: TBevel
              Left = 24
              Top = 108
              Width = 84
              Height = 22
            end
            object Label24: TLabel
              Left = 433
              Top = 93
              Width = 142
              Height = 13
              Caption = 'Situação do Dependente'
            end
            object Label10: TLabel
              Left = 24
              Top = 136
              Width = 152
              Height = 13
              Caption = 'Tipo de Dependente Legal'
            end
            object GroupBoxTitular: TGroupBox
              Left = 8
              Top = 14
              Width = 625
              Height = 71
              Caption = 'Dados do Titular'
              TabOrder = 0
              object Label28: TLabel
                Left = 359
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
                Left = 16
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
                Left = 359
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
              object bbtnProcurar: TBitBtn
                Left = 515
                Top = 18
                Width = 94
                Height = 37
                Hint = 'Procurar Empregado'
                Caption = '&Procurar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
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
            end
            object dbchkContaImpostoRenda: TDBCheckBox
              Left = 36
              Top = 187
              Width = 198
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Conta para Imposto de Renda'
              DataField = 'FLGCONTAIMPOSTOR'
              DataSource = dsDepenTit
              TabOrder = 4
              ValueChecked = '1'
              ValueUnchecked = '0'
              OnClick = dbchkContaImpostoRendaClick
            end
            object dbchkContaSalarioFamilia: TDBCheckBox
              Left = 36
              Top = 209
              Width = 198
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Conta para Salário Família'
              DataField = 'FLGCONTASALARIOF'
              DataSource = dsDepenTit
              TabOrder = 5
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object dbdtInclusao: TCMDateTimePicker
              Left = 261
              Top = 201
              Width = 101
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATACADASTRO'
              DataSource = dsDepenTit
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
              TabOrder = 6
            end
            object dbdtFimIR: TCMDateTimePicker
              Left = 373
              Top = 201
              Width = 101
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'FIMIMPOSTOR'
              DataSource = dsDepenTit
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
              TabOrder = 7
            end
            object dblkcmbDependente: TwwDBLookupCombo
              Left = 117
              Top = 108
              Width = 308
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
              LookupTable = CdsTipoDepend
              LookupField = 'IDDEPENDENCIA'
              Style = csDropDownList
              ParentFont = False
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnChange = dblkcmbDependenteChange
              OnCloseUp = dblkcmbDependenteCloseUp
            end
            object dblkcmbSitDependente: TwwDBLookupCombo
              Left = 433
              Top = 108
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
              LookupTable = CdsSitDepend
              LookupField = 'IDSITDEPENDENTE'
              Style = csDropDownList
              ParentFont = False
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dblkpcmbTipoDepenLegal: TwwDBLookupCombo
              Left = 24
              Top = 156
              Width = 612
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'10'#9'Descrição')
              DataField = 'IDDEPENDENTELEGALESOCIAL'
              DataSource = dsDepenTit
              LookupTable = CdsTipoDepenLegal
              LookupField = 'IDDEPENDENTELEGALESOCIAL'
              Style = csDropDownList
              DropDownWidth = 600
              ParentFont = False
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 1332
      end
      inherited Dock974: TDock97
        Left = 1246
        Height = 439
      end
    end
    inherited pnlMestre: TPanel
      Left = 2
      Top = 2
      Width = 1340
      Height = 53
      inherited lblNome: TLabel
        Width = 33
        Caption = 'Nome'
      end
      inherited lblDocumento: TLabel
        Width = 24
        Caption = 'CPF'
      end
      inherited lblMsg: TLabel
        Top = 9
      end
      inherited dbedRazaoSocial: TDBEdit
        TabOrder = 5
      end
      object cbxDepenAtivo: TCheckBox
        Left = 783
        Top = 25
        Width = 74
        Height = 17
        Caption = 'Ativo'
        TabOrder = 4
      end
    end
  end
  inherited Dock972: TDock97
    Width = 1344
  end
  inherited Dock971: TDock97
    Top = 602
    Width = 1344
    inherited tb97Fundo: TToolbar97
      Left = 640
      DockPos = 640
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 210009
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 471
      DockPos = 471
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 529
    Top = 42
  end
  inherited ds: TwwDataSource
    Left = 372
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 529
    Top = 28
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 750
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    Left = 344
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Dependentes'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO'
      'P2.NOME'
      'P2.NUMDOCUMENTO'
      'FUNC.MATRICULA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome do Dependente'
      'CPF do Dependente'
      'Nome do Titular'
      'CPF do Titular'
      'Matrícula do Titular')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'S'
      'S'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'PESSOA P2'
      'DEPENDENTE'
      'DEPENTIT'
      'FUNCIONARIO FUNC')
    CamposChave.Strings = (
      'DEPENDENTE.IDPESSOA')
    Filtro.Strings = (
      'DEPENDENTE.IDPESSOA = PESSOA.IDPESSOA'
      'DEPENDENTE.IDPESSOA = DEPENTIT.IDPESSOA'
      'DEPENTIT.IDTITULAR       = P2.IDPESSOA'
      'P2.IDPESSOA = FUNC.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '15'
      '60'
      '15'
      '13')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '0')
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
    Left = 698
    Top = 50
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 814
    Top = 9
  end
  inherited dsDet: TwwDataSource
    Left = 408
    Top = 1
  end
  inherited dsSubTipo: TwwDataSource
    Left = 459
    Top = 14
  end
  inherited dsPessoaFisica: TwwDataSource
    Left = 614
    Top = 14
  end
  inherited ImlDocumentos: TImageList
    Left = 529
    Top = 15
  end
  inherited dsTelefone: TwwDataSource
    Left = 1123
    Top = 444
  end
  inherited dsEndereco: TwwDataSource
    Left = 1195
    Top = 440
  end
  inherited dsContato: TwwDataSource
    Left = 1381
    Top = 280
  end
  inherited dsTelContato: TwwDataSource
    Left = 1191
    Top = 546
  end
  inherited dsDocumento: TwwDataSource
    Left = 1051
    Top = 445
  end
  inherited dsEscolhePessoa: TwwDataSource
    Left = 1315
    Top = 296
  end
  inherited dsImagem: TwwDataSource
    Left = 1249
    Top = 519
  end
  inherited dsImagensDoc: TwwDataSource
    Left = 1383
    Top = 332
  end
  inherited MSGrupo: TMontaSelect
    Left = 666
    Top = 6
  end
  inherited DsNaturalidade: TwwDataSource
    Left = 1253
    Top = 321
  end
  inherited CdsDocumento: TCMClientDataSet
    Left = 1047
    Top = 436
  end
  inherited CdsTipoDoc: TCMClientDataSet
    Left = 746
    Top = 108
  end
  inherited CdsTelefone: TCMClientDataSet
    Left = 1119
    Top = 435
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
    Left = 585
    Top = 251
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
      DisplayWidth = 10
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
    Left = 1195
    Top = 533
  end
  inherited CdsImagem: TCMClientDataSet
    Left = 1253
    Top = 510
  end
  inherited CdsEscolhePessoa: TCMClientDataSet
    Left = 1215
    Top = 124
  end
  inherited CdsImagensDoc: TCMClientDataSet
    Left = 1383
    Top = 322
  end
  inherited CdsSubTipo: TCMClientDataSet
    Left = 459
    Top = 1
  end
  inherited CdsPessoaFisica: TCMClientDataSet
    AfterInsert = CdsPessoaFisicaAfterInsert
    Left = 590
    Top = 1
  end
  inherited CdsCidade: TCMClientDataSet
    Left = 738
    Top = 86
  end
  inherited CdsNaturalidade: TCMClientDataSet
    Left = 1261
    Top = 332
  end
  inherited CdsEstado: TCMClientDataSet
    Left = 746
    Top = 88
  end
  inherited MsCidades: TMontaSelect
    Left = 1024
    Top = 67
  end
  inherited DsContaBancaria: TwwDataSource
    Left = 1105
    Top = 544
  end
  inherited CdsContaBancaria: TCMClientDataSet
    Left = 1109
    Top = 535
  end
  inherited MsBanco: TMontaSelect
    Left = 674
    Top = 97
  end
  object dsDepenTit: TwwDataSource [42]
    DataSet = CdsDepenTit
    Left = 934
    Top = 438
  end
  object dsPaises: TwwDataSource [43]
    AutoEdit = False
    DataSet = CdsPaises
    Left = 872
    Top = 455
  end
  inherited CdsBanco: TCMClientDataSet
    Left = 730
    Top = 90
  end
  inherited ppmCaixa: TPopupMenu
    Left = 465
    Top = 73
  end
  inherited CdsEndereco: TCMClientDataSet
    Left = 1195
    Top = 431
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
    Left = 1167
    Top = 65
  end
  inherited dsImagemOutro: TwwDataSource
    Left = 1167
    Top = 111
  end
  object MontaSelectTitular: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
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
      'FUNCIONARIO')
    CamposChave.Strings = (
      'FUNCIONARIO.IDPESSOA'
      'PESSOA.NUMDOCUMENTO'
      'PESSOA.NOME'
      'FUNCIONARIO.MATRICULA')
    Filtro.Strings = (
      'FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22'
      '22')
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
    Left = 924
    Top = 58
  end
  object MontaSelectEndTit: TMontaSelect
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
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = False
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
    Left = 916
    Top = 137
  end
  object CdsTipoDepend: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsRespIndex'
        CaseInsFields = 'DESCRICAO'
        Fields = 'DESCRICAO'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsRespIndex'
    Params = <>
    StoreDefs = True
    Left = 810
    Top = 470
  end
  object CdsDepenTit: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDTITULAR'
        DataType = ftFloat
      end
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'IDDEPENDENCIA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NUMSEQUENCIA'
        DataType = ftFloat
      end
      item
        Name = 'FLGCONTAIMPOSTOR'
        DataType = ftFloat
      end
      item
        Name = 'FLGCONTASALARIOF'
        DataType = ftFloat
      end
      item
        Name = 'FLGBENEFICIARIO'
        DataType = ftFloat
      end
      item
        Name = 'TITULAR'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'TIPODEPENDENCIA'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'FLGPLSAUDE'
        DataType = ftInteger
      end
      item
        Name = 'FLGPLODONTO'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterInsert = CdsDepenTitAfterInsert
    BeforePost = CdsDepenTitBeforePost
    Left = 934
    Top = 420
  end
  object CdsSitDepend: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsSitDependIndex'
        CaseInsFields = 'DESCRICAO'
        Fields = 'DESCRICAO'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsSitDependIndex'
    Params = <>
    StoreDefs = True
    Left = 798
    Top = 452
  end
  object CdsPaises: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsPaisesIndex'
        CaseInsFields = 'NOMENACIONALIDADE'
        Fields = 'NOMENACIONALIDADE'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsPaisesIndex'
    Params = <>
    StoreDefs = True
    Left = 864
    Top = 445
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 982
    Top = 459
  end
  object CdsEstadoNasc: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsEstadoNascIndex'
        CaseInsFields = 'NOMEESTADO'
        Fields = 'NOMEESTADO'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsEstadoNascIndex'
    Params = <>
    StoreDefs = True
    Left = 802
    Top = 398
  end
  object CdsCidadeNasc: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsCidadeNascIndex'
        CaseInsFields = 'NOME'
        Fields = 'NOME'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsCidadeNascIndex'
    Params = <>
    StoreDefs = True
    Left = 790
    Top = 420
  end
  object CdsLogContrDepenIncSaud: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPESSOA'
        DataType = ftInteger
      end
      item
        Name = 'TIPO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CAMPO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DATA'
        DataType = ftDateTime
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 1111
    Top = 200
  end
  object DsLogContrDepenIncSaud: TwwDataSource
    DataSet = CdsLogContrDepenIncSaud
    Left = 1111
    Top = 244
  end
  object CdsLogContrDepenIncOdont: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPESSOA'
        DataType = ftInteger
      end
      item
        Name = 'TIPO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CAMPO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DATA'
        DataType = ftDateTime
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 951
    Top = 304
  end
  object DsLogContrDepenIncOdont: TwwDataSource
    DataSet = CdsLogContrDepenIncOdont
    Left = 951
    Top = 348
  end
  object CdsLogContrDepenExcSaud: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPESSOA'
        DataType = ftInteger
      end
      item
        Name = 'TIPO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CAMPO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DATA'
        DataType = ftDateTime
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 959
    Top = 240
  end
  object CdsLogContrDepenExcOdont: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPESSOA'
        DataType = ftInteger
      end
      item
        Name = 'TIPO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CAMPO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DATA'
        DataType = ftDateTime
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 1103
    Top = 376
  end
  object DsLogContrDepenExcSaud: TwwDataSource
    DataSet = CdsLogContrDepenExcSaud
    Left = 959
    Top = 212
  end
  object DsLogContrDepenExcOdont: TwwDataSource
    DataSet = CdsLogContrDepenExcOdont
    Left = 1103
    Top = 324
  end
  object CdsEstCivil: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1275
    Top = 420
  end
  object dsEstCivil: TwwDataSource
    DataSet = CdsEstCivil
    Left = 1277
    Top = 441
  end
  object DsLogContrDepenExcAlimen: TwwDataSource
    DataSet = CdsLogContrDepenExcAlimen
    Left = 791
    Top = 216
  end
  object CdsLogContrDepenExcAlimen: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPESSOA'
        DataType = ftInteger
      end
      item
        Name = 'TIPO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CAMPO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DATA'
        DataType = ftDateTime
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 791
    Top = 244
  end
  object DsLogContrDepenIncAlimen: TwwDataSource
    DataSet = CdsLogContrDepenIncAlimen
    Left = 791
    Top = 296
  end
  object CdsLogContrDepenIncAlimen: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPESSOA'
        DataType = ftInteger
      end
      item
        Name = 'TIPO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CAMPO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DATA'
        DataType = ftDateTime
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 791
    Top = 324
  end
  object CdsTipoDepenLegal: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsRespIndex'
        CaseInsFields = 'DESCRICAO'
        Fields = 'DESCRICAO'
        Options = [ixCaseInsensitive]
      end>
    Params = <>
    StoreDefs = True
    Left = 710
    Top = 390
  end
  object dsTipoDepenLegal: TwwDataSource
    DataSet = CdsTipoDepenLegal
    Left = 711
    Top = 432
  end
  object CdsLogContrDepenPercAlimen: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPESSOA'
        DataType = ftInteger
      end
      item
        Name = 'TIPO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CAMPO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DATA'
        DataType = ftDateTime
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 571
    Top = 456
  end
  object CdsTipoDocumento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 861
    Top = 358
  end
end
