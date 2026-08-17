inherited FrmCadPlanass: TFrmCadPlanass
  Left = 201
  Top = 46
  Caption = 'Cadastro de Plano Assistencial'
  ClientHeight = 537
  ClientWidth = 766
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 766
    Height = 451
    inherited pnlMestre: TPanel
      Width = 764
      Height = 48
      object Label1: TLabel
        Left = 8
        Top = 0
        Width = 87
        Height = 13
        Caption = 'Nome do Plano'
      end
      object dbeNomePlano: TDBEdit
        Left = 8
        Top = 16
        Width = 489
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOME'
        DataSource = ds
        TabOrder = 0
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 49
      Width = 764
      Height = 401
      Tabs.Strings = (
        'Informações Gerais'
        'Regras do Plano'
        'Contribuições do Plano')
      detdbGrids.Strings = (
        ''
        ''
        'dbgrdCont')
      inherited pgctrlDetalhe: TPageControl
        Width = 666
        Height = 342
        ActivePage = tbsCont
        inherited tbsDet: TTabSheet
          Caption = 'Informações Gerais'
          inherited dbgrdDet: TwwDBGrid
            Width = 658
            Height = 314
            Selected.Strings = (
              'IDCONTASS'#9'8'#9'ID Contrib.'
              'NOMECONTRIBUICAO'#9'34'#9'Nome da Contribuição'
              'PRIORIDADE'#9'8'#9'Prioridade'
              'NOMEPAGADOR'#9'15'#9'Pago por'
              'FORMAPAGTO'#9'18'#9'Forma de Pagto.')
          end
          inherited pnlControlesDet: TPanel
            Width = 658
            Height = 314
            object Label2: TLabel
              Left = 8
              Top = 0
              Width = 119
              Height = 13
              Caption = 'Nome do Fornecedor'
            end
            object Label3: TLabel
              Left = 352
              Top = 0
              Width = 116
              Height = 13
              Caption = 'Produto Assistencial'
            end
            object Label4: TLabel
              Left = 8
              Top = 64
              Width = 67
              Height = 13
              Caption = 'Nº Contrato'
            end
            object Label5: TLabel
              Left = 355
              Top = 64
              Width = 81
              Height = 13
              Caption = 'Data Vigência'
            end
            object Label6: TLabel
              Left = 528
              Top = 64
              Width = 124
              Height = 13
              Caption = 'Data Comercialização'
            end
            object Label7: TLabel
              Left = 181
              Top = 64
              Width = 72
              Height = 13
              Caption = 'Identificador'
            end
            object edtNomeFornecedor: TEdit
              Left = 8
              Top = 16
              Width = 300
              Height = 21
              CharCase = ecUpperCase
              Color = clInactiveCaption
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object btnBuscaFornecedor: TBitBtn
              Left = 308
              Top = 16
              Width = 30
              Height = 21
              Hint = 'Clique aqui para selecionar o fornecedor do pronto.'
              TabOrder = 1
              OnClick = btnBuscaFornecedorClick
              Glyph.Data = {
                F6030000424DF603000000000000360000002800000013000000100000000100
                180000000000C0030000C30E0000C30E00000000000000000000C0C0C0C0C0C0
                C0C0C0C0C0C0808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
                C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C080
                8080000000808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
                C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0808080000000FFFF
                FF000000000000808080800000800000808080000000808080808080C0C0C0C0
                C0C0C0C0C0808080808080000000C0C0C0808080000000FFFFFFC0C0C0FFFFFF
                FFFFFF800000FF0000FF00008080000000000000000000008080808080808080
                80808080000000000000C0C0C0808080000000FFFFFFFFFFFFC0C0C0C0C0C080
                0000FF0000FF0000808000FFFFFFC0C0C0FFFFFF000000000000000000000000
                000000000000808080000000FFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFF8080
                80000000C0C0C0FFFFFFFFFFFFC0C0C0FFFFFFFFFFFF808000000000C0C0C000
                0000000000FFFFFFFFFFFFFFFFFFC0C0C0C0C0C0C0C0C0800000FF0000FF0000
                808000C0C0C0C0C0C0FFFFFFFFFFFF0000FF000000C0C0C0C0C0C0000000C0C0
                C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF800000FF0000FF0000808000FF
                FFFFFFFFFFFFFFFF0000FF000000C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0
                000000000000000000000000000000C0C0C0800000FF0000FF0000808000FFFF
                FF808000000000C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0
                C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000800000FF0000FF0000808000000000
                C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
                C0808000808000C0C0C0C0C0C0C0C0C0800000FF0000808000C0C0C0C0C0C0C0
                C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FF0000
                FF0000800000C0C0C0C0C0C0800000FF0000FF0000C0C0C0C0C0C0C0C0C0C0C0
                C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080FF000080
                0000800000800000800000FF0000FF0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
                C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080FF0000FF0000FF00
                00FF0000FF0000FF0000808000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
                0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080808080FF0000FF0000
                808000808000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0
                C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
                C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000}
            end
            object dblkIdProdass: TwwDBLookupCombo
              Left = 352
              Top = 16
              Width = 305
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'40'#9'NOME')
              DataField = 'IDPRODASS'
              DataSource = ds
              LookupTable = qryProdAss
              LookupField = 'IDPRODASS'
              Style = csDropDownList
              DropDownWidth = 5
              TabOrder = 2
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
            object dbeNumContrato: TDBEdit
              Left = 8
              Top = 80
              Width = 113
              Height = 21
              CharCase = ecUpperCase
              DataField = 'NUMCONTRATO'
              DataSource = ds
              TabOrder = 3
            end
            object dtpDataVigencia: TwwDBDateTimePicker
              Left = 355
              Top = 80
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              DataField = 'DATAINICIOVIGENC'
              DataSource = ds
              Epoch = 1950
              ShowButton = True
              TabOrder = 5
            end
            object dtpDataComercial: TwwDBDateTimePicker
              Left = 528
              Top = 80
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              DataField = 'DATAINICIOCOM'
              DataSource = ds
              Epoch = 1950
              ShowButton = True
              TabOrder = 6
            end
            object dbIdent: TDBEdit
              Left = 181
              Top = 80
              Width = 73
              Height = 21
              CharCase = ecUpperCase
              DataField = 'OPCAOAIDENT'
              DataSource = ds
              TabOrder = 4
            end
            object grbOutrasOpcoes: TGroupBox
              Left = 0
              Top = 136
              Width = 649
              Height = 129
              Caption = '  Outras Opções  '
              TabOrder = 7
              object sbtnOpcoes: TSpeedButton
                Left = 614
                Top = 100
                Width = 23
                Height = 20
                Hint = 'Especificar características das opções'
                Glyph.Data = {
                  42010000424D4201000000000000760000002800000011000000110000000100
                  040000000000CC00000000000000000000001000000010000000000000000000
                  BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                  DDDDD0000000DDDDDDDDDDDDDDDDD0000000D00000DDDDD00000D0000000D0FF
                  F0DDDDD0FFF0D0000000D0FFF0DDDDD0FFF0D0000000D00000DD0DD00000D000
                  0000DDD0DDD0F0DDD0DDD0000000DDD0DD0FFF0DD0DDD0000000DDD000FFFFF0
                  00DDD0000000DDDDDD0FFF0DDDDDD0000000DDDDDDD0F0DDDDDDD0000000DDDD
                  DDDD0DDDDDDDD0000000DDDDDD00000DDDDDD0000000DDDDDD0FFF0DDDDDD000
                  0000DDDDDD0FFF0DDDDDD0000000DDDDDD00000DDDDDD0000000DDDDDDDDDDDD
                  DDDDD0000000}
                ParentShowHint = False
                ShowHint = True
                OnClick = sbtnOpcoesClick
              end
              object Label20: TLabel
                Left = 541
                Top = 88
                Width = 62
                Height = 13
                Caption = 'Nº Opções'
              end
              object dbckPlanoAtivo: TDBCheckBox
                Left = 8
                Top = 16
                Width = 97
                Height = 17
                Caption = 'Plano Ativo'
                DataField = 'FLGATIVO'
                DataSource = ds
                TabOrder = 0
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object dbckCobDif: TDBCheckBox
                Left = 8
                Top = 60
                Width = 161
                Height = 17
                Caption = 'Cobrança Diferenciada'
                DataField = 'OPCAOBDIF'
                DataSource = ds
                TabOrder = 1
                ValueChecked = 'True'
                ValueUnchecked = 'False'
              end
              object dbckAceitaOpcoes: TDBCheckBox
                Left = 8
                Top = 104
                Width = 110
                Height = 17
                Caption = 'Aceitar Opções'
                DataField = 'FLGACEITAOPCAO'
                DataSource = ds
                TabOrder = 2
                ValueChecked = '1'
                ValueUnchecked = '0'
                OnClick = dbckAceitaOpcoesClick
              end
              object dbsNrOpcoes: TwwDBSpinEdit
                Left = 541
                Top = 101
                Width = 60
                Height = 21
                Increment = 1
                MaxValue = 8
                MinValue = 1
                DataField = 'NUMOPCOES'
                DataSource = ds
                TabOrder = 3
                UnboundDataType = wwDefault
              end
            end
          end
        end
        object tbsRegra: TTabSheet
          Caption = 'Regras do Plano'
          ImageIndex = 1
          object GroupBox3: TGroupBox
            Left = 0
            Top = 0
            Width = 658
            Height = 65
            Align = alTop
            Caption = '  Regra de Admissão  '
            TabOrder = 0
            object Label12: TLabel
              Left = 8
              Top = 16
              Width = 93
              Height = 13
              Caption = 'de Participantes'
            end
            object Label14: TLabel
              Left = 352
              Top = 16
              Width = 92
              Height = 13
              Caption = 'de Beneficiários'
            end
            object dblkRegraAdmParticip: TwwDBLookupCombo
              Left = 8
              Top = 32
              Width = 300
              Height = 21
              Hint = 'Define se elegível pode ser inscrito como participante no plano'
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'60'#9'NOMEREGRA')
              DataField = 'IDREGRAADMISSAO'
              DataSource = ds
              LookupTable = qryRegra
              LookupField = 'IDREGRA'
              Options = [loTitles]
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
            object dblkRegraAdmBenef: TwwDBLookupCombo
              Left = 352
              Top = 32
              Width = 300
              Height = 21
              Hint = 'Define se elegível pode ser inscrito como participante no plano'
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'60'#9'NOMEREGRA')
              DataField = 'IDREGRABENEFICIA'
              DataSource = ds
              LookupTable = qryRegra
              LookupField = 'IDREGRA'
              Options = [loTitles]
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
          end
          object GroupBox4: TGroupBox
            Left = 0
            Top = 65
            Width = 658
            Height = 65
            Align = alTop
            Caption = '  Regra de Cancelamento  '
            TabOrder = 1
            object Label15: TLabel
              Left = 8
              Top = 16
              Width = 89
              Height = 13
              Caption = 'por Desistência'
            end
            object Label16: TLabel
              Left = 352
              Top = 16
              Width = 101
              Height = 13
              Caption = 'por Inadimplencia'
            end
            object dblkRegraCancelaDesist: TwwDBLookupCombo
              Left = 8
              Top = 32
              Width = 300
              Height = 21
              Hint = 'Define se elegível pode ser inscrito como participante no plano'
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'60'#9'NOMEREGRA')
              DataField = 'IDREGRADESISTENC'
              DataSource = ds
              LookupTable = qryRegra
              LookupField = 'IDREGRA'
              Options = [loTitles]
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
            object dblkRegraCancelaInad: TwwDBLookupCombo
              Left = 352
              Top = 32
              Width = 300
              Height = 21
              Hint = 'Define se elegível pode ser inscrito como participante no plano'
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'60'#9'NOMEREGRA')
              DataField = 'IDREGRACANCELAME'
              DataSource = ds
              LookupTable = qryRegra
              LookupField = 'IDREGRA'
              Options = [loTitles]
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
          end
          object GroupBox5: TGroupBox
            Left = 0
            Top = 130
            Width = 658
            Height = 135
            Align = alTop
            Caption = '  Pagamentos e Recebimentos   '
            TabOrder = 2
            object Label17: TLabel
              Left = 8
              Top = 16
              Width = 150
              Height = 13
              Caption = 'Pagamento do Fornecedor'
            end
            object Label18: TLabel
              Left = 352
              Top = 16
              Width = 140
              Height = 13
              Caption = 'Comissão do Fornecedor'
            end
            object Label19: TLabel
              Left = 8
              Top = 64
              Width = 173
              Height = 13
              Caption = 'Contribuição da Patrocinadora'
            end
            object dblkRegraPagtoFornec: TwwDBLookupCombo
              Left = 8
              Top = 32
              Width = 300
              Height = 21
              Hint = 'Define se elegível pode ser inscrito como participante no plano'
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'60'#9'NOMEREGRA')
              DataField = 'IDREGRAPAGAMENTO'
              DataSource = ds
              LookupTable = qryRegra
              LookupField = 'IDREGRA'
              Options = [loTitles]
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
            object dblkRegraComissaoFornec: TwwDBLookupCombo
              Left = 352
              Top = 32
              Width = 300
              Height = 21
              Hint = 'Define se elegível pode ser inscrito como participante no plano'
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'60'#9'NOMEREGRA')
              DataField = 'IDREGRACOMISSAO'
              DataSource = ds
              LookupTable = qryRegra
              LookupField = 'IDREGRA'
              Options = [loTitles]
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
            object dblkRegraContribPatro: TwwDBLookupCombo
              Left = 8
              Top = 80
              Width = 300
              Height = 21
              Hint = 'Define se elegível pode ser inscrito como participante no plano'
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'60'#9'NOMEREGRA')
              DataField = 'IDREGRAGERAL'
              DataSource = ds
              LookupTable = qryRegra
              LookupField = 'IDREGRA'
              Options = [loTitles]
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
          end
        end
        object tbsCont: TTabSheet
          Caption = 'Contribuições do Plano'
          ImageIndex = 2
          object dbgrdCont: TwwDBGrid
            Left = 0
            Top = 0
            Width = 658
            Height = 314
            Selected.Strings = (
              'IDCONTASS'#9'8'#9'ID Contrib.'
              'NOMECONTRIBUICAO'#9'34'#9'Nome da Contribuição'
              'PRIORIDADE'#9'8'#9'Prioridade'
              'NOMEPAGADOR'#9'15'#9'Pago por'
              'FORMAPAGTO'#9'18'#9'Forma de Pagto.')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsDet
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
          object pnlControleCont: TPanel
            Left = 0
            Top = 0
            Width = 658
            Height = 314
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label8: TLabel
              Left = 8
              Top = 8
              Width = 126
              Height = 13
              Caption = 'Nome da Contribuição'
            end
            object Label11: TLabel
              Left = 262
              Top = 9
              Width = 78
              Height = 13
              Caption = 'Periodicidade'
            end
            object Label10: TLabel
              Left = 413
              Top = 9
              Width = 99
              Height = 13
              Caption = 'Regra de Cálculo'
            end
            object dblkContrib: TwwDBLookupCombo
              Left = 8
              Top = 26
              Width = 246
              Height = 21
              ControlInfoInDataset = False
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'Nome da Contribuição'#9'F')
              DataField = 'IDCONTASS'
              DataSource = dsDet
              LookupTable = qryContrib
              LookupField = 'IDCONTRIBUICAO'
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = False
              ShowMatchText = True
            end
            object GroupBox1: TGroupBox
              Left = 8
              Top = 56
              Width = 282
              Height = 257
              Caption = '  Dados sobre Pagamento  '
              TabOrder = 1
              object Label13: TLabel
                Left = 214
                Top = 217
                Width = 58
                Height = 13
                Caption = 'Prioridade'
              end
              object Label21: TLabel
                Left = 8
                Top = 133
                Width = 111
                Height = 13
                Caption = 'Forma de Cobrança'
              end
              object Label9: TLabel
                Left = 10
                Top = 91
                Width = 51
                Height = 13
                Caption = 'Situação'
              end
              object dbrgFormaPagto: TDBRadioGroup
                Left = 9
                Top = 17
                Width = 265
                Height = 65
                Caption = ' Forma de Pagamento '
                Columns = 2
                DataField = 'FLGCOBCARNE'
                DataSource = dsDet
                Items.Strings = (
                  'Folha de Ativo'
                  'Boleto Bancário')
                TabOrder = 0
                Values.Strings = (
                  '0'
                  '2'
                  '1')
                OnClick = dbrgFormaPagtoClick
              end
              object dbrgrpPagador: TDBRadioGroup
                Left = 8
                Top = 174
                Width = 264
                Height = 40
                Caption = 'Pagador '
                Columns = 2
                DataField = 'PAGADOR'
                DataSource = dsDet
                Items.Strings = (
                  'Participante'
                  'Patrocinadora')
                TabOrder = 2
                TabStop = True
                Values.Strings = (
                  'C'
                  'P')
              end
              object dbspPrioridade: TwwDBSpinEdit
                Left = 214
                Top = 233
                Width = 58
                Height = 21
                Increment = 1
                DataField = 'PRIORIDADE'
                DataSource = dsDet
                TabOrder = 3
                UnboundDataType = wwDefault
              end
              object dbckTotalPatro: TDBCheckBox
                Left = 8
                Top = 227
                Width = 169
                Height = 17
                Hint = 
                  'Indica se a contribuição da patrocinadora será calculada sobre o' +
                  ' valor de cada participante ou sobre o total.'
                Caption = 'Paga sobre Valor Total'
                DataField = 'FLGTOTAL'
                DataSource = dsDet
                TabOrder = 4
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object dblkCodPortForma: TwwDBLookupCombo
                Left = 8
                Top = 149
                Width = 265
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'35'#9'Forma de Recebimento')
                DataField = 'CODPORTFORMA'
                DataSource = dsDet
                LookupTable = qryPortForma
                LookupField = 'CODPORTFORMA'
                Options = [loTitles]
                Enabled = False
                ParentFont = False
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
              end
              object dbCboSituacao: TwwDBComboBox
                Left = 9
                Top = 107
                Width = 264
                Height = 21
                ShowButton = True
                Style = csDropDown
                MapList = True
                AllowClearKey = False
                DataField = 'FLGINTERNO'
                DataSource = dsDet
                DropDownCount = 8
                ItemHeight = 0
                Items.Strings = (
                  'ATIVO'#9'AT'
                  'ASSISTIDO'#9'AS'
                  'MANTIDO'#9'MA')
                Sorted = False
                TabOrder = 5
                UnboundDataType = wwDefault
              end
            end
            object dblkpcmbPeriodicidade: TwwDBLookupCombo
              Left = 261
              Top = 24
              Width = 142
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Periodicidade')
              DataField = 'IDTPPERIODICIDADE'
              DataSource = dsDet
              LookupTable = qryPeriodo
              LookupField = 'IDTPPERIODICIDADE'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object cmbRegraContrib: TwwDBLookupCombo
              Left = 411
              Top = 24
              Width = 247
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'60'#9'Nome da Regra'#9'F')
              DataField = 'IDREGRA'
              DataSource = dsDet
              LookupTable = qryRegra
              LookupField = 'IDREGRA'
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = False
              ShowMatchText = True
            end
            object DBCkboxevento: TDBCheckBox
              Left = 296
              Top = 53
              Width = 220
              Height = 20
              Caption = 'Cálculo envolve uso de serviços?'
              DataField = 'FLGCOBEVENTO'
              DataSource = dsDet
              TabOrder = 4
              ValueChecked = '1'
              ValueUnchecked = '0'
              Visible = False
            end
            object GroupBox2: TGroupBox
              Left = 296
              Top = 80
              Width = 361
              Height = 233
              Caption = '  Rubricas  '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 5
              object Label23: TLabel
                Left = 18
                Top = 17
                Width = 40
                Height = 13
                Caption = 'Normal'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label24: TLabel
                Left = 18
                Top = 69
                Width = 37
                Height = 13
                Caption = 'Atraso'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label25: TLabel
                Left = 18
                Top = 121
                Width = 128
                Height = 13
                Caption = 'Rubrica de Devolução'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object cmbRubNormal: TwwDBLookupCombo
                Left = 16
                Top = 32
                Width = 340
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'130'#9'Descrição')
                DataField = 'IDPROVENTO'
                DataSource = dsDet
                LookupTable = qryProvDesc
                LookupField = 'IDPROVENTO'
                ParentFont = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                UseTFields = False
                AllowClearKey = False
                ShowMatchText = True
                OnEnter = cmbRubNormalEnter
              end
              object cmbRubAtraso: TwwDBLookupCombo
                Left = 16
                Top = 84
                Width = 340
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'130'#9'Descrição')
                DataField = 'IDPROVENTOATRASO'
                DataSource = dsDet
                LookupTable = qryProvDesc
                LookupField = 'IDPROVENTO'
                ParentFont = False
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                UseTFields = False
                AllowClearKey = False
                ShowMatchText = True
              end
              object cmbRubDevolucao: TwwDBLookupCombo
                Left = 16
                Top = 136
                Width = 340
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'130'#9'Descrição')
                DataField = 'IDPROVENTODEVOL'
                DataSource = dsDet
                LookupTable = qryProvDesc
                LookupField = 'IDPROVENTO'
                ParentFont = False
                TabOrder = 2
                AutoDropDown = True
                ShowButton = True
                UseTFields = False
                AllowClearKey = False
                ShowMatchText = True
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 756
      end
      inherited Dock974: TDock97
        Left = 670
        Height = 342
      end
    end
  end
  inherited Dock972: TDock97
    Width = 766
  end
  inherited Dock971: TDock97
    Top = 498
    Width = 766
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 248
    Top = 2
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 701
    Top = 290
  end
  inherited ds: TwwDataSource
    Left = 438
    Top = 2
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PLANASS'
      'set'
      '  FLGACEITAOPCAO = :FLGACEITAOPCAO,'
      '  IDPLANASS = :IDPLANASS,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDREGRAATRASOJUR = :IDREGRAATRASOJUR,'
      '  IDFORNSERV = :IDFORNSERV,'
      '  CODPORTFORMA = :CODPORTFORMA,'
      '  CODTIPODOCHISTPAG = :CODTIPODOCHISTPAG,'
      '  IDPRODASS = :IDPRODASS,'
      '  RECPAGHISTPAG = :RECPAGHISTPAG,'
      '  NOME = :NOME,'
      '  CODTIPORECHISTREC = :CODTIPORECHISTREC,'
      '  IDREGRAADMINISTR = :IDREGRAADMINISTR,'
      '  RECPAGHISTREC = :RECPAGHISTREC,'
      '  FLGFECHADO = :FLGFECHADO,'
      '  IDREGRACOBRANCA = :IDREGRACOBRANCA,'
      '  IDREGRAGERAL = :IDREGRAGERAL,'
      '  IDREGRAADMISSAO = :IDREGRAADMISSAO,'
      '  IDREGRAPAGAMENTO = :IDREGRAPAGAMENTO,'
      '  IDREGRABENEFICIA = :IDREGRABENEFICIA,'
      '  IDREGRACANCELAME = :IDREGRACANCELAME,'
      '  IDREGRADESISTENC = :IDREGRADESISTENC,'
      '  IDREGRACOMISSAO = :IDREGRACOMISSAO,'
      '  NUMCONTRATO = :NUMCONTRATO,'
      '  DATAINICIOVIGENC = :DATAINICIOVIGENC,'
      '  DATAINICIOCOM = :DATAINICIOCOM,'
      '  CODTIPRECHISTPAG = :CODTIPRECHISTPAG,'
      '  CODTIPODOCHISTREC = :CODTIPODOCHISTREC,'
      '  IDREGRAATRASOCOR = :IDREGRAATRASOCOR,'
      '  IDREGRADEVOLJUROS = :IDREGRADEVOLJUROS,'
      '  IDREGRADEVOLCORR = :IDREGRADEVOLCORR,'
      '  IDFORNSERV2 = :IDFORNSERV2,'
      '  COMISSFORN = :COMISSFORN,'
      '  COMISSFUND = :COMISSFUND,'
      '  FLGOPCAOA = :FLGOPCAOA,'
      '  TIPOFORNSERV2 = :TIPOFORNSERV2,'
      '  FLGOPCAOB = :FLGOPCAOB,'
      '  FLGATIVO = :FLGATIVO,'
      '  OPCAOAIDENT = :OPCAOAIDENT,'
      '  OPCAOBDIF = :OPCAOBDIF,'
      '  NUMOPCOES = :NUMOPCOES,'
      '  IDREGRAVALOP1 = :IDREGRAVALOP1,'
      '  IDREGRAVALOP2 = :IDREGRAVALOP2,'
      '  IDREGRAVALOP3 = :IDREGRAVALOP3,'
      '  IDREGRAVALOP4 = :IDREGRAVALOP4,'
      '  IDREGRAVALOP5 = :IDREGRAVALOP5,'
      '  IDREGRAVALOP6 = :IDREGRAVALOP6,'
      '  IDREGRAVALOP7 = :IDREGRAVALOP7,'
      '  IDREGRAVALOP8 = :IDREGRAVALOP8,'
      '  IDREGRACALCOP1 = :IDREGRACALCOP1,'
      '  IDREGRACALCOP2 = :IDREGRACALCOP2,'
      '  IDREGRACALCOP3 = :IDREGRACALCOP3,'
      '  IDREGRACALCOP4 = :IDREGRACALCOP4,'
      '  IDREGRACALCOP5 = :IDREGRACALCOP5,'
      '  IDREGRACALCOP6 = :IDREGRACALCOP6,'
      '  IDREGRACALCOP7 = :IDREGRACALCOP7,'
      '  IDREGRACALCOP8 = :IDREGRACALCOP8,'
      '  NOMEVALORBASE1 = :NOMEVALORBASE1,'
      '  NOMEVALORBASE2 = :NOMEVALORBASE2,'
      '  NOMEVALORBASE3 = :NOMEVALORBASE3,'
      '  NOMEVALORBASE4 = :NOMEVALORBASE4,'
      '  NOMEVALORBASE5 = :NOMEVALORBASE5,'
      '  NOMEVALORBASE6 = :NOMEVALORBASE6,'
      '  NOMEVALORBASE7 = :NOMEVALORBASE7,'
      '  NOMEVALORBASE8 = :NOMEVALORBASE8,'
      '  FLGOBRIGAOP1 = :FLGOBRIGAOP1,'
      '  FLGOBRIGAOP2 = :FLGOBRIGAOP2,'
      '  FLGOBRIGAOP3 = :FLGOBRIGAOP3,'
      '  FLGOBRIGAOP4 = :FLGOBRIGAOP4,'
      '  FLGOBRIGAOP5 = :FLGOBRIGAOP5,'
      '  FLGOBRIGAOP6 = :FLGOBRIGAOP6,'
      '  FLGOBRIGAOP7 = :FLGOBRIGAOP7,'
      '  FLGOBRIGAOP8 = :FLGOBRIGAOP8,'
      '  FLGEDITAOP1 = :FLGEDITAOP1,'
      '  FLGEDITAOP2 = :FLGEDITAOP2,'
      '  FLGEDITAOP3 = :FLGEDITAOP3,'
      '  FLGEDITAOP4 = :FLGEDITAOP4,'
      '  FLGEDITAOP5 = :FLGEDITAOP5,'
      '  FLGEDITAOP6 = :FLGEDITAOP6,'
      '  FLGEDITAOP7 = :FLGEDITAOP7,'
      '  FLGEDITAOP8 = :FLGEDITAOP8'
      'where'
      '  IDPLANASS = :OLD_IDPLANASS')
    InsertSQL.Strings = (
      'insert into PLANASS'
      
        '  (FLGACEITAOPCAO, IDPLANASS, IDPESSOA, IDREGRAATRASOJUR, IDFORN' +
        'SERV, CODPORTFORMA, '
      
        '   CODTIPODOCHISTPAG, IDPRODASS, RECPAGHISTPAG, NOME, CODTIPOREC' +
        'HISTREC, '
      
        '   IDREGRAADMINISTR, RECPAGHISTREC, FLGFECHADO, IDREGRACOBRANCA,' +
        ' IDREGRAGERAL, '
      
        '   IDREGRAADMISSAO, IDREGRAPAGAMENTO, IDREGRABENEFICIA, IDREGRAC' +
        'ANCELAME, '
      
        '   IDREGRADESISTENC, IDREGRACOMISSAO, NUMCONTRATO, DATAINICIOVIG' +
        'ENC, DATAINICIOCOM, '
      
        '   CODTIPRECHISTPAG, CODTIPODOCHISTREC, IDREGRAATRASOCOR, IDREGR' +
        'ADEVOLJUROS, '
      
        '   IDREGRADEVOLCORR, IDFORNSERV2, COMISSFORN, COMISSFUND, FLGOPC' +
        'AOA, TIPOFORNSERV2, '
      
        '   FLGOPCAOB, FLGATIVO, OPCAOAIDENT, OPCAOBDIF, NUMOPCOES, IDREG' +
        'RAVALOP1, '
      
        '   IDREGRAVALOP2, IDREGRAVALOP3, IDREGRAVALOP4, IDREGRAVALOP5, I' +
        'DREGRAVALOP6, '
      
        '   IDREGRAVALOP7, IDREGRAVALOP8, IDREGRACALCOP1, IDREGRACALCOP2,' +
        ' IDREGRACALCOP3, '
      
        '   IDREGRACALCOP4, IDREGRACALCOP5, IDREGRACALCOP6, IDREGRACALCOP' +
        '7, IDREGRACALCOP8, '
      
        '   NOMEVALORBASE1, NOMEVALORBASE2, NOMEVALORBASE3, NOMEVALORBASE' +
        '4, NOMEVALORBASE5, '
      
        '   NOMEVALORBASE6, NOMEVALORBASE7, NOMEVALORBASE8, FLGOBRIGAOP1,' +
        ' FLGOBRIGAOP2, '
      
        '   FLGOBRIGAOP3, FLGOBRIGAOP4, FLGOBRIGAOP5, FLGOBRIGAOP6, FLGOB' +
        'RIGAOP7, '
      
        '   FLGOBRIGAOP8, FLGEDITAOP1, FLGEDITAOP2, FLGEDITAOP3, FLGEDITA' +
        'OP4, FLGEDITAOP5, '
      '   FLGEDITAOP6, FLGEDITAOP7, FLGEDITAOP8)'
      'values'
      
        '  (:FLGACEITAOPCAO, :IDPLANASS, :IDPESSOA, :IDREGRAATRASOJUR, :I' +
        'DFORNSERV, '
      
        '   :CODPORTFORMA, :CODTIPODOCHISTPAG, :IDPRODASS, :RECPAGHISTPAG' +
        ', :NOME, '
      
        '   :CODTIPORECHISTREC, :IDREGRAADMINISTR, :RECPAGHISTREC, :FLGFE' +
        'CHADO, '
      
        '   :IDREGRACOBRANCA, :IDREGRAGERAL, :IDREGRAADMISSAO, :IDREGRAPA' +
        'GAMENTO, '
      
        '   :IDREGRABENEFICIA, :IDREGRACANCELAME, :IDREGRADESISTENC, :IDR' +
        'EGRACOMISSAO, '
      
        '   :NUMCONTRATO, :DATAINICIOVIGENC, :DATAINICIOCOM, :CODTIPRECHI' +
        'STPAG, '
      
        '   :CODTIPODOCHISTREC, :IDREGRAATRASOCOR, :IDREGRADEVOLJUROS, :I' +
        'DREGRADEVOLCORR, '
      
        '   :IDFORNSERV2, :COMISSFORN, :COMISSFUND, :FLGOPCAOA, :TIPOFORN' +
        'SERV2, '
      
        '   :FLGOPCAOB, :FLGATIVO, :OPCAOAIDENT, :OPCAOBDIF, :NUMOPCOES, ' +
        ':IDREGRAVALOP1, '
      
        '   :IDREGRAVALOP2, :IDREGRAVALOP3, :IDREGRAVALOP4, :IDREGRAVALOP' +
        '5, :IDREGRAVALOP6, '
      
        '   :IDREGRAVALOP7, :IDREGRAVALOP8, :IDREGRACALCOP1, :IDREGRACALC' +
        'OP2, :IDREGRACALCOP3, '
      
        '   :IDREGRACALCOP4, :IDREGRACALCOP5, :IDREGRACALCOP6, :IDREGRACA' +
        'LCOP7, '
      
        '   :IDREGRACALCOP8, :NOMEVALORBASE1, :NOMEVALORBASE2, :NOMEVALOR' +
        'BASE3, '
      
        '   :NOMEVALORBASE4, :NOMEVALORBASE5, :NOMEVALORBASE6, :NOMEVALOR' +
        'BASE7, '
      
        '   :NOMEVALORBASE8, :FLGOBRIGAOP1, :FLGOBRIGAOP2, :FLGOBRIGAOP3,' +
        ' :FLGOBRIGAOP4, '
      
        '   :FLGOBRIGAOP5, :FLGOBRIGAOP6, :FLGOBRIGAOP7, :FLGOBRIGAOP8, :' +
        'FLGEDITAOP1, '
      
        '   :FLGEDITAOP2, :FLGEDITAOP3, :FLGEDITAOP4, :FLGEDITAOP5, :FLGE' +
        'DITAOP6, '
      '   :FLGEDITAOP7, :FLGEDITAOP8)')
    DeleteSQL.Strings = (
      'delete from PLANASS'
      'where'
      '  IDPLANASS = :OLD_IDPLANASS')
    Left = 390
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Plano Assistencial'
    Colunas.Strings = (
      'PL.NOME'
      'PD.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome do Plano'
      'Nome do Produto')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PLANASS PL'
      'PRODASS PD')
    CamposChave.Strings = (
      'PL.IDPLANASS')
    Filtro.Strings = (
      'PL.IDPRODASS = PD.IDPRODASS')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '40'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1')
    Left = 485
    Top = 2
  end
  inherited ImlPadrao: TImageList
    Left = 295
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    OnFind = CmeCadastroFind
    Left = 580
    Top = 2
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      
        'SELECT PL.FLGACEITAOPCAO, PL.IDPLANASS, PL.IDPESSOA, PL.IDREGRAA' +
        'TRASOJUR, PL.IDFORNSERV,'
      
        '       PL.CODPORTFORMA, PL.CODTIPODOCHISTPAG, PL.IDPRODASS, PL.R' +
        'ECPAGHISTPAG, PL.NOME,'
      
        '       PL.CODTIPORECHISTREC, PL.IDREGRAADMINISTR, PL.RECPAGHISTR' +
        'EC, PL.FLGFECHADO,'
      
        '       PL.IDREGRACOBRANCA, PL.IDREGRAGERAL, PL.IDREGRAADMISSAO, ' +
        'PL.IDREGRAPAGAMENTO,'
      
        '       PL.IDREGRABENEFICIA, PL.IDREGRACANCELAME, PL.IDREGRADESIS' +
        'TENC, PL.IDREGRACOMISSAO,'
      
        '       PL.NUMCONTRATO, PL.DATAINICIOVIGENC, PL.DATAINICIOCOM, PL' +
        '.CODTIPRECHISTPAG,'
      
        '       PL.CODTIPODOCHISTREC, PL.IDREGRAATRASOCOR, PL.IDREGRADEVO' +
        'LJUROS, PL.IDREGRADEVOLCORR,'
      
        '       PL.IDFORNSERV2, PL.COMISSFORN, PL.COMISSFUND, PL.FLGOPCAO' +
        'A, PL.TIPOFORNSERV2,'
      '       PL.FLGOPCAOB, PL.FLGATIVO, PL.OPCAOAIDENT, PL.OPCAOBDIF,'
      
        '       PL.NUMOPCOES, PL.IDREGRAVALOP1, PL.IDREGRAVALOP2, PL.IDRE' +
        'GRAVALOP3,'
      
        '       PL.IDREGRAVALOP4, PL.IDREGRAVALOP5, PL.IDREGRAVALOP6, PL.' +
        'IDREGRAVALOP7,'
      
        '       PL.IDREGRAVALOP8, PL.IDREGRACALCOP1, PL.IDREGRACALCOP2, P' +
        'L.IDREGRACALCOP3,'
      
        '       PL.IDREGRACALCOP4, PL.IDREGRACALCOP5, PL.IDREGRACALCOP6, ' +
        'PL.IDREGRACALCOP7,'
      
        '       PL.IDREGRACALCOP8, PL.NOMEVALORBASE1, PL.NOMEVALORBASE2, ' +
        'PL.NOMEVALORBASE3,'
      
        '       PL.NOMEVALORBASE4, PL.NOMEVALORBASE5, PL.NOMEVALORBASE6, ' +
        'PL.NOMEVALORBASE7,'
      
        '       PL.NOMEVALORBASE8, PL.FLGOBRIGAOP1, PL.FLGOBRIGAOP2, PL.F' +
        'LGOBRIGAOP3,'
      
        '       PL.FLGOBRIGAOP4, PL.FLGOBRIGAOP5, PL.FLGOBRIGAOP6, PL.FLG' +
        'OBRIGAOP7,'
      
        '       PL.FLGOBRIGAOP8, PL.FLGEDITAOP1, PL.FLGEDITAOP2, PL.FLGED' +
        'ITAOP3,'
      
        '       PL.FLGEDITAOP4, PL.FLGEDITAOP5, PL.FLGEDITAOP6, PL.FLGEDI' +
        'TAOP7,'
      '       PL.FLGEDITAOP8,'
      '       PF.NOME AS NOMEFORNECEDOR, PR.NOME AS NOMEPRODUTO,'
      '       DECODE(PL.FLGATIVO, 1, '#39'SIM'#39', '#39'NÃO'#39') ATIVO,'
      '       DECODE(PL.FLGACEITAOPCAO, 1, '#39'SIM'#39', '#39'NÃO'#39') ACEITAOPCOES'
      'FROM PLANASS PL, FORNSERV FS, PESSOA PF, PRODASS PR'
      'WHERE PL.IDPLANASS  = :IDPLANASS'
      '  AND PL.IDFORNSERV = FS.IDPESSOA'
      '  AND FS.IDPESSOA   = PF.IDPESSOA'
      '  AND PL.IDPRODASS  = PR.IDPRODASS'
      ' '
      ' '
      ' '
      ' ')
    Left = 343
    Top = 2
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 700
    Top = 234
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTRIBASS'
      'set'
      '  IDREGRA = :IDREGRA,'
      '  FLGINTERNO = :FLGINTERNO,'
      '  CODCENTRORESPON = :CODCENTRORESPON,'
      '  IDRUBRICA = :IDRUBRICA,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  IDEMPRESAPROP = :IDEMPRESAPROP,'
      '  IDPESSOA = :IDPESSOA,'
      '  CODPORTFORMA = :CODPORTFORMA,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  CODCENTROCUSTOC = :CODCENTROCUSTOC,'
      '  IDTPPERIODICIDADE = :IDTPPERIODICIDADE,'
      '  PAGADOR = :PAGADOR,'
      '  CODCENTROCUSTOD = :CODCENTROCUSTOD,'
      '  TEMPOCOBR = :TEMPOCOBR,'
      '  PLANO = :PLANO,'
      '  PLACONTAD = :PLACONTAD,'
      '  IDPROVENTOATRASO = :IDPROVENTOATRASO,'
      '  PLACONTAC = :PLACONTAC,'
      '  IDPROVENTODEVOL = :IDPROVENTODEVOL,'
      '  RECPAG = :RECPAG,'
      '  PRIORIDADE = :PRIORIDADE,'
      '  FLGTOTAL = :FLGTOTAL,'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  FLGJUROSATRASO = :FLGJUROSATRASO,'
      '  RECPAGDEVOL = :RECPAGDEVOL,'
      '  FLGCORRECAOATRASO = :FLGCORRECAOATRASO,'
      '  CODTIPDESEMBDEVOL = :CODTIPDESEMBDEVOL,'
      '  FLGJUROSDEVOL = :FLGJUROSDEVOL,'
      '  CODTIPDESEMBCAR = :CODTIPDESEMBCAR,'
      '  FLGCORRECAODEVOL = :FLGCORRECAODEVOL,'
      '  FLGCOBEVENTO = :FLGCOBEVENTO,'
      '  VLRACEITADIVERG = :VLRACEITADIVERG,'
      '  CODSUBCONTA = :CODSUBCONTA,'
      '  FLGCOBCARNE = :FLGCOBCARNE,'
      '  CODCCUSTOCDEVBAN = :CODCCUSTOCDEVBAN,'
      '  CODCCUSTOCDEVPAT = :CODCCUSTOCDEVPAT,'
      '  PLACONTACDEVPAT = :PLACONTACDEVPAT,'
      '  PLACONTACDEVBANCO = :PLACONTACDEVBANCO,'
      '  IDPROVENTO = :IDPROVENTO,'
      '  PLACONTADAUTPATR = :PLACONTADAUTPATR'
      'where'
      '  IDPLANASS = :OLD_IDPLANASS and'
      '  IDCONTASS = :OLD_IDCONTASS')
    InsertSQL.Strings = (
      'insert into CONTRIBASS'
      
        '  (IDREGRA, FLGINTERNO, CODCENTRORESPON, IDRUBRICA, UNIDNEGOC, I' +
        'DEMPRESAPROP, '
      
        '   IDPESSOA, CODPORTFORMA, IDEMPRESA, CODCENTROCUSTOC, IDTPPERIO' +
        'DICIDADE, '
      
        '   PAGADOR, CODCENTROCUSTOD, TEMPOCOBR, PLANO, PLACONTAD, IDPROV' +
        'ENTOATRASO, '
      
        '   PLACONTAC, IDPROVENTODEVOL, RECPAG, PRIORIDADE, FLGTOTAL, COD' +
        'TIPRECDES, '
      
        '   FLGJUROSATRASO, RECPAGDEVOL, FLGCORRECAOATRASO, CODTIPDESEMBD' +
        'EVOL, FLGJUROSDEVOL, '
      
        '   CODTIPDESEMBCAR, FLGCORRECAODEVOL, FLGCOBEVENTO, VLRACEITADIV' +
        'ERG, CODSUBCONTA, '
      
        '   FLGCOBCARNE, CODCCUSTOCDEVBAN, CODCCUSTOCDEVPAT, PLACONTACDEV' +
        'PAT, PLACONTACDEVBANCO, '
      '   IDPROVENTO, PLACONTADAUTPATR)'
      'values'
      
        '  (:IDREGRA, :FLGINTERNO, :CODCENTRORESPON, :IDRUBRICA, :UNIDNEG' +
        'OC, :IDEMPRESAPROP, '
      
        '   :IDPESSOA, :CODPORTFORMA, :IDEMPRESA, :CODCENTROCUSTOC, :IDTP' +
        'PERIODICIDADE, '
      
        '   :PAGADOR, :CODCENTROCUSTOD, :TEMPOCOBR, :PLANO, :PLACONTAD, :' +
        'IDPROVENTOATRASO, '
      
        '   :PLACONTAC, :IDPROVENTODEVOL, :RECPAG, :PRIORIDADE, :FLGTOTAL' +
        ', :CODTIPRECDES, '
      
        '   :FLGJUROSATRASO, :RECPAGDEVOL, :FLGCORRECAOATRASO, :CODTIPDES' +
        'EMBDEVOL, '
      
        '   :FLGJUROSDEVOL, :CODTIPDESEMBCAR, :FLGCORRECAODEVOL, :FLGCOBE' +
        'VENTO, '
      
        '   :VLRACEITADIVERG, :CODSUBCONTA, :FLGCOBCARNE, :CODCCUSTOCDEVB' +
        'AN, :CODCCUSTOCDEVPAT, '
      
        '   :PLACONTACDEVPAT, :PLACONTACDEVBANCO, :IDPROVENTO, :PLACONTAD' +
        'AUTPATR)')
    DeleteSQL.Strings = (
      'delete from CONTRIBASS'
      'where'
      '  IDPLANASS = :OLD_IDPLANASS and'
      '  IDCONTASS = :OLD_IDCONTASS')
    Left = 730
    Top = 290
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    AfterInsert = qryDetAfterScroll
    AfterEdit = qryDetAfterScroll
    BeforePost = qryDetBeforePost
    AfterScroll = qryDetAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT CB.IDPLANASS,         CB.IDCONTASS,        CB.IDREGRA, CB' +
        '.FLGINTERNO,'
      '       CB.CODCENTRORESPON,   CB.IDRUBRICA,        CB.UNIDNEGOC,'
      
        '       CB.IDEMPRESAPROP,     CB.IDPESSOA,         CB.CODPORTFORM' +
        'A,'
      
        '       CB.IDEMPRESA,         CB.CODCENTROCUSTOC,  CB.IDTPPERIODI' +
        'CIDADE,'
      '       CB.PAGADOR,           CB.CODCENTROCUSTOD,  CB.TEMPOCOBR,'
      
        '       CB.PLANO,             CB.PLACONTAD,        CB.IDPROVENTOA' +
        'TRASO,'
      '       CB.PLACONTAC,         CB.IDPROVENTODEVOL,  CB.RECPAG,'
      
        '       CB.PRIORIDADE,        CB.FLGTOTAL,         CB.CODTIPRECDE' +
        'S,'
      
        '       CB.FLGJUROSATRASO,    CB.RECPAGDEVOL,      CB.FLGCORRECAO' +
        'ATRASO,'
      
        '       CB.CODTIPDESEMBDEVOL, CB.FLGJUROSDEVOL,    CB.CODTIPDESEM' +
        'BCAR,'
      
        '       CB.FLGCORRECAODEVOL,  CB.FLGCOBEVENTO,     CB.VLRACEITADI' +
        'VERG,'
      
        '       CB.CODSUBCONTA,       CB.FLGCOBCARNE,      CB.CODCCUSTOCD' +
        'EVBAN,'
      
        '       CB.CODCCUSTOCDEVPAT,  CB.PLACONTACDEVPAT,  CB.PLACONTACDE' +
        'VBANCO,'
      
        '       CB.IDPROVENTO,        CB.PLACONTADAUTPATR,  C.NOME NOMECO' +
        'NTRIBUICAO,'
      '       TP.NOME PERIODO,'
      
        '       DECODE(CB.PAGADOR, '#39'C'#39', '#39'PARTICIPANTE'#39', '#39'PATROCINADORA'#39') ' +
        'NOMEPAGADOR,'
      '       DECODE(CB.FLGCOBCARNE, 0,'
      '                                '#39'FOLHA DE ATIVO'#39','
      
        '                              DECODE(CB.FLGCOBCARNE, 2, '#39'FOLHA D' +
        'E ASSISTIDO'#39', '#39'BOLETO BANCÁRIO'#39')) FORMAPAGTO'
      'FROM CONTRIBASS CB, CONTRIBUICAO C, TPPERIODICIDADE TP'
      'WHERE CB.IDPLANASS         = :IDPLANASS'
      '  AND CB.IDCONTASS         = C.IDCONTRIBUICAO'
      '  AND CB.IDTPPERIODICIDADE = TP.IDTPPERIODICIDADE'
      ''
      ' '
      ' '
      ' ')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 672
    Top = 290
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANASS'
        ParamType = ptUnknown
        Value = '126'
      end>
  end
  object qryFornServAss: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME,F.IDPESSOA'
      'FROM   PESSOA P, FORNSERV F'
      'WHERE  (F.IDPESSOA    = P.IDPESSOA)'
      '  AND  (P.IDPESSOA    = :IDPESSOA)'
      'ORDER BY P.NOME'
      '')
    ValidateWithMask = True
    Left = 571
    Top = 43
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryProdAss: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DESCRICAO,IDPRODASS,NOME'
      'FROM   PRODASS')
    ValidateWithMask = True
    Left = 525
    Top = 43
  end
  object msBuscaFornecedor: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Fornecedor'
    Colunas.Strings = (
      'PE.NOME'
      'PE.RAZAOSOCIAL'
      'PE.NUMDOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome Fantasia'
      'Razão Social'
      'CNPJ')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA PE'
      'FORNSERV FS')
    CamposChave.Strings = (
      'FS.IDPESSOA'
      'PE.NOME')
    Filtro.Strings = (
      'PE.IDPESSOA = FS.IDPESSOA'
      'PE.TIPO     = '#39'J'#39)
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
    Left = 627
    Top = 2
  end
  object qryPortForma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODPORTFORMA, DESCRICAO, RECPAG FROM PORTADORFORMA'
      'WHERE RECPAG = '#39'R'#39
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 532
    Top = 2
  end
  object qryContrib: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT C.NOME,C.IDCONTRIBUICAO, C.IDTPPERIODICIDADE'
      'FROM   CONTRIBUICAO C, TPPERIODICIDADE T'
      'WHERE  (C.IDTPPERIODICIDADE = T.IDTPPERIODICIDADE)'
      'ORDER BY C.NOME'
      '')
    ValidateWithMask = True
    Left = 618
    Top = 43
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOMEREGRA, IDREGRA'
      'FROM  REGRA'
      'WHERE  (IDTIPOREGRA = :IDTIPOREGRA)'
      'ORDER BY NOMEREGRA')
    ValidateWithMask = True
    Left = 664
    Top = 43
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOREGRA'
        ParamType = ptUnknown
      end>
  end
  object qryPeriodo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTPPERIODICIDADE, NOME'
      'FROM TPPERIODICIDADE')
    ValidateWithMask = True
    Left = 710
    Top = 43
  end
  object qryProvento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODRUBCLT,DESCRICAO,FLGATRASODEVOL,FLGCOMPOEREMTOTAL,'
      '  FLGCOMPOESALBENEF,FLGCOMPOESALPART,FLGCONSOLIDA,'
      '  FLGCONSTAFOLHA,FLGDECIMOTERCEIRO,FLGDESCONTO,'
      '  FLGDESCPENSAO,FLGESPECIAL,FLGFERIAS,FLGFGTS,'
      '  FLGINCIDECONTRIB,FLGINCIDESALPART,FLGINSS,FLGINTERNO,'
      '  FLGIRRF,FLGOBRIGAFAVOREC,FLGPRORATA,FLGRAIS,FLGRESCISAO,'
      '  FLGSALFAMILIA,FLGTPRUBRICA,FLGUSO,IDBENEFSALAR,IDINFORME,'
      '  IDPROVENTO,IDREGRA,IDREGRAFERIAS,IDREGRARESCISAO,'
      '  IDREGRA13,NUMPRIORIDADE'
      'FROM'
      '  PROVDESC'
      'WHERE'
      '  (SUBSTR(FLGTPRUBRICA,1,1) = '#39'A'#39')'
      'ORDER BY DESCRICAO'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 479
    Top = 43
  end
  object qryProvDesc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDPROVENTO,           DESCRICAO,               CODPROVDES' +
        'C,'
      
        '       FLGATRASODEVOL,       FLGCOMPOEREMTOTAL,       FLGCOMPOES' +
        'ALBENEF,'
      
        '       FLGCOMPOESALPART,     FLGCONSOLIDA,            FLGCONSTAF' +
        'OLHA,'
      
        '       FLGDECIMOTERCEIRO,    FLGDESCONTO,             FLGDESCPEN' +
        'SAO,'
      '       FLGESPECIAL,          FLGFERIAS,               FLGFGTS,'
      '       FLGINCIDECONTRIB,     FLGINCIDESALPART,        FLGINSS,'
      
        '       FLGINTERNO,           FLGIRRF,                 FLGOBRIGAF' +
        'AVOREC,'
      
        '       FLGPRORATA,           FLGRAIS,                 FLGRESCISA' +
        'O,'
      '       FLGSALFAMILIA,        FLGTPRUBRICA,            FLGUSO,'
      '       NUMPRIORIDADE'
      'FROM   PROVDESC'
      ''
      ' ')
    UpdateObject = updProvDesc
    ValidateWithMask = True
    Left = 672
    Top = 341
  end
  object updProvDesc: TUpdateSQL
    ModifySQL.Strings = (
      'update PROVDESC'
      'set'
      '  DESCRICAO = :DESCRICAO,'
      '  CODPROVDESC = :CODPROVDESC,'
      '  FLGATRASODEVOL = :FLGATRASODEVOL,'
      '  FLGCOMPOEREMTOTAL = :FLGCOMPOEREMTOTAL,'
      '  FLGCOMPOESALBENEF = :FLGCOMPOESALBENEF,'
      '  FLGCOMPOESALPART = :FLGCOMPOESALPART,'
      '  FLGCONSOLIDA = :FLGCONSOLIDA,'
      '  FLGCONSTAFOLHA = :FLGCONSTAFOLHA,'
      '  FLGDECIMOTERCEIRO = :FLGDECIMOTERCEIRO,'
      '  FLGDESCONTO = :FLGDESCONTO,'
      '  FLGDESCPENSAO = :FLGDESCPENSAO,'
      '  FLGESPECIAL = :FLGESPECIAL,'
      '  FLGFERIAS = :FLGFERIAS,'
      '  FLGFGTS = :FLGFGTS,'
      '  FLGINCIDECONTRIB = :FLGINCIDECONTRIB,'
      '  FLGINCIDESALPART = :FLGINCIDESALPART,'
      '  FLGINSS = :FLGINSS,'
      '  FLGINTERNO = :FLGINTERNO,'
      '  FLGIRRF = :FLGIRRF,'
      '  FLGOBRIGAFAVOREC = :FLGOBRIGAFAVOREC,'
      '  FLGPRORATA = :FLGPRORATA,'
      '  FLGRAIS = :FLGRAIS,'
      '  FLGRESCISAO = :FLGRESCISAO,'
      '  FLGSALFAMILIA = :FLGSALFAMILIA,'
      '  FLGTPRUBRICA = :FLGTPRUBRICA,'
      '  FLGUSO = :FLGUSO,'
      '  NUMPRIORIDADE = :NUMPRIORIDADE'
      'where'
      '  IDPROVENTO = :OLD_IDPROVENTO')
    InsertSQL.Strings = (
      'insert into PROVDESC'
      
        '  (IDPROVENTO, DESCRICAO, CODPROVDESC, FLGATRASODEVOL, FLGCOMPOE' +
        'REMTOTAL, '
      
        '   FLGCOMPOESALBENEF, FLGCOMPOESALPART, FLGCONSOLIDA, FLGCONSTAF' +
        'OLHA, FLGDECIMOTERCEIRO, '
      
        '   FLGDESCONTO, FLGDESCPENSAO, FLGESPECIAL, FLGFERIAS, FLGFGTS, ' +
        'FLGINCIDECONTRIB, '
      
        '   FLGINCIDESALPART, FLGINSS, FLGINTERNO, FLGIRRF, FLGOBRIGAFAVO' +
        'REC, FLGPRORATA, '
      
        '   FLGRAIS, FLGRESCISAO, FLGSALFAMILIA, FLGTPRUBRICA, FLGUSO, NU' +
        'MPRIORIDADE)'
      'values'
      
        '  (:IDPROVENTO, :DESCRICAO, :CODPROVDESC, :FLGATRASODEVOL, :FLGC' +
        'OMPOEREMTOTAL, '
      
        '   :FLGCOMPOESALBENEF, :FLGCOMPOESALPART, :FLGCONSOLIDA, :FLGCON' +
        'STAFOLHA, '
      
        '   :FLGDECIMOTERCEIRO, :FLGDESCONTO, :FLGDESCPENSAO, :FLGESPECIA' +
        'L, :FLGFERIAS, '
      
        '   :FLGFGTS, :FLGINCIDECONTRIB, :FLGINCIDESALPART, :FLGINSS, :FL' +
        'GINTERNO, '
      
        '   :FLGIRRF, :FLGOBRIGAFAVOREC, :FLGPRORATA, :FLGRAIS, :FLGRESCI' +
        'SAO, :FLGSALFAMILIA, '
      '   :FLGTPRUBRICA, :FLGUSO, :NUMPRIORIDADE)')
    DeleteSQL.Strings = (
      'delete from PROVDESC'
      'where'
      '  IDPROVENTO = :OLD_IDPROVENTO')
    Left = 730
    Top = 341
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 673
    Top = 394
  end
end
