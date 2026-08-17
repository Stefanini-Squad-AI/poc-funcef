inherited frmCadTipoOper: TfrmCadTipoOper
  Left = 201
  Top = 129
  HelpContext = 790120
  Caption = 'Tipos de Operação'
  ClientHeight = 473
  ClientWidth = 612
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 612
    Height = 387
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 610
      Height = 159
      Align = alClient
      TabOrder = 0
      object Label1: TLabel
        Left = 201
        Top = 49
        Width = 120
        Height = 13
        Caption = 'Tipo de Investimento'
      end
      object TLabel
        Left = 421
        Top = 48
        Width = 50
        Height = 13
        Caption = 'Mercado'
      end
      object Label2: TLabel
        Left = 9
        Top = 12
        Width = 186
        Height = 13
        Caption = 'Descrição do Tipo de Operação '
      end
      object Label3: TLabel
        Left = 538
        Top = 12
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Label4: TLabel
        Left = 422
        Top = 12
        Width = 106
        Height = 13
        Caption = 'Sigla da Operação'
        FocusControl = DBEdit2
      end
      object Label9: TLabel
        Left = 9
        Top = 88
        Width = 129
        Height = 13
        Caption = 'Num. Dias Vencimento'
        FocusControl = DBEdit2
      end
      object lblTipoMovto: TLabel
        Left = 9
        Top = 49
        Width = 109
        Height = 13
        Caption = 'Tipo de Movimento'
        FocusControl = DBEdit2
      end
      object dbcbxTipoMovto: TwwDBComboBox
        Left = 9
        Top = 63
        Width = 183
        Height = 21
        ShowButton = True
        Style = csDropDown
        MapList = True
        AllowClearKey = True
        AutoDropDown = True
        ShowMatchText = True
        DataField = 'TIPOMOVTO'
        DataSource = ds
        DropDownCount = 8
        ItemHeight = 0
        Items.Strings = (
          'Atualização'#9'ATU'
          'Direito'#9'DTO'
          'Operacão'#9'OPE'
          'Transferência de Carteira'#9'TRC'
          'Pendência'#9'PEN'
          'Desdobramento de Ações'#9'DTD'
          'Bloqueio'#9'BLQ'
          'Transferência Entre Planos'#9'TRP'
          'Transferência Entre CC e CCI'#9'TRI')
        Sorted = False
        TabOrder = 3
        UnboundDataType = wwDefault
      end
      object DbChOrdMov: TDBCheckBox
        Left = 151
        Top = 107
        Width = 157
        Height = 17
        Caption = 'Exige Ordem Movimento'
        DataField = 'FLGORDMOVINV'
        DataSource = ds
        TabOrder = 8
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        OnClick = DBCheckBox2Click
      end
      object DBlkTipoInvest: TwwDBLookupCombo
        Left = 201
        Top = 63
        Width = 212
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOINVEST'#9'40'#9'Tipo de Investimento')
        DataField = 'IDTIPOINVEST'
        DataSource = ds
        LookupTable = qryTipoinvest
        LookupField = 'IDTIPOINVEST'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnChange = DBlkTipoInvestChange
        OnCloseUp = DBlkTipoInvestCloseUp
        OnExit = DBlkTipoInvestExit
      end
      object DBlkMercado: TwwDBLookupCombo
        Left = 421
        Top = 62
        Width = 175
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCMERCADO'#9'40'#9'Mercado')
        DataField = 'IDMERCADO'
        DataSource = ds
        LookupTable = qryMercado
        LookupField = 'IDMERCADO'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object DBEDescTipoOperacao: TwwDBEdit
        Left = 9
        Top = 26
        Width = 404
        Height = 21
        DataField = 'DESCTIPOOPERACAO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeIdTipoOper: TDBEdit
        Left = 538
        Top = 26
        Width = 56
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'IDTIPOOPERACAO'
        DataSource = ds
        Enabled = False
        TabOrder = 2
      end
      object DBEdit2: TDBEdit
        Left = 9
        Top = 102
        Width = 130
        Height = 21
        DataField = 'VENCIMENTO'
        DataSource = ds
        TabOrder = 6
      end
      object DbChCorretor: TDBCheckBox
        Left = 151
        Top = 89
        Width = 117
        Height = 17
        Caption = 'Obriga Corretora'
        DataField = 'FLGCORRET'
        DataSource = ds
        TabOrder = 7
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object DbChDireito: TDBCheckBox
        Left = 316
        Top = 107
        Width = 136
        Height = 17
        Caption = 'Operação de Direito'
        DataField = 'FLGOPDIREITO'
        DataSource = ds
        TabOrder = 10
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        OnClick = DbChDireitoClick
      end
      object dbeSigla: TDBEdit2
        Left = 422
        Top = 26
        Width = 101
        Height = 21
        DataField = 'SIGLATIPOOPER'
        DataSource = ds
        TabOrder = 1
      end
      object dbchkOpGerenc: TDBCheckBox
        Left = 316
        Top = 89
        Width = 145
        Height = 17
        Caption = 'Operação Gerencial'
        DataField = 'FLGOPGERENC'
        DataSource = ds
        TabOrder = 9
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbckStaAtivo: TDBCheckBox
        Left = 463
        Top = 107
        Width = 111
        Height = 17
        Caption = 'Operação Ativa'
        DataField = 'STAATIVO'
        DataSource = ds
        TabOrder = 12
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbckAfetaRent: TDBCheckBox
        Left = 463
        Top = 89
        Width = 133
        Height = 17
        Caption = 'Afeta Rentabilidade'
        DataField = 'FLGRENTABILIDADE'
        DataSource = ds
        TabOrder = 11
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbckObrigaOBS: TDBCheckBox
        Left = 151
        Top = 125
        Width = 157
        Height = 17
        Caption = 'Obriga Observação'
        DataField = 'FLGOBRIGAOBS'
        DataSource = ds
        TabOrder = 13
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        OnClick = DBCheckBox2Click
      end
    end
    object PgTabs: TPageControl
      Left = 1
      Top = 160
      Width = 610
      Height = 226
      ActivePage = TbCart
      Align = alBottom
      TabOrder = 1
      OnChange = PgTabsChange
      object TbCart: TTabSheet
        Caption = 'Carteira'
        object DBRadioGroup2: TDBRadioGroup
          Left = -7
          Top = -1
          Width = 601
          Height = 162
          Hint = 
            'Compra: Aumenta o valor  e as cotas da Carteira, o valor e a qua' +
            'ntidade do Estoque e os Custos Atuarial, de Carregamento e de Aq' +
            'uisição'#13#10#13#10'Venda: Calcula e lança o Lucro(Prejuizo), que aumenta' +
            '(diminui) o valor da Carteira, e lança a Venda, que diminui o va' +
            'lor e as cotas da Carteira, a quantidade do Estoque e Custo Atua' +
            'rial e diminui pela média anterior o valor do Estoque e os Custo' +
            's de Carregamento e de Aquisição'#13#10#13#10'Venda de Opção:  Aumenta o v' +
            'alor da Carteira e diminui o Custo Atuarial'#13#10#13#10'Compra de Opção: ' +
            ' Diminui o valor da Carteira e aumenta o Custo Atuarial'#13#10#13#10'Divid' +
            'endo:  Aumenta o valor da Carteira e o saldo de Rendimentos e di' +
            'minui o Custo Atuarial'#13#10#13#10#13#10
          Caption = ' Atualizações na Carteira '
          DataField = 'NATUREZAOPERACAO'
          DataSource = ds
          Items.Strings = (
            '&Compra/Bonificação'
            '&Venda/Cancelamento de Cotas/Transf. Plano(Baixa)'
            'V&enda de Opção'
            'Compra de &Opção'
            
              '&Dividendo/Juros sobre Capital/Rest.de Capital /Recebimentos/Dir' +
              'eito de Subscrição'
            '&Alteração de Tipo/Grupamento/Incorporação/Permulta/Subscrição'
            '&Não altera')
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Values.Strings = (
            'A'
            'D'
            'O'
            'U'
            'R'
            'F'
            'N')
        end
      end
      object TbCust: TTabSheet
        Caption = 'Custódia'
        object Label7: TLabel
          Left = 321
          Top = 6
          Width = 186
          Height = 13
          Caption = 'Motivo de Bloqueio/Desbloqueio'
          Visible = False
        end
        object DbLkcMotBlq: TwwDBLookupCombo
          Left = 321
          Top = 22
          Width = 193
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'SIGLAMOTBLOQ'#9'10'#9'Sigla'
            'DESCMOTBLOQ'#9'30'#9'Descrição')
          DataField = 'IDMOTIVOBLOQUEIO'
          DataSource = ds
          LookupTable = QryMotBlq
          LookupField = 'IDMOTIVOBLOQUEIO'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 0
          Visible = False
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object DBRadioGroup4: TDBRadioGroup
          Left = 0
          Top = 5
          Width = 305
          Height = 152
          Hint = 
            'Compra :  Aumenta Sld Liberado'#13#10'Venda:  Diminui Sld Liberado    ' +
            ' '#13#10'Bloqueio: Aumenta Sld Bloqueado e Diminui Sld Liberado'#13#10'Desbl' +
            'oqueio: Diminui Sld Bloqueado e Aumenta Sld Liberado'#13#10'Desbloquei' +
            'o e Venda: Diminui Sld Bloqueado'#13#10
          Caption = ' Atualizações na Custódia '
          Columns = 2
          DataField = 'TIPOCUSTODIA'
          DataSource = ds
          Items.Strings = (
            '&Compra'
            '&Venda'
            '&Bloqueio'
            '&Desbloqueio'
            'De&sbloqueio e Venda'
            '&Não altera')
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Values.Strings = (
            'C'
            'V'
            'B'
            'D'
            'X'
            'N')
          OnChange = DBRadioGroup4Change
        end
      end
      object TbFinanc: TTabSheet
        Caption = 'Financeiro'
        object Label6: TLabel
          Left = 5
          Top = 81
          Width = 81
          Height = 13
          Caption = 'Tipo Rec/Des'
        end
        object Label5: TLabel
          Left = 5
          Top = 119
          Width = 112
          Height = 13
          Caption = 'Tipo do Documento'
          Visible = False
        end
        object Label15: TLabel
          Left = 5
          Top = 39
          Width = 84
          Height = 13
          AutoSize = False
          Caption = 'Tipo Credor '
        end
        object Label8: TLabel
          Left = 5
          Top = 159
          Width = 81
          Height = 13
          Caption = 'Tipo de Conta'
        end
        object lblAjusteCpVd: TLabel
          Left = 250
          Top = 39
          Width = 287
          Height = 13
          Caption = 'Tipo de Operação para Zerar Conta de Liquidação'
        end
        object DbLkcCredor: TwwDBLookupCombo
          Left = 5
          Top = 55
          Width = 236
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'RAZAOSOCIAL'#9'40'#9'Fornecedor')
          LookupTable = QryCredor
          LookupField = 'IDPESSOA'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 2
          Visible = False
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
        end
        object DbCmbTipoCredor: TwwDBComboBox
          Left = 5
          Top = 55
          Width = 237
          Height = 21
          ShowButton = True
          Style = csDropDown
          MapList = True
          AllowClearKey = True
          AutoDropDown = True
          ShowMatchText = True
          DataField = 'TIPCREDOR'
          DataSource = ds
          DropDownCount = 8
          ItemHeight = 0
          Items.Strings = (
            'Corretora'#9'CO'
            'Emissor'#9'EM'
            'Custodiante'#9'CT'
            'Comprador - Vendedor'#9'CV')
          Sorted = False
          TabOrder = 1
          UnboundDataType = wwDefault
        end
        object DbCmbRecPag: TwwDBComboBox
          Left = 5
          Top = 96
          Width = 237
          Height = 21
          ShowButton = True
          Style = csDropDown
          MapList = True
          AllowClearKey = True
          AutoDropDown = True
          ShowMatchText = True
          DataField = 'RECPAG'
          DataSource = ds
          DropDownCount = 8
          ItemHeight = 0
          Items.Strings = (
            'Recebimento'#9'R'
            'Desconto'#9'D'
            'Pagamento'#9'P'
            'Dedução '#9'U')
          Sorted = False
          TabOrder = 3
          UnboundDataType = wwDefault
          OnChange = DbCmbRecPagChange
        end
        object DbLkcTipoDoc: TwwDBLookupCombo
          Left = 5
          Top = 135
          Width = 237
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'40'#9'Tipo de Documento ')
          DataField = 'CODTIPDOC'
          DataSource = ds
          LookupTable = QryTipoDoc
          LookupField = 'CODTIPDOC'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 4
          Visible = False
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object RgTipoCred: TRadioGroup
          Left = 5
          Top = 2
          Width = 236
          Height = 33
          Caption = ' Credor por '
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Tipo'
            'R.Social')
          TabOrder = 0
          OnClick = RgTipoCredClick
        end
        object GroupBox3: TGroupBox
          Left = 250
          Top = 2
          Width = 338
          Height = 33
          TabOrder = 6
          object DBCheckBox1: TDBCheckBox
            Left = 8
            Top = 10
            Width = 87
            Height = 18
            Caption = 'Contabiliza'
            DataField = 'FLGGERACONTAB'
            DataSource = ds
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox2: TDBCheckBox
            Left = 169
            Top = 10
            Width = 135
            Height = 17
            Caption = 'Integra CaP/CaR'
            DataField = 'FLGGERACAPCAR'
            DataSource = ds
            TabOrder = 1
            ValueChecked = '1'
            ValueUnchecked = '0'
            OnClick = DBCheckBox2Click
          end
        end
        object dbrImposto: TDBRadioGroup
          Left = 250
          Top = 83
          Width = 339
          Height = 73
          Caption = 'Imposto de Renda'
          DataField = 'FLGTRATAIR'
          DataSource = ds
          Items.Strings = (
            'Não é Fato Gerador'
            'Fato Gerador c/ Base de Cáculo = Valor da Operação'
            'Fato Gerador c/ Base de Cálculo  = Ganho de Capital')
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          Values.Strings = (
            'N'
            'V'
            'G')
          OnChange = DBRadioGroup4Change
        end
        object DbCmbTipoResgate: TwwDBComboBox
          Left = 5
          Top = 175
          Width = 237
          Height = 21
          ShowButton = True
          Style = csDropDown
          MapList = True
          AllowClearKey = True
          AutoDropDown = True
          ShowMatchText = True
          DataField = 'FLGCONTAINVEST'
          DataSource = ds
          DropDownCount = 8
          ItemHeight = 0
          Items.Strings = (
            'Nenhum'#9'-1'
            'Antigo'#9'0'
            'Novo'#9'1')
          Sorted = False
          TabOrder = 5
          UnboundDataType = wwDefault
        end
        object dblkAjusteCpVd: TwwDBLookupCombo
          Left = 250
          Top = 54
          Width = 338
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCTIPOOPERACAO'#9'40'#9'Operação'#9'F')
          DataField = 'IDTIPOOPERCPVD'
          DataSource = ds
          LookupTable = qryTipoOperCPVD
          LookupField = 'IDTIPOOPERACAO'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 8
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
      end
      object TbTransf: TTabSheet
        Caption = 'Transferências'
        object Lb8: TLabel
          Left = 387
          Top = 36
          Width = 186
          Height = 13
          Caption = 'Motivo de Bloqueio/Desbloqueio'
          Visible = False
        end
        object Lb9: TLabel
          Left = 387
          Top = 110
          Width = 186
          Height = 13
          Caption = 'Motivo de Bloqueio/Desbloqueio'
          Visible = False
        end
        object DbRgTransferencias: TDBRadioGroup
          Left = 4
          Top = 5
          Width = 169
          Height = 141
          Caption = ' Transferências '
          DataField = 'FLGTRANSF'
          DataSource = ds
          Items.Strings = (
            'Antes'
            'Depois'
            'Não Faz')
          TabOrder = 0
          Values.Strings = (
            'A'
            'D'
            'N')
          OnChange = DbRgTransferenciasChange
        end
        object DbRgOrigem: TDBRadioGroup
          Left = 186
          Top = 5
          Width = 189
          Height = 68
          Caption = ' Tipo de Saldo da Origem '
          DataField = 'TIPSALDOCARTORIG'
          DataSource = ds
          Items.Strings = (
            'Liberado '
            'Bloqueado')
          TabOrder = 1
          Values.Strings = (
            'L'
            'B')
          OnChange = DbRgOrigemChange
        end
        object DbLkc8: TwwDBLookupCombo
          Left = 387
          Top = 51
          Width = 193
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'SIGLAMOTBLOQ'#9'10'#9'Sigla'
            'DESCMOTBLOQ'#9'30'#9'Descrição')
          DataField = 'MOTBLOQCARTORIG'
          DataSource = ds
          LookupTable = QryMotBlq
          LookupField = 'IDMOTIVOBLOQUEIO'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 2
          Visible = False
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object DbRgDestino: TDBRadioGroup
          Left = 186
          Top = 79
          Width = 189
          Height = 68
          Caption = ' Tipo de Saldo do Destino'
          DataField = 'TIPSALDOCARTDEST'
          DataSource = ds
          Items.Strings = (
            'Liberado '
            'Bloqueado')
          TabOrder = 3
          Values.Strings = (
            'L'
            'B')
          OnChange = DbRgDestinoChange
        end
        object DbLkc9: TwwDBLookupCombo
          Left = 387
          Top = 126
          Width = 193
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'SIGLAMOTBLOQ'#9'10'#9'Sigla'
            'DESCMOTBLOQ'#9'30'#9'Descrição')
          DataField = 'MOTBLOQCARTDEST'
          DataSource = ds
          LookupTable = QryMotBlq
          LookupField = 'IDMOTIVOBLOQUEIO'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 4
          Visible = False
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
      end
      object TbOprDir: TTabSheet
        Caption = 'Operações de Direito'
        object Bevel2: TBevel
          Left = -9
          Top = 26
          Width = 615
          Height = 9
          Shape = bsTopLine
        end
        object DbChkQtdeXPerc: TDBCheckBox
          Left = 36
          Top = 39
          Width = 93
          Height = 16
          Hint = 'Qtde. Operação = %  s/ Saldo na AGE'
          Caption = 'Percentual '
          DataField = 'FLGPERC'
          DataSource = ds
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckBox5: TDBCheckBox
          Left = 51
          Top = 5
          Width = 97
          Height = 17
          Caption = 'Data AGE'
          DataField = 'FLGAGE'
          DataSource = ds
          TabOrder = 0
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckBox6: TDBCheckBox
          Left = 163
          Top = 5
          Width = 97
          Height = 17
          Caption = 'Data Base'
          DataField = 'FLGDATAEX'
          DataSource = ds
          TabOrder = 1
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckBox7: TDBCheckBox
          Left = 283
          Top = 5
          Width = 97
          Height = 17
          Caption = 'Data Prevista'
          DataField = 'FLGDATACOM'
          DataSource = ds
          TabOrder = 2
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object GrBxSubscricao: TGroupBox
          Left = 2
          Top = 65
          Width = 319
          Height = 92
          Caption = ' Subscrição '
          TabOrder = 4
          object DbChkPrazoBolsa: TDBCheckBox
            Left = 8
            Top = 18
            Width = 138
            Height = 17
            Caption = 'Data Limite Bolsa'
            DataField = 'FLGPRZBOLSA'
            DataSource = ds
            TabOrder = 0
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DbChkPrazoEmpresa: TDBCheckBox
            Left = 8
            Top = 43
            Width = 138
            Height = 16
            Caption = 'Data Limite Empresa'
            DataField = 'FLGPRZEMP'
            DataSource = ds
            TabOrder = 1
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DbAtaDecisao: TDBCheckBox
            Left = 168
            Top = 43
            Width = 138
            Height = 17
            Caption = 'Ata Decisão'
            DataField = 'FLGATADEC'
            DataSource = ds
            TabOrder = 4
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DbChkFormaPagamento: TDBCheckBox
            Left = 168
            Top = 68
            Width = 138
            Height = 17
            Caption = 'Forma Pagamento'
            DataField = 'FLGFORMAPAGREC'
            DataSource = ds
            TabOrder = 5
            ValueChecked = 'P'
            ValueUnchecked = 'N;R'
            OnClick = DbChkFormaPagamentoClick
          end
          object DBCkLimPgto: TDBCheckBox
            Left = 8
            Top = 68
            Width = 141
            Height = 17
            Caption = 'Data Limite p/ Pagto'
            DataField = 'FLGINIPAG'
            DataSource = ds
            TabOrder = 2
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBCkPuSub: TDBCheckBox
            Left = 168
            Top = 18
            Width = 134
            Height = 17
            Caption = 'PU'
            DataField = 'FLGDIVACAO'
            DataSource = ds
            TabOrder = 3
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
        object GrBxDividendos: TGroupBox
          Left = 333
          Top = 65
          Width = 248
          Height = 91
          Caption = 'Dividendos e Juros s/ Cap. da Empresa'
          TabOrder = 5
          object DbChkDividendos: TDBCheckBox
            Left = 8
            Top = 18
            Width = 185
            Height = 17
            Caption = 'Dividendos por Ação'
            DataField = 'FLGDIVACAO'
            DataSource = ds
            TabOrder = 0
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DbChkInicioPgto: TDBCheckBox
            Left = 8
            Top = 43
            Width = 184
            Height = 17
            Caption = 'Início de Pagamento'
            DataField = 'FLGINIPAG'
            DataSource = ds
            TabOrder = 1
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DbChkFormaReceb: TDBCheckBox
            Left = 8
            Top = 68
            Width = 185
            Height = 17
            Caption = 'Forma de Recebimento'
            DataField = 'FLGFORMAPAGREC'
            DataSource = ds
            TabOrder = 2
            ValueChecked = 'R'
            ValueUnchecked = 'N;P'
            OnClick = DbChkFormaRecebClick
          end
        end
        object DbLkcParidade: TDBCheckBox
          Left = 137
          Top = 39
          Width = 164
          Height = 17
          Caption = 'Proporção'
          DataField = 'FLGPARIDADE'
          DataSource = ds
          TabOrder = 7
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DbLkIsentoIR: TDBCheckBox
          Left = 248
          Top = 40
          Width = 93
          Height = 16
          Hint = 'Qtde. Operação = %  s/ Saldo na AGE'
          Caption = 'Isento de IR'
          DataField = 'FLGISENTOIR'
          DataSource = ds
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DbLkGeraIRLitigio: TDBCheckBox
          Left = 369
          Top = 39
          Width = 164
          Height = 17
          Caption = 'Gera IR Litígio'
          DataField = 'FLGGRAVAIRLITIGIO'
          DataSource = ds
          TabOrder = 9
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCkDataVenc: TDBCheckBox
          Left = 402
          Top = 5
          Width = 141
          Height = 17
          Hint = 'Data de Vencimento'
          Caption = 'Data de Vencimento'
          DataField = 'FLGDATAVENCIMENTO'
          DataSource = ds
          TabOrder = 3
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 612
    inherited Toolbar971: TToolbar97
      object sbtnCopiar: TToolbarButton97
        Left = 240
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Copiar'
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
        ImageIndex = 9
        Images = ImlPadrao
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        OnClick = sbtnCopiarClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 434
    Width = 612
    inherited tb97Fundo: TToolbar97
      Left = 440
      DockPos = 476
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 271
      DockPos = 307
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 401
    Top = 6
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 350
    Top = 6
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOOPERACAO'
      'set'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDMERCADO = :IDMERCADO,'
      '  DESCTIPOOPERACAO = :DESCTIPOOPERACAO,'
      '  NATUREZAOPERACAO = :NATUREZAOPERACAO,'
      '  TIPOCUSTODIA = :TIPOCUSTODIA,'
      '  VENCIMENTO = :VENCIMENTO,'
      '  CODTIPDOC = :CODTIPDOC,'
      '  FLGGERACONTAB = :FLGGERACONTAB,'
      '  FLGGERACAPCAR = :FLGGERACAPCAR,'
      '  RECPAG = :RECPAG,'
      '  TIPCREDOR = :TIPCREDOR,'
      '  FLGGERACAF = :FLGGERACAF,'
      '  FLGTRANSF = :FLGTRANSF,'
      '  FLGCORRET = :FLGCORRET,'
      '  FLGORDMOVINV = :FLGORDMOVINV,'
      '  IDMOTIVOBLOQUEIO = :IDMOTIVOBLOQUEIO,'
      '  FLGOPDIREITO = :FLGOPDIREITO,'
      '  FLGAGE = :FLGAGE,'
      '  FLGDATAEX = :FLGDATAEX,'
      '  FLGDATACOM = :FLGDATACOM,'
      '  FLGINVORIGEM = :FLGINVORIGEM,'
      '  FLGPERC = :FLGPERC,'
      '  FLGPARIDADE = :FLGPARIDADE,'
      '  FLGPRZBOLSA = :FLGPRZBOLSA,'
      '  FLGPRZEMP = :FLGPRZEMP,'
      '  FLGATADEC = :FLGATADEC,'
      '  FLGFORMAPAGREC = :FLGFORMAPAGREC,'
      '  FLGDIVACAO = :FLGDIVACAO,'
      '  FLGINIPAG = :FLGINIPAG,'
      '  FLGJUROS = :FLGJUROS,'
      '  MOTBLOQCARTORIG = :MOTBLOQCARTORIG,'
      '  MOTBLOQCARTDEST = :MOTBLOQCARTDEST,'
      '  TIPSALDOCARTORIG = :TIPSALDOCARTORIG,'
      '  TIPSALDOCARTDEST = :TIPSALDOCARTDEST,'
      '  FLGTRATAIR = :FLGTRATAIR,'
      '  SIGLATIPOOPER = :SIGLATIPOOPER,'
      '  FLGISENTOIR = :FLGISENTOIR,'
      '  FLGGRAVAIRLITIGIO = :FLGGRAVAIRLITIGIO,'
      '  STAATIVO = :STAATIVO,'
      '  TIPOMOVTO = :TIPOMOVTO,'
      '  FLGRENTABILIDADE = :FLGRENTABILIDADE,'
      '  FLGCONTAINVEST = :FLGCONTAINVEST,'
      '  FLGDATAVENCIMENTO = :FLGDATAVENCIMENTO,'
      '  FLGOBRIGAOBS = :FLGOBRIGAOBS,'
      '  IDTIPOOPERCPVD = :IDTIPOOPERCPVD'
      'where'
      '  IDTIPOINVEST = :OLD_IDTIPOINVEST and'
      '  IDTIPOOPERACAO = :OLD_IDTIPOOPERACAO')
    InsertSQL.Strings = (
      'insert into TIPOOPERACAO'
      '  (IDTIPOINVEST, IDTIPOOPERACAO, IDMERCADO, DESCTIPOOPERACAO, '
      'NATUREZAOPERACAO, '
      '   TIPOCUSTODIA, VENCIMENTO, CODTIPDOC, FLGGERACONTAB, '
      'FLGGERACAPCAR, RECPAG, '
      '   TIPCREDOR, FLGGERACAF, FLGTRANSF, FLGCORRET, FLGORDMOVINV, '
      'IDMOTIVOBLOQUEIO, '
      '   FLGOPDIREITO, FLGAGE, FLGDATAEX, FLGDATACOM, FLGINVORIGEM, '
      'FLGPERC, '
      '   FLGPARIDADE, FLGPRZBOLSA, FLGPRZEMP, FLGATADEC, '
      'FLGFORMAPAGREC, FLGDIVACAO, '
      '   FLGINIPAG, FLGJUROS, MOTBLOQCARTORIG, MOTBLOQCARTDEST, '
      'TIPSALDOCARTORIG, '
      '   TIPSALDOCARTDEST, FLGTRATAIR, SIGLATIPOOPER, FLGISENTOIR, '
      'FLGGRAVAIRLITIGIO, '
      '   STAATIVO, TIPOMOVTO, FLGRENTABILIDADE, FLGCONTAINVEST, '
      'FLGDATAVENCIMENTO, FLGOBRIGAOBS, IDTIPOOPERCPVD)'
      'values'
      
        '  (:IDTIPOINVEST, :IDTIPOOPERACAO, :IDMERCADO, :DESCTIPOOPERACAO' +
        ', '
      ':NATUREZAOPERACAO, '
      '   :TIPOCUSTODIA, :VENCIMENTO, :CODTIPDOC, :FLGGERACONTAB, '
      ':FLGGERACAPCAR, '
      '   :RECPAG, :TIPCREDOR, :FLGGERACAF, :FLGTRANSF, :FLGCORRET, '
      ':FLGORDMOVINV, '
      '   :IDMOTIVOBLOQUEIO, :FLGOPDIREITO, :FLGAGE, :FLGDATAEX, '
      ':FLGDATACOM, '
      
        '   :FLGINVORIGEM, :FLGPERC, :FLGPARIDADE, :FLGPRZBOLSA, :FLGPRZE' +
        'MP, '
      ':FLGATADEC, '
      '   :FLGFORMAPAGREC, :FLGDIVACAO, :FLGINIPAG, :FLGJUROS, '
      ':MOTBLOQCARTORIG, '
      '   :MOTBLOQCARTDEST, :TIPSALDOCARTORIG, :TIPSALDOCARTDEST, '
      ':FLGTRATAIR, '
      '   :SIGLATIPOOPER, :FLGISENTOIR, :FLGGRAVAIRLITIGIO, :STAATIVO, '
      ':TIPOMOVTO, '
      '   :FLGRENTABILIDADE, :FLGCONTAINVEST, :FLGDATAVENCIMENTO,'
      ':FLGOBRIGAOBS, :IDTIPOOPERCPVD)'
      ' ')
    DeleteSQL.Strings = (
      'delete from TIPOOPERACAO'
      'where'
      '  IDTIPOINVEST = :OLD_IDTIPOINVEST and'
      '  IDTIPOOPERACAO = :OLD_IDTIPOOPERACAO')
    Left = 322
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TipoOperacao.IDTIPOOPERACAO'
      'TipoOperacao.DescTipoOperacao'
      'TipoInvest.DescTipoInvest'
      'Mercado.DescMercado'
      'TipoOperacao.NaturezaOperacao'
      'MOTIVOBLOQUEIO.SIGLAMOTBLOQ')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código '
      'Tipo da Operação'
      'Tipo do Investimento'
      'Mercado'
      'Natureza'
      'Sigla Bloq.')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'TIPOOPERACAO'
      'TIPOINVEST'
      'MERCADO'
      'MOTIVOBLOQUEIO')
    CamposChave.Strings = (
      'TipoOperacao.IdTipoOperacao'
      'TipoOperacao.IdTipoInvest'
      'Mercado.IdMercado'
      'TipoInvest.IdTipoInvest')
    Filtro.Strings = (
      'TipoOperacao.IdMercado = Mercado.IdMercado(+)'
      'TipoOperacao.IdTipoInvest = TipoInvest.IdTipoInvest'
      
        'TipoOperacao.IdMotivoBloqueio = MotivoBloqueio.IdMotivoBloqueio(' +
        '+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '5'
      '30'
      '20'
      '15'
      '4'
      '6')
    Left = 386
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 401
    Top = 6
    Bitmap = {
      494C01010B000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
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
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      FF000000FF000000FF0000000000FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B00FFFF
      FF0000000000000000007B7B7B00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      FF000000FF000000FF0000000000FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B00FFFF
      FF0000000000000000007B7B7B00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      FF000000FF000000FF0000000000FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B00FFFF
      FF00FFFFFF00FFFFFF007B7B7B00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B007B7B7B00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B00FFFFFF0000000000000000007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF00000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00000000007B7B7B00FFFFFF000000
      0000000000007B7B7B00FFFFFF00000000000000000000000000000000007B7B
      7B007B7B7B007B7B7B00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF00000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00000000007B7B7B00FFFFFF000000
      0000000000007B7B7B00FFFFFF00000000000000000000000000000000007B7B
      7B007B7B7B007B7B7B00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF00000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00000000007B7B7B00FFFFFF00FFFF
      FF00FFFFFF007B7B7B00FFFFFF00000000000000000000000000FFFFFF007B7B
      7B007B7B7B007B7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00000000007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B000000000000000000000000007B7B7B007B7B7B007B7B
      7B007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
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
      0000000000000000000000840000008400000084000000840000008400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400008400000084000000840000008400000084000000840000008400000084
      0000008400000000000000000000000000000000000000000000000000000000
      0000000000000000FF00000084000000FF00000084000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000008400000084000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      0000008400000084000000000000000000000084000000840000008400000084
      0000008400000084000000000000000000000000000000000000848484000000
      FF000000FF00000084000000FF00000084000000FF00000084000000FF000000
      84000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000848484008400
      0000840000008400000084848400FFFFFF008484840084000000840000008400
      00000000000000000000000000000000000000000000000000008484840000FF
      000000840000FFFFFF00FFFFFF00FFFFFF000000000000840000008400000084
      00000084000000840000000000000000000000000000848484000000FF000000
      FF00000084000000FF00000084000000FF00000084000000FF00000084000000
      FF00000084000000000000000000000000000000000084848400FFFFFF0000FF
      FF0084848400000000008484840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400840000008400
      00008400000084000000FFFFFF00FFFFFF00FFFFFF0084000000840000008400
      000084000000000000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000008400000084
      00000084000000840000008400000000000000000000848484000000FF000000
      840084848400FFFFFF000000FF00000084000000FF00FFFFFF00848484000000
      84000000FF000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400840000008400
      0000840000008400000084848400FFFFFF008484840084000000840000008400
      000084000000000000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000084
      000000840000008400000084000000000000848484000000FF00000084000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000000000000000000000000000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
      000000840000008400000084000000000000848484000000FF000000FF000000
      84000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      84000000FF0000008400000000000000000084848400FFFFFF0000FFFF0000FF
      FF000000000000000000000000008484840000FFFF00000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000FFFFFF000000000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF000000000000840000FFFFFF00FFFFFF00FFFF
      FF0000000000008400000084000000000000848484000000FF00000084000000
      FF00000084000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00000084000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000FFFFFF000000000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00008400000084000000840000FFFFFF00FFFF
      FF0000000000008400000084000000000000848484000000FF000000FF000000
      84000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      84000000FF0000008400000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00848484000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      000084000000840000008400000000000000FFFFFF00FFFFFF00840000008400
      00008400000084000000000000000000000000000000000000008484840000FF
      000000840000008400000084000000840000008400000084000000840000FFFF
      FF00FFFFFF00008400000000000000000000848484000000FF00000084000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000FFFFFF00FFFFFF00840000008400000000000000FFFFFF00FFFFFF008400
      00008400000084000000000000000000000000000000000000008484840000FF
      0000008400000084000000840000008400000084000000840000008400000084
      00000084000000840000000000000000000000000000848484000000FF000000
      840084848400FFFFFF000000FF00000084000000FF00FFFFFF00848484000000
      84000000FF000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF000000000000000000000000000000000084848400FF0000008400
      0000FFFFFF00FFFFFF00000000008400000000000000FFFFFF00FFFFFF008400
      0000840000000000000000000000000000000000000000000000000000008484
      840000FF000000FF000000840000008400000084000000840000008400000084
      00000084000000000000000000000000000000000000848484000000FF000000
      FF00000084000000FF00000084000000FF00000084000000FF00000084000000
      FF00000084000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400FF0000008400
      000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000848484008484840000FF000000FF000000FF000000FF000000FF00008484
      8400848484000000000000000000000000000000000000000000848484000000
      FF000000FF00000084000000FF00000084000000FF00000084000000FF000000
      840000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000000000000084848400FF00
      0000FF00000084000000FFFFFF00FFFFFF00FFFFFF0084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000FF000000FF000000FF000000FF000000FF00848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      840084848400FF000000FF000000FF000000FF000000FF000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      0000000000000000000000FFFF0000FFFF008484840084848400000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      000000000000000000008484840084848400FFFFFF00FFFFFF00000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000000000000000000000000000000000FFFFFF0000000000000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      0000000000000000000000000000000000000000840000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000084000000
      8400000084000000840000008400FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000840000008400000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF0000000000000000000000000000000000000000000000000000FFFF008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      000000FFFF0000FFFF000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000000084000000FF000000
      FF000000FF000000FF000000FF0000008400FFFFFF00FFFFFF00FF000000FFFF
      FF00000000000000000000000000000000000000840000008400000084000000
      000084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000FFFF0000FFFF0000FFFF008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF0000FFFF00000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF0000008400FF000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000008400000084000000
      840000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FF00
      0000FFFFFF00FFFFFF000000000000000000000000000000000000FFFF0000FF
      FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      0000FFFFFF008484840084848400000000000000FF000000FF0000000000FFFF
      FF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF00FF00
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000084000000
      0000FFFF000000000000FFFF0000000000000000000084840000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000000000FF
      FF0084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000FF000000FF000000FF000000
      0000FFFFFF00FFFFFF000000FF000000FF0000008400FF000000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      000000000000FFFF000000000000FFFF00000000000000000000FFFFFF00FFFF
      FF00FFFFFF0084848400848484000000000000000000000000000000000000FF
      FF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484008484840000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF000000000000000000000000000000FF000000FF000000FF00FFFF
      FF00FFFFFF00000000000000FF000000FF0000008400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008484840084848400000000000000000000000000000000000000
      0000FFFF000000000000FFFF000000000000FFFF000000000000FFFFFF008484
      840084848400000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00848484008484
      840000FFFF0000FFFF0000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000FF000000FF0000000000FFFF
      FF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF008484
      840084848400000000000000000000000000000000000000000000000000FFFF
      000000000000FFFF000000000000FFFF00000000000000000000848484000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00000000000000000000FFFF00848484008484840084848400000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400848484000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000084008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF000000000000FFFF000000000000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00848484008484
      84000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFF8000FFE00000FFFF8000FFC00000
      FFFFC000FFCC0000FFFFE000FFCC0000FFFFF000FFC00000FFFFF800FFC10000
      E007FC00FFFB0000F00FFE00FFF10000F81FFF00FFE00000FC3FFF80C1800000
      FE7F838081800000FFFF83E099E10000FFFF83E099E10000FFFF83E081C30000
      FFFF838483870000FFFFFFFEFFFF0000FC1FFFFFFFFFFFFFF007F83FF83FF83F
      E003E00FE00FE00FC301C007C007C007C0818003800380038040800380038003
      8020000100010001811000010001008181080001000100818008000100010101
      C001000100010081C001800380038283E003800380038023F007C007C007C007
      FC1FE00FE00FE00FFFFFF83FF83FF83FFEFFFF1FFFFFFF9FBC3DFC0FFF9FFE1F
      CC33F00FFE1FF81FC003E00FF81FE00FC007E007E00FE00FC00FF007E00F6007
      C007C003C0073007C003C001800710030000C00000038001C003E0012001C500
      E001E0071000CA81E003F0030401D507C003F0012007CA9FCC33F803801FD53F
      BEFDFC0FC1FFEA7FFEFFFE3FFFFFF0FF00000000000000000000000000000000
      000000000000}
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 416
    Top = 6
  end
  inherited qry: TwwQuery
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      
        'SELECT  TPO.IDTIPOINVEST, TPO.IDTIPOOPERACAO, TPO.IDMERCADO, TPO' +
        '.DESCTIPOOPERACAO, TPO.NATUREZAOPERACAO,'
      
        #9'TPO.TIPOCUSTODIA, TPO.VENCIMENTO, TPO.CODTIPDOC, TPO.FLGGERACON' +
        'TAB, TPO.FLGGERACAPCAR,'
      
        #9'TPO.RECPAG, TPO.TIPCREDOR, TPO.FLGGERACAF, TPO.FLGTRANSF, TPO.F' +
        'LGCORRET, TPO.FLGORDMOVINV,'
      
        #9'TPO.IDMOTIVOBLOQUEIO, TPO.FLGOPDIREITO, TPO.FLGAGE, TPO.FLGDATA' +
        'EX, TPO.FLGDATACOM,'
      
        #9'TPO.FLGINVORIGEM, TPO.FLGPERC, TPO.FLGPARIDADE, TPO.FLGPRZBOLSA' +
        ', TPO.FLGPRZEMP,'
      
        #9'TPO.FLGATADEC, TPO.FLGFORMAPAGREC, TPO.FLGDIVACAO, TPO.FLGINIPA' +
        'G, TPO.FLGJUROS,'
      #9'TPO.MOTBLOQCARTORIG, TPO.MOTBLOQCARTDEST, TPO.TIPSALDOCARTORIG,'
      
        '        TPO.TIPSALDOCARTDEST, TPO.FLGTRATAIR, TPO.SIGLATIPOOPER,' +
        ' TPO.FLGISENTOIR,'
      '        TPO.FLGGRAVAIRLITIGIO, TPO.FLGOPGERENC, TPO.STAATIVO,'
      
        '        TPO.TIPOMOVTO, TPO.FLGRENTABILIDADE, TPO.FLGCONTAINVEST,' +
        ' TPO.FLGDATAVENCIMENTO,'
      '        TPO.FLGOBRIGAOBS, TPO.IDTIPOOPERCPVD '
      'FROM TIPOOPERACAO TPO'
      'WHERE TPO.IDTIPOINVEST = :IDTIPOINVEST'
      '  AND TPO.IDTIPOOPERACAO = :IDTIPOOPERACAO'
      ''
      ' '
      ' '
      ' '
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 294
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end>
    object qryIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'TIPOOPERACAO.IDTIPOINVEST'
    end
    object qryIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.IDTIPOOPERACAO'
    end
    object qryIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
      Origin = 'TIPOOPERACAO.IDMERCADO'
    end
    object qryDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object N: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'TIPOOPERACAO.NATUREZAOPERACAO'
      Size = 1
    end
    object qryTIPOCUSTODIA: TStringField
      FieldName = 'TIPOCUSTODIA'
      Origin = 'TIPOOPERACAO.TIPOCUSTODIA'
      Size = 1
    end
    object qryVENCIMENTO: TFloatField
      FieldName = 'VENCIMENTO'
      Origin = 'TIPOOPERACAO.VENCIMENTO'
    end
    object qryCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
      Origin = 'TIPOOPERACAO.CODTIPDOC'
    end
    object qryFLGGERACONTAB: TFloatField
      FieldName = 'FLGGERACONTAB'
      Origin = 'TIPOOPERACAO.FLGGERACONTAB'
    end
    object qryFLGGERACAPCAR: TFloatField
      FieldName = 'FLGGERACAPCAR'
      Origin = 'TIPOOPERACAO.FLGGERACAPCAR'
    end
    object qryRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'TIPOOPERACAO.RECPAG'
      Size = 1
    end
    object qryTIPCREDOR: TStringField
      FieldName = 'TIPCREDOR'
      Origin = 'TIPOOPERACAO.TIPCREDOR'
      Size = 2
    end
    object qryFLGGERACAF: TFloatField
      FieldName = 'FLGGERACAF'
      Origin = 'TIPOOPERACAO.FLGGERACAF'
    end
    object qryFLGTRANSF: TStringField
      FieldName = 'FLGTRANSF'
      Origin = 'TIPOOPERACAO.FLGTRANSF'
      Size = 1
    end
    object qryFLGCORRET: TStringField
      FieldName = 'FLGCORRET'
      Origin = 'TIPOOPERACAO.FLGCORRET'
      Size = 1
    end
    object qryFLGORDMOVINV: TStringField
      FieldName = 'FLGORDMOVINV'
      Origin = 'TIPOOPERACAO.FLGORDMOVINV'
      Size = 1
    end
    object qryIDMOTIVOBLOQUEIO: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
      Origin = 'TIPOOPERACAO.IDMOTIVOBLOQUEIO'
    end
    object qryFLGOPDIREITO: TStringField
      FieldName = 'FLGOPDIREITO'
      Origin = 'TIPOOPERACAO.FLGOPDIREITO'
      Size = 1
    end
    object qryFLGAGE: TStringField
      FieldName = 'FLGAGE'
      Origin = 'TIPOOPERACAO.FLGAGE'
      Size = 1
    end
    object qryFLGDATAEX: TStringField
      FieldName = 'FLGDATAEX'
      Origin = 'TIPOOPERACAO.FLGDATAEX'
      Size = 1
    end
    object qryFLGDATACOM: TStringField
      FieldName = 'FLGDATACOM'
      Origin = 'TIPOOPERACAO.FLGDATACOM'
      Size = 1
    end
    object qryFLGINVORIGEM: TStringField
      FieldName = 'FLGINVORIGEM'
      Origin = 'TIPOOPERACAO.FLGINVORIGEM'
      Size = 1
    end
    object qryFLGPERC: TStringField
      FieldName = 'FLGPERC'
      Origin = 'TIPOOPERACAO.FLGPERC'
      Size = 1
    end
    object qryFLGPARIDADE: TStringField
      FieldName = 'FLGPARIDADE'
      Origin = 'TIPOOPERACAO.FLGPARIDADE'
      Size = 1
    end
    object qryFLGPRZBOLSA: TStringField
      FieldName = 'FLGPRZBOLSA'
      Origin = 'TIPOOPERACAO.FLGPRZBOLSA'
      Size = 1
    end
    object qryFLGPRZEMP: TStringField
      FieldName = 'FLGPRZEMP'
      Origin = 'TIPOOPERACAO.FLGPRZEMP'
      Size = 1
    end
    object qryFLGATADEC: TStringField
      FieldName = 'FLGATADEC'
      Origin = 'TIPOOPERACAO.FLGATADEC'
      Size = 1
    end
    object qryFLGFORMAPAGREC: TStringField
      FieldName = 'FLGFORMAPAGREC'
      Origin = 'TIPOOPERACAO.FLGFORMAPAGREC'
      Size = 1
    end
    object qryFLGDIVACAO: TStringField
      FieldName = 'FLGDIVACAO'
      Origin = 'TIPOOPERACAO.FLGDIVACAO'
      Size = 1
    end
    object qryFLGINIPAG: TStringField
      FieldName = 'FLGINIPAG'
      Origin = 'TIPOOPERACAO.FLGINIPAG'
      Size = 1
    end
    object qryFLGJUROS: TStringField
      FieldName = 'FLGJUROS'
      Origin = 'TIPOOPERACAO.FLGJUROS'
      Size = 1
    end
    object qryMOTBLOQCARTORIG: TFloatField
      FieldName = 'MOTBLOQCARTORIG'
      Origin = 'TIPOOPERACAO.MOTBLOQCARTORIG'
    end
    object qryMOTBLOQCARTDEST: TFloatField
      FieldName = 'MOTBLOQCARTDEST'
      Origin = 'TIPOOPERACAO.MOTBLOQCARTDEST'
    end
    object qryTIPSALDOCARTORIG: TStringField
      FieldName = 'TIPSALDOCARTORIG'
      Origin = 'TIPOOPERACAO.TIPSALDOCARTORIG'
      Size = 1
    end
    object qryTIPSALDOCARTDEST: TStringField
      FieldName = 'TIPSALDOCARTDEST'
      Origin = 'TIPOOPERACAO.TIPSALDOCARTDEST'
      Size = 1
    end
    object qryFLGTRATAIR: TStringField
      FieldName = 'FLGTRATAIR'
      Origin = 'TIPOOPERACAO.FLGTRATAIR'
      Size = 1
    end
    object qrySIGLATIPOOPER: TStringField
      FieldName = 'SIGLATIPOOPER'
      Origin = 'TIPOOPERACAO.SIGLATIPOOPER'
      Size = 4
    end
    object qryFLGISENTOIR: TStringField
      FieldName = 'FLGISENTOIR'
      Origin = 'TIPOOPERACAO.FLGISENTOIR'
      Size = 1
    end
    object qryFLGGRAVAIRLITIGIO: TStringField
      FieldName = 'FLGGRAVAIRLITIGIO'
      Origin = 'TIPOOPERACAO.FLGGRAVAIRLITIGIO'
      Size = 1
    end
    object qryFLGOPGERENC: TStringField
      FieldName = 'FLGOPGERENC'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGOPGERENC'
      FixedChar = True
      Size = 1
    end
    object qrySTAATIVO: TStringField
      FieldName = 'STAATIVO'
      Origin = 'BASEDADOS.TIPOOPERACAO.STAATIVO'
      FixedChar = True
      Size = 1
    end
    object qryTIPOMOVTO: TStringField
      FieldName = 'TIPOMOVTO'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPOMOVTO'
      Size = 3
    end
    object qryFLGRENTABILIDADE: TStringField
      FieldName = 'FLGRENTABILIDADE'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGRENTABILIDADE'
      FixedChar = True
      Size = 1
    end
    object qryFLGCONTAINVEST: TFloatField
      FieldName = 'FLGCONTAINVEST'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGCONTAINVEST'
    end
    object qryFLGDATAVENCIMENTO: TStringField
      FieldName = 'FLGDATAVENCIMENTO'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGDATAVENCIMENTO'
      FixedChar = True
      Size = 1
    end
    object qryFLGOBRIGAOBS: TStringField
      FieldName = 'FLGOBRIGAOBS'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGOBRIGAOBS'
      FixedChar = True
      Size = 1
    end
    object qryIDTIPOOPERCPVD: TFloatField
      FieldName = 'IDTIPOOPERCPVD'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDTIPOOPERCPVD'
    end
  end
  object qryTipoinvest: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'select       TI.IdTipoInvest,'
      '             TI.DescTipoInvest'
      ''
      'From        TipoInvest TI'
      ''
      'Order By TI.DescTipoInvest'
      ''
      ' ')
    ValidateWithMask = True
    Left = 373
    Top = 107
  end
  object qryMercado: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT IDMERCADO,'
      '       DESCMERCADO'
      'FROM MERCADO'
      'WHERE'
      '  IDTIPOINVEST = :P_IDTIPOINVEST')
    ValidateWithMask = True
    Left = 524
    Top = 170
    ParamData = <
      item
        DataType = ftInteger
        Name = 'P_IDTIPOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryCredor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PS.IDPESSOA, PS.RAZAOSOCIAL'
      ''
      'FROM PESSOA PS, EMPRESAFORN EF'
      ''
      'WHERE EF.IDFORCLI = PS.IDPESSOA '
      ''
      'ORDER BY PS.RAZAOSOCIAL')
    ValidateWithMask = True
    Left = 340
    Top = 61
    object QryCredorIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PESSOA.IDPESSOA'
    end
    object QryCredorRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'PESSOA.RAZAOSOCIAL'
      Size = 60
    end
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 448
    Top = 6
  end
  object QrySubTipo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOINVEST, IDTIPOOPERACAO, EMPRESAPROP, IDFORCLI'
      ''
      'FROM FORCLIXTIPOPER '
      ''
      'WHERE'#9'IDTIPOINVEST'#9'= :IDTIPOINVEST '#9'     AND'
      '                IDTIPOOPERACAO'#9'= :IDTIPOOPERACAO AND '
      '                EMPRESAPROP   '#9'= :EMPRESAPROP')
    ValidateWithMask = True
    Left = 490
    Top = 6
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end>
    object QrySubTipoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'FORCLIXTIPOPER.IDTIPOINVEST'
    end
    object QrySubTipoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'FORCLIXTIPOPER.IDTIPOOPERACAO'
    end
    object QrySubTipoEMPRESAPROP: TFloatField
      FieldName = 'EMPRESAPROP'
      Origin = 'FORCLIXTIPOPER.EMPRESAPROP'
    end
    object QrySubTipoIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'FORCLIXTIPOPER.IDFORCLI'
    end
  end
  object DsSubTipo: TwwDataSource
    DataSet = QrySubTipo
    Left = 518
    Top = 6
  end
  object QryTipoDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODTIPDOC, RECPAG, DESCRICAO, DEBCRE'
      'FROM'
      '   TIPODOCRECPAG'
      'WHERE'
      '  ( RECPAG =:RECPAG ) AND'
      '  ( DEBCRE =:DEBCRE )'
      'ORDER BY'
      '   DESCRICAO')
    ValidateWithMask = True
    Left = 212
    Top = 58
    ParamData = <
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DEBCRE'
        ParamType = ptUnknown
      end>
  end
  object QryMotBlq: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDMOTIVOBLOQUEIO, DESCMOTBLOQ, SIGLAMOTBLOQ'
      'FROM MOTIVOBLOQUEIO'
      'WHERE IDMOTIVOBLOQUEIO > 0'
      'ORDER BY SIGLAMOTBLOQ')
    ValidateWithMask = True
    Left = 278
    Top = 63
    object QryMotBlqSIGLAMOTBLOQ: TStringField
      DisplayLabel = 'Sigla'
      DisplayWidth = 10
      FieldName = 'SIGLAMOTBLOQ'
      Origin = 'MOTIVOBLOQUEIO.SIGLAMOTBLOQ'
      Size = 3
    end
    object QryMotBlqDESCMOTBLOQ: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'DESCMOTBLOQ'
      Origin = 'MOTIVOBLOQUEIO.DESCMOTBLOQ'
      Size = 30
    end
    object QryMotBlqIDMOTIVOBLOQUEIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMOTIVOBLOQUEIO'
      Origin = 'MOTIVOBLOQUEIO.IDMOTIVOBLOQUEIO'
      Visible = False
    end
  end
  object qryParamInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '*'
      'FROM'
      '    PARAMINVEST')
    ValidateWithMask = True
    Left = 560
    Top = 6
  end
  object qryCopiaOper: TwwQuery
    CachedUpdates = True
    AfterScroll = qryAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO TIPOOPERACAO'
      
        '(IDTIPOINVEST, IDTIPOOPERACAO, IDMERCADO, DESCTIPOOPERACAO, NATU' +
        'REZAOPERACAO,'
      
        ' TIPOCUSTODIA, VENCIMENTO, CODTIPDOC, FLGGERACONTAB, FLGGERACAPC' +
        'AR,'
      
        ' RECPAG, TIPCREDOR, FLGGERACAF, FLGTRANSF, FLGCORRET, FLGORDMOVI' +
        'NV,'
      ' IDMOTIVOBLOQUEIO, FLGOPDIREITO, FLGAGE, FLGDATAEX, FLGDATACOM,'
      ' FLGINVORIGEM, FLGPERC, FLGPARIDADE, FLGPRZBOLSA, FLGPRZEMP,'
      ' FLGATADEC, FLGFORMAPAGREC, FLGDIVACAO, FLGINIPAG, FLGJUROS,'
      ' MOTBLOQCARTORIG, MOTBLOQCARTDEST, TIPSALDOCARTORIG,'
      ' TIPSALDOCARTDEST, FLGTRATAIR, SIGLATIPOOPER, FLGISENTOIR,'
      ' FLGGRAVAIRLITIGIO, FLGOPGERENC, STAATIVO,'
      ' TIPOMOVTO, FLGRENTABILIDADE, FLGCONTAINVEST)'
      'VALUES'
      
        '(:IDTIPOINVEST, :IDTIPOOPERACAO, :IDMERCADO, :DESCTIPOOPERACAO, ' +
        ':NATUREZAOPERACAO,'
      
        ' :TIPOCUSTODIA, :VENCIMENTO, :CODTIPDOC, :FLGGERACONTAB, :FLGGER' +
        'ACAPCAR,'
      
        ' :RECPAG, :TIPCREDOR, :FLGGERACAF, :FLGTRANSF, :FLGCORRET, :FLGO' +
        'RDMOVINV,'
      
        ' :IDMOTIVOBLOQUEIO, :FLGOPDIREITO, :FLGAGE, :FLGDATAEX, :FLGDATA' +
        'COM,'
      
        ' :FLGINVORIGEM, :FLGPERC, :FLGPARIDADE, :FLGPRZBOLSA, :FLGPRZEMP' +
        ','
      
        ' :FLGATADEC, :FLGFORMAPAGREC, :FLGDIVACAO, :FLGINIPAG, :FLGJUROS' +
        ','
      ' :MOTBLOQCARTORIG, :MOTBLOQCARTDEST, :TIPSALDOCARTORIG,'
      ' :TIPSALDOCARTDEST, :FLGTRATAIR, :SIGLATIPOOPER, :FLGISENTOIR,'
      ' :FLGGRAVAIRLITIGIO, :FLGOPGERENC, :STAATIVO,'
      ' :TIPOMOVTO, :FLGRENTABILIDADE, :FLGCONTAINVEST)'
      '')
    ValidateWithMask = True
    Left = 526
    Top = 217
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDMERCADO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESCTIPOOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NATUREZAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPOCUSTODIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VENCIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODTIPDOC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGGERACONTAB'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGGERACAPCAR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPCREDOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGGERACAF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGTRANSF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGCORRET'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGORDMOVINV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDMOTIVOBLOQUEIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGOPDIREITO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGAGE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGDATAEX'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGDATACOM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGINVORIGEM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGPERC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGPARIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGPRZBOLSA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGPRZEMP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGATADEC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGFORMAPAGREC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGDIVACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGINIPAG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGJUROS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'MOTBLOQCARTORIG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'MOTBLOQCARTDEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPSALDOCARTORIG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPSALDOCARTDEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGTRATAIR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SIGLATIPOOPER'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGISENTOIR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGGRAVAIRLITIGIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGOPGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STAATIVO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPOMOVTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGRENTABILIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGCONTAINVEST'
        ParamType = ptInput
      end>
  end
  object qryTipoOperCPVD: TwwQuery
    CachedUpdates = True
    AfterScroll = qryAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM TIPOOPERACAO'
      'WHERE IDTIPOINVEST = :IDTIPOINVEST'
      'AND TIPOMOVTO='#39'OPE'#39
      'ORDER BY DESCTIPOOPERACAO'
      ' ')
    ValidateWithMask = True
    Left = 526
    Top = 273
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end>
    object qryTipoOperCPVDDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Operação'
      DisplayWidth = 40
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object qryTipoOperCPVDIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDTIPOINVEST'
      Visible = False
    end
    object qryTipoOperCPVDIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDTIPOOPERACAO'
      Visible = False
    end
    object qryTipoOperCPVDIDMERCADO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMERCADO'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDMERCADO'
      Visible = False
    end
    object qryTipoOperCPVDCODTIPDOC: TFloatField
      DisplayWidth = 10
      FieldName = 'CODTIPDOC'
      Origin = 'BASEDADOS.TIPOOPERACAO.CODTIPDOC'
      Visible = False
    end
    object qryTipoOperCPVDNATUREZAOPERACAO: TStringField
      DisplayWidth = 1
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.NATUREZAOPERACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCPVDTIPOCUSTODIA: TStringField
      DisplayWidth = 1
      FieldName = 'TIPOCUSTODIA'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPOCUSTODIA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCPVDVENCIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'VENCIMENTO'
      Origin = 'BASEDADOS.TIPOOPERACAO.VENCIMENTO'
      Visible = False
    end
    object qryTipoOperCPVDFLGGERACONTAB: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGGERACONTAB'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGERACONTAB'
      Visible = False
    end
    object qryTipoOperCPVDFLGGERACAPCAR: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGGERACAPCAR'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGERACAPCAR'
      Visible = False
    end
    object qryTipoOperCPVDRECPAG: TStringField
      DisplayWidth = 1
      FieldName = 'RECPAG'
      Origin = 'BASEDADOS.TIPOOPERACAO.RECPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCPVDTIPCREDOR: TStringField
      DisplayWidth = 2
      FieldName = 'TIPCREDOR'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPCREDOR'
      Visible = False
      Size = 2
    end
    object qryTipoOperCPVDFLGGERACAF: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGGERACAF'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGERACAF'
      Visible = False
    end
    object qryTipoOperCPVDFLGTRANSF: TStringField
      DisplayWidth = 1
      FieldName = 'FLGTRANSF'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGTRANSF'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCPVDFLGCORRET: TStringField
      DisplayWidth = 1
      FieldName = 'FLGCORRET'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGCORRET'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCPVDTRGDTINCLUSAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.TRGDTINCLUSAO'
      Visible = False
    end
    object qryTipoOperCPVDTRGUSERINCLUSAO: TStringField
      DisplayWidth = 30
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object qryTipoOperCPVDFLGORDMOVINV: TStringField
      DisplayWidth = 1
      FieldName = 'FLGORDMOVINV'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGORDMOVINV'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCPVDIDMOTIVOBLOQUEIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMOTIVOBLOQUEIO'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDMOTIVOBLOQUEIO'
      Visible = False
    end
    object qryTipoOperCPVDFLGOPDIREITO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGOPDIREITO'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGOPDIREITO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCPVDFLGAGE: TStringField
      DisplayWidth = 1
      FieldName = 'FLGAGE'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGAGE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCPVDFLGDATAEX: TStringField
      DisplayWidth = 1
      FieldName = 'FLGDATAEX'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGDATAEX'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCPVDFLGDATACOM: TStringField
      DisplayWidth = 1
      FieldName = 'FLGDATACOM'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGDATACOM'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCPVDFLGINVORIGEM: TStringField
      DisplayWidth = 1
      FieldName = 'FLGINVORIGEM'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGINVORIGEM'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCPVDFLGPERC: TStringField
      DisplayWidth = 1
      FieldName = 'FLGPERC'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGPERC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCPVDFLGPARIDADE: TStringField
      DisplayWidth = 1
      FieldName = 'FLGPARIDADE'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGPARIDADE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCPVDFLGPRZBOLSA: TStringField
      DisplayWidth = 1
      FieldName = 'FLGPRZBOLSA'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGPRZBOLSA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCPVDFLGPRZEMP: TStringField
      DisplayWidth = 1
      FieldName = 'FLGPRZEMP'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGPRZEMP'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCPVDFLGATADEC: TStringField
      DisplayWidth = 1
      FieldName = 'FLGATADEC'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGATADEC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCPVDFLGFORMAPAGREC: TStringField
      DisplayWidth = 1
      FieldName = 'FLGFORMAPAGREC'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGFORMAPAGREC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCPVDFLGDIVACAO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGDIVACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGDIVACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCPVDFLGINIPAG: TStringField
      DisplayWidth = 1
      FieldName = 'FLGINIPAG'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGINIPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCPVDFLGJUROS: TStringField
      DisplayWidth = 1
      FieldName = 'FLGJUROS'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGJUROS'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCPVDMOTBLOQCARTORIG: TFloatField
      DisplayWidth = 10
      FieldName = 'MOTBLOQCARTORIG'
      Origin = 'BASEDADOS.TIPOOPERACAO.MOTBLOQCARTORIG'
      Visible = False
    end
    object qryTipoOperCPVDMOTBLOQCARTDEST: TFloatField
      DisplayWidth = 10
      FieldName = 'MOTBLOQCARTDEST'
      Origin = 'BASEDADOS.TIPOOPERACAO.MOTBLOQCARTDEST'
      Visible = False
    end
    object qryTipoOperCPVDTIPSALDOCARTORIG: TStringField
      DisplayWidth = 1
      FieldName = 'TIPSALDOCARTORIG'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPSALDOCARTORIG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCPVDTIPSALDOCARTDEST: TStringField
      DisplayWidth = 1
      FieldName = 'TIPSALDOCARTDEST'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPSALDOCARTDEST'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCPVDFLGTRATAIR: TStringField
      DisplayWidth = 1
      FieldName = 'FLGTRATAIR'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGTRATAIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCPVDSIGLATIPOOPER: TStringField
      DisplayWidth = 4
      FieldName = 'SIGLATIPOOPER'
      Origin = 'BASEDADOS.TIPOOPERACAO.SIGLATIPOOPER'
      Visible = False
      Size = 4
    end
    object qryTipoOperCPVDFLGISENTOIR: TStringField
      DisplayWidth = 1
      FieldName = 'FLGISENTOIR'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGISENTOIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCPVDFLGGRAVAIRLITIGIO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGGRAVAIRLITIGIO'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGRAVAIRLITIGIO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCPVDFLGOPGERENC: TStringField
      DisplayWidth = 1
      FieldName = 'FLGOPGERENC'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGOPGERENC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCPVDTIPOMOVTO: TStringField
      DisplayWidth = 3
      FieldName = 'TIPOMOVTO'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPOMOVTO'
      Visible = False
      Size = 3
    end
    object qryTipoOperCPVDSTAATIVO: TStringField
      DisplayWidth = 1
      FieldName = 'STAATIVO'
      Origin = 'BASEDADOS.TIPOOPERACAO.STAATIVO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCPVDFLGRENTABILIDADE: TStringField
      DisplayWidth = 1
      FieldName = 'FLGRENTABILIDADE'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGRENTABILIDADE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCPVDFLGCONTAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGCONTAINVEST'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGCONTAINVEST'
      Visible = False
    end
    object qryTipoOperCPVDFLGMOVCOTA: TStringField
      DisplayWidth = 1
      FieldName = 'FLGMOVCOTA'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGMOVCOTA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCPVDFLGCOTARECDES: TStringField
      DisplayWidth = 1
      FieldName = 'FLGCOTARECDES'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGCOTARECDES'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCPVDFLGDATAVENCIMENTO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGDATAVENCIMENTO'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGDATAVENCIMENTO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCPVDFLGOBRIGAOBS: TStringField
      DisplayWidth = 1
      FieldName = 'FLGOBRIGAOBS'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGOBRIGAOBS'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCPVDIDTIPOOPERCPVD: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERCPVD'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDTIPOOPERCPVD'
      Visible = False
    end
  end
end
