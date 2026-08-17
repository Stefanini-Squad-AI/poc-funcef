inherited frmCadDependenteAss: TfrmCadDependenteAss
  Left = 1
  Top = 35
  Caption = 'Dependente'
  ClientWidth = 793
  FormStyle = fsStayOnTop
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 793
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 58
      Width = 783
      Height = 321
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos'
        'Dependente'
        'Dados Pessoais'
        'Contas Bancárias')
      detdbGrids.Strings = (
        ''
        'dbGrdDet'
        'dbgTelefone'
        'dbgContato'
        ''
        ''
        'dbgrdContaBancaria')
      inherited pgctrlDetalhe: TPageControl
        Width = 685
        Height = 262
        ActivePage = tbsPessFis
        inherited tbsDocumento: TTabSheet
          inherited PgCtrlPesFisica_Padrao: TPageControl
            Width = 677
            Height = 234
          end
          inherited PnlDocumentos_Padrao: TPanel
            Width = 677
            Height = 234
            inherited pnlItemsDoc: TPanel
              Height = 232
            end
            inherited pnlFoto: TPanel
              Width = 187
              Height = 232
              inherited Bevel1: TBevel
                Height = 236
              end
              inherited PnlAssociaFoto_Padrao: TPanel
                Top = 236
                Width = 187
              end
              inherited SbImagePessoa_Padrao: TScrollBox
                Width = 185
                Height = 236
              end
            end
            inherited lstDocumentos: TListView
              Height = 232
            end
          end
        end
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel
            Width = 677
            Height = 234
            inherited grpTipoEnd: TGroupBox
              Left = 480
              Height = 234
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 677
            Height = 234
          end
        end
        inherited tbsTelefone: TTabSheet
          inherited dbgTelefone: TwwDBGrid
            Width = 677
            Height = 234
          end
          inherited Panel1: TPanel
            Width = 677
            Height = 234
          end
        end
        inherited tbsContato: TTabSheet
          inherited Panel2: TPanel
            Width = 677
            Height = 234
          end
          inherited dbgContato: TwwDBGrid
            Width = 677
            Height = 234
          end
        end
        object tddepend: TTabSheet
          Caption = 'Dependente'
          object Label24: TLabel
            Left = 22
            Top = 30
            Width = 142
            Height = 13
            Caption = 'Situação do Dependente'
          end
          object cmbsitdependente: TwwDBLookupCombo
            Left = 22
            Top = 47
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
            LookupTable = qrySitDependente
            LookupField = 'IDSITDEPENDENTE'
            Options = [loTitles]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dbckDesignado: TDBCheckBox
            Left = 22
            Top = 123
            Width = 114
            Height = 17
            Alignment = taLeftJustify
            Caption = 'É Designado'
            DataField = 'FlgDesignado'
            DataSource = dsSubTipo
            TabOrder = 1
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
        object tbsPessFis: TTabSheet
          Caption = 'Dados Pessoais'
          object pnlPessFis: TPanel
            Left = 0
            Top = 0
            Width = 677
            Height = 234
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object DBCheckBox1: TDBCheckBox
              Left = 6
              Top = 212
              Width = 112
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Isento de IRRF'
              DataField = 'FLGISENTOIRRF_PADRAO'
              DataSource = dsPessoaFisica
              TabOrder = 6
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object dbrgrpSexo: TDBRadioGroup
              Left = 3
              Top = 96
              Width = 121
              Height = 64
              Caption = 'Sexo'
              DataField = 'SEXO'
              DataSource = dsPessoaFisica
              Items.Strings = (
                'Masculino'
                'Feminino')
              TabOrder = 2
              TabStop = True
              Values.Strings = (
                'M'
                'F')
            end
            object dbrgrpEstCivil: TDBRadioGroup
              Left = 270
              Top = 96
              Width = 130
              Height = 130
              Caption = 'Estado Civil'
              DataField = 'ESTCIVIL'
              DataSource = dsPessoaFisica
              Items.Strings = (
                'Solteiro(a)'
                'Casado(a)'
                'Divorciado(a)'
                'Viúvo(a)'
                'Outros')
              TabOrder = 4
              TabStop = True
              Values.Strings = (
                'S'
                'C'
                'D'
                'V'
                'O')
            end
            object grpFiliacao: TGroupBox
              Left = 3
              Top = -3
              Width = 355
              Height = 97
              TabOrder = 0
              object Label25: TLabel
                Left = 6
                Top = 15
                Width = 73
                Height = 13
                Caption = 'Nome do Pai'
              end
              object Label26: TLabel
                Left = 6
                Top = 54
                Width = 79
                Height = 13
                Caption = 'Nome da Mãe'
              end
              object wwDBEdit2: TwwDBEdit
                Left = 6
                Top = 27
                Width = 340
                Height = 21
                DataField = 'NOMEPAI'
                DataSource = dsPessoaFisica
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object wwDBEdit3: TwwDBEdit
                Left = 6
                Top = 66
                Width = 340
                Height = 21
                DataField = 'NOMEMAE'
                DataSource = dsPessoaFisica
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
            end
            object grpNaturalidade: TGroupBox
              Left = 360
              Top = -3
              Width = 208
              Height = 97
              TabOrder = 1
              object Label27: TLabel
                Left = 12
                Top = 15
                Width = 73
                Height = 13
                Caption = 'Naturalidade'
              end
              object Label28: TLabel
                Left = 12
                Top = 54
                Width = 82
                Height = 13
                Caption = 'Nacionalidade'
              end
              object dblkpcmbNaturalidade: TwwDBLookupCombo
                Left = 12
                Top = 27
                Width = 184
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOMEESTADO'#9'30'#9'Natural de')
                DataField = 'CODESTADO'
                DataSource = dsPessoaFisica
                LookupTable = qryNaturalidade
                LookupField = 'CODESTADO'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                OnCloseUp = dblkpcmbNaturalidadeCloseUp
              end
              object dbedNacionalidade: TwwDBEdit
                Left = 12
                Top = 66
                Width = 181
                Height = 21
                Color = clSilver
                DataField = 'NOMENACIONALIDADE'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
            end
            object grpDataNasc: TGroupBox
              Left = 126
              Top = 96
              Width = 139
              Height = 130
              TabOrder = 3
              object Label29: TLabel
                Left = 12
                Top = 12
                Width = 116
                Height = 13
                Caption = 'Data de Nascimento'
              end
              object Label30: TLabel
                Left = 12
                Top = 54
                Width = 92
                Height = 13
                Caption = 'Tipo Sanguíneo'
              end
              object wwDBEdit4: TwwDBEdit
                Left = 12
                Top = 69
                Width = 88
                Height = 21
                DataField = 'TIPOSANG'
                DataSource = dsPessoaFisica
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dbdtNasc: TCMDateTimePicker
                Left = 12
                Top = 27
                Width = 121
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
                TabOrder = 0
              end
            end
            object grpDependentes: TGroupBox
              Left = 405
              Top = 96
              Width = 163
              Height = 130
              TabOrder = 5
              object Label31: TLabel
                Left = 9
                Top = 12
                Width = 108
                Height = 13
                Caption = 'Nº Dep. para IRRF'
              end
              object Label32: TLabel
                Left = 9
                Top = 48
                Width = 146
                Height = 13
                Caption = 'Nº Dep. para Sal. Família'
              end
              object Label33: TLabel
                Left = 9
                Top = 87
                Width = 145
                Height = 13
                Caption = 'Nº Total de Dependentes'
              end
              object wwDBSpinEdit1: TwwDBSpinEdit
                Left = 9
                Top = 27
                Width = 121
                Height = 21
                Increment = 1
                MaxValue = 100
                DataField = 'NUMDEPIRRF_PADRAO'
                DataSource = dsPessoaFisica
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                UnboundDataType = wwDefault
              end
              object wwDBSpinEdit2: TwwDBSpinEdit
                Left = 9
                Top = 63
                Width = 121
                Height = 21
                Increment = 1
                MaxValue = 100
                DataField = 'NUMDEPSALF_PADRAO'
                DataSource = dsPessoaFisica
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                UnboundDataType = wwDefault
              end
              object wwDBSpinEdit3: TwwDBSpinEdit
                Left = 9
                Top = 102
                Width = 121
                Height = 21
                Increment = 1
                MaxValue = 100
                DataField = 'NUMDEPTOT_PADRAO'
                DataSource = dsPessoaFisica
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
                UnboundDataType = wwDefault
              end
            end
          end
        end
        object tbsContasBancarias: TTabSheet
          Caption = 'Contas Bancárias'
          object dbgrdContaBancaria: TwwDBGrid
            Left = 0
            Top = 0
            Width = 677
            Height = 234
            Selected.Strings = (
              'BANCO'#9'23'#9'Banco'
              'AGENCIA'#9'29'#9'Agência'
              'CONTACORRENTE'#9'17'#9'Conta Corrente'
              'FLGCONTAPREF'#9'13'#9'Conta Preferencial')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsContaBancaria
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 677
            Height = 234
            Align = alClient
            BevelOuter = bvLowered
            TabOrder = 1
            object GroupBoxBanco: TGroupBox
              Left = 18
              Top = 10
              Width = 351
              Height = 117
              TabOrder = 0
              object Label38: TLabel
                Left = 15
                Top = 65
                Width = 47
                Height = 13
                Caption = 'Agência'
              end
              object Label39: TLabel
                Left = 15
                Top = 19
                Width = 37
                Height = 13
                Caption = 'Banco'
              end
              object dblkpcmbAgencia: TwwDBLookupCombo
                Left = 15
                Top = 78
                Width = 300
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'AGENCIA'#9'60'#9'Agência'
                  'NUMAGENCIA'#9'15'#9'Nº')
                DataField = 'IDAGENCIA'
                DataSource = dsContaBancaria
                LookupTable = qryAgencia
                LookupField = 'IDPESSOA'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                OnEnter = dblkpcmbAgenciaEnter
              end
              object dblkpcmbBanco: TwwDBLookupCombo
                Left = 15
                Top = 32
                Width = 300
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'BANCO'#9'60'#9'Banco'
                  'NUMBANCO'#9'10'#9'Nº')
                LookupTable = qryBanco
                LookupField = 'BANCO'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                OnCloseUp = dblkpcmbBancoCloseUp
              end
            end
            object GroupBoxConta: TGroupBox
              Left = 18
              Top = 137
              Width = 349
              Height = 96
              TabOrder = 1
              object Label40: TLabel
                Left = 15
                Top = 16
                Width = 86
                Height = 13
                Caption = 'Conta Corrente'
              end
              object dbedContaCorrente: TwwDBEdit
                Left = 15
                Top = 29
                Width = 300
                Height = 21
                DataField = 'CONTACORRENTE'
                DataSource = dsContaBancaria
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dbcbFlgContaPref: TDBCheckBox
                Left = 15
                Top = 66
                Width = 184
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Conta Preferencial'
                DataField = 'FLGCONTAPREF'
                DataSource = dsContaBancaria
                TabOrder = 1
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 775
      end
      inherited Dock974: TDock97
        Left = 689
        Height = 262
      end
    end
    inherited pnlMestre: TPanel
      Width = 783
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
  inherited Dock972: TDock97
    Width = 793
  end
  inherited Dock971: TDock97
    Width = 793
    inherited tb97Fundo: TToolbar97
      Left = 623
      DockPos = 623
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 455
      DockPos = 455
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Dependente')
    Tabelas.Strings = (
      'PESSOA'
      'DEPENDENTE'
      'DEPENTIT')
    CamposChave.Strings = (
      'DEPENDENTE.IDPESSOA')
    Filtro.Strings = (
      'PESSOA.FLGDEPENDENTE = 1'
      'PESSOA.IDPESSOA = DEPENDENTE.IDPESSOA'
      'DEPENTIT.IDPESSOA = DEPENDENTE.IDPESSOA'
      'DEPENTIT.IDPESSOA <> DEPENTIT.IDTITULAR')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 358
  end
  inherited updSubTipo: TUpdateSQL
    ModifySQL.Strings = (
      'update DEPENDENTE'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDSITDEPENDENTE = :IDSITDEPENDENTE,'
      '  FLGDESIGNADO = :FLGDESIGNADO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into DEPENDENTE'
      '  (IDPESSOA, IDSITDEPENDENTE, FLGDESIGNADO)'
      'values'
      '  (:IDPESSOA, :IDSITDEPENDENTE, :FLGDESIGNADO)')
    DeleteSQL.Strings = (
      'delete from DEPENDENTE'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Top = 61
  end
  inherited qrySubTipo: TwwQuery
    AfterInsert = qrySubTipoAfterInsert
    AfterScroll = qrySubTipoAfterScroll
    SQL.Strings = (
      'SELECT IDPESSOA, IDSITDEPENDENTE, FLGDESIGNADO'
      'FROM DEPENDENTE'
      'WHERE IDPESSOA = :IdPessoa ')
    Left = 410
    Top = 56
  end
  inherited dsPessoaFisica: TwwDataSource
    OnStateChange = dsPessoaFisicaStateChange
  end
  inherited ImageList1: TImageList
    Left = 55
    Top = 389
    Bitmap = {
      494C01010C000F00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001001000000000000020
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
      0000000000000000000000000000000000000000104210421042104210421042
      1042104210421042104210421042104200000000104210421042104210421042
      1042104210421042104210421042104200000000104210421042104210421042
      1042104210421042104210421042104200000000104210421042104210421042
      1042104210421042104210421042104200001863000000000000000000000000
      0000000000000000000000000000104200001863000000000000000000000000
      0000000000000000000000000000104200001863000000000000000000000000
      0000000000000000000000000000104200001863000000000000000000000000
      00000000000000000000000000001042000018630000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7F1000100010001000
      FF7F0000FF7F00000000FF7F00001042000018630000FF7F1000100010001000
      FF7F0000FF7F00000000FF7F00001042000018630000FF7F1000100010001000
      FF7F0000FF7F00000000FF7F00001042000018630000FF7F1000100010001000
      FF7F0000FF7F00000000FF7F00001042000018630000FF7FFF7F00000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7F00000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7F00000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7F00000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7F0000004000400000
      FF7F00000000FF7F0000FF7F00001042000018630000FF7F0000004000400000
      FF7FFF7FFF7FFF7FFF7FFF7F00000000000018630000FF7F0000004000400000
      FF7F00000000FF7F0000FF7F00001042000018630000FF7F0000004000400000
      FF7FFF7FFF7FFF7FFF7FFF7F00000000000018630000FF7F0000004000400000
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7F0000004000400000
      00000000000000000000000000000000104218630000FF7F0000004000400000
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7F0000004000400000
      00000000000000000000000000000000104218630000FF7F0000000000000000
      FF7F0000000000000000FF7F00001042000018630000FF7F0000000000001042
      00000000104210421042000000001042000018630000FF7F0000000000000000
      FF7F0000000000000000FF7F00001042000018630000FF7F0000000000001042
      00000000104210421042000000001042000018630000FF7FFF7F10421042FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7F104200001042
      00001042186310421042104200001042000018630000FF7FFF7F10421042FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7F104200001042
      0000104218631042104210420000104200001863000000000000000000000000
      0000000000000000000000000000104200001863000000000000000000001042
      00001042FF7F1042104210420000104200001863000000000000000000000000
      0000000000000000000000000000104200001863000000000000000000001042
      00001042FF7F1042104210420000104200001863186318631863186300000000
      000000000000104218631863186300000000186318631863186318630000FF7F
      0000000010421042104200000000FF7F00001863186318631863186300000000
      000000000000104218631863186300000000186318631863186318630000FF7F
      0000000010421042104200000000FF7F00000000000000000000186300000000
      000000000000104200000000000000000000000000000000000000000000FF7F
      FF7F00000000000000000000FF7FFF7F00000000000000000000186300000000
      000000000000104200000000000000000000000000000000000000000000FF7F
      FF7F00000000000000000000FF7FFF7F00000000000000000000186300000000
      0000000000001042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000186300000000
      0000000000001042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000186318631863
      1863186318630000000000000000000000000000000000000000000000000000
      000010420000FF7F000010420000000000000000000000000000186318631863
      1863186318630000000000000000000000000000000000000000000000000000
      000010420000FF7F000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000010420000104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000010420000104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000104210421042104210421042
      1042104210421042104210421042104200000000104210421042104210421042
      1042104210421042104210421042104200000000104210421042104210421042
      1042104210421042104210421042104200000000104210421042104210421042
      1042104210421042104210421042104200001863000000000000000000000000
      0000000000000000000000000000104200001863000000000000000000000000
      0000000000000000000000000000104200001863000000000000000000000000
      0000000000000000000000000000104200001863000000000000000000000000
      00000000000000000000000000001042000018630000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7F1000100010001000
      FF7F0000FF7F00000000FF7F00001042000018630000FF7F1000100010001000
      FF7F0000FF7F00000000FF7F00001042000018630000FF7F1000100010001000
      FF7F0000FF7F00000000FF7F00001042000018630000FF7F1000100010001000
      FF7F0000FF7F00000000FF7F00001042000018630000FF7FFF7F00000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7F00000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7F00000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7F00000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7F0000004000400000
      FF7F00000000FF7F0000FF7F00001042000018630000FF7F0000004000400000
      FF7FFF7FFF7FFF7FFF7FFF7F00000000000018630000FF7F0000004000400000
      FF7F00000000FF7F0000FF7F00001042000018630000FF7F0000004000400000
      FF7FFF7FFF7FFF7FFF7FFF7F00000000000018630000FF7F0000004000400000
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7F0000004000400000
      00000000000000000000000000000000104218630000FF7F0000004000400000
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7F0000004000400000
      00000000000000000000000000000000104218630000FF7F0000000000000000
      FF7F0000000000000000FF7F00001042000018630000FF7F0000000000001042
      00000000104210421042000000001042000018630000FF7F0000000000000000
      FF7F0000000000000000FF7F00001042000018630000FF7F0000000000001042
      00000000104210421042000000001042000018630000FF7FFF7F10421042FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7F104200001042
      00001042186310421042104200001042000018630000FF7FFF7F10421042FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7F104200001042
      0000104218631042104210420000104200001863000000000000000000000000
      0000000000000000000000000000104200001863000000000000000000001042
      00001042FF7F1042104210420000104200001863000000000000000000000000
      0000000000000000000000000000104200001863000000000000000000001042
      00001042FF7F1042104210420000104200001863186318631863186300000000
      000000000000104218631863186300000000186318631863186318630000FF7F
      0000000010421042104200000000FF7F00001863186318631863186300000000
      000000000000104218631863186300000000186318631863186318630000FF7F
      0000000010421042104200000000FF7F00000000000000000000186300000000
      000000000000104200000000000000000000000000000000000000000000FF7F
      FF7F00000000000000000000FF7FFF7F00000000000000000000186300000000
      000000000000104200000000000000000000000000000000000000000000FF7F
      FF7F00000000000000000000FF7FFF7F00000000000000000000186300000000
      0000000000001042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000186300000000
      0000000000001042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000186318631863
      1863186318630000000000000000000000000000000000000000000000000000
      000010420000FF7F000010420000000000000000000000000000186318631863
      1863186318630000000000000000000000000000000000000000000000000000
      000010420000FF7F000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000010420000104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000010420000104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000104210421042104210421042
      1042104210421042104210421042104200000000104210421042104210421042
      1042104210421042104210421042104200000000104210421042104210421042
      1042104210421042104210421042104200000000104210421042104210421042
      1042104210421042104210421042104200001863000000000000000000000000
      0000000000000000000000000000104200001863000000000000000000000000
      0000000000000000000000000000104200001863000000000000000000000000
      0000000000000000000000000000104200001863000000000000000000000000
      00000000000000000000000000001042000018630000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7F1000100010001000
      FF7F0000FF7F00000000FF7F00001042000018630000FF7F1000100010001000
      FF7F0000FF7F00000000FF7F00001042000018630000FF7F1000100010001000
      FF7F0000FF7F00000000FF7F00001042000018630000FF7F1000100010001000
      FF7F0000FF7F00000000FF7F00001042000018630000FF7FFF7F00000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7F00000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7F00000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7F00000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7F0000004000400000
      FF7F00000000FF7F0000FF7F00001042000018630000FF7F0000004000400000
      FF7FFF7FFF7FFF7FFF7FFF7F00000000000018630000FF7F0000004000400000
      FF7F00000000FF7F0000FF7F00001042000018630000FF7F0000004000400000
      FF7FFF7FFF7FFF7FFF7FFF7F00000000000018630000FF7F0000004000400000
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7F0000004000400000
      00000000000000000000000000000000104218630000FF7F0000004000400000
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7F0000004000400000
      00000000000000000000000000000000104218630000FF7F0000000000000000
      FF7F0000000000000000FF7F00001042000018630000FF7F0000000000001042
      00000000104210421042000000001042000018630000FF7F0000000000000000
      FF7F0000000000000000FF7F00001042000018630000FF7F0000000000001042
      00000000104210421042000000001042000018630000FF7FFF7F10421042FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7F104200001042
      00001042186310421042104200001042000018630000FF7FFF7F10421042FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7F104200001042
      0000104218631042104210420000104200001863000000000000000000000000
      0000000000000000000000000000104200001863000000000000000000001042
      00001042FF7F1042104210420000104200001863000000000000000000000000
      0000000000000000000000000000104200001863000000000000000000001042
      00001042FF7F1042104210420000104200001863186318631863186300000000
      000000000000104218631863186300000000186318631863186318630000FF7F
      0000000010421042104200000000FF7F00001863186318631863186300000000
      000000000000104218631863186300000000186318631863186318630000FF7F
      0000000010421042104200000000FF7F00000000000000000000186300000000
      000000000000104200000000000000000000000000000000000000000000FF7F
      FF7F00000000000000000000FF7FFF7F00000000000000000000186300000000
      000000000000104200000000000000000000000000000000000000000000FF7F
      FF7F00000000000000000000FF7FFF7F00000000000000000000186300000000
      0000000000001042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000186300000000
      0000000000001042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000186318631863
      1863186318630000000000000000000000000000000000000000000000000000
      000010420000FF7F000010420000000000000000000000000000186318631863
      1863186318630000000000000000000000000000000000000000000000000000
      000010420000FF7F000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000010420000104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000001042000010420000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFF8001800180018001
      0001000100010001000100010001000100010001000100010001000100010001
      0001000300010003000100000001000000010000000100000001000000010000
      00010000000100000003000000030000F39FF800F39FF800F01FF800F01FF800
      F03FFD05F03FFD05FFFFFF8FFFFFFF8FFFFFFFFFFFFFFFFF8001800180018001
      0001000100010001000100010001000100010001000100010001000100010001
      0001000300010003000100000001000000010000000100000001000000010000
      00010000000100000003000000030000F39FF800F39FF800F01FF800F01FF800
      F03FFD05F03FFD05FFFFFF8FFFFFFF8FFFFFFFFFFFFFFFFF8001800180018001
      0001000100010001000100010001000100010001000100010001000100010001
      0001000300010003000100000001000000010000000100000001000000010000
      00010000000100000003000000030000F39FF800F39FF800F01FF800F01FF800
      F03FFD05F03FFD05FFFFFF8FFFFFFF8F00000000000000000000000000000000
      000000000000}
  end
  inherited qryDocumento: TwwQuery
    Left = 57
    Top = 423
  end
  inherited dsDocumento: TwwDataSource
    Left = 189
    Top = 417
  end
  inherited updDocumento: TUpdateSQL
    Left = 129
    Top = 417
  end
  inherited dsEscolhePessoa: TwwDataSource
    Top = 116
  end
  inherited Pessoa: TPessoa
    TipoPessoa = tpFisica
    SubTipo = stDependente
    OnChangeSubtipo = PessoaChangeSubtipo
    OnSaveSubtipo = PessoaSaveSubtipo
    Left = 300
    Top = 8
  end
  inherited OpenPictureDialog1: TOpenPictureDialog
    Left = 133
    Top = 389
  end
  inherited qryImagensDoc: TwwQuery
    Left = 54
    Top = 456
  end
  inherited dsImagensDoc: TwwDataSource
    Left = 190
    Top = 461
  end
  object qrySitDependente: TwwQuery [46]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDSITDEPENDENTE, DESCRICAO '
      'FROM SITDEPENDENTE'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 258
    Top = 463
  end
  object qryNaturalidade: TwwQuery [47]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT ESTADO."CODESTADO" , '
      ' ESTADO."NOMEESTADO" , PAIS."IDPAIS" , '
      ' PAIS."NOMEPAIS", PAIS."NOMENACIONALIDADE"'
      'FROM "ESTADO" ESTADO , "PAIS" PAIS'
      'WHERE ( ESTADO.IDPAIS = PAIS.IDPAIS )'
      'ORDER BY'
      ' ESTADO."NOMEESTADO"'
      '')
    ValidateWithMask = True
    Left = 644
    Top = 375
  end
  object qryBanco: TwwQuery [48]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BANCO.IDPESSOA, PESSOA.NOME AS BANCO, BANCO.NUMBANCO'
      'FROM BANCO, PESSOA'
      'WHERE BANCO.IDPESSOA = PESSOA.IDPESSOA ')
    ValidateWithMask = True
    Left = 528
    Top = 236
  end
  object qryAgencia: TwwQuery [49]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  AGENCIABANCARIA.IDPESSOA,'
      '               AGENCIA.NOME AS AGENCIA, '
      '               AGENCIABANCARIA.NUMAGENCIA'
      'FROM AGENCIABANCARIA, PESSOA AGENCIA'
      'WHERE AGENCIABANCARIA.IDPESSOA  = AGENCIA.IDPESSOA AND'
      '               AGENCIABANCARIA.IDBANCO=:pIdBanco'
      '')
    ValidateWithMask = True
    Left = 532
    Top = 301
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdBanco'
        ParamType = ptUnknown
      end>
  end
  object qryContaBancaria: TwwQuery [50]
    CachedUpdates = True
    AfterInsert = qryContaBancariaAfterInsert
    BeforePost = qryContaBancariaBeforePost
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT CONTABANCARIA."IDCBANCARIA",'
      '               CONTABANCARIA."CONTACORRENTE",'
      '               CONTABANCARIA."IDAGENCIA",'
      '               CONTABANCARIA."FLGCONTAPREF",'
      '               CONTABANCARIA."IDPESSOA",'
      '               AGENCIA."NOME" AS AGENCIA,'
      '               BANCO."NOME" AS BANCO'
      'FROM "CONTABANCARIA" CONTABANCARIA, "PESSOA" AGENCIA,'
      '           "PESSOA" BANCO, "AGENCIABANCARIA" AGENCIABANCARIA'
      'WHERE CONTABANCARIA."IDPESSOA" = :IDPESSOA AND'
      
        '               CONTABANCARIA."IDAGENCIA" = AGENCIA."IDPESSOA" AN' +
        'D'
      
        '               CONTABANCARIA."IDAGENCIA"  = AGENCIABANCARIA."IDP' +
        'ESSOA" AND'
      '               AGENCIABANCARIA."IDBANCO" =  BANCO."IDPESSOA" '
      '')
    UpdateObject = updContaBancaria
    ControlType.Strings = (
      'FLGCONTAPREF;CheckBox;1;0')
    ValidateWithMask = True
    Left = 526
    Top = 348
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsContaBancaria: TwwDataSource [51]
    DataSet = qryContaBancaria
    Left = 527
    Top = 391
  end
  object updContaBancaria: TUpdateSQL [52]
    ModifySQL.Strings = (
      'update "CONTABANCARIA"'
      'set'
      '  IDCBANCARIA = :IDCBANCARIA,'
      '  CONTACORRENTE = :CONTACORRENTE,'
      '  IDAGENCIA = :IDAGENCIA,'
      '  FLGCONTAPREF = :FLGCONTAPREF,'
      '  IDPESSOA = :IDPESSOA'
      'where'
      '  IDCBANCARIA = :OLD_IDCBANCARIA and'
      '  CONTACORRENTE = :OLD_CONTACORRENTE and'
      '  IDAGENCIA = :OLD_IDAGENCIA and'
      '  FLGCONTAPREF = :OLD_FLGCONTAPREF and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into "CONTABANCARIA"'
      
        '  (IDCBANCARIA, CONTACORRENTE, IDAGENCIA, FLGCONTAPREF, IDPESSOA' +
        ')'
      'values'
      
        '  (:IDCBANCARIA, :CONTACORRENTE, :IDAGENCIA, :FLGCONTAPREF, :IDP' +
        'ESSOA)')
    DeleteSQL.Strings = (
      'delete from "CONTABANCARIA"'
      'where'
      '  IDCBANCARIA = :OLD_IDCBANCARIA and'
      '  CONTACORRENTE = :OLD_CONTACORRENTE and'
      '  IDAGENCIA = :OLD_IDAGENCIA and'
      '  FLGCONTAPREF = :OLD_FLGCONTAPREF and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 516
    Top = 428
  end
  object qryAux: TwwQuery [53]
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 448
    Top = 211
  end
end
