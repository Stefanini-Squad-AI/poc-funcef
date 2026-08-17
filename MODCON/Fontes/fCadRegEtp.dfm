inherited frmCadRegEtp: TfrmCadRegEtp
  Left = 26
  Top = 84
  HelpContext = 760020
  Caption = 'Registro das Etapas do Processo'
  ClientHeight = 461
  ClientWidth = 752
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 752
    Height = 375
    inherited pnlMestre: TPanel
      Width = 742
      object Label1: TLabel
        Left = 8
        Top = 2
        Width = 83
        Height = 13
        Caption = 'Nosso Número'
        FocusControl = dbedNumero
      end
      object Label2: TLabel
        Left = 6
        Top = 53
        Width = 118
        Height = 13
        Caption = 'Data do Ajuizamento'
      end
      object Label19: TLabel
        Left = 135
        Top = 53
        Width = 115
        Height = 13
        Caption = 'Data da Notificação'
      end
      object Label30: TLabel
        Left = 136
        Top = 4
        Width = 92
        Height = 13
        Caption = 'Número na Vara'
        FocusControl = dbedNumJCJ
      end
      object Label13: TLabel
        Left = 271
        Top = 4
        Width = 77
        Height = 13
        Caption = 'Vara Nº (JCJ)'
        FocusControl = dbedJCJ
      end
      object Label20: TLabel
        Left = 411
        Top = 4
        Width = 219
        Height = 13
        Caption = 'Órgão Jurisdicional (Vara do Trabalho)'
      end
      object dbedDataAju: TCMDateTimePicker
        Left = 8
        Top = 68
        Width = 120
        Height = 21
        TabStop = False
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Color = clBtnFace
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
        Enabled = False
        ReadOnly = True
        ShowButton = True
        TabOrder = 0
      end
      object dbedDataNot: TCMDateTimePicker
        Left = 137
        Top = 68
        Width = 115
        Height = 21
        TabStop = False
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Color = clBtnFace
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
        Enabled = False
        ReadOnly = True
        ShowButton = True
        TabOrder = 1
      end
      object rgSituacao: TDBRadioGroup
        Left = 257
        Top = 43
        Width = 140
        Height = 49
        Caption = 'Situação'
        DataField = 'FLGSITPROC'
        DataSource = ds
        Enabled = False
        Items.Strings = (
          'Aberto'
          'Encerrado')
        ReadOnly = True
        TabOrder = 2
        Values.Strings = (
          '0'
          '1')
      end
      object CMProcuraRequerente: TCMProcuraSubTipo
        Left = 410
        Top = 42
        Width = 320
        Height = 50
        Caption = 'Reclamante'
        Enabled = False
        TabOrder = 3
        CampoEdit = ceNome
        MostraMensagens = False
        DataSource = ds
        DataField = 'IDRECLAMANTE'
        Mensagens.EmBranco = 'Chave não pode estar em branco'
        Mensagens.NaoExiste = 'Chave não existe'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = False
        SubTipo = stFuncionario
        FiltraSubTipo = True
      end
      object dbedNumero: TDBEdit
        Left = 8
        Top = 17
        Width = 120
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'NUMPROCTRAB'
        DataSource = ds
        Enabled = False
        ReadOnly = True
        TabOrder = 4
      end
      object dbedNumJCJ: TDBEdit
        Left = 136
        Top = 19
        Width = 120
        Height = 21
        DataField = 'PROCJCJNUM'
        DataSource = ds
        TabOrder = 5
      end
      object dbedJCJ: TDBEdit
        Left = 271
        Top = 19
        Width = 120
        Height = 21
        DataField = 'JCJ'
        DataSource = ds
        TabOrder = 6
      end
      object dblcVara: TwwDBLookupCombo
        Left = 411
        Top = 19
        Width = 320
        Height = 21
        DropDownAlignment = taRightJustify
        Selected.Strings = (
          'DESCRICAO'#9'40'#9'DESCRICAO')
        DataField = 'IDVARAJUSTICA'
        DataSource = ds
        LookupTable = qryVara
        LookupField = 'IDVARAJUSTICA'
        Options = [loColLines, loTitles]
        TabOrder = 7
        AutoDropDown = True
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        AllowClearKey = True
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Width = 742
      Height = 267
      Tabs.Strings = (
        'Etapas (Andamento) do Processo'
        'Contabilização e Contas a Pagar')
      detdbGrids.Strings = (
        'dbgrdDet'
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 644
        Height = 208
        inherited tbsDet: TTabSheet
          Caption = 'Etapas (Andamento) do Processo'
          inherited dbgrdDet: TwwDBGrid
            Width = 636
            Height = 180
            Selected.Strings = (
              'NUMSEQ'#9'8'#9'Num.Seq.'#9'No'
              'ETAPA'#9'37'#9'Tipo de Etapa'#9'No'
              'DATAREALOCOR'#9'17'#9'Data e Hora'#9'No'
              'ASSUNTO'#9'40'#9'Assunto'#9'No')
          end
          inherited pnlControlesDet: TPanel
            Width = 636
            Height = 180
            object Label7: TLabel
              Left = 103
              Top = 1
              Width = 156
              Height = 13
              Caption = 'Tipo de Etapa (Andamento)'
            end
            object Label4: TLabel
              Left = 439
              Top = 1
              Width = 70
              Height = 13
              Caption = 'Data e Hora'
            end
            object Label3: TLabel
              Left = 103
              Top = 37
              Width = 113
              Height = 13
              Caption = 'Assunto (Resumido)'
            end
            object Label5: TLabel
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
            object Label6: TLabel
              Left = 103
              Top = 107
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
              DataSource = dsDet
              LookupTable = qryTipoEtapa
              LookupField = 'CODTIPORECURSO'
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
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
              DataSource = dsDet
              TabOrder = 3
            end
            object redHonor: TRealEdit
              Left = 481
              Top = 84
              Width = 125
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 4
              Visible = False
              WordWrap = False
              OnChange = redHonorChange
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
            object dbmObserv: TDBMemo
              Left = 103
              Top = 120
              Width = 503
              Height = 80
              DataField = 'OBSERVETAPA'
              DataSource = dsDet
              ScrollBars = ssVertical
              TabOrder = 5
            end
            object dbedValRec: TDBRealEdit
              Left = 481
              Top = 49
              Width = 125
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 6
              WordWrap = False
              OnChange = dbedValRecChange
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VALORREC'
              DataSource = dsDet
            end
            object dbrgAbate: TDBRadioGroup
              Left = 104
              Top = 72
              Width = 320
              Height = 33
              Caption = 'Depósito ou Despesa Abate do Valor da Causa ?'
              Columns = 2
              DataField = 'FLGVALORABATE'
              DataSource = dsDet
              Items.Strings = (
                'Sim'
                'Não')
              TabOrder = 7
              Values.Strings = (
                '1'
                '0')
            end
          end
        end
        object tbshCAP: TTabSheet
          Caption = 'Contabilização e Contas a Pagar'
          object gbxCAP: TGroupBox
            Left = 10
            Top = 65
            Width = 620
            Height = 104
            TabOrder = 0
            object Label47: TLabel
              Left = 16
              Top = 60
              Width = 112
              Height = 13
              Caption = 'Tipo de Documento'
            end
            object Label48: TLabel
              Left = 321
              Top = 60
              Width = 116
              Height = 13
              Caption = 'Tipo de Desembolso'
            end
            object Label46: TLabel
              Left = 17
              Top = 20
              Width = 95
              Height = 13
              Caption = 'Data Pagamento'
            end
            object dblcTipoDoc: TwwDBLookupCombo
              Left = 16
              Top = 74
              Width = 280
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'35'#9'DESCRICAO')
              LookupTable = qryTipoDoc
              LookupField = 'CODTIPDOC'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
            end
            object dblcTipoDesemb: TwwDBLookupCombo
              Left = 321
              Top = 74
              Width = 280
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'35'#9'DESCRICAO')
              LookupTable = qryTipoDesemb
              LookupField = 'CODTIPRECDES'
              Style = csDropDownList
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
            end
            object dtPagamento: TCMDateTimePicker
              Left = 17
              Top = 34
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 2
            end
            object cmprocFonecedor: TCMProcuraForCli
              Left = 146
              Top = 11
              Width = 453
              Height = 46
              Caption = 'Favorecido'
              TabOrder = 3
              CampoEdit = ceRazaoSocial
              MostraMensagens = True
              Mensagens.EmBranco = 'Fornecedor não pode estar em branco'
              Mensagens.NaoExiste = 'Fornecedor não existe'
              PermiteChaveInvalida = True
              PermiteChaveEmBranco = False
              ForCli = fcFornecedor
              MostraEndereco = True
              StatusForCli = fcAll
              MostraStatusCredito = False
            end
          end
          object gbxContabilizacao: TGroupBox
            Left = 10
            Top = 5
            Width = 620
            Height = 53
            Caption = 'Tipo de Operação (Contabilização)'
            TabOrder = 1
            object dblcTipOper: TwwDBLookupCombo
              Left = 122
              Top = 20
              Width = 376
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'TIPDESCRICAO'#9'25'#9'TIPDESCRICAO')
              LookupTable = qryTipoOper
              LookupField = 'TIPCODIGO'
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 734
      end
      inherited Dock974: TDock97
        Left = 648
        Height = 208
      end
    end
  end
  inherited Dock972: TDock97
    Width = 752
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
      object ToolbarSep972: TToolbarSep97
        Left = 240
        Top = 0
        Blank = True
        SizeHorz = 20
      end
      object sbtnImagem: TToolbarButton97
        Left = 260
        Top = 0
        Width = 183
        Height = 41
        AllowAllUp = True
        DropdownCombo = True
        Caption = '&Associar / Visualizar Imagem'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333FFF33F333FF3F330E0330FFFCCFCC33777FF7F3377F7730EEE030FFFC
          CFCC377777F7F33773770EEE0000FFFFFCCF777777773F33377FEEE0BFBF0FFF
          FCCF7777333373F337730E0BFBFBF0FFCCFF77733333373F77F330BFBFBFBF0F
          CCFF37F333333F7F773330FBFBFB0B0FFFFF37F3F33F737FFFFF30B0BF0FB000
          000037F73F73F777777730FB0BF0FB0FFFFF373F73F73F7F333F330030BF0F0F
          FF993F77373F737F3377CC33330BF00FFF9977FFF373F77F3F77CC993330009F
          99FF7777F337777F77F333993330F99F99FF3F77FF37F773773F993CC330FFF9
          9F9977F77F37F3377F77993CC330FFF99F997737733733377377}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        Visible = False
        OnClick = sbtnImagemClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 422
    Width = 752
    inherited tb97Fundo: TToolbar97
      Left = 582
      DockPos = 590
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 415
      DockPos = 423
    end
  end
  inherited qry: TwwQuery
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
      '  NUMPROCTRAB = :NUMPROCTRAB,'
      '  IDRECLAMANTE = :IDRECLAMANTE,'
      '  IDADVOGRECTE = :IDADVOGRECTE,'
      '  CODTIPOSENT = :CODTIPOSENT,'
      '  CODIGOTRT = :CODIGOTRT,'
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
      '  TRGDTINCLUSAO = :TRGDTINCLUSAO,'
      '  TRGUSERINCLUSAO = :TRGUSERINCLUSAO,'
      '  PROCJCJNUM = :PROCJCJNUM,'
      '  IDTIPOPROC = :IDTIPOPROC,'
      '  INDMATERIA = :INDMATERIA,'
      '  IDENTPASTA = :IDENTPASTA,'
      '  DATAJUIZO = :DATAJUIZO,'
      '  IDTIPOACAO = :IDTIPOACAO,'
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
      
        '  (NUMPROCTRAB, IDRECLAMANTE, IDADVOGRECTE, CODTIPOSENT, CODIGOT' +
        'RT, JCJ, '
      
        '   QTDERECTES, DATANOTIF, DATAPOST, PROCTRTNUM, PROCTSTNUM, DATA' +
        'PREVENCER, '
      
        '   DATAEFETENC, CUSTOPROC, TIPOENCER, FLGSITPROC, QTDEPARCACOR, ' +
        'IDADVOGRECDA, '
      
        '   IDASSISTTECN, TRGDTINCLUSAO, TRGUSERINCLUSAO, PROCJCJNUM, IDT' +
        'IPOPROC, '
      
        '   INDMATERIA, IDENTPASTA, DATAJUIZO, IDTIPOACAO, IDVARAJUSTICA,' +
        ' IDCIDADES, '
      
        '   IDADVOGCASA, FLGPARTEATIVA, IDLITISCONSORTE, IDPROCVINCULADO,' +
        ' FLGVINCULADO, '
      '   DESPESAPROC, NUMVARAJUSTICA)'
      'values'
      
        '  (:NUMPROCTRAB, :IDRECLAMANTE, :IDADVOGRECTE, :CODTIPOSENT, :CO' +
        'DIGOTRT, '
      
        '   :JCJ, :QTDERECTES, :DATANOTIF, :DATAPOST, :PROCTRTNUM, :PROCT' +
        'STNUM, '
      
        '   :DATAPREVENCER, :DATAEFETENC, :CUSTOPROC, :TIPOENCER, :FLGSIT' +
        'PROC, :QTDEPARCACOR, '
      
        '   :IDADVOGRECDA, :IDASSISTTECN, :TRGDTINCLUSAO, :TRGUSERINCLUSA' +
        'O, :PROCJCJNUM, '
      
        '   :IDTIPOPROC, :INDMATERIA, :IDENTPASTA, :DATAJUIZO, :IDTIPOACA' +
        'O, :IDVARAJUSTICA, '
      
        '   :IDCIDADES, :IDADVOGCASA, :FLGPARTEATIVA, :IDLITISCONSORTE, :' +
        'IDPROCVINCULADO, '
      '   :FLGVINCULADO, :DESPESAPROC, :NUMVARAJUSTICA)')
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
      'PROCESSOTRAB.JCJ'
      'PROCESSOTRAB.PROCJCJNUM'
      'PROCESSOTRAB.CODIGOTRT'
      'TRT.DESCRICAO'
      'PROCESSOTRAB.PROCTRTNUM'
      'PROCESSOTRAB.PROCTSTNUM'
      'PROCESSOTRAB.NUMPROCTRAB')
    TipodeDado.Strings = (
      'C'
      'D'
      'N'
      'C'
      'N'
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Nome Reclamante'
      'Data de Notificação'
      'Número da Vara (JCJ)'
      'Número Proc. na Vara'
      'Código do TRT'
      'Nome do TRT'
      'Número Proc. no TRT'
      'Número Proc. no TST'
      'Número Proc. Interno')
    Tabelas.Strings = (
      'PESSOA'
      'PROCESSOTRAB'
      'TRT')
    CamposChave.Strings = (
      'PROCESSOTRAB.NUMPROCTRAB')
    Filtro.Strings = (
      'PROCESSOTRAB.IDRECLAMANTE = PESSOA.IDPESSOA'
      'PROCESSOTRAB.CODIGOTRT        = TRT.CODIGOTRT(+)'
      'PROCESSOTRAB.INDMATERIA       = 1')
    Larguras.Strings = (
      '50'
      '12'
      '15'
      '15'
      '15'
      '40'
      '15'
      '15'
      '15')
    Left = 557
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 408
    Top = 108
  end
  object qryImagem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      ' IMAGENS.IDIMAGEM , '
      ' IMAGENS.IMAGEM , '
      ' IMAGENS.DESCRIMAGEM'
      'FROM IMAGENS, ETAPAPROCTRAB'
      'WHERE '
      ' (ETAPAPROCTRAB.NUMPROCTRAB = :NumProc)'
      ' AND'
      '(ETAPAPROCTRAB.NUMSEQ = :NumSeq)'
      ' AND'
      '( IMAGENS.IDIMAGEM = ETAPAPROCTRAB.IDIMAGEM )'
      '')
    UpdateObject = updImagem
    ValidateWithMask = True
    Left = 197
    Top = 115
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NumProc'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NumSeq'
        ParamType = ptUnknown
      end>
    object qryImagemIDIMAGEM: TFloatField
      FieldName = 'IDIMAGEM'
      Origin = 'IMAGENS.IDIMAGEM'
    end
    object qryImagemIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      Origin = 'IMAGENS.IMAGEM'
      BlobType = ftBlob
      Size = 1
    end
    object qryImagemDESCRIMAGEM: TStringField
      FieldName = 'DESCRIMAGEM'
      Origin = 'IMAGENS.DESCRIMAGEM'
      Size = 50
    end
  end
  object updImagem: TUpdateSQL
    ModifySQL.Strings = (
      'update IMAGENS'
      'set'
      '  IDIMAGEM = :IDIMAGEM,'
      '  IMAGEM = :IMAGEM,'
      '  DESCRIMAGEM = :DESCRIMAGEM'
      'where'
      '  IDIMAGEM = :OLD_IDIMAGEM')
    InsertSQL.Strings = (
      'insert into IMAGENS'
      '  (IDIMAGEM, IMAGEM, DESCRIMAGEM)'
      'values'
      '  (:IDIMAGEM, :IMAGEM, :DESCRIMAGEM)')
    DeleteSQL.Strings = (
      'delete from IMAGENS'
      'where'
      '  IDIMAGEM = :OLD_IDIMAGEM')
    Left = 348
    Top = 70
  end
  object dsImagem: TwwDataSource
    DataSet = qryImagem
    Left = 408
    Top = 70
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
    Left = 656
    Top = 17
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NUMPROC'
        ParamType = ptUnknown
      end>
  end
  object qryTipoEtapa: TwwQuery
    CachedUpdates = True
    BeforeInsert = qryEtapaBeforeInsert
    AfterInsert = qryEtapaAfterInsert
    BeforeEdit = qryEtapaBeforeEdit
    AfterScroll = qryEtapaAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DESCRICAO, CODTIPORECURSO'
      'FROM  TIPORECTRAB '
      'ORDER  BY  UPPER(DESCRICAO)')
    ValidateWithMask = True
    Left = 407
    Top = 136
  end
  object updDocumentos: TUpdateSQL
    ModifySQL.Strings = (
      'update documento'
      'set'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  PLANO = :PLANO,'
      '  PLACONTA = :PLACONTA,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  NUMLANCTO = :NUMLANCTO,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  CODCENTRORESPON = :CODCENTRORESPON,'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  VALOR = :VALOR,'
      '  PORTFORMAPARTICIP = :PORTFORMAPARTICIP'
      'where'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO')
    InsertSQL.Strings = (
      'insert into documento'
      
        '  (CODDOCUMENTO, PLANO, PLACONTA, PLNCODIGO, NUMLANCTO, UNIDNEGO' +
        'C, CODCENTRORESPON, '
      '   CODTIPRECDES, VALOR, PORTFORMAPARTICIP)'
      'values'
      
        '  (:CODDOCUMENTO, :PLANO, :PLACONTA, :PLNCODIGO, :NUMLANCTO, :UN' +
        'IDNEGOC, '
      '   :CODCENTRORESPON, :CODTIPRECDES, :VALOR, :PORTFORMAPARTICIP)')
    DeleteSQL.Strings = (
      'delete from documento'
      'where'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO')
    Left = 487
    Top = 360
  end
  object qryDocumentos: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  D.CODDOCUMENTO, D.PLANO, D.PLACONTA, L.PLNCODIGO, L.NUMLANCTO,'
      
        '  R.UNIDNEGOC, R.CODCENTRORESPON, R.CODTIPRECDES, R.VALOR, D.COD' +
        'PORTFORMA,'
      '  L.DEBCRE, 1 PORTFORMAPARTICIP, R.CODCENTROCUSTO'
      'FROM'
      '  DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R'
      'WHERE'
      '  (D.CODDOCUMENTO = :CODDOCUMENTO)  AND'
      '  (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '  (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      'ORDER BY'
      '  D.PLACONTA, R.UNIDNEGOC, R.CODCENTRORESPON, R.CODTIPRECDES')
    UpdateObject = updDocumentos
    ValidateWithMask = True
    Left = 487
    Top = 347
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
    object qryDocumentosCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'RATEIODOCUM.CODTIPRECDES'
      Size = 15
    end
    object qryDocumentosCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'DOCUMENTO.CODDOCUMENTO'
    end
    object qryDocumentosPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'DOCUMENTO.PLANO'
    end
    object qryDocumentosPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'DOCUMENTO.PLACONTA'
      Size = 18
    end
    object qryDocumentosPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'LANCTODOCUM.PLNCODIGO'
    end
    object qryDocumentosNUMLANCTO: TFloatField
      FieldName = 'NUMLANCTO'
      Origin = 'LANCTODOCUM.NUMLANCTO'
    end
    object qryDocumentosUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'RATEIODOCUM.UNIDNEGOC'
    end
    object qryDocumentosCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'RATEIODOCUM.CODCENTRORESPON'
      Size = 10
    end
    object qryDocumentosVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'RATEIODOCUM.VALOR'
    end
    object qryDocumentosCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Origin = 'DOCUMENTO.CODPORTFORMA'
    end
    object qryDocumentosDEBCRE: TStringField
      FieldName = 'DEBCRE'
      Origin = 'LANCTODOCUM.DEBCRE'
      Size = 1
    end
    object qryDocumentosPORTFORMAPARTICIP: TFloatField
      FieldName = 'PORTFORMAPARTICIP'
    end
    object qryDocumentosCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
  end
  object qryTipoDoc: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT '
      '  CODTIPDOC, DESCRICAO, DEBCRE'
      'FROM'
      '  TIPODOCRECPAG'
      'WHERE'
      '  (RECPAG = '#39'P'#39')'
      'ORDER BY'
      '  UPPER(DESCRICAO)')
    ValidateWithMask = True
    Left = 488
    Top = 334
  end
  object qryTipoDesemb: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODTIPRECDES, DESCRICAO, PLACONTACREDITO,'
      '  PLANO, PLACONTA'
      'FROM'
      '  TIPORECEBDESEMB'
      'WHERE'
      '  (ANASINT  = '#39'A'#39') AND'
      '  (RECPAG   = '#39'P'#39')'
      'ORDER BY'
      '  DESCRICAO')
    ValidateWithMask = True
    Left = 336
    Top = 318
  end
  object qryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 607
    Top = 188
  end
  object tblParam: TwwTable
    DatabaseName = 'BaseDados'
    TableName = 'CM.PARAMRH'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 37
    Top = 219
  end
  object qryTipoOper: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  TIPCODIGO,'
      '  TIPDESCRICAO'
      'FROM TIPOPER'
      'ORDER BY UPPER(TIPDESCRICAO)')
    ValidateWithMask = True
    Left = 569
    Top = 248
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
  object qryEtapa: TwwQuery
    CachedUpdates = True
    BeforeInsert = qryEtapaBeforeInsert
    AfterInsert = qryEtapaAfterInsert
    BeforeEdit = qryEtapaBeforeEdit
    BeforePost = qryEtapaBeforePost
    AfterScroll = qryEtapaAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT E.NUMSEQ,'
      '  T.DESCRICAO AS ETAPA,'
      '  T.VALORHONOR,'
      '  E.DATAREALOCOR,'
      '  E.ASSUNTO,'
      '  E.NUMPROCTRAB,'
      '  E.CODTIPORECURSO,'
      '  E.VALORREC,'
      '  E.FLGVALORABATE,'
      '  E.OBSERVETAPA,'
      '  E.IDIMAGEM'
      'FROM ETAPAPROCTRAB E, TIPORECTRAB T'
      'WHERE E.NUMPROCTRAB = :NUMPROC'
      'AND       T.CODTIPORECURSO = E.CODTIPORECURSO'
      'ORDER  BY  E.DATAREALOCOR')
    UpdateObject = UpdEtapa
    ValidateWithMask = True
    Left = 479
    Top = 8
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NUMPROC'
        ParamType = ptUnknown
      end>
    object qryEtapaNUMSEQ: TFloatField
      DisplayLabel = 'Num.Seq.'
      DisplayWidth = 8
      FieldName = 'NUMSEQ'
      Origin = 'ETAPAPROCTRAB.NUMSEQ'
    end
    object qryEtapaETAPA: TStringField
      DisplayLabel = 'Tipo de Etapa'
      DisplayWidth = 37
      FieldName = 'ETAPA'
      Origin = 'TIPORECTRAB.DESCRICAO'
      Size = 40
    end
    object qryEtapaDATAREALOCOR: TDateTimeField
      DisplayLabel = 'Data e Hora'
      DisplayWidth = 17
      FieldName = 'DATAREALOCOR'
      Origin = 'ETAPAPROCTRAB.DATAREALOCOR'
    end
    object qryEtapaASSUNTO: TStringField
      DisplayLabel = 'Assunto'
      DisplayWidth = 40
      FieldName = 'ASSUNTO'
      Origin = 'ETAPAPROCTRAB.ASSUNTO'
      Size = 40
    end
    object qryEtapaVALORHONOR: TFloatField
      FieldName = 'VALORHONOR'
      Origin = 'TIPORECTRAB.VALORHONOR'
      Visible = False
    end
    object qryEtapaNUMPROCTRAB: TFloatField
      FieldName = 'NUMPROCTRAB'
      Origin = 'ETAPAPROCTRAB.NUMPROCTRAB'
      Visible = False
    end
    object qryEtapaCODTIPORECURSO: TFloatField
      FieldName = 'CODTIPORECURSO'
      Origin = 'ETAPAPROCTRAB.CODTIPORECURSO'
      Visible = False
    end
    object qryEtapaVALORREC: TFloatField
      FieldName = 'VALORREC'
      Origin = 'ETAPAPROCTRAB.VALORREC'
      Visible = False
    end
    object qryEtapaOBSERVETAPA: TMemoField
      FieldName = 'OBSERVETAPA'
      Origin = 'ETAPAPROCTRAB.OBSERVETAPA'
      Visible = False
      BlobType = ftMemo
      Size = 1
    end
    object qryEtapaIDIMAGEM: TFloatField
      FieldName = 'IDIMAGEM'
      Origin = 'ETAPAPROCTRAB.IDIMAGEM'
      Visible = False
    end
    object qryEtapaFLGVALORABATE: TFloatField
      FieldName = 'FLGVALORABATE'
      Origin = 'BASEDADOS.ETAPAPROCTRAB.FLGVALORABATE'
    end
  end
  object UpdEtapa: TUpdateSQL
    ModifySQL.Strings = (
      'update ETAPAPROCTRAB'
      'set'
      '  DATAREALOCOR = :DATAREALOCOR,'
      '  ASSUNTO = :ASSUNTO,'
      '  CODTIPORECURSO = :CODTIPORECURSO,'
      '  VALORREC = :VALORREC,'
      '  FLGVALORABATE = :FLGVALORABATE,'
      '  OBSERVETAPA = :OBSERVETAPA,'
      '  IDIMAGEM = :IDIMAGEM'
      'where'
      '  NUMSEQ = :OLD_NUMSEQ and'
      '  NUMPROCTRAB = :OLD_NUMPROCTRAB')
    InsertSQL.Strings = (
      'insert into ETAPAPROCTRAB'
      '  (NUMSEQ, DATAREALOCOR, ASSUNTO, NUMPROCTRAB, CODTIPORECURSO, '
      'VALORREC, '
      '   FLGVALORABATE, OBSERVETAPA, IDIMAGEM)'
      'values'
      '  (:NUMSEQ, :DATAREALOCOR, :ASSUNTO, :NUMPROCTRAB, '
      ':CODTIPORECURSO, :VALORREC, '
      '   :FLGVALORABATE, :OBSERVETAPA, :IDIMAGEM)')
    DeleteSQL.Strings = (
      'delete from ETAPAPROCTRAB'
      'where'
      '  NUMSEQ = :OLD_NUMSEQ and'
      '  NUMPROCTRAB = :OLD_NUMPROCTRAB')
    Left = 529
    Top = 8
  end
end
