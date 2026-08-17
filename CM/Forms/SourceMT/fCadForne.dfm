inherited frmCadForne: TfrmCadForne
  Left = 23
  Top = 44
  Width = 1382
  Height = 744
  BorderStyle = bsSizeable
  Caption = 'Cadastro de Fornecedor/Favorecido'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 1366
    Height = 619
    inherited pnlMestre: TPanel [0]
      Width = 1364
      Height = 112
      object lblTipoFornecedor: TLabel [7]
        Left = 783
        Top = 8
        Width = 112
        Height = 13
        Caption = 'Tipo de Fornecedor'
      end
      object cbkAvaliaFornecSN: TDBCheckBox
        Left = 937
        Top = 10
        Width = 265
        Height = 17
        Caption = 'Fornecedor não passível de avaliação'
        DataField = 'FLGAVALIAFORNEC'
        DataSource = ds
        TabOrder = 7
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbcTipoFornecedor: TDBComboBox
        Left = 784
        Top = 23
        Width = 145
        Height = 21
        DataField = 'TPFORNECEDOR'
        DataSource = DsEmpresaForne
        DropDownCount = 5
        ItemHeight = 13
        Items.Strings = (
          'Empregado'
          'Cedido'
          'Conselheiro'
          'Autônomo'
          'Outros')
        TabOrder = 6
        OnChange = dbcTipoFornecedorChange
      end
      object chkCPRB: TCheckBox
        Left = 937
        Top = 31
        Width = 336
        Height = 17
        Caption = 'Contribuinte Contrib. Prev. sobre Receita Bruta (CPRB)'
        TabOrder = 8
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe [1]
      Top = 113
      Width = 1364
      Height = 505
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos'
        'Contas Bancárias'
        'Dados do Fornecedor'
        'Tipos de Desembolso'
        'Impostos Agregados'
        'Ramo de Fornecedor'
        'Avaliação do Fornecedor')
      OnChanging = nil
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
        'grdAvaliacaoFornec'
        'dbGrdDadosProc')
      inherited pgctrlDetalhe: TPageControl
        Width = 1266
        Height = 446
        inherited tbsDocumento: TTabSheet
          inherited PgCtrlPesFisica_Padrao: TPageControl
            Width = 1258
            Height = 418
            inherited TbsDadosPessoais_Padrao: TTabSheet
              Caption = 'Dados Pessoais - eSocial'
              inherited BvlDadosNasc_Padrao: TBevel
                Left = 671
                Top = 192
                Visible = False
              end
              inherited BvlNatur_Padrao: TBevel
                Left = 672
                Top = 88
                Visible = False
              end
              inherited LblNomePai_Padrao: TLabel
                Left = 662
                Top = 103
                Width = 19
                Caption = 'Pai'
                Visible = False
              end
              inherited LblNomeMae_Padrao: TLabel
                Left = 662
                Top = 134
                Width = 25
                Caption = 'Mãe'
                Visible = False
              end
              inherited LblNaturalidade_Padrao: TLabel
                Left = 19
                Top = 125
              end
              inherited LblNacionalidade_Padrao: TLabel
                Left = 287
                Top = 125
              end
              inherited LblDataNasc_Padrao: TLabel
                Left = 287
                Top = 24
                Width = 98
                Caption = 'Data Nascimento'
              end
              inherited LblTipoSang_Padrao: TLabel
                Left = 1157
                Top = 72
                Width = 92
                Height = 13
                Visible = False
              end
              inherited LbVlrlINSS_Padrao: TLabel
                Left = 140
                Top = 444
              end
              inherited LblvlrPensao_Padrao: TLabel
                Left = 250
                Top = 445
              end
              object lblRaca: TLabel [10]
                Left = 287
                Top = 75
                Width = 64
                Height = 13
                Caption = 'Raça / Cor'
              end
              object lblCodCBO: TLabel [11]
                Left = 19
                Top = 168
                Width = 69
                Height = 13
                Caption = 'Código CBO'
              end
              object lblGrauInstr: TLabel [12]
                Left = 19
                Top = 75
                Width = 103
                Height = 13
                Caption = 'Grau de Instrução'
              end
              object lblCargo_padrao: TLabel [13]
                Left = 112
                Top = 168
                Width = 98
                Height = 13
                Caption = 'Cargo ou Função'
              end
              inherited CkbIsentoIrrf_Padrao: TDBCheckBox
                Left = 20
                Top = 463
                TabOrder = 14
              end
              inherited dbrgrpSexo_Padrao: TDBRadioGroup
                Left = 488
                Top = 85
                Width = 146
                Height = 80
                TabOrder = 4
                Visible = True
              end
              inherited dbrgrpEstCivil_Padrao: TDBRadioGroup
                Left = 903
                Top = 2
                Width = 347
                Height = 64
                Columns = 3
                TabOrder = 1
                Visible = False
              end
              inherited EdtNomePai_Padrao: TwwDBEdit
                Left = 690
                Top = 98
                Width = 427
                TabOrder = 9
                Visible = False
              end
              inherited EdtNomeMae_Padrao: TwwDBEdit
                Left = 690
                Top = 129
                Width = 427
                TabOrder = 10
                Visible = False
              end
              inherited CmbNaturalidade_Padrao: TwwDBLookupCombo
                Left = 19
                Top = 140
                Width = 250
                TabOrder = 8
              end
              inherited DbedNacionalidade_Padrao: TwwDBEdit
                Left = 287
                Top = 140
                Width = 189
                TabStop = False
                TabOrder = 18
              end
              inherited EdtTipoSang_Padrao: TwwDBEdit
                Left = 1157
                Top = 88
                Width = 56
                TabOrder = 7
                Visible = False
              end
              inherited GpNumDepend_Padrao: TGroupBox
                Left = 1105
                Top = 113
                Width = 145
                Height = 98
                TabOrder = 11
                TabStop = True
                Visible = False
              end
              inherited EdtDataNasc_Padrao: TCMDateTimePicker
                Left = 287
                Top = 40
                Width = 120
                TabOrder = 2
              end
              inherited EdtvlrPensao_Padrao: TDBRealEdit
                Left = 250
                Top = 460
                Width = 96
                TabOrder = 16
              end
              inherited EdtlrlINSS_Padrao: TDBRealEdit
                Left = 140
                Top = 460
                Width = 96
                TabOrder = 15
              end
              object dbmCodCBO: TwwDBEdit
                Left = 19
                Top = 184
                Width = 86
                Height = 21
                DataField = 'CBO'
                DataSource = DsEmpresaForne
                MaxLength = 15
                TabOrder = 6
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dblckGrauInstr: TwwDBLookupCombo
                Left = 19
                Top = 91
                Width = 250
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'80'#9'Descrição'#9'F')
                DataField = 'IDGRINSTR'
                DataSource = dsPessoaFisica
                LookupTable = CdsGrauInstrucao
                LookupField = 'IDGRINSTR'
                Style = csDropDownList
                DropDownWidth = 250
                TabOrder = 5
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
              end
              object grbCatTrab: TGroupBox
                Left = 15
                Top = 217
                Width = 619
                Height = 99
                Caption = 'Categoria de Trabalhadores'
                TabOrder = 12
                TabStop = True
                object lblgrupCat: TLabel
                  Left = 5
                  Top = 18
                  Width = 111
                  Height = 13
                  Caption = 'Grupo de Categoria'
                end
                object lblDescCat: TLabel
                  Left = 5
                  Top = 56
                  Width = 134
                  Height = 13
                  Caption = 'Descrição de Categoria'
                end
                object dblckgrupoCat: TwwDBLookupCombo
                  Left = 5
                  Top = 32
                  Width = 606
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'GRUPO'#9'80'#9'grupo'#9'F')
                  LookupTable = CdsGrupoCat
                  LookupField = 'GRUPO'
                  Style = csDropDownList
                  DropDownWidth = 145
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  OnChange = dblckgrupoCatChange
                end
                object dblckDescCat: TwwDBLookupCombo
                  Left = 5
                  Top = 70
                  Width = 606
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'80'#9'Descrição'#9'F')
                  DataField = 'IDCATEGTRABAESOCIAL'
                  DataSource = DsEmpresaForne
                  LookupTable = CdsDescCat
                  LookupField = 'IDCATEGTRABAESOCIAL'
                  Style = csDropDownList
                  DropDownWidth = 450
                  TabOrder = 1
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                end
              end
              object grbExpAgNocivo: TGroupBox
                Left = 15
                Top = 328
                Width = 619
                Height = 51
                Caption = 'Grau de Exposição a Agentes Nocivos'
                TabOrder = 13
                TabStop = True
                object dblckExpAgNocivo: TwwDBLookupCombo
                  Left = 5
                  Top = 24
                  Width = 606
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'80'#9'Descrição'#9'F')
                  DataField = 'IDGRAUEXPAGENTESOCIAL'
                  DataSource = DsEmpresaForne
                  LookupTable = CdsExpAgNocivo
                  LookupField = 'IDGRAUEXPAGENTESOCIAL'
                  Style = csDropDownList
                  DropDownWidth = 450
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                end
              end
              object cbbRaca: TwwDBComboBox
                Left = 287
                Top = 91
                Width = 191
                Height = 21
                ShowButton = True
                Style = csDropDownList
                MapList = True
                AllowClearKey = True
                AutoDropDown = True
                DataField = 'CORPESSOA'
                DataSource = dsPessoaFisica
                DropDownCount = 8
                ItemHeight = 0
                Items.Strings = (
                  'Branca'#9'2'
                  'Negra'#9'4'
                  'Amarela'#9'6'
                  'Parda'#9'8'
                  'Indígena'#9'0')
                Sorted = False
                TabOrder = 3
                UnboundDataType = wwDefault
              end
              object grpVinculo: TGroupBox
                Left = 13
                Top = 7
                Width = 261
                Height = 64
                Caption = 'Vínculo'
                TabOrder = 0
                TabStop = True
                object lblIniVinculo: TLabel
                  Left = 6
                  Top = 17
                  Width = 34
                  Height = 13
                  Caption = 'Início'
                end
                object lblFimVinculo: TLabel
                  Left = 136
                  Top = 17
                  Width = 20
                  Height = 13
                  Caption = 'Fim'
                end
                object EdtDtFimVinculo: TCMDateTimePicker
                  Left = 136
                  Top = 33
                  Width = 120
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATAFIMVINCULO'
                  DataSource = DsEmpresaForne
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
                object EdtDtIniVinculo: TCMDateTimePicker
                  Left = 6
                  Top = 33
                  Width = 120
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATAINIVINCULO'
                  DataSource = DsEmpresaForne
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
              end
              object dbedtCargoFuncao: TwwDBEdit
                Left = 112
                Top = 184
                Width = 155
                Height = 21
                DataField = 'CARGO_FUNCAO'
                DataSource = DsEmpresaForne
                MaxLength = 15
                TabOrder = 17
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
            end
          end
          inherited PnlDocumentos_Padrao: TPanel
            Width = 1258
            Height = 418
            inherited pnlItemsDoc: TPanel
              Height = 416
            end
            inherited pnlFoto: TPanel
              Width = 768
              Height = 416
              inherited BvlImagem: TBevel
                Height = 385
              end
              inherited PnlAssociaFoto_Padrao: TPanel
                Top = 385
                Width = 768
              end
              inherited SbImagePessoa_Padrao: TScrollBox
                Width = 766
                Height = 385
              end
            end
            inherited lstDocumentos: TListView
              Height = 416
            end
          end
        end
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Width = 1258
            Height = 418
            Selected.Strings = ()
          end
          inherited pnlControlesDet: TPanel
            Width = 1258
            Height = 418
            inherited lblPdLogradouro: TLabel
              Left = 141
            end
            inherited lblPdEstado: TLabel
              Left = 383
              Top = 135
            end
            inherited lblPdNumero: TLabel
              Left = 601
            end
            inherited lblPdCEP: TLabel
              Left = 567
              Width = 25
              Caption = 'CEP'
            end
            inherited lblBairro: TLabel
              Left = 339
            end
            inherited lblPdPais: TLabel
              Left = 601
              Top = 135
              Width = 27
              Caption = 'País'
            end
            object lblTpLograd: TLabel [9]
              Left = 14
              Top = 46
              Width = 112
              Height = 13
              Caption = 'Tipo de Logradouro'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblUF: TLabel [10]
              Left = 534
              Top = 135
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
            object lblCodMun: TLabel [11]
              Left = 233
              Top = 135
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
              Width = 657
            end
            inherited dbedLogradouro: TDBEdit
              Left = 141
              Width = 453
            end
            inherited DBEDCOMPLEMENTO: TwwDBEdit
              Width = 316
            end
            inherited dbedEstado: TwwDBEdit
              Left = 381
              Width = 145
            end
            inherited dbedBairro: TwwDBEdit
              Left = 338
              Width = 220
            end
            inherited DBNUMERO: TDBEdit
              Left = 601
            end
            inherited dbedCEP: TwwDBEdit
              Left = 567
              Width = 104
            end
            inherited dbedPais: TwwDBEdit
              Left = 601
              Width = 70
            end
            inherited grpTipoEnd: TGroupBox
              Left = 1061
              Height = 418
            end
            object dbmUF: TwwDBEdit
              Left = 534
              Top = 148
              Width = 60
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'CODESTADO'
              DataSource = dsEndereco
              ReadOnly = True
              TabOrder = 10
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbmCodMun: TwwDBEdit
              Left = 233
              Top = 148
              Width = 140
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'CODMUNICIPIO'
              DataSource = dsEndereco
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 11
              UnboundDataType = wwDefault
              UsePictureMask = False
              WantReturns = False
              WordWrap = False
            end
            object dblkpTpLogradouro: TwwDBLookupCombo
              Left = 16
              Top = 60
              Width = 121
              Height = 21
              DropDownAlignment = taLeftJustify
              DataField = 'IDTIPO_LOGRADOURO'
              DataSource = dsEndereco
              LookupTable = CdsTpLogradouro
              LookupField = 'IDTIPO_LOGRADOURO'
              TabOrder = 12
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
          end
        end
        inherited tbsTelefone: TTabSheet
          inherited SplContatos_Padrao: TSplitter
            Left = 1029
            Height = 418
          end
          inherited dbgTelefone: TwwDBGrid
            Width = 1029
            Height = 418
          end
          inherited Panel1: TPanel
            Width = 1029
            Height = 418
          end
          inherited PnlContatol_Padrao: TPanel
            Left = 1032
            Height = 418
            inherited GrdExibeContatos_Padrao: TwwDBGrid
              Height = 405
            end
          end
        end
        inherited tbsContato: TTabSheet
          inherited SplTelefones_Padrao: TSplitter
            Left = 1056
            Height = 418
          end
          inherited Panel2: TPanel
            Width = 1056
            Height = 418
          end
          inherited dbgContato: TwwDBGrid
            Width = 1056
            Height = 418
          end
          inherited PnlTelefones_Padrao: TPanel
            Left = 1059
            Height = 418
            inherited GrdTelefones_Padrao: TwwDBGrid
              Height = 405
            end
          end
        end
        inherited tbsDadosBancarios: TTabSheet
          inherited GrdContaBancaria_Padrao: TwwDBGrid
            Width = 1258
            Height = 418
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgWordWrap]
          end
          inherited PnlDadosBancarios_Padrao: TPanel
            Width = 1258
            Height = 418
          end
        end
        object TbsDadosCliente: TTabSheet
          Caption = 'Dados do Fornecedor'
          ImageIndex = 5
          object TbsGeral: TPageControl
            Left = 0
            Top = 0
            Width = 1258
            Height = 418
            ActivePage = TbsDados
            Align = alClient
            TabOrder = 0
            object TbsDados: TTabSheet
              Caption = 'Dados Gerais'
              object LblNatuRend_Padrao: TLabel
                Left = 8
                Top = 103
                Width = 141
                Height = 13
                Caption = 'Natureza de Rendimento'
              end
              object Label2: TLabel
                Left = 8
                Top = 155
                Width = 94
                Height = 13
                Caption = 'Nº Dependentes'
              end
              object LblCodCorresp_Padrao: TLabel
                Left = 8
                Top = 62
                Width = 133
                Height = 13
                Caption = 'Código Correspondente'
              end
              object wwDBSpinEdit1: TwwDBSpinEdit
                Left = 108
                Top = 151
                Width = 41
                Height = 21
                Increment = 1
                MaxValue = 99
                DataField = 'NUMDEPENDENTES'
                DataSource = dsSubTipo
                TabOrder = 0
                UnboundDataType = wwDefault
              end
              object wwDBEdit2: TwwDBEdit
                Left = 8
                Top = 77
                Width = 177
                Height = 21
                DataField = 'CODCORRESP'
                DataSource = dsSubTipo
                TabOrder = 1
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object DBRadioGroup2: TDBRadioGroup
                Left = 8
                Top = 8
                Width = 177
                Height = 45
                Caption = ' Status '
                Columns = 2
                DataField = 'FLGSTATUS'
                DataSource = DsEmpresaForne
                Items.Strings = (
                  'Ativo'
                  'Inativo')
                TabOrder = 2
                Values.Strings = (
                  'A'
                  'I')
              end
              object CmpNaturezaRendimento: TCMProcura
                Left = 6
                Top = 119
                Width = 177
                Height = 27
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                MostraMensagens = True
                Mensagens.EmBranco = 'Código da Natureza não pode estar em branco'
                Mensagens.NaoExiste = 'Código da Natureza não existe'
                PermiteChaveInvalida = False
                PermiteChaveEmBranco = True
                DataSource = dsSubTipo
                DataField = 'CODNATUREZA'
                LookupChave = 'CODNATUREZA'
                LookupDescricao = 'DESCRICAO'
                MontaSelect = MsNatuRendimento
                LookupTabela = 'NATURENDIMENTO'
                DataBaseName = 'BaseDados'
                ReadOnly = False
              end
            end
            object TbsContabil: TTabSheet
              Caption = 'Integração Contábil'
              object CContabil: TCMProcuraMaskContabil
                Left = 5
                Top = 1
                Width = 220
                Height = 51
                Caption = ' Conta do Fornecedor '
                TabOrder = 0
                MostraMensagens = True
                MostraDescricao = True
                DataSource = DsEmpresaForne
                DataField = 'CONTACFORN'
                Mensagens.EmBranco = 'Conta Contábil não pode estar em branco'
                Mensagens.NaoExiste = 'Conta Contábil não existe'
                Mensagens.Sintetica = 'Conta Contábil não pode ser sintética'
                Mensagens.Analitica = 'Conta Contábil não pode ser analítica'
                PermiteChaveInvalida = False
                PermiteChaveEmBranco = True
                AceitaTipoConta = SoAnalitica
                Plano = 0
                Status = scSoAtiva
              end
              object CContabilCredito: TCMProcuraMaskContabil
                Left = 236
                Top = 112
                Width = 233
                Height = 103
                Caption = ' Conta a Débito '
                TabOrder = 1
                MostraMensagens = True
                MostraDescricao = True
                DataSource = DsEmpresaForne
                DataField = 'CONTACDESPESA'
                Mensagens.EmBranco = 'Conta Contábil não pode estar em branco'
                Mensagens.NaoExiste = 'Conta Contábil não existe'
                Mensagens.Sintetica = 'Conta Contábil não pode ser sintética'
                Mensagens.Analitica = 'Conta Contábil não pode ser analítica'
                PermiteChaveInvalida = False
                PermiteChaveEmBranco = True
                AceitaTipoConta = SoAnalitica
                Plano = 0
                Status = scSoAtiva
              end
              object CContabilAdiantamento: TCMProcuraMaskContabil
                Left = 236
                Top = 2
                Width = 233
                Height = 102
                Caption = 'Conta de Adiantamento'
                TabOrder = 2
                MostraMensagens = True
                MostraDescricao = True
                DataSource = DsEmpresaForne
                DataField = 'CONTACADIANTAMENTO'
                Mensagens.EmBranco = 'Conta de Adiantamento não pode estar em branco'
                Mensagens.NaoExiste = 'Conta de Adiantamento não existe'
                Mensagens.Sintetica = 'Conta de Adiantamento não pode ser sintética'
                Mensagens.Analitica = 'Conta de Adiantamento não pode ser analítica'
                PermiteChaveInvalida = False
                PermiteChaveEmBranco = True
                AceitaTipoConta = SoAnalitica
                Plano = 0
                Status = scSoAtiva
              end
              object Panel5: TPanel
                Left = 6
                Top = 52
                Width = 222
                Height = 177
                BevelOuter = bvNone
                TabOrder = 3
                object Label23: TLabel
                  Left = 5
                  Top = 0
                  Width = 55
                  Height = 13
                  Caption = 'Subconta'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label4: TLabel
                  Left = 7
                  Top = 119
                  Width = 108
                  Height = 13
                  Caption = 'Atividade / Projeto'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object CmpSubConta: TCMProcura
                  Left = 5
                  Top = 15
                  Width = 209
                  Height = 27
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  MostraMensagens = True
                  Mensagens.EmBranco = 'Sub-Conta não pode estar em branco'
                  Mensagens.NaoExiste = 'Sub-Conta não existe'
                  PermiteChaveInvalida = False
                  PermiteChaveEmBranco = True
                  DataSource = DsEmpresaForne
                  DataField = 'CODSUBCONTA'
                  LookupChave = 'CODSUBCONTA'
                  LookupDescricao = 'NOMESUBCONTA'
                  MontaSelect = MsSubConta
                  LookupTabela = 'SUBCONTA'
                  DataBaseName = 'BaseDados'
                  ReadOnly = False
                end
                object CmpAtivProj: TCMProcura
                  Left = 5
                  Top = 135
                  Width = 210
                  Height = 27
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  MostraMensagens = True
                  Mensagens.EmBranco = 'Atividade / Projeto não pode estar em branco'
                  Mensagens.NaoExiste = 'Atividade / Projeto não existe'
                  PermiteChaveInvalida = False
                  PermiteChaveEmBranco = True
                  DataSource = DsEmpresaForne
                  DataField = 'UNIDNEGOC'
                  LookupChave = 'UNIDNEGOC'
                  LookupDescricao = 'NOME'
                  MontaSelect = MsAtividadeProjeto
                  LookupTabela = 'UNIDNEGOCIO'
                  DataBaseName = 'BaseDados'
                  ReadOnly = False
                end
                object CmpCentCusto: TCMProcuraMask
                  Left = 1
                  Top = 47
                  Width = 220
                  Height = 70
                  Caption = 'Centro de Custo '
                  Color = clBtnFace
                  ParentColor = False
                  TabOrder = 2
                  MostraMensagens = True
                  MostraDescricao = True
                  DataSource = DsEmpresaForne
                  DataField = 'CODCENTROCUSTO'
                  Mensagens.EmBranco = 'Centro de Custo não pode estar em branco'
                  Mensagens.NaoExiste = 'Centro de Custo não existe'
                  Mensagens.Sintetica = 'Centro de Custo não pode ser sintético'
                  Mensagens.Analitica = 'Centro de Custo não pode ser analítico'
                  PermiteChaveInvalida = False
                  PermiteChaveEmBranco = False
                  DadoExibido = 'CODEXTERNO'
                  LookupSql.Strings = (
                    'SELECT CODCENTROCUSTO, NOME, STATUSGRUPOCDC, CODEXTERNO '
                    'FROM CENTCUST '
                    'WHERE IDEMPRESA = 2'
                    
                      'AND IDPLANCENTCUST = (SELECT IDPLANCENTCUST FROM PARAMGLOBAL WHE' +
                      'RE IDPESSOA = 2)')
                  AceitaTipoConta = SoAnalitica
                  MontaSelect = MsCentroCusto
                  LookupQuery = CdsCentCusto
                  LookupSQLParams = SqlCentCusto
                  LookupParam = 'CODCENTROCUSTO'
                  LookupChave = 'CODCENTROCUSTO'
                  LookupTipo = 'STATUSGRUPOCDC'
                  LookupDescricao = 'NOME'
                  OnApertouBotao = CmpCentCustoApertouBotao
                end
              end
            end
          end
        end
        object TbsTipoDesemb: TTabSheet
          Caption = 'Tipos de Desembolso'
          ImageIndex = 6
          object BtnDelTipoDesemb: TSpeedButton
            Left = 356
            Top = 100
            Width = 25
            Height = 25
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88880666666666088888788888F88878F880E6666F6666
              608887F88887F88887F880E666FF6666608887888877F888878F0E666FFF6666
              66087F888777FFFFF87F0E66FFFFFFFF66087F8877777777F87F0E6FFFFFFFFF
              66087F8777777777F87F0E66FFFFFFFF66087F8877777777887F0E666FFF6666
              660878F88777F888887880E666FF6666608887F88877F88887F880E6666F6666
              6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
              8888888778FFFF77888888888000008888888888877777888888}
            NumGlyphs = 2
            OnClick = BtnDelTipoDesembClick
          end
          object BtnAddTipoDesemb: TSpeedButton
            Left = 356
            Top = 60
            Width = 25
            Height = 25
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88880666666666088888788888F88878F880E6666F6666
              608887F888878F8887F880E6666FF66660888788888778F8878F0E66666FFF66
              66087F88FFF7778F887F0E6FFFFFFFF666087F8777777778F87F0E6FFFFFFFFF
              66087F8777777777887F0E6FFFFFFFF666087F8777777778887F0E66666FFF66
              660878F888877788887880E6666FF666608887F88887788887F880E6666F6666
              6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
              8888888778FFFF77888888888000008888888888877777888888}
            NumGlyphs = 2
            OnClick = BtnAddTipoDesembClick
          end
          object PnlTipoDesembCli: TPanel
            Left = 386
            Top = 9
            Width = 343
            Height = 26
            BevelInner = bvLowered
            Caption = 'Tipos de Desembolso do Fornecedor'
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object GrdTipoDesembForn: TwwDBGrid
            Left = 386
            Top = 35
            Width = 343
            Height = 150
            Selected.Strings = (
              'CODTIPRECDES'#9'10'#9'Código'
              'ANASINT'#9'1'#9'T'
              'DESCRICAO'#9'35'#9'Descrição')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = DsTipoDesembForn
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
            OnCalcCellColors = GrdTipoDesembFornCalcCellColors
            IndicatorColor = icBlack
          end
          object PnlTipoDesemb: TPanel
            Left = 7
            Top = 9
            Width = 343
            Height = 26
            BevelInner = bvLowered
            Caption = 'Tipos de Desembolso'
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
          object GrdTipoDesemb: TwwDBGrid
            Left = 7
            Top = 35
            Width = 343
            Height = 150
            Selected.Strings = (
              'CODTIPRECDES'#9'10'#9'Código'
              'ANASINT'#9'1'#9'T'
              'DESCRICAO'#9'35'#9'Descrição')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = DsTipoDesemb
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 3
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnCalcCellColors = GrdTipoDesembCalcCellColors
            IndicatorColor = icBlack
          end
        end
        object TbsImpAgreg: TTabSheet
          Caption = 'Impostos Agregados'
          ImageIndex = 7
          object BtnAddImpAgreg: TSpeedButton
            Left = 356
            Top = 60
            Width = 25
            Height = 25
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88880666666666088888788888F88878F880E6666F6666
              608887F888878F8887F880E6666FF66660888788888778F8878F0E66666FFF66
              66087F88FFF7778F887F0E6FFFFFFFF666087F8777777778F87F0E6FFFFFFFFF
              66087F8777777777887F0E6FFFFFFFF666087F8777777778887F0E66666FFF66
              660878F888877788887880E6666FF666608887F88887788887F880E6666F6666
              6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
              8888888778FFFF77888888888000008888888888877777888888}
            NumGlyphs = 2
            OnClick = BtnAddImpAgregClick
          end
          object BtnDelImpAgreg: TSpeedButton
            Left = 356
            Top = 100
            Width = 25
            Height = 25
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88880666666666088888788888F88878F880E6666F6666
              608887F88887F88887F880E666FF6666608887888877F888878F0E666FFF6666
              66087F888777FFFFF87F0E66FFFFFFFF66087F8877777777F87F0E6FFFFFFFFF
              66087F8777777777F87F0E66FFFFFFFF66087F8877777777887F0E666FFF6666
              660878F88777F888887880E666FF6666608887F88877F88887F880E6666F6666
              6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
              8888888778FFFF77888888888000008888888888877777888888}
            NumGlyphs = 2
            OnClick = BtnDelImpAgregClick
          end
          object PnlImpAgregFor: TPanel
            Left = 386
            Top = 7
            Width = 343
            Height = 26
            BevelInner = bvLowered
            Caption = 'Impostos Agregados Ao Fornecedor'
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object GrdImpAgreg2: TwwDBGrid
            Left = 10
            Top = 36
            Width = 343
            Height = 150
            Selected.Strings = (
              'DESCCUSTAGREG'#9'25'#9'Nome'#9'No')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = DsImAgreg
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
          object PnlImpAgreg: TPanel
            Left = 8
            Top = 8
            Width = 343
            Height = 26
            BevelInner = bvLowered
            Caption = 'Impostos Agregados'
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
          object GrdImpAgregForn: TwwDBGrid
            Left = 386
            Top = 34
            Width = 343
            Height = 150
            Selected.Strings = (
              'DESCCUSTAGREG'#9'25'#9'Nome')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = DsImAgregForn
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 2
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
        object TbsRamodeFornecedor: TTabSheet
          Caption = 'Ramo de Fornecedor'
          ImageIndex = 8
          object spdFornxRamo: TSpeedButton
            Left = 356
            Top = 100
            Width = 25
            Height = 25
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88880666666666088888788888F88878F880E6666F6666
              608887F88887F88887F880E666FF6666608887888877F888878F0E666FFF6666
              66087F888777FFFFF87F0E66FFFFFFFF66087F8877777777F87F0E6FFFFFFFFF
              66087F8777777777F87F0E66FFFFFFFF66087F8877777777887F0E666FFF6666
              660878F88777F888887880E666FF6666608887F88877F88887F880E6666F6666
              6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
              8888888778FFFF77888888888000008888888888877777888888}
            NumGlyphs = 2
            OnClick = spdFornxRamoClick
          end
          object spdRamosForn: TSpeedButton
            Left = 356
            Top = 60
            Width = 25
            Height = 25
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88880666666666088888788888F88878F880E6666F6666
              608887F888878F8887F880E6666FF66660888788888778F8878F0E66666FFF66
              66087F88FFF7778F887F0E6FFFFFFFF666087F8777777778F87F0E6FFFFFFFFF
              66087F8777777777887F0E6FFFFFFFF666087F8777777778887F0E66666FFF66
              660878F888877788887880E6666FF666608887F88887788887F880E6666F6666
              6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
              8888888778FFFF77888888888000008888888888877777888888}
            NumGlyphs = 2
            OnClick = spdRamosFornClick
          end
          object dbRamos: TwwDBGrid
            Left = 8
            Top = 36
            Width = 343
            Height = 150
            Selected.Strings = (
              'DESCRAMOFORNECEDOR'#9'30'#9'Ramo de Fornecedores'#9'No')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = DsRamoForne
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 0
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object dbFornxRamo: TwwDBGrid
            Left = 386
            Top = 36
            Width = 343
            Height = 150
            Selected.Strings = (
              'DESCRAMOFORNECEDOR'#9'30'#9'Ramos do Fornecedor'#9'No')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = DsRamoXForne
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 1
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object PnlTitDesembAssoc: TPanel
            Left = 8
            Top = 9
            Width = 343
            Height = 26
            BevelInner = bvLowered
            Caption = 'Ramos de Fornecedores'
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
          object Panel6: TPanel
            Left = 386
            Top = 9
            Width = 343
            Height = 26
            BevelInner = bvLowered
            Caption = 'Ramos do Fornecedor'
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
          end
        end
        object TbsAvaliacaoFornec: TTabSheet
          Caption = 'Avaliação do Fornecedor'
          ImageIndex = 9
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 1258
            Height = 418
            Align = alClient
            TabOrder = 0
            object Panel7: TPanel
              Left = 1
              Top = 1
              Width = 1256
              Height = 416
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object Splitter2: TSplitter
                Left = 0
                Top = 281
                Width = 1256
                Height = 5
                Cursor = crVSplit
                Align = alBottom
              end
              object grdAvaliacaoFornec: TwwDBGrid
                Left = 0
                Top = 286
                Width = 1256
                Height = 130
                MemoAttributes = [mSizeable, mWordWrap, mGridShow]
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alBottom
                DataSource = dsAvaliacaoFornec
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
              object pnDescr: TPanel
                Left = 0
                Top = 68
                Width = 1256
                Height = 213
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 1
                object dbrExec: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 440
                  Height = 158
                  Align = alLeft
                  Caption = 'Descrição da execução do serviço'
                  TabOrder = 0
                  object Label5: TLabel
                    Left = 21
                    Top = 21
                    Width = 5
                    Height = 13
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object dmMemExecServico: TDBMemo
                    Left = 2
                    Top = 15
                    Width = 436
                    Height = 141
                    Align = alClient
                    DataField = 'DESCRICAOSERVICO'
                    DataSource = dsAvaliacaoFornec
                    Enabled = False
                    MaxLength = 500
                    ScrollBars = ssBoth
                    TabOrder = 0
                  end
                end
                object gbrQua: TGroupBox
                  Left = 440
                  Top = 0
                  Width = 440
                  Height = 158
                  Align = alLeft
                  Caption = 'Justificativa da qualidade técnica'
                  TabOrder = 1
                  object dbMemQualificacao: TDBMemo
                    Left = 2
                    Top = 15
                    Width = 436
                    Height = 141
                    Align = alClient
                    DataField = 'MOTIVOQUALIFICACAO'
                    DataSource = dsAvaliacaoFornec
                    Enabled = False
                    MaxLength = 500
                    ScrollBars = ssBoth
                    TabOrder = 0
                  end
                end
              end
              object pnDados: TPanel
                Left = 0
                Top = 0
                Width = 1256
                Height = 68
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 2
                object Label6: TLabel
                  Left = 4
                  Top = 14
                  Width = 106
                  Height = 13
                  Caption = 'Data da Avaliação'
                end
                object Label7: TLabel
                  Left = 133
                  Top = 14
                  Width = 106
                  Height = 13
                  Caption = 'Data da Execução'
                end
                object lblNat: TLabel
                  Left = 416
                  Top = 6
                  Width = 117
                  Height = 13
                  Caption = 'Natureza do Serviço'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object edDtAval: TCMDateTimePicker
                  Left = 3
                  Top = 28
                  Width = 122
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DTAVALIACAO'
                  DataSource = dsAvaliacaoFornec
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
                  TabOrder = 0
                end
                object edDtExec: TCMDateTimePicker
                  Left = 133
                  Top = 28
                  Width = 122
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DTEXECUCAO'
                  DataSource = dsAvaliacaoFornec
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
                  TabOrder = 1
                end
                object rdQualidTecnica: TDBRadioGroup
                  Left = 275
                  Top = 7
                  Width = 124
                  Height = 60
                  Caption = 'Qualidade Tecnica'
                  DataField = 'QUALIDADETECNICA'
                  DataSource = dsAvaliacaoFornec
                  Enabled = False
                  Items.Strings = (
                    'Satisfatória'
                    'Insatisfatória')
                  TabOrder = 2
                  Values.Strings = (
                    'P'
                    'N')
                  OnClick = rdQualidTecnicaClick
                end
                object lcbNaturezaContr: TwwDBLookupCombo
                  Left = 416
                  Top = 20
                  Width = 281
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'80'#9'Descrição'#9'F')
                  DataField = 'IDNATUREZA'
                  DataSource = dsAvaliacaoFornec
                  LookupTable = qryNatureaContr
                  LookupField = 'IDNATUREZA'
                  Style = csDropDownList
                  Enabled = False
                  TabOrder = 3
                  AutoDropDown = True
                  ShowButton = True
                  OrderByDisplay = False
                  AllowClearKey = True
                  ShowMatchText = True
                end
                object btnPesq: TBitBtn
                  Left = 726
                  Top = 21
                  Width = 110
                  Height = 27
                  Caption = 'Procurar'
                  Default = True
                  TabOrder = 4
                  OnClick = btnPesqClick
                  Glyph.Data = {
                    36040000424D3604000000000000360000002800000010000000100000000100
                    2000000000000004000000000000000000000000000000000000FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008484
                    840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FFFF
                    FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF000000000000000000FFFFFF00FFFFFF00FFFF
                    FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00
                    0000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF0000008400FF00
                    FF00FF00FF0084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFF
                    FF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00000084000000
                    8400FF00FF00FF00FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FF000000FFFFFF0000000000FF00FF00FF00FF00FF00FF00000084000000
                    840000008400FF00FF0084848400FFFFFF00FFFFFF00FF000000FF000000FF00
                    0000FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF000000
                    8400000084000000840000000000000000000000000000000000FFFFFF00FFFF
                    FF00FFFFFF00FF000000FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
                    FF000000840000000000FFFF0000FF00FF00FFFF0000FF00FF00000000008484
                    0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00
                    FF0000000000FFFF0000FF00FF00FFFF0000FF00FF00FFFF0000FF00FF000000
                    0000FFFFFF00FFFFFF00FFFFFF008484840084848400FF00FF00FF00FF00FF00
                    FF0000000000FF00FF00FFFF0000FF00FF00FFFF0000FF00FF00FFFF00000000
                    0000FFFFFF008484840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF0000000000FFFF0000FF00FF00FFFF0000FF00FF00FFFF0000FF00FF000000
                    000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF0000000000FF00FF00FFFF0000FF00FF00FFFF0000FF00FF00FFFF00000000
                    0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF0000000000FF00FF00FFFF0000FF00FF00FFFF000000000000FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF0000000000000000000000000000000000FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
                end
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 1356
      end
      inherited Dock974: TDock97
        Left = 1270
        Height = 446
      end
    end
  end
  inherited Dock972: TDock97
    Width = 1366
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Left = 285
      end
      inherited sbtnFisJur: TToolbarButton97
        Left = 180
        Width = 105
      end
      inherited ToolbarSep972: TToolbarSep97
        Left = 345
      end
    end
    object btnTrazFornec: TButton
      Left = 812
      Top = 4
      Width = 145
      Height = 25
      Caption = '[Traz Fornec]'
      TabOrder = 1
      Visible = False
      OnClick = btnTrazFornecClick
    end
  end
  inherited Dock971: TDock97
    Top = 666
    Width = 1366
    inherited tb97Fundo: TToolbar97
      Left = 624
      DockPos = 624
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 455
      DockPos = 455
    end
    object Toolbar972: TToolbar97
      Left = 893
      Top = 0
      Caption = 'TB97oKCancelar'
      DockPos = 893
      TabOrder = 2
      object btnImprimir: TBitBtn
        Left = 0
        Top = 0
        Width = 81
        Height = 33
        Caption = 'Imprimir'
        Default = True
        TabOrder = 0
        OnClick = btnImprimirClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
      end
    end
  end
  inherited ds: TwwDataSource
    Left = 740
    Top = 517
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 333
    Top = 65
  end
  inherited Cds: TCMClientDataSet
    Left = 708
    Top = 471
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Cliente'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.RAZAOSOCIAL'
      'PESSOA.NUMDOCUMENTO'
      'FORNSERV.CODCORRESP'
      'PESSOA.IDPESSOA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Nome'
      'Razão Social'
      'Número do Documento'
      'Código Correspondente'
      'Identificador')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'FORNSERV'
      'EMPRESAFORN')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA=FORNSERV.IDPESSOA'
      'PESSOA.IDPESSOA=EMPRESAFORN.IDFORCLI')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '60'
      '18'
      '30'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
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
  end
  inherited CmeDetalhe: TCmEventosCadastro
    ApplyInsert = CmeDetalheApplyInsert
    ApplyEdit = CmeDetalheApplyEdit
    Left = 388
    Top = 15
  end
  inherited dsDet: TwwDataSource
    Left = 410
    Top = 73
  end
  inherited dsSubTipo: TwwDataSource
    Left = 1246
    Top = 773
  end
  inherited dsPessoaFisica: TwwDataSource
    Left = 993
    Top = 549
  end
  inherited ImlDocumentos: TImageList
    Left = 713
    Top = 4
  end
  inherited dsTelefone: TwwDataSource
    Left = 913
    Top = 437
  end
  inherited dsEndereco: TwwDataSource
    Left = 739
    Top = 669
  end
  inherited dsContato: TwwDataSource
    Left = 935
    Top = 525
  end
  inherited dsTelContato: TwwDataSource
    Left = 1045
    Top = 781
  end
  inherited dsDocumento: TwwDataSource
    Left = 754
    Top = 517
  end
  inherited dsEscolhePessoa: TwwDataSource
    Left = 1153
    Top = 773
  end
  inherited dsImagem: TwwDataSource
    Left = 1108
    Top = 773
  end
  inherited dsImagensDoc: TwwDataSource
    Left = 1201
    Top = 773
  end
  inherited DsNaturalidade: TwwDataSource
    Left = 1123
    Top = 773
  end
  inherited CdsDocumento: TCMClientDataSet
    Left = 754
    Top = 471
  end
  inherited CdsTipoDoc: TCMClientDataSet
    Left = 801
    Top = 471
  end
  inherited CdsTelefone: TCMClientDataSet
    Left = 893
    Top = 471
  end
  inherited CdsContato: TCMClientDataSet
    Left = 940
    Top = 471
  end
  inherited CdsTelContato: TCMClientDataSet
    Left = 664
    Top = 243
  end
  inherited CdsImagem: TCMClientDataSet
    Left = 1108
    Top = 727
  end
  inherited CdsEscolhePessoa: TCMClientDataSet
    Left = 1154
    Top = 727
  end
  inherited CdsImagensDoc: TCMClientDataSet
    Left = 1201
    Top = 727
  end
  inherited CdsSubTipo: TCMClientDataSet
    Left = 1247
    Top = 727
  end
  inherited CdsPessoaFisica: TCMClientDataSet
    Left = 986
    Top = 471
  end
  inherited CdsCidade: TCMClientDataSet
    Left = 1033
    Top = 471
  end
  inherited CdsNaturalidade: TCMClientDataSet
    Left = 1057
    Top = 727
  end
  inherited CdsEstado: TCMClientDataSet
    Left = 1047
    Top = 687
  end
  inherited DsContaBancaria: TwwDataSource
    Left = 691
    Top = 826
  end
  inherited CdsContaBancaria: TCMClientDataSet
    Left = 644
    Top = 826
  end
  inherited MsBanco: TMontaSelect
    Left = 666
    Top = 11
  end
  inherited CdsBanco: TCMClientDataSet
    Left = 740
    Top = 826
  end
  inherited CdsEndereco: TCMClientDataSet
    Left = 847
    Top = 471
  end
  inherited CdsImagemOutro: TCMClientDataSet
    Left = 847
    Top = 557
  end
  inherited dsImagemOutro: TwwDataSource
    Left = 1005
    Top = 377
  end
  inherited CdsPais: TCMClientDataSet
    Left = 661
    Top = 295
  end
  object MsClasFisCliFor: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Classificação Fiscal'
    Colunas.Strings = (
      'CLASFISCLIFOR.DESCCLASFISCLIFOR'
      'CLASFISCLIFOR.CODREDUZIDO'
      'CLASFISCLIFOR.FLGTIPOFATURA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Descrição'
      'Código Reduzido'
      'Tipo Fatura')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CLASFISCLIFOR')
    CamposChave.Strings = (
      'CLASFISCLIFOR.IDCLASFISCLIFOR')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '3'
      '2')
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
    Left = 939
    Top = 330
  end
  object MsSubConta: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Sub Conta'
    Colunas.Strings = (
      'SUBCONTA.CODSUBCONTA'
      'SUBCONTA.NOMESUBCONTA')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'SUBCONTA')
    CamposChave.Strings = (
      'SUBCONTA.CODSUBCONTA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 939
    Top = 392
  end
  object MsCentroCusto: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Centro de Custo'
    Colunas.Strings = (
      'CENTCUST.CODEXTERNO'
      'CENTCUST.NOME'
      'CENTCUST.CODCORRESP')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Nome'
      'Código Correspondente')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CENTCUST'
      'CONTASXCC')
    CamposChave.Strings = (
      'CENTCUST.CODCENTROCUSTO')
    Filtro.Strings = (
      'UNIDNEGOCIO.UNETIPO = '#39'A'#39' AND UNIDNEGOCIO.ATIVO = '#39'S'#39)
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '25'
      '10')
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
    Left = 748
    Top = 4
  end
  object MsAtividadeProjeto: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'UNIDNEGOCIO.UNECODIGO'
      'UNIDNEGOCIO.NOME'
      'UNIDNEGOCIO.UNIDNEGOC')
    TipodeDado.Strings = (
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Código'
      'Nome'
      'Identificador')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'UNIDNEGOCIO')
    CamposChave.Strings = (
      'UNIDNEGOCIO.UNIDNEGOC')
    Filtro.Strings = (
      'UNIDNEGOCIO.UNETIPO = '#39'A'#39' AND UNIDNEGOCIO.ATIVO = '#39'S'#39)
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '25'
      '10')
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
    Left = 867
    Top = 360
  end
  object CdsTipoDesemb: TCMClientDataSet
    Aggregates = <>
    IndexFieldNames = 'CODTIPRECDES;ANASINT'
    Params = <>
    Left = 680
    Top = 552
  end
  object CdsTipoDesembForn: TCMClientDataSet
    Aggregates = <>
    IndexFieldNames = 'CODTIPRECDES;ANASINT'
    Params = <>
    Left = 784
    Top = 268
  end
  object CdsImAgreg: TCMClientDataSet
    Aggregates = <>
    IndexFieldNames = 'DESCCUSTAGREG'
    Params = <>
    Left = 688
    Top = 576
  end
  object CdsImAgregForn: TCMClientDataSet
    Aggregates = <>
    IndexFieldNames = 'DESCCUSTAGREG'
    Params = <>
    Left = 824
    Top = 268
  end
  object DsTipoDesemb: TwwDataSource
    DataSet = CdsTipoDesemb
    Left = 848
    Top = 412
  end
  object DsImAgreg: TwwDataSource
    DataSet = CdsImAgreg
    Left = 864
    Top = 404
  end
  object DsTipoDesembForn: TwwDataSource
    DataSet = CdsTipoDesembForn
    Left = 784
    Top = 316
  end
  object DsImAgregForn: TwwDataSource
    DataSet = CdsImAgregForn
    Left = 824
    Top = 316
  end
  object CdsRamoForne: TCMClientDataSet
    Aggregates = <>
    IndexFieldNames = 'DESCRAMOFORNECEDOR'
    Params = <>
    Left = 720
    Top = 252
  end
  object DsRamoForne: TwwDataSource
    DataSet = CdsRamoForne
    Left = 712
    Top = 316
  end
  object CdsRamoXForne: TCMClientDataSet
    Aggregates = <>
    IndexFieldNames = 'DESCRAMOFORNECEDOR'
    Params = <>
    Left = 864
    Top = 268
  end
  object DsRamoXForne: TwwDataSource
    DataSet = CdsRamoXForne
    Left = 864
    Top = 316
  end
  object CdsEmpresaForne: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = CdsEmpresaForneBeforePost
    Left = 817
    Top = 556
  end
  object DsEmpresaForne: TwwDataSource
    DataSet = CdsEmpresaForne
    Left = 864
    Top = 556
  end
  object MsNatuRendimento: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Natureza do Rendimento'
    Colunas.Strings = (
      'NATURENDIMENTO.DESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'NATURENDIMENTO')
    CamposChave.Strings = (
      'NATURENDIMENTO.CODNATUREZA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 959
    Top = 545
  end
  object CdsCentCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 724
    Top = 611
    object CdsCentCustoCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
    object CdsCentCustoNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object CdsCentCustoSTATUSGRUPOCDC: TStringField
      FieldName = 'STATUSGRUPOCDC'
      FixedChar = True
      Size = 1
    end
    object CdsCentCustoCODEXTERNO: TStringField
      FieldName = 'CODEXTERNO'
      FixedChar = True
      Size = 10
    end
  end
  object SqlCentCusto: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  C.CODCENTROCUSTO,'
      '  C.NOME,'
      '  C.STATUSGRUPOCDC,'
      '  C.CODEXTERNO'
      'FROM'
      ' CENTCUST C,  CONTASXCC CXCC'
      'WHERE'
      ' (C.IDEMPRESA = :IDEMPRESA)  AND'
      ' (RTRIM(C.CODCENTROCUSTO) = :CODCENTROCUSTO) AND'
      ' (C.IDPLANCENTCUST = :IDPLANCENTCUST)  AND'
      ' (CXCC.CODCENTROCUSTO = C.CODCENTROCUSTO) AND'
      ' (CXCC.IDEMPRESA = C.IDEMPRESA)  --AND'
      '-- (CXCC.PLACONTA = PLACONTA)')
    ClientDataSet = CdsCentCusto
    Left = 754
    Top = 611
  end
  object cdsAvaliacaoFornec: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = cdsAvaliacaoFornecAfterOpen
    AfterScroll = cdsAvaliacaoFornecAfterScroll
    Left = 618
    Top = 716
  end
  object dsAvaliacaoFornec: TwwDataSource
    DataSet = cdsAvaliacaoFornec
    Left = 618
    Top = 764
  end
  object dsNatureza: TDataSource
    DataSet = qryNatureaContr
    Left = 819
    Top = 767
  end
  object qryNatureaContr: TQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT IDNATUREZA, DESCRICAO'
      'FROM NATUREZACONTR '
      'WHERE FLGATIVO = '#39'S'#39
      'ORDER BY DESCRICAO')
    Left = 655
    Top = 691
    object qryNatureaContrDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 80
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.NATUREZACONTR.DESCRICAO'
      Size = 80
    end
    object qryNatureaContrIDNATUREZA: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'IDNATUREZA'
      Origin = 'BASEDADOS.NATUREZACONTR.IDNATUREZA'
      Visible = False
    end
  end
  object cdsJustificativas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ReadOnly = True
    Left = 930
    Top = 700
  end
  object dsJustificativas: TwwDataSource
    DataSet = cdsJustificativas
    Left = 930
    Top = 748
  end
  object rptAvaliacao: TppReport
    AutoStop = False
    DataPipeline = ppAvaliacao
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 753
    Top = 383
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppAvaliacao'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 33602
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Dt. Avaliação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 3175
        mmTop = 29370
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Dt. Execução'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 26723
        mmTop = 29370
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Qualidade Tec.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 50006
        mmTop = 29370
        mmWidth = 19844
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Natureza Serviço'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 72761
        mmTop = 29370
        mmWidth = 24606
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Desc. Execução'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 110490
        mmTop = 29370
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Motivo da Qualificação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 149860
        mmTop = 29369
        mmWidth = 35560
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Justificativa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 191770
        mmTop = 29370
        mmWidth = 16341
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Position = lpBottom
        Style = lsDouble
        Weight = 0.75
        mmHeight = 2381
        mmLeft = 794
        mmTop = 26458
        mmWidth = 284428
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3260
        mmLeft = 257842
        mmTop = 24341
        mmWidth = 25527
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Emissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 245005
        mmTop = 24342
        mmWidth = 11769
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Fornecedor: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 1588
        mmTop = 22754
        mmWidth = 17463
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppAvaliacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppAvaliacao'
        mmHeight = 3302
        mmLeft = 20373
        mmTop = 22753
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'FUNDAÇÃO DOS ECONOMIÁRIOS FEDERAIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4995
        mmLeft = 80074
        mmTop = 1058
        mmWidth = 91483
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Histórico de Avaliação do Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 94721
        mmTop = 10319
        mmWidth = 62442
        BandType = 0
      end
      object ppImage1: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          0A544A504547496D61676540190000FFD8FFE000104A46494600010101006000
          600000FFDB004300020101020101020202020202020203050303030303060404
          0305070607070706070708090B0908080A0807070A0D0A0A0B0C0C0C0C07090E
          0F0D0C0E0B0C0C0CFFDB004301020202030303060303060C0807080C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0CFFC00011080077006A03012200021101031101
          FFC4001F0000010501010101010100000000000000000102030405060708090A
          0BFFC400B5100002010303020403050504040000017D01020300041105122131
          410613516107227114328191A1082342B1C11552D1F02433627282090A161718
          191A25262728292A3435363738393A434445464748494A535455565758595A63
          6465666768696A737475767778797A838485868788898A92939495969798999A
          A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
          D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
          01010101010101010000000000000102030405060708090A0BFFC400B5110002
          0102040403040705040400010277000102031104052131061241510761711322
          328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
          292A35363738393A434445464748494A535455565758595A636465666768696A
          737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
          A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
          E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00FDFC
          A28A2800A28A28011781E95F907FF0708FFC16BFC55FB31F8D25F827F0A6FF00
          FB17C4CD6515C6BFAF45FF001F5A72CE9B92DE0DC3E491A3647F357E65DE36ED
          61BABF5EC92189F4AFE643FE0E43F839AE7C32FF0082A4F8C355D4E39CE9DE32
          B4B2D5F4BB8765659A0F21602ABFDDD92C2E9B5BFBABFC2CB5F41C2D85A15F1B
          CB5F5B2B9A4373E44D3FF69EF891A57C416F165AF8F3C610789DA5F3DB558F57
          9D6F37FF007BCDDFBB757EF3FF00C1BD1FF058AF107EDC1A3EADF0B7E25DD25F
          F8F7C2D63F6FD3F59C6C935CB25758DC4CB8DBE7C4CE9F32FF00AC46DC57723B
          BFF3C15FA55FF06B77C10D7BC73FF05137F18DA4170BA0F82345BA7D42E5636F
          2B7DCA3410C0CFF77736E7755FBCCB1337F0B57DCF126070F3C14A735AC57BAC
          D6A47DD3FA3AA28A2BF2639828A28A0028A28A0045CFAE69707B9AFE66FE387F
          C17EBF6B9F07FC68F17691A7FC567834FD2B59BBB5B58BFE11AD25BCB8927915
          17735B6E6DAA07DEAE607FC1C3BFB638FF009ABB2FFE12FA47FF002257D54783
          F16D5F9E1F7BFF00234F66CFEA2E8FCEBF974FF8887BF6C7FF00A2BB2FFE12FA
          47FF002251FF00110F7ED8FF00F45765FF00C25F48FF00E44ABFF53B17FCF0FB
          DFF90FD933FA8A0BC5784FEDE5FF0004F4F86DFF000511F8551785FE216993CB
          F6194DCE9BA9D932C57FA5CAC30CD13956E18001919595B0BC655597F9EB5FF8
          388FF6C4824566F8BAC76FF09F0CE91F37FE4A57D7FF00F04E1FF83A3FC453FC
          40D37C2BFB42D9E9775A26A32AC0BE2AD32DBECD3E9EE5B1BEE615FDDBC5EAD1
          2A32AFCDB5EB3A9C31986157B7A4D371FE57AFE42E4923B3D27FE0D08F0E45E3
          2867BCF8D3AC5C680B36F96D62F0FC715D345BBFD5894CCCAAD8FE3D9FF01AFD
          40FD903F635F01FEC31F062CFC0BF0F74A3A6E8D6CED3CD248FE65D6A170C155
          EE267E37CAC1546EECAAAA30AAAB5DE6BBF10344F0C780AEFC53A8EAB616BE1E
          B2B26D4AE351926516D1DB2A798D317FBBB360DDBBD2BF0BBF6F6FF83A6BC79E
          24F1E5FE8DF012CAC3C33E19B191A28B5ED4EC96EF51D4B1FF002D5219731431
          B7F086576DB866DBF7570A3FDA79B7EEB9AEA3F242F7A47EF751F9D7F2E69FF0
          711FED8D274F8BACDF4F0CE8FF00FC894BFF00110F7ED8FF00F45765FF00C25F
          48FF00E44AEB7C1D8BFE787DEFFC8AF6523FA8BFCE8FCEBF974FF8887BF6C7FF
          00A2BB2FFE12FA47FF002251FF00110F7ED8FF00F45765FF00C25F48FF00E44A
          3FD4EC5FF3C3EF7FE41ECA47F5141BD4E7F0A4DDFED7E95FCE6FEC1FFF0005D3
          FDAABE317EDADF09BC25E25F89F26A5E1EF1378BB4CD2F52B4FF00847B4B8BED
          16F2DD4492C7BD2D95D772B32E5595BFBAD5FD18824F27A9AF0B33CAEBE066A9
          D4926DF62251B1CDCBF077C27753BC92785FC3D2C921DCCCFA742CCC7D73B699
          FF000A53C1E1C9FF008453C39C76FECC871FFA0D74E1B72835CD7C5CF1C1F875
          F0F755D696333BD840D22267019BA0CFB648AF1F1D99470987A989AF2B4209C9
          FA2576552A53A95234E1BCB418DF063C1EBC1F0A786F27FEA190FF00F134A9F0
          5FC1C79FF8453C367FEE190FFF00135F2AF817F6D4F18C7E38B49352BC8AFB4D
          BA9D524B516E88B12337F010376E5FF699ABECE4949404F52326BE33817C4BCB
          B8B2955AB9639AF66ECD4959EBB3D1BD1D9F99ED679C3F8BCA270A78AB7BEAEA
          C7C1FF00F05BDFF82757C32F8DDFB077C43F131F0A68BA478B7C07A2DD6BFA5E
          B163671DBDCAFD9A3695E17641978DD11976B70BB830DA56BF991AFEBAFF00E0
          A87CFF00C1373E3B9F4F016B5FFA452D7F2295FD09C195673C3CD4A5B33C8A6F
          467EB57C70FDAEFC55A8FF00C1AF1F0F6CE6D46E5EE356F162F81EEAE37B6F7D
          3ED9AEEE228B77F7563B6862FF007576D7E4AAAEE655AFD13F8C5FF2ACD7C2BF
          FB2C137FE926A75F9DC9FEB57FDEAF632684610AAE2BEDC8D11FD547FC12EBFE
          09CDF0BBF65CFD913C13058F84740BFD7B5AD16D750D6759BBB28A7BBD42EA68
          9647F9DD772C4ACDB5231F2AAA8EADB99BE92FF852BE0F3CFF00C229E1BFFC16
          41FF00C4D667ECC7CFECDBF0FF00D4786F4FFF00D258EBB2D42F069F633CEC09
          58519C81D7815F91E37193539D6AB276D4E7BCA52B1CF1F831E0E2D8FF00844F
          C379F4FECD87FF0089A43F05FC1E093FF089F86FFF0005B0FF00F135F27EA5FB
          6FF8DE7F163DF5BDDC10D82CB94B068119367A31C6FF00C73FF7CD7D85E07F13
          8F19783F4BD5963685752B58EE551BEF26F40D8FD6BF36E09F1572AE29AF5F0F
          974A7CD45EBCCAD75DD6AF4F5B3F23DECEB86F19954213C4DAD3ECFF000653B1
          F847E16D36F21B9B7F0DE836F716EE1E3962D3E2578D8746560BC1AE968A377B
          D7E8AE6DEE7CF1C15D7ED27E07B1B99609BC49A7C72C2CD1BA963B9597A8E955
          EE7E387C3EF1E5ACBA3CDAFE95731DFA185E1924D8250DF2E39C5137ECBDE05B
          EB896E27F0FDA4B34CECEEE59FE62DD4F5AF0AFDB4FE07787BE1B687A4EA3A25
          8AE9EF71706DE44472C8E36EE0793D7E5FD6BF10E31E20E31C972CAD98E328E1
          AA5187C514E77716EDD55BA9F679460327C6E26186A72A919CB67EEDAFF99E91
          A1FEC7BE08F86BE225F10DD5EDDB5AD83FDA512F2E116DE02BF3024E0642FF00
          B47EB9AEC9BF69AF02C4ECA7C4DA6FC9E9213FCABE4EF897F11F56D7FE027827
          4DB9BA95E15372B2E4FF00ADF2A4558F3F452457B87ECF1FB33783B5EF84FA2E
          A5A969297F777F0F9D2C92C8FF00C44FCA006C003DABE378378BE78ACC6793F0
          560A9508FB38D59BA9CDBC945DBDDEDCD6EDBDAC7AF9C64EA96196333BAD39BE
          6708F2DBA37DFBD8E6FF00E0A2DF1B7C2BE38FF827BFC75D3B49D6ECAFAF24F0
          06B8CB146C7732AD84B9AFE502BFABBFF82887C06F09780BFE09F7F1D752D274
          682CEF63F006B882547766556B0973D4D7F2895FD99E15FF006B7D42A7F6C7B3
          F69CDFF2EEF6B5BFBDADF73E2B13F55E6FF63BF27F7ED7BFC8FD13F8C5FF002A
          CD7C2BFF00B2C137FE926A75F9DC9FEB57FDEAFD11F8C5FF002ACD7C2BFF00B2
          C137FE926A75F9DC9FEB57FDEAFB9CA7E0ADFE397E672A3FAF6F80BF1DFC23E1
          2F811E06D3B52D76CACEF6D7C39A70962918EE43F6588FF5AEB62FDA57C073C8
          231E26D2CF99C65A50A0FE26B8CF819FB3DF83BC61F02BC0FA9EA7A1DADD5F5D
          78734E32CACEFB9FFD1225EC7D00AE7BF6A9FD9CFC27E11F83B7DAD693A6269D
          7B612464189DF0E1E45420827FDAFD2BF9138C737E32CAE962B30A70C3CE8D2E
          695AF3E6E4577E97B7CAE7D065B84C9B15569E1A52A919CECBECDB99FE36B9B9
          73FB15F81F5DF101D721B8BC1A7CEC2736D04E9F6561D7E538DCA9F46E3B6DAE
          D13F683F00E8012C63F116931ADAA889522943468070146DE2BE50D1BE25EAD6
          1FB326ABA4477730B693568ED873F32C6F1C8EE8BFECB3463FEFA6F5AF4AFD8E
          3E01F863C7FF000FEEB56D6F4E5D46E5EF1E04F31D95511429C280DFED1AFCA7
          8478E6189CC6960F83B014A854C453F695253BDB46D5972EB64F6E9AEC8FA5CD
          B25953C3CEBE71889CE34A5C904AD7EF7D7FAF33DBB4AFDA2BC17AD6A76F6569
          E20B09EEAEA458A28D18E647270074AED783CE739AE1749FD99FC11A16A96F7D
          69A05AC37569209A1915DF31BA9C86EBEB5DD7038F4AFE8BE1DFEDAF653FEDCF
          67CF7D3D9F35ADE77EA7E7D8FF00A9732FA973DBAF35AF7F90F6E335F3C7FC14
          40FF00C5BED0BFEC207FF45B57D0EDDEBE78FF0082887FC93FD0BFEC207FF45B
          57C6F8D1FF0024663BFC2BFF004A47AFC1BFF239A1FE2FD19F3CF8CBFE491F83
          7FDEBEFF00D1A95F68FECC1CFC06F0CE79FF00435FE66BE2EF191FF8B47E0DFF
          007AFBFF0046A57DA3FB2FFF00C906F0CFFD79AFF335F84FD1FBFE4A8AFF00F6
          0D4BFF0049A67DDF883FF22BA7FF005F27F9C8E17FE0A89FF28DDF8EFF00F620
          EB5FFA452D7F2275FD767FC1513FE51BBF1DFF00EC41D6BFF48A5AFE44EBFD0E
          E08FE0D4F53F25A3B1FA27F18BFE559AF857FF0065826FFD24D4EBF3B93FD6AF
          FBD5FA23F18BFE559AF857FF0065826FFD24D4EBF3B93FD6AFFBD5F4194BF72B
          7F8E5F99A23FB27FD98BFE4DB7E1FF00FD8B7A7FFE92C758BFB697FC9BAEBDFE
          F5B7FE94475B5FB30FFC9B6FC3FF00FB16F4FF00FD258EB17F6D1E7F674D78FF
          00B56DFF00A511D7F35F895FF24DE65FF5EAA7FE92CEDE1FFF0091A61FFC71FC
          D1F215AFFC90AD47FEC396BFFA22E2BE9FFD817FE48C4FFF0061097FF414AF98
          2D7FE4856A3FF61CB5FF00D11715F4FF00EC0BFF0024627FFB084BFF00A0A57F
          23F80AFF00E328C27FD83CBFF4A67EA9C75FF22DADFF005F57FE9313DCE8C514
          57F739F898C2A7703CF15F3B7FC142F23C03A1AF617FFF00B4DABE890BF28C9A
          C5F18F80347F1F5A456FABE9F6BA8C30BEF459D03056F5AF8EE3CE1EAD9EE458
          8CAA84D427515937B6E9FE87AD91E631C0E3E9E2E4AEA0CF833C62DFF1693C1C
          39C86BDFFD1A95F68FECC5CFC06F0C0CF3F635FE66AD5CFC06F085EE9D6F6927
          87B4C6B6B2DFE42188111EEFBD8FAD749A2E896BE1AD26DEC6C608EDED2D9764
          51C636AA0F415F9DF86BE1663B86F37A998626AC26A74A14ECAF7BC5455F55B7
          BA7D0F12F1551CCB090C3D3838B8CDCB5F36FF00CCF17FF82A1FFCA37BE3C67A
          FF00C205AD7FE90CB5FC8A57F697E37F04E93F12BC1DAAF87F5EB0B7D5745D6E
          D65B1BFB3B84DF15D41229478DD7BAB2922BC0FF00E1CEDFB307FD10FF0087DF
          F82C5AFE9BE1FCFA9E5F4E709C5BE63E36152C7E227C623FF1CCC7C2B1FF0055
          826FFD24D4EBF3B53FD6AFFBD5FD7D5F7FC13DFE09EAFF0005EC7E1CDCFC33F0
          9CDE06D2F516D56D7447B15FB1DBDDB2BA99D53FBFB6571BBFDA35C90FF823D7
          ECC0BFF3443E1F1C7FD4316BD3C1F15D0A319A941FBD26FEF1AA87ABFECCE33F
          B377C3D3CF1E1BD3FF00F4963AC7FDB3D80FD9D35E519FBD6FFF00A511D7A368
          DA359F86744B4D3ACA08ED6CAC614B7B78631B5218D005551EC14545E27F0C58
          F8C345974ED4ADA1BDB39CAF9914AB946C3647EA057E55C55964F34CAB1580A4
          F95D684E29BE9CC9AD7EF3A32DC52C363296264B48493FB9DCF806D4FF00C58C
          D447AEB96BFF00A22E2BE9FF00D82723E0BCC739FF00898CBC7AFCA95DF7FC28
          4F07A693258AF87B4C16B2482568FCA054B80406FAE09FCEB73C21E0DD2FC0DA
          5358E9365058DB173218A15DABB8F7FD2BF14F0E7C1FC7F0EE6F4730C45684E3
          0A4E9D95EF76DBBEAB63EC388B8BA8663849E1E9C1A729F36B6FE548DA07201F
          5A281D0515FD0E7C09FCFD2FFC1597F6DAF8FF00FF000507F157C1AF85FE3FD3
          5B51FF00848F58B0D1ACEE746D2618D6DECDE77DAD2CB6FF00C3142DF3336E6D
          B5F7C7FC13A743FDBEB4EFDA3E09BF686D6FC3FA87C395D3AE3CD86CD34A59BE
          D3B57C93FE8F12C9F7B77F16DAFC7AF827FB306A1FB637FC16B3C55F0F34CF18
          EA7E02BCD7BC5FE2564D72C226927B3F2BED93B6D55746F9D62D9F7D7EF7F17D
          DAFDC7FF0082657FC12CFC41FF0004F7F13F8B752D6BE33F89BE292F88ECE1B5
          8ADF55B67896C191D9B7A6FB8973BB763F87A57DC67DF55A10F6508C136969C9
          AFADFA1BCB951F167FC11A3FE0AD3F1EBF6B8FF82986A5F0F3C7DE33875AF095
          B596AB2A58A68D656CC1E0915633BE2855F8FF007AB5FF00E0E10FF82AAFC73F
          D847F6B3F07F85FE1878BE0F0F68BABF8562D4EEADDF48B2BDF32E1AF2EA267D
          D3C4EC3E48D0601DBC57C6FF00F048DF8A7E1EFD87BFE0B57E228BE276AD69E1
          2B4B5B9D6F41B8BDD45BECD6D6B70D2B6DF31DBE544664DBB9BE5F996ADFFC1C
          7BFB427843F6C0FF008282F842DFE196BDA778DE3D2FC3769A2C973A3CEB776D
          2DEC97970E2089D32B2B6D962FB8CCBB9B6FDE56AE879751799C1AA6BD9F276D
          05CBA9F69FFC17BFFE0A89F1B3F623B6F822FF000D7C5D0E80DE32D0EE2F756D
          FA459DD7DAA54FB361BF7F13ECFF0058FF002AEDEB5E85FB22FF00C165351FDA
          D3FE0917F14FC6D69AA59E95F1B3E14F852FE7D50241132B5C456D23DBEA290B
          068DA394A65976ED57575DBB76EEF92FFE0EBFD0E5F0DEA9FB3BE9B332BC963A
          0DFDBB91F75991ACD5BFF41AF9C3F6F5FD913C67FF0004ACBCD07C6FE02B9BC8
          FE1C7C76F03FF664E4EE9228DAFAC57ED96137FC09BCE899BFBABF79A26A9C2E
          5B84AF84A3192519C9B69F7B3D9FC83962D1FA4DFF000425FF0082A7FC42FDA5
          3F674F8E3E3EF8E5E2C8F59D3BE19A417C2E22D36D6D3EC76AB6F7334DF2C089
          BDB6C43EF7A57CC5E15FF82B77EDBDFF000553F8F3E20D2FF671B4B3F0AE81A2
          8FB4FD960B5B07FB1DBB332C4D737778ACA657DA7E58F6EEDADB576AB35617FC
          10DFE186ADF193FE0955FB66F867428A6B9D6756D2A18ED2DE2FBF7128B5BA75
          897FDA936EDFF81569FF00C1AE9FB677C34FD9A352F8B5E1AF887E2DF0FF0082
          AF75F3A7DF585DEB3789636D7420FB4AC9179D2954575F350852DF36E6DBF76A
          6B6128D29E26BD3A6A52835656D168BA072DAE7D2BFF000499FF0082A17ED33E
          21FDAFF53F815FB44F82758D4F50B4965B57F10DAE85E5368F7489E684BB7B54
          FB33412478D92AAAFDE46DCCAFB97E73FDA3BFE0ACBFB60F883FE0A91E35F821
          F0AFC79A7DBE7C5B77A2E816171A3697E5C688EDB11A696166FBABF799ABEE7F
          81BFF05FFF0087DFB437FC14065F81FE14F0A6BFE22B4BCBE363A478A74A9E29
          ECEFBCB87CC9A778DB632408565F9D59F72A0603E6C57E397ED5DF0EB40F8B1F
          F05CAF887E1CF14F8CA3F87FA06ADE3DD420BDF10C92A44BA4A6F76F359DD955
          7EEAAFCCCBF7AA32FC342A62AA4F114143DCBDAD75EB6FD02313F4E3E04786FF
          00E0A8107C70F06BF8E3C4FE11B8F05AEB76475F8E18F45DF269FE7A7DA55764
          2AFBBCADFF0075B77F76BC5BFE0AD7FF000569FDA6BE03FF00C15375CF841F0A
          FC6F6BA4E953CFA4D969563368DA74E167BBB5B66F9A59A166DAD2CA7EF37CB9
          AEA7F632FD82FF0066FF00D9EFF6A7F03F8CB49FDB6744F18EA5A2EA88F6BA2C
          9ADD8B2EA72B65122F96E19BE6671F754D7C8DFF0005CAF05CBF127FE0BC9AC7
          87A0D466D227D7B50F0E69C97D08DCF66D2D9D9A0954657E65DDBBEF2FDDFBD4
          F0342854C6B52845AE47F6397AAE8C6B73F407F671F0F7FC14E63F8FFE0997E2
          1F88FC2D73E025D6ED1BC431C31E8BE649A7F9EBF6855F2A157DDE56FF00B8DB
          BFBB5FA9DB88E335F9EDFB07FF00C111FC57FB1A7ED2BA2FC41D4FF688F197C4
          1B4D2A0B989F44D46CA58A0B932C0F12B3335DCAB95DFBBEE1FBB5FA162BE573
          4AD4E7513A5CB6F28DBF032933E43F81DFF0457F831FB3EFED82FF001C3404F1
          42F8E25BFBFD409B8D484969E6DE24B1CDFBAD9D36CCFB46EF978AFAECAF4F51
          4515C35B1352B4F9AABBB1367C7DFB6CFF00C1113E017EDE5E3A97C57E2DD075
          3D1FC5774AB15CEADA15E7D8EE2F42AED5F35595E2760BF2EF64DDB555776145
          62FEC77FF0407FD9E7F630F89361E34D1749D7BC4FE24D25FCFD3EF7C457EB76
          2C24FE19638D1238F7AF50CCAC54FCCBB4F34515D10CCF17EC7D97B476F51F33
          3D07F6F8FF008251FC2AFF0082906B7E1ABFF88C3C44D71E148A686CBFB3350F
          B28DB2B233EFF91B77DC5AEDBE3C7EC3FF000FBF694FD96D3E1078B74D9F53F0
          95BDA5ADA5B0336DBAB6FB32AAC3324B8F96550BF7BF8B2C0E558AD14542C5D7
          518AE77EE6DE43B9CEFEC0BFF04CDF86BFF04E2D0BC4561F0E46BA2DFC553433
          DEFF00695EFDA58B44AE136FCAB8E1DABC6BF6A3FF008378FF00670FDAAFE25E
          A5E2ABDD1B5EF09EB7ABCC6E6FE4F0DDFADA45772B36E691A27478D599BE66D8
          ABB9B2C72C73451571CC3131A92ACA6F99F517333D3BF60EFF00824AFC15FF00
          82765C5EDFF80341BA97C41A8C1E45CEB7AADCFDAB5068376EF2D5B68545240C
          8455DDB5776768AF29F8F3FF0006ED7ECF3FB457C63F1378EFC46BE343AEF8B3
          519751BE36BABAC50F9D2B65B62F96768A28A4B32C529CAB2A8F99F50E6665FC
          3FFF0083693F66CF869E3BD1BC45A6C7E393A8E817F0EA16BE6EB4AD18962757
          4DC3CAE46E51C57A67C78FF822AFC17FDA33F6B88FE35788D3C527C6B15E58DF
          29B6D4C456BE6D9AC4B0FEEF61E310A6E1BBE6E68A2AE599E29CBDA3A8EF6B6E
          1CCCFAEFEEAFD2968A2B8EE49FFFD9}
        mmHeight = 15875
        mmLeft = 1058
        mmTop = 265
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Usuário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3302
        mmLeft = 234188
        mmTop = 29369
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3302
        mmLeft = 269241
        mmTop = 29370
        mmWidth = 13970
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 8996
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'DTAVALIACAO'
        DataPipeline = ppAvaliacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppAvaliacao'
        mmHeight = 3440
        mmLeft = 2117
        mmTop = 1323
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'DTEXECUCAO'
        DataPipeline = ppAvaliacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppAvaliacao'
        mmHeight = 3440
        mmLeft = 25929
        mmTop = 1323
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'QUALIDADETECNICA'
        DataPipeline = ppAvaliacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppAvaliacao'
        mmHeight = 3440
        mmLeft = 49477
        mmTop = 1323
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'NATUREZA'
        DataPipeline = ppAvaliacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppAvaliacao'
        mmHeight = 3440
        mmLeft = 72496
        mmTop = 1323
        mmWidth = 36513
        BandType = 4
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        KeepTogether = True
        CharWrap = False
        DataField = 'DESCRICAOSERVICO'
        DataPipeline = ppAvaliacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppAvaliacao'
        mmHeight = 3969
        mmLeft = 110490
        mmTop = 1323
        mmWidth = 36830
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo2: TppDBMemo
        UserName = 'DBMemo2'
        KeepTogether = True
        CharWrap = False
        DataField = 'MOTIVOQUALIFICACAO'
        DataPipeline = ppAvaliacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppAvaliacao'
        mmHeight = 3969
        mmLeft = 149860
        mmTop = 1323
        mmWidth = 40640
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo3: TppDBMemo
        UserName = 'DBMemo3'
        KeepTogether = True
        CharWrap = False
        DataField = 'DESCRJUSTIFICATIVA'
        DataPipeline = ppAvaliacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppAvaliacao'
        mmHeight = 3969
        mmLeft = 191770
        mmTop = 1323
        mmWidth = 40640
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Position = lpBottom
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 8731
        mmWidth = 284428
        BandType = 4
      end
      object ppDBMemo4: TppDBMemo
        UserName = 'DBMemo4'
        KeepTogether = True
        CharWrap = False
        DataField = 'TRGDTINCLUSAO'
        DataPipeline = ppAvaliacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppAvaliacao'
        mmHeight = 3969
        mmLeft = 269241
        mmTop = 1323
        mmWidth = 13970
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo5: TppDBMemo
        UserName = 'DBMemo5'
        KeepTogether = True
        CharWrap = False
        DataField = 'NOMEUSUARIO'
        DataPipeline = ppAvaliacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppAvaliacao'
        mmHeight = 3969
        mmLeft = 234188
        mmTop = 1323
        mmWidth = 33020
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 235744
        mmTop = 2117
        mmWidth = 48154
        BandType = 8
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 3440
        mmLeft = 0
        mmTop = 265
        mmWidth = 284428
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Total de Linhas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 1323
        mmTop = 2117
        mmWidth = 21548
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'DTAVALIACAO'
        DataPipeline = ppAvaliacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppAvaliacao'
        mmHeight = 3175
        mmLeft = 25665
        mmTop = 2117
        mmWidth = 17198
        BandType = 7
      end
    end
    object daDataModule1: TdaDataModule
    end
  end
  object ppAvaliacao: TppDBPipeline
    DataSource = qryiprfo
    UserName = 'Avaliacao'
    Left = 705
    Top = 383
    object ppAvaliacaoppField1: TppField
      FieldAlias = 'DTAVALIACAO'
      FieldName = 'DTAVALIACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppAvaliacaoppField2: TppField
      FieldAlias = 'DTEXECUCAO'
      FieldName = 'DTEXECUCAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppAvaliacaoppField3: TppField
      FieldAlias = 'QUALIDADETECNICA'
      FieldName = 'QUALIDADETECNICA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppAvaliacaoppField4: TppField
      FieldAlias = 'DESCRICAOSERVICO'
      FieldName = 'DESCRICAOSERVICO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppAvaliacaoppField5: TppField
      FieldAlias = 'MOTIVOQUALIFICACAO'
      FieldName = 'MOTIVOQUALIFICACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppAvaliacaoppField6: TppField
      FieldAlias = 'NATUREZA'
      FieldName = 'NATUREZA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppAvaliacaoppField7: TppField
      FieldAlias = 'DESCRJUSTIFICATIVA'
      FieldName = 'DESCRJUSTIFICATIVA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppAvaliacaoppField8: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppAvaliacaoppField9: TppField
      FieldAlias = 'NOMEUSUARIO'
      FieldName = 'NOMEUSUARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppAvaliacaoppField10: TppField
      FieldAlias = 'TRGDTINCLUSAO'
      FieldName = 'TRGDTINCLUSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
  end
  object QryIprFornec: TQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT'
      '  A.DTAVALIACAO,'
      '  A.DTEXECUCAO,'
      '  DECODE(A.QUALIDADETECNICA,'
      '                  '#39'P'#39', '#39'Satisfatória'#39','
      '                  '#39'N'#39', '#39'Insatisfatória'#39') AS QUALIDADETECNICA,'
      '  A.DESCRICAOSERVICO,'
      '  A.MOTIVOQUALIFICACAO,'
      '  N.DESCRICAO AS NATUREZA,'
      '  A.DESCRJUSTIFICATIVA,'
      '  P.NOME,'
      '  U.NOME NOMEUSUARIO,'
      '  A.TRGDTINCLUSAO'
      ' FROM AVALIACAOFORNEC A, NATUREZACONTR N, PESSOA P, PESSOA U'
      'WHERE A.IDNATUREZA = N.IDNATUREZA(+)'
      '  AND A.IDPESSOA = P.IDPESSOA'
      '  AND A.IDPESSOA = :IDPESSOA'
      '  AND SUBSTR(A.trguserinclusao,3,30) = U.IDPESSOA(+)'
      'ORDER BY DTAVALIACAO'
      ' ')
    Left = 862
    Top = 735
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object QryIprFornecDTAVALIACAO: TDateTimeField
      FieldName = 'DTAVALIACAO'
    end
    object QryIprFornecDTEXECUCAO: TDateTimeField
      FieldName = 'DTEXECUCAO'
    end
    object QryIprFornecQUALIDADETECNICA: TStringField
      FieldName = 'QUALIDADETECNICA'
      FixedChar = True
      Size = 1
    end
    object QryIprFornecDESCRICAOSERVICO: TMemoField
      FieldName = 'DESCRICAOSERVICO'
      BlobType = ftMemo
      Size = 500
    end
    object QryIprFornecMOTIVOQUALIFICACAO: TMemoField
      FieldName = 'MOTIVOQUALIFICACAO'
      BlobType = ftMemo
      Size = 500
    end
    object QryIprFornecNATUREZA: TStringField
      FieldName = 'NATUREZA'
      Size = 80
    end
    object QryIprFornecDESCRJUSTIFICATIVA: TMemoField
      FieldName = 'DESCRJUSTIFICATIVA'
      BlobType = ftMemo
      Size = 500
    end
    object QryIprFornecNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object QryIprFornecNOMEUSUARIO: TStringField
      FieldName = 'NOMEUSUARIO'
      Size = 60
    end
    object QryIprFornecTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
  end
  object qryiprfo: TDataSource
    DataSet = QryIprFornec
    Left = 859
    Top = 687
  end
  object MSAval: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'TEMPAVALIACAOFORNEC.IDAVALIACAO'
      'TEMPAVALIACAOFORNEC.DTAVALIACAO'
      'TEMPAVALIACAOFORNEC.DTEXECUCAO'
      'TEMPAVALIACAOFORNEC.QUALIDADETECNICA'
      'TEMPAVALIACAOFORNEC.DESCRICAOSERVICO'
      'TEMPAVALIACAOFORNEC.MOTIVOQUALIFICACAO'
      'TEMPAVALIACAOFORNEC.DESCRJUSTIFICATIVA'
      'TEMPAVALIACAOFORNEC.NATUREZA')
    TipodeDado.Strings = (
      'N'
      'D'
      'D'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Data da Avaliação'
      'Data da Execução'
      'Qualidade Técnica'
      'Descr. execução do serviço'
      'Motivo da Qualificação'
      'Justificativa'
      'Descr. Natureza')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'TEMPAVALIACAOFORNEC')
    CamposChave.Strings = (
      'TEMPAVALIACAOFORNEC.IDAVALIACAO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '18'
      '18'
      '10'
      '10'
      '10'
      '10'
      '100')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
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
    BeforeOpenCds = MSAvalBeforeOpenCds
    LookupSQL.Strings = (
      ''
      ''
      ''
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
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 941
    Top = 267
  end
  object CdsGrauInstrucao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 991
    Top = 663
  end
  object CdsGrupoCat: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 743
    Top = 743
  end
  object CdsDescCat: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 743
    Top = 791
  end
  object CdsExpAgNocivo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 999
    Top = 751
  end
  object CdsTpLogradouro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1098
    Top = 417
  end
  object CdsDescGrupoCat: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1101
    Top = 599
  end
  object cdsCidadeMunicipio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 803
    Top = 639
  end
  object dsClone: TDataSetProvider
    Constraints = True
    Left = 41
    Top = 559
  end
  object cdsClone: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 84
    Top = 560
  end
end
