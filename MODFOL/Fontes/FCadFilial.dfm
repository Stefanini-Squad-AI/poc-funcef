inherited frmCadFilial: TfrmCadFilial
  Left = -4
  Top = -4
  Caption = 'Filial'
  ClientHeight = 581
  WindowState = wsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 495
    BorderWidth = 2
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 4
      Top = 109
      Width = 796
      Height = 382
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos'
        'Dados para Folha'
        'Dados para FGTS'
        'Outras Guias')
      detdbGrids.Strings = (
        ''
        'dbGrdDet'
        'dbgTelefone'
        'dbgContato'
        ''
        ''
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 698
        Height = 323
        inherited tbsDocumento: TTabSheet
          inherited PgCtrlPesFisica_Padrao: TPageControl
            Width = 690
            Height = 295
          end
          inherited PnlDocumentos_Padrao: TPanel
            Width = 690
            Height = 295
            inherited pnlItemsDoc: TPanel
              Height = 293
            end
            inherited pnlFoto: TPanel
              Width = 200
              Height = 293
              inherited Bevel1: TBevel
                Height = 262
              end
              inherited PnlAssociaFoto_Padrao: TPanel
                Top = 262
                Width = 196
                inherited btnAssociarimgPessoa: TButton
                  Caption = 'Associar &Logotipo'
                end
              end
              inherited SbImagePessoa_Padrao: TScrollBox
                Width = 194
                Height = 262
              end
            end
            inherited lstDocumentos: TListView
              Height = 293
            end
          end
        end
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel
            Width = 690
            Height = 295
            inherited grpTipoEnd: TGroupBox
              Left = 493
              Height = 295
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 690
            Height = 295
          end
        end
        inherited tbsTelefone: TTabSheet
          inherited dbgTelefone: TwwDBGrid
            Width = 690
            Height = 295
          end
          inherited Panel1: TPanel
            Width = 690
            Height = 295
          end
        end
        inherited tbsContato: TTabSheet
          inherited Panel2: TPanel
            Width = 690
            Height = 295
          end
          inherited dbgContato: TwwDBGrid
            Width = 690
            Height = 295
          end
        end
        object tbshFolha: TTabSheet
          Caption = 'Dados para Folha'
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
            object Label14: TLabel
              Left = 5
              Top = 26
              Width = 116
              Height = 13
              Caption = 'Adic.Noturno: Início'
            end
            object Label15: TLabel
              Left = 5
              Top = 56
              Width = 102
              Height = 13
              Caption = 'Adic.Noturno: Fim'
            end
            object Label20: TLabel
              Left = 218
              Top = 26
              Width = 139
              Height = 13
              Caption = 'Extra Diurno Antecipado'
            end
            object Label21: TLabel
              Left = 218
              Top = 56
              Width = 170
              Height = 13
              Caption = 'Extra Diurno Após Expediente'
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
              TabOrder = 1
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
              TabOrder = 2
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
            Height = 76
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
            object wwDBLookupCombo3: TwwDBLookupCombo
              Left = 141
              Top = 42
              Width = 283
              Height = 21
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'DESCRICAO')
              DataField = 'IDNATEMPRE'
              DataSource = dsSubTipo
              LookupTable = tblNatEmpr
              LookupField = 'IDNATEMPRE'
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
        end
        object tbshGRE: TTabSheet
          Caption = 'Dados para FGTS'
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
            TabOrder = 2
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
            TabOrder = 4
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
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object gbxCustosEspec: TGroupBox
            Left = 240
            Top = 114
            Width = 202
            Height = 91
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
              Top = 51
              Width = 66
              Height = 13
              Caption = 'Patrocínios'
            end
            object dbedCustoRural: TwwDBEdit
              Left = 36
              Top = 27
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
              Top = 63
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
          Caption = 'Outras Guias'
          object gbxGRCS: TGroupBox
            Left = 350
            Top = 1
            Width = 320
            Height = 110
            Caption = 'GRCS'
            TabOrder = 1
            object Label31: TLabel
              Left = 17
              Top = 14
              Width = 54
              Height = 13
              Caption = 'Sindicato'
            end
            object Label32: TLabel
              Left = 18
              Top = 56
              Width = 108
              Height = 13
              Caption = 'Dia de Vencimento'
            end
            object Label33: TLabel
              Left = 21
              Top = 80
              Width = 95
              Height = 13
              Caption = 'Base da Receita'
            end
            object wwDBLookupCombo2: TwwDBLookupCombo
              Left = 18
              Top = 27
              Width = 283
              Height = 21
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'NOME'#9'60'#9'NOME')
              DataField = 'IDSINDICATO'
              DataSource = dsSubTipo
              LookupTable = qrySindicato
              LookupField = 'IDPESSOA'
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
            end
            object wwDBEdit12: TwwDBEdit
              Left = 138
              Top = 51
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
              Top = 78
              Width = 158
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '             0,00')
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
            Top = 119
            Width = 320
            Height = 95
            Caption = 'DARF'
            TabOrder = 2
            object Label36: TLabel
              Left = 17
              Top = 17
              Width = 109
              Height = 13
              Caption = 'Índice de Correção'
            end
            object Label37: TLabel
              Left = 18
              Top = 65
              Width = 108
              Height = 13
              Caption = 'Dia de Vencimento'
            end
            object wwDBLookupCombo6: TwwDBLookupCombo
              Left = 18
              Top = 30
              Width = 283
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'MOEDESC'#9'20'#9'MOEDESC')
              DataField = 'IDMOEDADARF'
              DataSource = dsSubTipo
              LookupTable = qryMoeda
              LookupField = 'MOECODIGO'
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
            end
            object wwDBEdit13: TwwDBEdit
              Left = 138
              Top = 60
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
            Height = 213
            Caption = 'GPS'
            TabOrder = 0
            object Label34: TLabel
              Left = 17
              Top = 11
              Width = 109
              Height = 13
              Caption = 'Índice de Correção'
            end
            object Label35: TLabel
              Left = 17
              Top = 44
              Width = 185
              Height = 13
              Caption = 'Seguro de Acidente do Trabalho'
            end
            object Label29: TLabel
              Left = 17
              Top = 77
              Width = 32
              Height = 13
              Caption = 'FPAS'
            end
            object Label38: TLabel
              Left = 17
              Top = 108
              Width = 143
              Height = 13
              Caption = 'Convênio Previdenciário '
            end
            object Label39: TLabel
              Left = 17
              Top = 140
              Width = 92
              Height = 13
              Caption = 'Categoria CNAE'
            end
            object Label40: TLabel
              Left = 17
              Top = 173
              Width = 62
              Height = 13
              Caption = 'Item CNAE'
            end
            object wwDBLookupCombo4: TwwDBLookupCombo
              Left = 17
              Top = 24
              Width = 283
              Height = 21
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'MOEDESC'#9'20'#9'MOEDESC')
              DataField = 'IDMOEDAGRPS'
              DataSource = dsSubTipo
              LookupTable = qryMoeda
              LookupField = 'MOECODIGO'
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
            end
            object wwDBLookupCombo5: TwwDBLookupCombo
              Left = 17
              Top = 57
              Width = 283
              Height = 21
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'DESCRICAO'#9'120'#9'DESCRICAO')
              DataField = 'IDSEGACIDTRAB'
              DataSource = dsSubTipo
              LookupTable = tblSegAcid
              LookupField = 'IDSEGACIDTRAB'
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
            end
            object dblcFPAS: TwwDBLookupCombo
              Left = 17
              Top = 88
              Width = 283
              Height = 21
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'DESCPEQUENA'#9'80'#9'DESCPEQUENA')
              DataField = 'IDFPAS'
              DataSource = dsSubTipo
              LookupTable = tblFPAS
              LookupField = 'IDFPAS'
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              OnCloseUp = dblcFPASCloseUp
            end
            object dblcConvPrev: TwwDBLookupCombo
              Left = 17
              Top = 120
              Width = 283
              Height = 21
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'DESCRICAO'#9'60'#9'DESCRICAO')
              DataField = 'IDCONVPREVID'
              DataSource = dsSubTipo
              LookupTable = qryConvPrev
              LookupField = 'IDCONVPREVID'
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
            end
            object dblcCatCNAE: TwwDBLookupCombo
              Left = 17
              Top = 153
              Width = 283
              Height = 21
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'DESCRICAO'#9'180'#9'DESCRICAO')
              DataField = 'IDCATCNAE'
              DataSource = dsSubTipo
              LookupTable = tblCatCNAE
              LookupField = 'IDCATCNAE'
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              OnCloseUp = dblcCatCNAECloseUp
            end
            object dblcItemCNAE: TwwDBLookupCombo
              Left = 17
              Top = 186
              Width = 283
              Height = 21
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'DESCRICAO'#9'120'#9'DESCRICAO')
              DataField = 'IDITEMCNAE'
              DataSource = dsSubTipo
              LookupTable = qryItemCNAE
              LookupField = 'IDITEMCNAE'
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 788
      end
      inherited Dock974: TDock97
        Left = 702
        Height = 323
      end
    end
    inherited pnlMestre: TPanel
      Left = 4
      Top = 4
      Width = 796
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
  inherited Dock971: TDock97
    Top = 542
    inherited tb97Fundo: TToolbar97
      Left = 532
      DockPos = 532
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 364
      DockPos = 364
    end
  end
  inherited MontaSelect: TMontaSelect
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
  end
  inherited updSubTipo: TUpdateSQL
    ModifySQL.Strings = (
      'update FILIALPESSOA'
      'set'
      '  FICHAREGINI = :FICHAREGINI,'
      '  FICHAREGFIM = :FICHAREGFIM,'
      '  ADICNOTURINI = :ADICNOTURINI,'
      '  ADICNOTURFIM = :ADICNOTURFIM,'
      '  EXTRADIURNOINI = :EXTRADIURNOINI,'
      '  EXTRADIURNOFIM = :EXTRADIURNOFIM,'
      '  EXTRANOTURINI = :EXTRANOTURINI,'
      '  EXTRANOTURFIM = :EXTRANOTURFIM,'
      '  EXTRAORDININI = :EXTRAORDININI,'
      '  EXTRAORDINFIM = :EXTRAORDINFIM,'
      '  DATAINICIOATIV = :DATAINICIOATIV,'
      '  DIAVENCDARF = :DIAVENCDARF,'
      '  IDMOEDADARF = :IDMOEDADARF,'
      '  IDNATEMPRE = :IDNATEMPRE,'
      '  UNIDTRABALHO = :UNIDTRABALHO,'
      '  FLGESPFGTS = :FLGESPFGTS,'
      '  INDTIPOEMPRESA = :INDTIPOEMPRESA,'
      '  INDORIGEMCGC = :INDORIGEMCGC,'
      '  DIAVENCGRE = :DIAVENCGRE,'
      '  IDSINDICATO = :IDSINDICATO,'
      '  DIAVENCGRCS = :DIAVENCGRCS,'
      '  IDMOEDAGRPS = :IDMOEDAGRPS,'
      '  IDSEGACIDTRAB = :IDSEGACIDTRAB,'
      '  VLRBASERECEITA = :VLRBASERECEITA,'
      '  IDFPAS = :IDFPAS,'
      '  IDCONVPREVID = :IDCONVPREVID,'
      '  IDCATCNAE = :IDCATCNAE,'
      '  IDITEMCNAE = :IDITEMCNAE,'
      '  CUSTORURAL = :CUSTORURAL,'
      '  CUSTOPATROC = :CUSTOPATROC'
      'where'
      '  IDFILIALPESSOA = :OLD_IDFILIALPESSOA')
    InsertSQL.Strings = (
      'insert into FILIALPESSOA'
      '  (IDFILIALPESSOA, FICHAREGINI, FICHAREGFIM, ADICNOTURINI, '
      'ADICNOTURFIM, '
      
        '   EXTRADIURNOINI, EXTRADIURNOFIM, EXTRANOTURINI, EXTRANOTURFIM,' +
        ' '
      'EXTRAORDININI, '
      '   EXTRAORDINFIM, DATAINICIOATIV, DIAVENCDARF, IDMOEDADARF, '
      'IDNATEMPRE, '
      '   UNIDTRABALHO, FLGESPFGTS, INDTIPOEMPRESA, INDORIGEMCGC, '
      'DIAVENCGRE, '
      '   IDSINDICATO, DIAVENCGRCS, IDMOEDAGRPS, IDSEGACIDTRAB, '
      'VLRBASERECEITA, '
      '   IDFPAS, IDCONVPREVID, IDCATCNAE, IDITEMCNAE, CUSTORURAL, '
      'CUSTOPATROC)'
      'values'
      '  (:IDFILIALPESSOA, :FICHAREGINI, :FICHAREGFIM, :ADICNOTURINI, '
      ':ADICNOTURFIM, '
      '   :EXTRADIURNOINI, :EXTRADIURNOFIM, :EXTRANOTURINI, '
      ':EXTRANOTURFIM, :EXTRAORDININI, '
      '   :EXTRAORDINFIM, :DATAINICIOATIV, :DIAVENCDARF, :IDMOEDADARF, '
      ':IDNATEMPRE, '
      '   :UNIDTRABALHO, :FLGESPFGTS, :INDTIPOEMPRESA, :INDORIGEMCGC, '
      ':DIAVENCGRE, '
      '   :IDSINDICATO, :DIAVENCGRCS, :IDMOEDAGRPS, :IDSEGACIDTRAB, '
      ':VLRBASERECEITA, '
      
        '   :IDFPAS, :IDCONVPREVID, :IDCATCNAE, :IDITEMCNAE, :CUSTORURAL,' +
        ' '
      ':CUSTOPATROC)')
    DeleteSQL.Strings = (
      'delete from FILIALPESSOA'
      'where'
      '  IDFILIALPESSOA = :OLD_IDFILIALPESSOA')
    Left = 516
    Top = 69
  end
  inherited qrySubTipo: TwwQuery
    AfterScroll = qrySubTipoAfterScroll
    SQL.Strings = (
      'SELECT * FROM FILIALPESSOA'
      'WHERE ( IDFILIALPESSOA =  :IdPessoa )')
    Left = 482
    Top = 64
  end
  inherited dsSubTipo: TwwDataSource
    Left = 545
    Top = 64
  end
  inherited qryDocumento: TwwQuery
    Left = 73
    Top = 196
  end
  inherited dsDocumento: TwwDataSource
    Left = 111
    Top = 186
  end
  inherited updDocumento: TUpdateSQL
    Left = 30
    Top = 178
  end
  inherited dsEscolhePessoa: TwwDataSource
    Left = 317
    Top = 124
  end
  inherited Pessoa: TPessoa
    SubTipo = stFilial
    FormCaption = 'Estabelecimento'
  end
  inherited updImagensDoc: TUpdateSQL
    Left = 70
    Top = 234
  end
  inherited qryImagensDoc: TwwQuery
    Left = 164
    Top = 207
  end
  inherited dsImagensDoc: TwwDataSource
    Left = 141
    Top = 227
  end
  inherited MSGrupo: TMontaSelect
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
  end
  object tblNatEmpr: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDNATEMPRE'
    TableName = 'CM.NATEMPRESA'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 170
    Top = 480
  end
  object tblSegAcid: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDSEGACIDTRAB'
    TableName = 'CM.SEGACIDTRAB'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 219
    Top = 485
  end
  object qrySindicato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDPESSOA, NOME from PESSOA where FLGSINDICATO = 1 '
      'order by upper(NOME)')
    ValidateWithMask = True
    Left = 87
    Top = 516
  end
  object qryMoeda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from MOEDA '
      'order by upper(MOEDESC)')
    ValidateWithMask = True
    Left = 27
    Top = 513
  end
  object tblFPAS: TwwTable
    OnCalcFields = tblFPASCalcFields
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDFPAS'
    TableName = 'CM.FPAS'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 396
    Top = 499
    object tblFPASIDFPAS: TFloatField
      FieldName = 'IDFPAS'
      Required = True
    end
    object tblFPASDESCRICAO: TMemoField
      FieldName = 'DESCRICAO'
      Required = True
      BlobType = ftMemo
      Size = 800
    end
    object tblFPASDESCPEQUENA: TStringField
      FieldKind = fkCalculated
      FieldName = 'DESCPEQUENA'
      Size = 80
      Calculated = True
    end
  end
  object tblCatCNAE: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDCATCNAE'
    TableName = 'CM.CATCNAE'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 267
    Top = 442
  end
  object qryItemCNAE: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from ITEMCNAE '
      'where IDCATCNAE =:CodCateg'
      'order by upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 327
    Top = 507
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodCateg'
        ParamType = ptUnknown
      end>
  end
  object qryConvPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from CONVPREVID '
      'where IDFPAS =:CodFPAS'
      'order by upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 453
    Top = 498
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodFPAS'
        ParamType = ptUnknown
      end>
  end
end
