inherited frmCadRoteiros: TfrmCadRoteiros
  Left = 184
  Top = 260
  Caption = 'Cadastro de Roteiros'
  ClientHeight = 424
  ClientWidth = 741
  Scaled = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 741
    Height = 338
    inherited pnlMestre: TPanel
      Width = 739
      Height = 128
      object lblNome: TLabel
        Left = 8
        Top = 8
        Width = 33
        Height = 13
        Caption = 'Nome'
        FocusControl = dbNome
      end
      object lblDescricao: TLabel
        Left = 8
        Top = 50
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object lblVigenciaInicio: TLabel
        Left = 445
        Top = 51
        Width = 104
        Height = 13
        Caption = 'Início de vigência'
      end
      object lblVigenciaFim: TLabel
        Left = 607
        Top = 48
        Width = 116
        Height = 13
        Caption = 'Término de vigência'
      end
      object Label3: TLabel
        Left = 445
        Top = 8
        Width = 30
        Height = 13
        Caption = 'Ativo'
      end
      object dbNome: TDBEdit
        Left = 8
        Top = 24
        Width = 417
        Height = 21
        DataField = 'NOME'
        DataSource = ds
        TabOrder = 0
      end
      object dbtpVigenciaInicio: TCMDateTimePicker
        Left = 445
        Top = 67
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DTINICIO'
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
        ShowButton = True
        TabOrder = 3
      end
      object dbtpVigenciaFim: TCMDateTimePicker
        Left = 607
        Top = 64
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DTFIM'
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
        ShowButton = True
        TabOrder = 4
      end
      object dbMmDescricao: TDBMemo
        Left = 8
        Top = 66
        Width = 417
        Height = 49
        DataField = 'DESCRICAO'
        DataSource = ds
        ScrollBars = ssVertical
        TabOrder = 2
      end
      object dbchkAtivo: TDBCheckBox
        Left = 445
        Top = 100
        Width = 96
        Height = 17
        Caption = 'Roteiro ativo'
        DataField = 'FLGATIVO'
        DataSource = ds
        TabOrder = 5
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object cmlkpAtivo: TCMDBLookupCombo
        Left = 445
        Top = 24
        Width = 284
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Nome do Ativo'#9'F')
        DataField = 'IDCPATIVO'
        DataSource = ds
        LookupTable = CdsAtivo
        LookupField = 'IDCPATIVO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = cmlkpAtivoCloseUp
      end
      object btnAtualizarListas: TBitBtn
        Left = 607
        Top = 96
        Width = 121
        Height = 25
        Caption = 'Atualizar listas'
        TabOrder = 6
        OnClick = btnAtualizarListasClick
        Kind = bkRetry
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 129
      Width = 739
      Height = 208
      Tabs.Strings = (
        'Integração'
        'Entradas'
        'Movimentações')
      detdbGrids.Strings = (
        ''
        'dbgrEntrada'
        'dbgrMovimentacao')
      inherited pgctrlDetalhe: TPageControl
        Width = 641
        Height = 149
        inherited tbsDet: TTabSheet
          Caption = 'Integração'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 633
            Height = 121
            Selected.Strings = (
              'NOMECONTA'#9'23'#9'Conta / Fundo'
              'DESCTIPOOPER'#9'21'#9'Tipo Operação'
              'ORDEMCALC'#9'11'#9'Ordem Cálculo'
              'DTINICIO'#9'12'#9'Início Vigência'
              'DTFIM'#9'14'#9'Término Vigência')
            DataSource = ds
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 633
            Height = 121
            Hint = 'Escolha o Desembolso'
            object pnlDadosContas: TPanel
              Left = 160
              Top = -1
              Width = 553
              Height = 166
              BevelOuter = bvNone
              TabOrder = 1
              Visible = False
              object lblDesembReceb: TLabel
                Left = 8
                Top = 8
                Width = 209
                Height = 13
                Caption = 'Recebimento / Desembolso principal'
              end
              object btnRecDesPrinc: TSpeedButton
                Left = 530
                Top = 24
                Width = 22
                Height = 21
                Hint = 'Selecionar desembolso/recebimento'
                Flat = True
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
                ParentShowHint = False
                ShowHint = True
                OnClick = btnRecDesPrincClick
              end
              object dbrgOperacao: TDBRadioGroup
                Left = 8
                Top = 64
                Width = 145
                Height = 95
                Caption = 'Operação'
                DataField = 'FLGOPERACAO'
                DataSource = ds
                Items.Strings = (
                  'Baixa Documento'
                  'Estorno Baixa'
                  'Próxima Baixa')
                TabOrder = 0
                Values.Strings = (
                  'D'
                  'E'
                  'P')
                OnClick = dbrgOperacaoClick
              end
              object edtRecDesPrinc: TEdit
                Left = 8
                Top = 24
                Width = 522
                Height = 21
                ReadOnly = True
                TabOrder = 1
              end
            end
            object dbrgBaseado: TDBRadioGroup
              Left = 8
              Top = 8
              Width = 145
              Height = 151
              Caption = 'Sistema de origem'
              DataField = 'FLGORIGEM'
              DataSource = ds
              Items.Strings = (
                'Nenhum'
                'Contas a Pagar'
                'Contas a Receber'
                'Controle Financeiro')
              TabOrder = 0
              Values.Strings = (
                'N'
                'P'
                'R'
                'F')
              OnClick = dbrgBaseadoClick
            end
          end
        end
        object tbsEntradas: TTabSheet
          Caption = 'Entradas'
          ImageIndex = 1
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 633
            Height = 121
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object lblTpEntrada: TLabel
              Left = 8
              Top = 5
              Width = 92
              Height = 13
              Caption = 'Tipo de Entrada'
            end
            object pnlDadosContasEnt: TPanel
              Left = 4
              Top = 49
              Width = 623
              Height = 88
              BevelOuter = bvNone
              TabOrder = 1
              object pnlAlterador: TPanel
                Left = 204
                Top = 50
                Width = 417
                Height = 36
                BevelOuter = bvNone
                TabOrder = 2
                Visible = False
                object lblalterador: TLabel
                  Left = 8
                  Top = -1
                  Width = 56
                  Height = 13
                  Caption = 'Alterador:'
                end
                object dblkAlterador: TCMDBLookupCombo
                  Left = 8
                  Top = 15
                  Width = 406
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'40'#9'Descrição'#9'F')
                  DataField = 'CODALTERADOR'
                  DataSource = dsEntrada
                  LookupTable = cdsAlterador
                  LookupField = 'CODALTERADOR'
                  Options = [loTitles]
                  Style = csDropDownList
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                end
              end
              object pnlRecebDesemb: TPanel
                Left = 204
                Top = 50
                Width = 417
                Height = 36
                BevelOuter = bvNone
                TabOrder = 0
                Visible = False
                object btnEntRecDes: TSpeedButton
                  Left = 395
                  Top = 15
                  Width = 22
                  Height = 21
                  Hint = 'Selecionar desembolso/recebimento'
                  Flat = True
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
                  ParentShowHint = False
                  ShowHint = True
                  OnClick = btnEntRecDesClick
                end
                object Label2: TLabel
                  Left = 0
                  Top = 0
                  Width = 157
                  Height = 13
                  Caption = 'Recebimento / Desembolso'
                end
                object edtEntRecDes: TEdit
                  Left = 1
                  Top = 15
                  Width = 394
                  Height = 21
                  ReadOnly = True
                  TabOrder = 0
                end
              end
              object dbrgrpOrigemEnt: TDBRadioGroup
                Left = 4
                Top = -2
                Width = 193
                Height = 88
                Caption = 'Origem'
                DataField = 'FLGORIGEM'
                DataSource = dsEntrada
                Items.Strings = (
                  'Desembolso/Recebimento'
                  'Valor Líquido da Operação'
                  'Quantidade de Cotas'
                  'Alterador')
                TabOrder = 1
                Values.Strings = (
                  'R'
                  'V'
                  'Q'
                  'A')
                OnClick = dbrgrpOrigemEntClick
              end
            end
            object dblkTpEntrada: TCMDBLookupCombo
              Left = 8
              Top = 21
              Width = 614
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'Nome'#9'F'
                'DESCTIPOUNIDADE'#9'18'#9'Tipo'#9'F')
              DataField = 'IDCPTPENTRADA'
              DataSource = dsEntrada
              LookupTable = CdsLkEntrada
              LookupField = 'IDCPTPENTRADA'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
          end
          object dbgrEntrada: TwwDBGrid
            Left = 0
            Top = 0
            Width = 633
            Height = 121
            Selected.Strings = (
              'NOME_ENTRADA'#9'23'#9'Tipo de entrada'
              'ORIGEM'#9'22'#9'Origem'
              'DESCEXIBE'#9'23'#9'Tipo de recebimento/desembolso'
              'NOME_ALTERADOR'#9'23'#9'Tipo de alterador')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsEntrada
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgWordWrap]
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnDblClick = dbgrdDetDblClick
            IndicatorColor = icBlack
          end
        end
        object tabMovimentacoes: TTabSheet
          Caption = 'Movimentações'
          ImageIndex = 2
          object dbgrMovimentacao: TwwDBGrid
            Left = 0
            Top = 0
            Width = 633
            Height = 121
            Selected.Strings = (
              'NOME'#9'22'#9'Tipo de movimento'
              'NOME_CONTA'#9'22'#9'Conta / Fundo'
              'ORIGEM'#9'7'#9'Origem'
              'NOME_ENTRADA'#9'22'#9'Entrada'
              'NOME_REGRA'#9'22'#9'Regra'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsMovimentacao
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgWordWrap]
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnDblClick = dbgrdDetDblClick
            IndicatorColor = icBlack
          end
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 633
            Height = 121
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object lblMovimenta: TLabel
              Left = 8
              Top = 8
              Width = 83
              Height = 13
              Caption = 'Movimentação'
            end
            object lblConta: TLabel
              Left = 8
              Top = 49
              Width = 80
              Height = 13
              Caption = 'Conta / fundo'
            end
            object pnlRegra: TPanel
              Left = 220
              Top = 88
              Width = 408
              Height = 50
              BevelOuter = bvNone
              TabOrder = 3
              Visible = False
              object lblRegraCalculo: TLabel
                Left = 11
                Top = 6
                Width = 99
                Height = 13
                Caption = 'Regra de Cálculo'
              end
              object dblkRegraCalculo: TCMDBLookupCombo
                Left = 11
                Top = 24
                Width = 390
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOMEREGRA'#9'40'#9'Nome'#9'F'
                  'IDREGRA'#9'10'#9'Código da regra'#9'F')
                DataField = 'IDREGRA'
                DataSource = dsMovimentacao
                LookupTable = CdsLkRegra
                LookupField = 'IDREGRA'
                Options = [loTitles]
                Style = csDropDownList
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
            end
            object pnlEntrada: TPanel
              Left = 220
              Top = 88
              Width = 408
              Height = 50
              BevelOuter = bvNone
              TabOrder = 4
              Visible = False
              object Label1: TLabel
                Left = 11
                Top = 6
                Width = 45
                Height = 13
                Caption = 'Entrada'
              end
              object dblkpEntrada: TCMDBLookupCombo
                Left = 11
                Top = 24
                Width = 390
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'30'#9'Nome'#9'F')
                DataField = 'IDCPTPENTRADA'
                DataSource = dsMovimentacao
                LookupTable = CdsLkEntrada
                LookupField = 'IDCPTPENTRADA'
                Options = [loTitles]
                Style = csDropDownList
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
            end
            object dblkMovimentacao: TCMDBLookupCombo
              Left = 8
              Top = 24
              Width = 614
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Nome'#9'F')
              DataField = 'IDCPTIPOMOVIM'
              DataSource = dsMovimentacao
              LookupTable = Cdslkmovim
              LookupField = 'IDCPTIPOMOVIM'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = dblkMovimentacaoCloseUp
            end
            object dblkConta: TCMDBLookupCombo
              Left = 8
              Top = 65
              Width = 614
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'50'#9'Contas'#9'F')
              DataField = 'IDCPCONTA'
              DataSource = dsMovimentacao
              LookupTable = CdslkConta
              LookupField = 'IDCPCONTA'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dbrgrpOrigemMov: TDBRadioGroup
              Left = 8
              Top = 94
              Width = 185
              Height = 40
              Caption = 'Origem'
              Columns = 2
              DataField = 'FLGORIGEM'
              DataSource = dsMovimentacao
              Items.Strings = (
                'Entrada'
                'Regra')
              TabOrder = 2
              Values.Strings = (
                'E'
                'R')
              OnClick = dbrgrpOrigemMovClick
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 731
      end
      inherited Dock974: TDock97
        Left = 645
        Height = 149
      end
    end
  end
  inherited Dock972: TDock97
    Width = 741
  end
  inherited Dock971: TDock97
    Top = 385
    Width = 741
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 10
    Top = 65519
    TargetsData = (
      1
      3
      (
        'TMemo'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0)
      (
        ''
        'Items'
        0))
  end
  inherited ds: TwwDataSource
    AutoEdit = False
    Left = 286
    Top = 18
  end
  inherited ImlPadrao: TImageList
    Left = 24
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 336
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    AfterOpen = CdsAfterOpen
    AfterClose = CdsAfterClose
    AfterInsert = CdsAfterInsert
    BeforePost = CdsBeforePost
    AfterDelete = CdsAfterDelete
    Left = 252
    Top = 15
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'CPROTEIRO.NOME'
      'CPATIVO.NOME'
      'CPROTEIRO.DTINICIO'
      'CPROTEIRO.DTFIM'
      'decode( CPROTEIRO.FLGATIVO, '#39'S'#39', '#39'Sim'#39', '#39'Não'#39' ) as FLGATIVO'
      
        'decode( CPROTEIRO.FLGORIGEM, '#39'N'#39', '#39'Nenhum'#39', '#39'P'#39', '#39'Contas a Pagar' +
        #39', '#39'R'#39', '#39'Contas a Receber'#39' ) as FLGORIGEM'
      
        'decode( CPROTEIRO.FLGOPERACAO, '#39'D'#39', '#39'Baixa Documento'#39', '#39'E'#39', '#39'Est' +
        'orno Baixa'#39', '#39'P'#39', '#39'Próxima Baixa'#39' ) as FLGOPERACAO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'D'
      'D'
      'C'
      'C')
    Descricao.Strings = (
      'Nome'
      'Ativo'
      'Início'
      'Término'
      'Ativo'
      'Sistema de origem'
      'Operação')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CPROTEIRO'
      'CPRTPMOVIM'
      'CPRTPENTRADA'
      'CPATIVO')
    CamposChave.Strings = (
      'CPROTEIRO.IDCPROTEIRO'
      'CPRTPENTRADA.IDCPROTEIRO'
      'CPRTPMOVIM.IDCPROTEIRO')
    Filtro.Strings = (
      'CPROTEIRO.IDCPROTEIRO = CPRTPENTRADA.IDCPROTEIRO(+)'
      'CPROTEIRO.IDCPROTEIRO = CPRTPMOVIM.IDCPROTEIRO(+)'
      'CPROTEIRO.IDCPATIVO = CPATIVO.IDCPATIVO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '38'
      '40'
      '14'
      '14'
      '6'
      '15'
      '15')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    UsaDistinct = True
    LookupSQL.Strings = (
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
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 392
    Top = 7
  end
  inherited CmeDetalhe: TCmEventosCadastro
    OnCancel = nil
    BeforeConfirma = CmeDetalheBeforeConfirma
    Left = 460
    Top = 7
  end
  inherited dsDet: TwwDataSource
    AutoEdit = True
    Left = 126
    Top = 202
  end
  object CdsEntrada: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterInsert = CdsEntradaAfterInsert
    BeforePost = CdsEntradaBeforePost
    AfterPost = CdsEntradaAfterPost
    AfterDelete = CdsEntradaAfterDelete
    AfterScroll = CdsEntradaAfterScroll
    Left = 304
    Top = 233
  end
  object dsEntrada: TwwDataSource
    DataSet = CdsEntrada
    Left = 224
    Top = 209
  end
  object cdsMovimentacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterInsert = cdsMovimentacaoAfterInsert
    BeforePost = cdsMovimentacaoBeforePost
    AfterPost = cdsMovimentacaoAfterPost
    AfterDelete = cdsMovimentacaoAfterDelete
    AfterScroll = cdsMovimentacaoAfterScroll
    Left = 448
    Top = 217
  end
  object dsMovimentacao: TwwDataSource
    DataSet = cdsMovimentacao
    Left = 432
    Top = 257
  end
  object CdsLkRegra: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 500
    Top = 375
  end
  object CdslkConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 628
    Top = 319
  end
  object Cdslkmovim: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 484
    Top = 319
  end
  object CdsLkEntrada: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 68
    Top = 279
  end
  object CdsAtivo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 300
    Top = 183
  end
  object cdsAlterador: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 377
    Top = 168
  end
  object msRecDes: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona desembolso/recebimento'
    Colunas.Strings = (
      'TIPORECEBDESEMB.CODTIPRECDES'
      'TIPORECEBDESEMB.DESCRICAO'
      'TIPORECEBDESEMB.RECPAG'
      'TIPORECEBDESEMB.ANASINT')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição'
      'Recebimento / Pagamento'
      'Analítico / Sintético')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'TIPORECEBDESEMB')
    CamposChave.Strings = (
      'TIPORECEBDESEMB.CODTIPRECDES'
      'TIPORECEBDESEMB.RECPAG'
      'TIPORECEBDESEMB.DESCRICAO')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '35'
      '1'
      '1')
    OperComparador.Strings = (
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
    Left = 553
    Top = 326
  end
end
