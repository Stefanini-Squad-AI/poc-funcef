inherited frmConsultaProcesso: TfrmConsultaProcesso
  Left = 24
  Top = 78
  Caption = 'Consulta Processo de Qualquer Matéria'
  ClientHeight = 467
  ClientWidth = 752
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 752
    Height = 381
    inherited pnlMestre: TPanel
      Width = 742
      object Label1: TLabel
        Left = 6
        Top = 0
        Width = 83
        Height = 13
        Caption = 'Nosso Número'
        FocusControl = dbedNumero
      end
      object Label2: TLabel
        Left = 6
        Top = 51
        Width = 118
        Height = 13
        Caption = 'Data do Ajuizamento'
      end
      object Label19: TLabel
        Left = 135
        Top = 51
        Width = 115
        Height = 13
        Caption = 'Data da Notificação'
      end
      object Label30: TLabel
        Left = 254
        Top = 0
        Width = 118
        Height = 13
        Caption = 'Número do Processo'
        FocusControl = dbedNumJCJ
      end
      object Label9: TLabel
        Left = 408
        Top = 51
        Width = 72
        Height = 13
        Caption = 'Contra-Parte'
      end
      object dbedNumero: TDBEdit
        Left = 6
        Top = 15
        Width = 120
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'NUMPROCTRAB'
        DataSource = ds
        ReadOnly = True
        TabOrder = 0
      end
      object dbedDataAju: TCMDateTimePicker
        Left = 6
        Top = 66
        Width = 120
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAJUIZO'
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
        TabOrder = 1
      end
      object rgSituacao: TDBRadioGroup
        Left = 135
        Top = 0
        Width = 115
        Height = 49
        Caption = 'Situação'
        DataField = 'FLGSITPROC'
        DataSource = ds
        Items.Strings = (
          'Aberto'
          'Encerrado')
        TabOrder = 2
        Values.Strings = (
          '0'
          '1')
        OnClick = rgSituacaoClick
      end
      object dbedDataNot: TCMDateTimePicker
        Left = 135
        Top = 66
        Width = 115
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATANOTIF'
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
      object dbedNumJCJ: TDBEdit
        Left = 254
        Top = 15
        Width = 148
        Height = 21
        DataField = 'PROCJCJNUM'
        DataSource = ds
        TabOrder = 4
      end
      object rgAtivo: TDBRadioGroup
        Left = 254
        Top = 50
        Width = 148
        Height = 37
        Caption = 'Somos a Parte'
        Columns = 2
        DataField = 'FLGPARTEATIVA'
        DataSource = ds
        Items.Strings = (
          'Ativa'
          'Passiva')
        TabOrder = 5
        Values.Strings = (
          '1'
          '0')
      end
      object dbrgMateria: TDBRadioGroup
        Left = 408
        Top = 0
        Width = 320
        Height = 49
        Caption = 'Matéria'
        Columns = 4
        DataField = 'INDMATERIA'
        DataSource = ds
        Items.Strings = (
          'Trabalh.'
          'Previd..'
          'Prv./Trb.'
          'Civil'
          'Comercial'
          'Tributária'
          'Penal')
        TabOrder = 6
        Values.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7')
      end
      object dbedNome: TwwDBEdit
        Left = 408
        Top = 66
        Width = 320
        Height = 21
        DataField = 'NOME'
        DataSource = ds5
        TabOrder = 7
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Width = 742
      Height = 273
      Tabs.Strings = (
        'Litisconsortes'
        'OutrosDados'
        'Objetos do Processo'
        'Encerramento'
        'Etapas'
        'Obs.Etapa'
        'Vinculações')
      detdbGrids.Strings = (
        'dbgrDet2'
        ''
        'dbgrdDet'
        ''
        'dbGrdEtapa'
        ''
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 644
        Height = 214
        ActivePage = tbsLitisconsortes
        object tbsLitisconsortes: TTabSheet [0]
          Caption = 'Litisconsortes'
          object dbgrDet2: TwwDBGrid
            Left = 0
            Top = 0
            Width = 636
            Height = 186
            Selected.Strings = (
              'NOME'#9'66'#9'Nome ou Razão Social')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsDet2
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
          object pnlDet2: TPanel
            Left = 0
            Top = 0
            Width = 636
            Height = 186
            Align = alClient
            TabOrder = 0
            object CMProcuraLitis: TCMProcuraSubTipo
              Left = 121
              Top = 59
              Width = 400
              Height = 50
              Caption = 'Litisconsorte'
              TabOrder = 0
              OnExit = CMProcuraRequerenteExit
              CampoEdit = ceRazaoSocial
              MostraMensagens = True
              DataSource = dsDet2
              DataField = 'IDPESSOA'
              Mensagens.EmBranco = 'Chave não pode estar em branco'
              Mensagens.NaoExiste = 'Chave não existe'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = False
              SubTipo = stFornecedor
              FiltraSubTipo = True
            end
          end
        end
        object tbshOutrosDados: TTabSheet [1]
          Caption = 'OutrosDados'
          object Label3: TLabel
            Left = 40
            Top = 26
            Width = 105
            Height = 13
            Caption = 'Data da Postagem'
          end
          object Label16: TLabel
            Left = 216
            Top = 26
            Width = 109
            Height = 13
            Caption = 'Número na 2a Inst.'
            FocusControl = dbedNumTRT
          end
          object Label18: TLabel
            Left = 39
            Top = 68
            Width = 115
            Height = 13
            Caption = 'Quant. Requerentes'
            FocusControl = dbedQtde
          end
          object Label17: TLabel
            Left = 216
            Top = 68
            Width = 121
            Height = 13
            Caption = 'Número na Inst. Sup.'
            FocusControl = dbedNumTST
          end
          object Label31: TLabel
            Left = 39
            Top = 110
            Width = 100
            Height = 13
            Caption = 'Tipo de Processo'
          end
          object Label33: TLabel
            Left = 39
            Top = 150
            Width = 77
            Height = 13
            Caption = 'Tipo de Açao'
          end
          object Label34: TLabel
            Left = 389
            Top = 150
            Width = 108
            Height = 13
            Caption = 'Advogado da Casa'
          end
          object Label35: TLabel
            Left = 39
            Top = 190
            Width = 267
            Height = 13
            Caption = 'Pasta do Processo (Identificação/Localização)'
            FocusControl = dbedPasta
          end
          object Label36: TLabel
            Left = 389
            Top = 189
            Width = 175
            Height = 13
            Caption = 'Cidade Onde Corre o Processo'
          end
          object Label8: TLabel
            Left = 39
            Top = 5
            Width = 56
            Height = 13
            Caption = 'Despesas'
          end
          object Label4: TLabel
            Left = 260
            Top = 6
            Width = 118
            Height = 13
            Caption = 'Vara de Justiça e Nº'
          end
          object dblcVara: TwwDBLookupCombo
            Left = 389
            Top = 2
            Width = 268
            Height = 21
            DropDownAlignment = taRightJustify
            Selected.Strings = (
              'DESCRICAO'#9'40'#9'DESCRICAO')
            DataField = 'IDVARAJUSTICA'
            DataSource = ds
            LookupTable = qryVara
            LookupField = 'IDVARAJUSTICA'
            Options = [loColLines, loTitles]
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            AllowClearKey = True
          end
          object dbedPost: TCMDateTimePicker
            Left = 40
            Top = 41
            Width = 120
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAPOST'
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
            TabOrder = 2
          end
          object dbedNumTRT: TDBEdit
            Left = 216
            Top = 41
            Width = 120
            Height = 21
            DataField = 'PROCTRTNUM'
            DataSource = ds
            TabOrder = 3
          end
          object dbedQtde: TDBEdit
            Left = 39
            Top = 83
            Width = 120
            Height = 21
            DataField = 'QTDERECTES'
            DataSource = ds
            TabOrder = 5
          end
          object dbedNumTST: TDBEdit
            Left = 216
            Top = 83
            Width = 120
            Height = 21
            DataField = 'PROCTSTNUM'
            DataSource = ds
            TabOrder = 6
          end
          object dblcTipProc: TwwDBLookupCombo
            Left = 39
            Top = 125
            Width = 300
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMETIPOPROC'#9'60'#9'Tipo de Processo')
            DataField = 'IDTIPOPROC'
            DataSource = ds
            LookupTable = qryTipoProc
            LookupField = 'IDTIPOPROC'
            TabOrder = 8
            AutoDropDown = True
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            AllowClearKey = True
          end
          object dblcTipAcao: TwwDBLookupCombo
            Left = 39
            Top = 165
            Width = 300
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'40'#9'DESCRICAO')
            DataField = 'IDTIPOACAO'
            DataSource = ds
            LookupTable = qryTipAcao
            LookupField = 'IDTIPOACAO'
            TabOrder = 10
            AutoDropDown = True
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            AllowClearKey = True
          end
          object dblcAdvCasa: TwwDBLookupCombo
            Left = 389
            Top = 164
            Width = 300
            Height = 21
            DropDownAlignment = taRightJustify
            Selected.Strings = (
              'NOME'#9'60'#9'NOME')
            DataField = 'IDADVOGCASA'
            DataSource = ds
            LookupTable = qryAdvCasa
            LookupField = 'IDUSUARIO'
            TabOrder = 11
            AutoDropDown = True
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            AllowClearKey = True
          end
          object dbedPasta: TDBEdit
            Left = 39
            Top = 205
            Width = 300
            Height = 21
            DataField = 'IDENTPASTA'
            DataSource = ds
            TabOrder = 12
          end
          object ProcuraCidade: TCMProcura
            Left = 388
            Top = 201
            Width = 300
            Height = 27
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MostraMensagens = True
            Mensagens.EmBranco = 'Chave não pode estar em branco'
            Mensagens.NaoExiste = 'Chave não existe'
            PermiteChaveInvalida = False
            PermiteChaveEmBranco = False
            DataSource = ds
            DataField = 'IDCIDADES'
            LookupChave = 'IDCIDADES'
            LookupDescricao = 'NOME'
            MontaSelect = MontaSelectCidade
            LookupTabela = 'CM.CIDADES'
            DataBaseName = 'BaseDados'
            ReadOnly = False
          end
          object dbreDespesa: TDBRealEdit
            Left = 101
            Top = 2
            Width = 121
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Enabled = False
            Lines.Strings = (
              '      0,00')
            ReadOnly = True
            TabOrder = 14
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'DESPESAPROC'
            DataSource = ds
          end
          object dbedNumVara: TwwDBEdit
            Left = 659
            Top = 2
            Width = 27
            Height = 21
            DataField = 'NumVaraJustica'
            DataSource = ds
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object CMProcuraAdv1: TCMProcuraSubTipo
            Left = 389
            Top = 23
            Width = 300
            Height = 42
            Caption = 'Escritório/Advogado da Contra-Parte'
            TabOrder = 4
            CampoEdit = ceRazaoSocial
            MostraMensagens = True
            DataSource = ds
            DataField = 'IDADVOGRECTE'
            Mensagens.EmBranco = 'Chave não pode estar em branco'
            Mensagens.NaoExiste = 'Chave não existe'
            PermiteChaveInvalida = False
            PermiteChaveEmBranco = False
            SubTipo = stFornecedor
            FiltraSubTipo = True
          end
          object CMProcuraAdv2: TCMProcuraSubTipo
            Left = 389
            Top = 67
            Width = 300
            Height = 42
            Caption = 'Nosso Escritório/Advogado'
            TabOrder = 7
            CampoEdit = ceRazaoSocial
            MostraMensagens = True
            DataSource = ds
            DataField = 'IDADVOGRECDA'
            Mensagens.EmBranco = 'Chave não pode estar em branco'
            Mensagens.NaoExiste = 'Chave não existe'
            PermiteChaveInvalida = False
            PermiteChaveEmBranco = False
            SubTipo = stFornecedor
            FiltraSubTipo = True
          end
          object CMProcuraAssist: TCMProcuraSubTipo
            Left = 389
            Top = 109
            Width = 300
            Height = 42
            Caption = 'Assistente Técnico'
            TabOrder = 9
            CampoEdit = ceRazaoSocial
            MostraMensagens = True
            DataSource = ds
            DataField = 'IDASSISTTECN'
            Mensagens.EmBranco = 'Chave não pode estar em branco'
            Mensagens.NaoExiste = 'Chave não existe'
            PermiteChaveInvalida = False
            PermiteChaveEmBranco = False
            SubTipo = stFornecedor
            FiltraSubTipo = True
          end
        end
        inherited tbsDet: TTabSheet
          Caption = 'Objetos do Processo'
          inherited dbgrdDet: TwwDBGrid
            Width = 636
            Height = 186
          end
          inherited pnlControlesDet: TPanel
            Width = 636
            Height = 186
            object Label5: TLabel
              Left = 124
              Top = 7
              Width = 85
              Height = 13
              Caption = 'Tipo de Objeto'
            end
            object Label6: TLabel
              Left = 124
              Top = 40
              Width = 97
              Height = 13
              Caption = 'Valor Reclamado'
            end
            object Label7: TLabel
              Left = 257
              Top = 40
              Width = 99
              Height = 13
              Caption = 'Probabilidade (%)'
            end
            object Label24: TLabel
              Left = 373
              Top = 40
              Width = 87
              Height = 13
              Caption = 'Valor Esperado'
            end
            object lblValReal: TLabel
              Left = 503
              Top = 40
              Width = 60
              Height = 13
              Caption = 'Valor Real'
            end
            object Label39: TLabel
              Left = 121
              Top = 80
              Width = 69
              Height = 13
              Caption = 'Observação'
            end
            object dblcTipObj: TwwDBLookupCombo
              Left = 219
              Top = 6
              Width = 256
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'40'#9'DESCRICAO')
              DataField = 'CODTIPOOBJETO'
              DataSource = dsDet
              LookupTable = qryTipoObj
              LookupField = 'CODTIPOOBJETO'
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
            end
            object dbedValRecl: TDBEdit
              Left = 124
              Top = 53
              Width = 100
              Height = 21
              DataField = 'VALORRECL'
              DataSource = dsDet
              TabOrder = 1
            end
            object dbedPerc: TDBEdit
              Left = 257
              Top = 53
              Width = 100
              Height = 21
              DataField = 'PERCPROB'
              DataSource = dsDet
              TabOrder = 2
            end
            object edValor: TRealEdit
              Left = 373
              Top = 53
              Width = 100
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 3
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
            object dbedValReal: TDBEdit
              Left = 503
              Top = 53
              Width = 100
              Height = 21
              DataField = 'VALORSENTENCA'
              DataSource = dsDet
              TabOrder = 4
            end
            object dbmemObserv: TDBMemo
              Left = 121
              Top = 94
              Width = 490
              Height = 89
              DataField = 'OBSERVACAO'
              DataSource = dsDet
              ScrollBars = ssVertical
              TabOrder = 5
            end
          end
        end
        object tbshEncer: TTabSheet
          Caption = 'Encerramento'
          object Label15: TLabel
            Left = 314
            Top = 21
            Width = 99
            Height = 13
            Caption = 'Prev.Encerramto.'
          end
          object rgTipEncer: TDBRadioGroup
            Left = 127
            Top = 52
            Width = 121
            Height = 120
            Caption = 'Tipo'
            DataField = 'TIPOENCER'
            DataSource = ds
            Items.Strings = (
              'Arquivamento'
              'Acordo'
              'Desistência'
              'Sentença')
            TabOrder = 0
            Values.Strings = (
              'A'
              'C'
              'D'
              'S')
            OnClick = rgTipEncerClick
          end
          object gbxAcordo: TGroupBox
            Left = 295
            Top = 70
            Width = 139
            Height = 43
            Caption = 'Número de Parcelas'
            TabOrder = 1
            Visible = False
            object sbspeParc: TwwDBSpinEdit
              Left = 42
              Top = 16
              Width = 55
              Height = 21
              Increment = 1
              DataField = 'QTDEPARCACOR'
              DataSource = ds
              TabOrder = 0
              UnboundDataType = wwDefault
            end
          end
          object gbxDataEncer: TGroupBox
            Left = 476
            Top = 70
            Width = 125
            Height = 43
            Caption = 'Data Encerramento'
            TabOrder = 2
            object dbedEncerr: TCMDateTimePicker
              Left = 10
              Top = 15
              Width = 100
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAEFETENC'
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
              TabOrder = 0
            end
          end
          object gbxSent: TGroupBox
            Left = 295
            Top = 130
            Width = 306
            Height = 42
            Caption = 'Tipo de Sentença'
            TabOrder = 3
            Visible = False
            object dblcTipSent: TwwDBLookupCombo
              Left = 10
              Top = 15
              Width = 285
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'40'#9'DESCRICAO')
              DataField = 'CODTIPOSENT'
              DataSource = ds
              LookupTable = tblTipSent
              LookupField = 'CODTIPOSENT'
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
          end
          object dbedPrevEnc: TCMDateTimePicker
            Left = 314
            Top = 36
            Width = 100
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAPREVENCER'
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
        end
        object tbsEtapas: TTabSheet
          Caption = 'Etapas'
          object dbGrdEtapa: TwwDBGrid
            Left = 0
            Top = 0
            Width = 636
            Height = 186
            Selected.Strings = (
              'DATAREALOCOR'#9'17'#9'Data e Hora Prev./Real'
              'DESCRICAO'#9'38'#9'Tipo de Etapa'
              'ASSUNTO'#9'40'#9'Assunto Resumido')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = ds2
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgCancelOnExit, dgWordWrap]
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
          object pnlEtapas: TPanel
            Left = 0
            Top = 0
            Width = 636
            Height = 186
            Align = alClient
            TabOrder = 1
            object Label22: TLabel
              Left = 103
              Top = 1
              Width = 156
              Height = 13
              Caption = 'Tipo de Etapa (Andamento)'
            end
            object Label20: TLabel
              Left = 439
              Top = 1
              Width = 168
              Height = 13
              Caption = 'Data e Hora Prevista ou Real'
            end
            object Label41: TLabel
              Left = 103
              Top = 37
              Width = 113
              Height = 13
              Caption = 'Assunto (Resumido)'
            end
            object Label42: TLabel
              Left = 481
              Top = 37
              Width = 122
              Height = 13
              Hint = 'Valor do Depósito do Recurso ou Despesa Processual'
              Caption = 'Depósito ou Despesa'
              ParentShowHint = False
              ShowHint = True
            end
            object lblHonor: TLabel
              Left = 481
              Top = 72
              Width = 83
              Height = 13
              Caption = 'Honorário Fixo'
              ParentShowHint = False
              ShowHint = False
              Visible = False
            end
            object Label43: TLabel
              Left = 103
              Top = 98
              Width = 146
              Height = 13
              Caption = 'Descrição / Observações'
            end
            object dblcTipoEtp: TwwDBLookupCombo
              Left = 103
              Top = 13
              Width = 320
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'40'#9'DESCRICAO')
              DataField = 'CODTIPORECURSO'
              DataSource = ds2
              LookupTable = qryTipoEtapa
              LookupField = 'CODTIPORECURSO'
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnCloseUp = dblcTipoEtpCloseUp
            end
            object dtedDataReal: TCMDateTimePicker
              Left = 439
              Top = 13
              Width = 100
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
              TabOrder = 1
            end
            object mskedHora: TMaskEdit
              Left = 555
              Top = 13
              Width = 50
              Height = 21
              EditMask = '!90:00;1;_'
              MaxLength = 5
              TabOrder = 2
              Text = '  :  '
            end
            object dbedAssunto: TDBEdit
              Left = 103
              Top = 49
              Width = 320
              Height = 21
              DataField = 'ASSUNTO'
              DataSource = ds2
              TabOrder = 3
            end
            object dbedValRec: TwwDBEdit
              Left = 481
              Top = 49
              Width = 125
              Height = 21
              DataField = 'VALORREC'
              DataSource = ds2
              TabOrder = 4
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object redHonor: TRealEdit
              Left = 481
              Top = 84
              Width = 125
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 5
              Visible = False
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
            object dbmObserv: TDBMemo
              Left = 103
              Top = 110
              Width = 503
              Height = 70
              DataField = 'OBSERVETAPA'
              DataSource = ds2
              ScrollBars = ssVertical
              TabOrder = 6
            end
          end
        end
        object tbsObsEtp: TTabSheet
          Caption = 'Obs.Etapa'
          object Label25: TLabel
            Left = 81
            Top = 12
            Width = 56
            Height = 13
            Caption = 'Num.Seq.'
            FocusControl = DBEdit1
          end
          object Label26: TLabel
            Left = 150
            Top = 12
            Width = 113
            Height = 13
            Caption = 'Assunto (Resumido)'
            FocusControl = DBEdit2
          end
          object Label27: TLabel
            Left = 515
            Top = 12
            Width = 126
            Height = 13
            Caption = 'Data Prevista ou Real'
          end
          object Label29: TLabel
            Left = 81
            Top = 54
            Width = 75
            Height = 13
            Caption = 'Observações'
            FocusControl = DBMemo1
          end
          object DBEdit1: TDBEdit
            Left = 81
            Top = 27
            Width = 60
            Height = 21
            DataField = 'NUMSEQ'
            DataSource = ds2
            TabOrder = 0
          end
          object DBEdit2: TDBEdit
            Left = 150
            Top = 27
            Width = 355
            Height = 21
            DataField = 'ASSUNTO'
            DataSource = ds2
            TabOrder = 1
          end
          object DBEdit4: TDBEdit
            Left = 515
            Top = 27
            Width = 126
            Height = 21
            DataField = 'DATAREALOCOR'
            DataSource = ds2
            TabOrder = 2
          end
          object DBMemo1: TDBMemo
            Left = 81
            Top = 68
            Width = 565
            Height = 150
            DataField = 'OBSERVETAPA'
            DataSource = ds2
            ScrollBars = ssVertical
            TabOrder = 3
          end
        end
        object tbshVinculos: TTabSheet
          Caption = 'Vinculações'
          object pnlLigado: TPanel
            Left = 0
            Top = 0
            Width = 636
            Height = 41
            Align = alTop
            Caption = 'pnlLigado'
            TabOrder = 0
            object Label37: TLabel
              Left = 40
              Top = 14
              Width = 176
              Height = 13
              Caption = 'Este Processo Está Ligado Por'
            end
            object Label38: TLabel
              Left = 433
              Top = 14
              Width = 72
              Height = 13
              Caption = 'Ao Processo'
            end
            object spbProcVinc: TSpeedButton
              Left = 664
              Top = 8
              Width = 24
              Height = 24
              Hint = 'Escolhe o processo a que este está ligado'
              Glyph.Data = {
                66010000424D6601000000000000760000002800000014000000140000000100
                040000000000F000000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333333FFFFF
                FFF0000000003333333BFBFBFBF0FFF000003333333FFFFFFF00000000003333
                333BFBFBF0FBFBFB00003333333F00000FF0000000003333333B0FFF0000FFF0
                00003333333F00000FF0000000003333330BFBFBF0FBFBFB000033333010FFFF
                FF0000000000333330180BFBFBF0FFF000003333301180FFFFF0000000003333
                0811190BFBFBFBFB0000333307719990FFFFFFFF0000333077FF999903333333
                000033077FFFF0003333333300003077FFF00333333333330000077FFF033333
                33333333000007FFF093333333333333000030FF093333333333333300003300
                33333333333333330000}
              ParentShowHint = False
              ShowHint = True
              OnClick = spbProcVincClick
            end
            object spbApagaVinc: TSpeedButton
              Left = 697
              Top = 8
              Width = 24
              Height = 24
              Hint = 'Exclui a Vinculação'
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
                555557777F777555F55500000000555055557777777755F75555005500055055
                555577F5777F57555555005550055555555577FF577F5FF55555500550050055
                5555577FF77577FF555555005050110555555577F757777FF555555505099910
                555555FF75777777FF555005550999910555577F5F77777775F5500505509990
                3055577F75F77777575F55005055090B030555775755777575755555555550B0
                B03055555F555757575755550555550B0B335555755555757555555555555550
                BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
                50BB555555555555575F555555555555550B5555555555555575}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = spbApagaVincClick
            end
            object dbrgVinc: TDBRadioGroup
              Left = 232
              Top = 4
              Width = 185
              Height = 30
              Columns = 2
              DataField = 'FLGVINCULADO'
              DataSource = ds
              Items.Strings = (
                'Incidência'
                'Vinculação')
              TabOrder = 0
              Values.Strings = (
                '0'
                '1')
            end
            object dbedNumVinc: TDBEdit
              Left = 535
              Top = 10
              Width = 120
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'IDPROCVINCULADO'
              DataSource = ds
              ReadOnly = True
              TabOrder = 1
            end
          end
          object gbxVinculados: TGroupBox
            Left = 0
            Top = 41
            Width = 636
            Height = 145
            Align = alClient
            Caption = 'Processos Ligados a Este'
            TabOrder = 1
            object wwDBGrid1: TwwDBGrid
              Left = 2
              Top = 15
              Width = 637
              Height = 128
              Selected.Strings = (
                'NOME'#9'40'#9'Contra Parte'
                'DATAJUIZO'#9'10'#9'Data Ajuiz.'
                'DATANOTIF'#9'10'#9'Data Notif.'
                'JCJ'#9'10'#9'Junta ou Vara'
                'PROCJCJNUM'#9'15'#9'Número na 1.a Inst.'
                'PROCTRTNUM'#9'15'#9'Número na 2.a Inst.'
                'PROCTSTNUM'#9'15'#9'Número na Inst. Sup.'
                'FLGSITPROC'#9'10'#9'Encerrado?'
                'DATAEFETENC'#9'10'#9'Data Encerr.'
                'FLGVINCULADO'#9'10'#9'Vinculado?'
                'NUMPROCTRAB'#9'10'#9'Número Interno')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsProcVinc
              TabOrder = 0
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = False
              UseTFields = False
              IndicatorColor = icBlack
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 734
      end
      inherited Dock974: TDock97
        Left = 648
        Height = 214
      end
    end
  end
  inherited Dock972: TDock97
    Width = 752
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 428
    Width = 752
    inherited tb97Fundo: TToolbar97
      Left = 583
      DockPos = 590
      inherited sep1: TToolbarSep97
        SizeHorz = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 417
      DockPos = 423
      inherited ToolbarSep971: TToolbarSep97
        SizeHorz = 2
      end
      inherited bbtnCancelar: TBitBtn
        Left = 82
      end
    end
  end
  inherited qry: TwwQuery
    AfterOpen = qryAfterOpen
    AfterInsert = qryAfterInsert
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      'SELECT * FROM PROCESSOTRAB'
      'WHERE NUMPROCTRAB = :NumProcTrab')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NumProcTrab'
        ParamType = ptUnknown
      end>
  end
  inherited dsDet: TwwDataSource
    DataSet = tblObjeto
    Left = 405
    Top = 4
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PROCESSOTRAB'
      'set'
      '  IDRECLAMANTE = :IDRECLAMANTE,'
      '  IDADVOGRECTE = :IDADVOGRECTE,'
      '  CODTIPOSENT = :CODTIPOSENT,'
      '  JCJ = :JCJ,'
      '  QTDERECTES = :QTDERECTES,'
      '  DATANOTIF = :DATANOTIF,'
      '  DATAPOST = :DATAPOST,'
      '  PROCTRTNUM = :PROCTRTNUM,'
      '  PROCTSTNUM = :PROCTSTNUM,'
      '  DATAPREVENCER = :DATAPREVENCER,'
      '  DATAEFETENC = :DATAEFETENC,'
      '  CUSTOPROC = :CUSTOPROC,'
      '  TIPOENCER = :TIPOENCER,'
      '  FLGSITPROC = :FLGSITPROC,'
      '  QTDEPARCACOR = :QTDEPARCACOR,'
      '  IDADVOGRECDA = :IDADVOGRECDA,'
      '  IDASSISTTECN = :IDASSISTTECN,'
      '  PROCJCJNUM = :PROCJCJNUM,'
      '  IDTIPOPROC = :IDTIPOPROC,'
      '  INDMATERIA = :INDMATERIA,'
      '  IDTIPOACAO = :IDTIPOACAO,'
      '  IDENTPASTA = :IDENTPASTA,'
      '  DATAJUIZO = :DATAJUIZO,'
      '  IDVARAJUSTICA = :IDVARAJUSTICA,'
      '  IDCIDADES = :IDCIDADES,'
      '  IDADVOGCASA = :IDADVOGCASA,'
      '  FLGPARTEATIVA = :FLGPARTEATIVA,'
      '  IDLITISCONSORTE = :IDLITISCONSORTE,'
      '  IDPROCVINCULADO = :IDPROCVINCULADO,'
      '  FLGVINCULADO = :FLGVINCULADO,'
      '  DESPESAPROC = :DESPESAPROC,'
      '  NUMVARAJUSTICA = :NUMVARAJUSTICA'
      'where'
      '  NUMPROCTRAB = :OLD_NUMPROCTRAB')
    InsertSQL.Strings = (
      'insert into PROCESSOTRAB'
      '  (NUMPROCTRAB, IDRECLAMANTE, IDADVOGRECTE, CODTIPOSENT, JCJ, '
      'QTDERECTES, '
      '   DATANOTIF, DATAPOST, PROCTRTNUM, PROCTSTNUM, DATAPREVENCER, '
      'DATAEFETENC, '
      
        '   CUSTOPROC, TIPOENCER, FLGSITPROC, QTDEPARCACOR, IDADVOGRECDA,' +
        ' '
      'IDASSISTTECN, '
      '   PROCJCJNUM, IDTIPOPROC, INDMATERIA, IDTIPOACAO, IDENTPASTA, '
      'DATAJUIZO, '
      '   IDVARAJUSTICA, IDCIDADES, IDADVOGCASA, FLGPARTEATIVA, '
      'IDLITISCONSORTE, '
      '   IDPROCVINCULADO, FLGVINCULADO, DESPESAPROC, NUMVARAJUSTICA)'
      'values'
      
        '  (:NUMPROCTRAB, :IDRECLAMANTE, :IDADVOGRECTE, :CODTIPOSENT, :JC' +
        'J, '
      ':QTDERECTES, '
      '   :DATANOTIF, :DATAPOST, :PROCTRTNUM, :PROCTSTNUM, '
      ':DATAPREVENCER, :DATAEFETENC, '
      '   :CUSTOPROC, :TIPOENCER, :FLGSITPROC, :QTDEPARCACOR, '
      ':IDADVOGRECDA, :IDASSISTTECN, '
      
        '   :PROCJCJNUM, :IDTIPOPROC, :INDMATERIA, :IDTIPOACAO, :IDENTPAS' +
        'TA, '
      ':DATAJUIZO, '
      '   :IDVARAJUSTICA, :IDCIDADES, :IDADVOGCASA, :FLGPARTEATIVA, '
      ':IDLITISCONSORTE, '
      
        '   :IDPROCVINCULADO, :FLGVINCULADO, :DESPESAPROC, :NUMVARAJUSTIC' +
        'A)')
    DeleteSQL.Strings = (
      'delete from PROCESSOTRAB'
      'where'
      '  NUMPROCTRAB = :OLD_NUMPROCTRAB')
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Processo'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PROCESSOTRAB.DATANOTIF'
      'PROCESSOTRAB.PROCJCJNUM'
      'VARAJUSTICA.DESCRICAO'
      'PROCESSOTRAB.NUMVARAJUSTICA'
      'PROCESSOTRAB.PROCTRTNUM'
      'PROCESSOTRAB.PROCTSTNUM'
      'PROCESSOTRAB.NUMPROCTRAB')
    TipodeDado.Strings = (
      'C'
      'D'
      'C'
      'C'
      'N'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Nome Contra-Parte'
      'Data de Notificação'
      'Número Proc. na 1a Inst.'
      'Órgão Jur. (Vara)'
      'Número da Vara'
      'Número Proc. na 2a Inst.'
      'Número Proc. na 3a Inst.'
      'Número Proc. Interno')
    Tabelas.Strings = (
      'PESSOA'
      'PROCESSOTRAB'
      'VARAJUSTICA')
    CamposChave.Strings = (
      'PROCESSOTRAB.NUMPROCTRAB')
    Filtro.Strings = (
      'PROCESSOTRAB.IDRECLAMANTE  = PESSOA.IDPESSOA'
      'PROCESSOTRAB.IDVARAJUSTICA  = VARAJUSTICA .IDVARAJUSTICA (+)')
    Larguras.Strings = (
      '50'
      '12'
      '15'
      '40'
      '15'
      '15'
      '15'
      '15')
    Left = 348
    Top = 11
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 408
    Top = 108
  end
  object MontaSelectCidade: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Cidade'
    Colunas.Strings = (
      'CIDADES.NOME'
      'ESTADO.CODESTADO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Cidade'
      'Sigla UF')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CIDADES'
      'ESTADO')
    CamposChave.Strings = (
      'CIDADES.IDCIDADES')
    Filtro.Strings = (
      'CIDADES.IDESTADO = ESTADO.IDESTADO')
    Larguras.Strings = (
      '60'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 552
    Top = 6
  end
  object ds2: TwwDataSource
    AutoEdit = False
    DataSet = qryEtapa
    Left = 444
    Top = 5
  end
  object tblTipRec: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'CODTIPORECURSO'
    TableName = 'CM.TIPORECTRAB'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 434
    Top = 125
  end
  object qryProcVinc: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'SELECT PESSOA.NOME, PESSOA.IDPESSOA, PROCESSOTRAB.* '
      'FROM PESSOA, PROCESSOTRAB '
      'WHERE PESSOA.IDPESSOA = PROCESSOTRAB.IDRECLAMANTE'
      'AND      PROCESSOTRAB.IDPROCVINCULADO = :NumProcTrab')
    ControlType.Strings = (
      'FLGSITPROC;CheckBox;1;0'
      'FLGVINCULADO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 375
    Top = 256
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NUMPROCTRAB'
        ParamType = ptUnknown
      end>
  end
  object qryPartic: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PESSOA.NOME'
      'FROM PESSOA'
      'WHERE'
      '    PESSOA.IDPESSOA   = :IDRECLAMANTE')
    ValidateWithMask = True
    Left = 210
    Top = 320
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDRECLAMANTE'
        ParamType = ptUnknown
      end>
  end
  object ds5: TwwDataSource
    DataSet = qryPartic
    Left = 159
    Top = 306
  end
  object qryTipAcao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDTIPOACAO, DESCRICAO from TIPOACAOPROCJUR'
      'order by upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 93
    Top = 320
  end
  object ds4: TwwDataSource
    Left = 153
    Top = 237
  end
  object tblTipSent: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'CODTIPOSENT'
    TableName = 'CM.TIPOSENTENCA'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 39
    Top = 192
  end
  object dsProcVinc: TwwDataSource
    DataSet = qryProcVinc
    Left = 378
    Top = 313
  end
  object qryAdvCasa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select p.nome, s.idusuario from pessoa p, usuariosistema s'
      'where p.idpessoa=s.idusuario'
      'order by upper(p.nome)')
    ValidateWithMask = True
    Left = 591
    Top = 278
  end
  object qryTipoProc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDTIPOPROC, NOMETIPOPROC from TIPOPROCESSO '
      'order by upper(NOMETIPOPROC)')
    ValidateWithMask = True
    Left = 201
    Top = 176
  end
  object tblObjeto: TwwTable
    CachedUpdates = True
    AfterInsert = tblObjetoAfterInsert
    BeforeEdit = tblObjetoBeforeEdit
    AfterPost = tblObjetoAfterPost
    OnCalcFields = tblObjetoCalcFields
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'NUMPROCTRAB'
    MasterFields = 'NUMPROCTRAB'
    MasterSource = ds
    TableName = 'CM.OBJPROCTRAB'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 257
    Top = 169
    object tblObjetoDescricao: TStringField
      DisplayLabel = 'Descrição do Objeto Reclamado'
      DisplayWidth = 40
      FieldKind = fkLookup
      FieldName = 'Descricao'
      LookupDataSet = tblTipObj
      LookupKeyFields = 'CODTIPOOBJETO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODTIPOOBJETO'
      Size = 40
      Lookup = True
    end
    object tblObjetoVALORRECL: TFloatField
      DisplayLabel = 'Valor Reclamado'
      DisplayWidth = 16
      FieldName = 'VALORRECL'
      Required = True
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object tblObjetoPERCPROB: TFloatField
      DisplayLabel = 'Probabilidade (%)'
      DisplayWidth = 17
      FieldName = 'PERCPROB'
      Required = True
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object tblObjetoValorEsperado: TFloatField
      DisplayLabel = 'Valor Estimado'
      DisplayWidth = 12
      FieldKind = fkCalculated
      FieldName = 'ValorEsperado'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object tblObjetoVALORSENTENCA: TFloatField
      DisplayLabel = 'Valor Real'
      FieldName = 'VALORSENTENCA'
      DisplayFormat = '0.00'
    end
    object tblObjetoNUMPROCTRAB: TFloatField
      DisplayWidth = 10
      FieldName = 'NUMPROCTRAB'
      Required = True
      Visible = False
    end
    object tblObjetoCODTIPOOBJETO: TFloatField
      DisplayWidth = 10
      FieldName = 'CODTIPOOBJETO'
      Required = True
      Visible = False
    end
    object tblObjetoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 240
    end
  end
  object tblTipObj: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'CODTIPOOBJETO'
    TableName = 'CM.TIPOOBJPROCTRAB'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 362
    Top = 169
  end
  object qryTipoObj: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select CODTIPOOBJETO, DESCRICAO from TIPOOBJPROCTRAB'
      'order by upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 441
    Top = 240
  end
  object qryVara: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDVARAJUSTICA, DESCRICAO from VARAJUSTICA'
      'order by upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 513
    Top = 184
  end
  object dsDet2: TwwDataSource
    AutoEdit = False
    DataSet = qryLitis
    Left = 621
    Top = 4
  end
  object qryLitis: TwwQuery
    CachedUpdates = True
    BeforePost = qryLitisBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DECODE(P.TIPO,'#39'F'#39', P.NOME, P.RAZAOSOCIAL) AS NOME, '
      'C.IDPESSOA, C.NUMPROCTRAB '
      'FROM PESSOA P, COPARTPROCTRAB C'
      'WHERE C.NUMPROCTRAB = :NumProcTrab'
      'AND       C.IDPESSOA           = P.IDPESSOA')
    UpdateObject = updLitis
    ValidateWithMask = True
    Left = 703
    Top = 8
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NumProcTrab'
        ParamType = ptUnknown
      end>
  end
  object updLitis: TUpdateSQL
    ModifySQL.Strings = (
      'update COPARTPROCTRAB'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  NUMPROCTRAB = :NUMPROCTRAB'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  NUMPROCTRAB = :OLD_NUMPROCTRAB')
    InsertSQL.Strings = (
      'insert into COPARTPROCTRAB'
      '  (IDPESSOA, NUMPROCTRAB)'
      'values'
      '  (:IDPESSOA, :NUMPROCTRAB)')
    DeleteSQL.Strings = (
      'delete from COPARTPROCTRAB'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  NUMPROCTRAB = :OLD_NUMPROCTRAB')
    Left = 664
    Top = 9
  end
  object qryEtapa: TwwQuery
    CachedUpdates = True
    BeforeInsert = qryEtapaBeforeInsert
    AfterInsert = qryEtapaAfterInsert
    BeforeEdit = qryEtapaBeforeEdit
    BeforePost = qryEtapaBeforePost
    AfterScroll = qryEtapaAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select ET.ASSUNTO, ET.DATAREALOCOR, ET.NUMSEQ, '
      '       ET.OBSERVETAPA, TP.DESCRICAO, ET.CODTIPORECURSO,'
      '       ET.VALORREC, ET.NUMPROCTRAB, TP.VALORHONOR'
      'from etapaproctrab ET, tiporectrab TP'
      'where ET.CODTIPORECURSO = TP.CODTIPORECURSO'
      'and   ET.NUMPROCTRAB = :NumProcTrab'
      'order by ET.DATAREALOCOR')
    UpdateObject = UpdEtapa
    ValidateWithMask = True
    Left = 488
    Top = 4
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NumProcTrab'
        ParamType = ptUnknown
      end>
  end
  object UpdEtapa: TUpdateSQL
    ModifySQL.Strings = (
      'update ETAPAPROCTRAB'
      'set'
      '  ASSUNTO = :ASSUNTO,'
      '  DATAREALOCOR = :DATAREALOCOR,'
      '  NUMSEQ = :NUMSEQ,'
      '  OBSERVETAPA = :OBSERVETAPA,'
      '  CODTIPORECURSO = :CODTIPORECURSO,'
      '  VALORREC = :VALORREC,'
      '  NUMPROCTRAB = :NUMPROCTRAB'
      'where'
      '  NUMSEQ = :OLD_NUMSEQ and'
      '  NUMPROCTRAB = :OLD_NUMPROCTRAB')
    InsertSQL.Strings = (
      'insert into ETAPAPROCTRAB'
      '  (ASSUNTO, DATAREALOCOR, NUMSEQ, OBSERVETAPA, CODTIPORECURSO, '
      'VALORREC, '
      '   NUMPROCTRAB)'
      'values'
      '  (:ASSUNTO, :DATAREALOCOR, :NUMSEQ, :OBSERVETAPA, '
      ':CODTIPORECURSO, :VALORREC, '
      '   :NUMPROCTRAB)')
    DeleteSQL.Strings = (
      'delete from ETAPAPROCTRAB'
      'where'
      '  NUMSEQ = :OLD_NUMSEQ and'
      '  NUMPROCTRAB = :OLD_NUMPROCTRAB')
    Left = 521
    Top = 8
  end
  object qryTipoEtapa: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DESCRICAO, CODTIPORECURSO'
      'FROM  TIPORECTRAB '
      'ORDER  BY  UPPER(DESCRICAO)')
    ValidateWithMask = True
    Left = 287
    Top = 240
  end
  object tblHonor: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'NUMPROCTRAB;DATAPAGTOHONOR;IDFORNSERV'
    TableName = 'CM.HONORARIOS'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 303
    Top = 137
  end
  object qryNumSeq: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MAX(NUMSEQ)  AS ULTSEQ'
      'FROM ETAPAPROCTRAB'
      'WHERE NUMPROCTRAB = :NUMPROC')
    ValidateWithMask = True
    Left = 640
    Top = 137
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NUMPROC'
        ParamType = ptUnknown
      end>
  end
end
