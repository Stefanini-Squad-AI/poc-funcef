inherited frmCadContasOrcMT: TfrmCadContasOrcMT
  Left = 147
  Top = 158
  HelpContext = 520023
  Caption = 'Cadastro das Contas Orçamentárias'
  ClientHeight = 460
  ClientWidth = 744
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 744
    Height = 374
    inherited pnlMestre: TPanel
      Width = 742
      Height = 164
      object lblCodigoConta: TLabel
        Left = 8
        Top = 0
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object lblNome: TLabel
        Left = 186
        Top = 0
        Width = 167
        Height = 13
        Caption = 'Nome da Conta Orçamentária'
      end
      object Label4: TLabel
        Left = 467
        Top = 80
        Width = 160
        Height = 13
        Caption = 'Centro de Responsabilidade'
      end
      object Label5: TLabel
        Left = 8
        Top = 40
        Width = 168
        Height = 13
        Caption = 'Tipo de Cálculo do Realizado'
      end
      object Label6: TLabel
        Left = 256
        Top = 40
        Width = 153
        Height = 13
        Caption = 'Tipo de Cálculo do Orçado'
      end
      object Label1: TLabel
        Left = 183
        Top = 80
        Width = 232
        Height = 13
        Caption = 'Tipo de Cálculo dos Valores Acumulados'
      end
      object Label12: TLabel
        Left = 183
        Top = 120
        Width = 71
        Height = 13
        Caption = 'Data Inativa'
      end
      object Label13: TLabel
        Left = 290
        Top = 120
        Width = 97
        Height = 13
        Caption = 'Data Reativação'
      end
      object dbcTransfere: TDBCheckBox
        Left = 519
        Top = 141
        Width = 225
        Height = 17
        Caption = 'Transfere Saldos entre Exercícios'
        DataField = 'FLGTRANSFSALDO'
        DataSource = ds
        TabOrder = 12
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbeNomeContaOrc: TwwDBEdit
        Left = 184
        Top = 16
        Width = 297
        Height = 21
        DataField = 'NOMECONTAORCAMEN'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbcConverte: TDBCheckBox
        Left = 519
        Top = 122
        Width = 193
        Height = 17
        Caption = 'Conta Orçamentária &Monetária'
        DataField = 'FLGCONTAMONETARIA'
        DataSource = ds
        TabOrder = 11
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbrdgSinal: TDBRadioGroup
        Left = 8
        Top = 81
        Width = 169
        Height = 37
        Caption = 'Sinal da Conta'
        Columns = 2
        DataField = 'FLGSINALCONTA'
        DataSource = ds
        Items.Strings = (
          'Positiva'
          'Negativa')
        TabOrder = 5
        TabStop = True
        Values.Strings = (
          'P'
          'N')
      end
      object dblcCentRespConta: TwwDBLookupCombo
        Left = 467
        Top = 96
        Width = 253
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Nome'#9'F'
          'CODEXTERNO'#9'10'#9'Código'#9'F')
        DataField = 'CODCENTRORESPON'
        DataSource = ds
        LookupTable = CdsCenRespConta
        LookupField = 'CODCENTRORESPON'
        Options = [loColLines, loTitles]
        DropDownCount = 5
        TabOrder = 7
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dbcboTipoCalcReal: TwwDBComboBox
        Left = 8
        Top = 56
        Width = 233
        Height = 21
        ShowButton = True
        Style = csDropDownList
        MapList = True
        AllowClearKey = True
        AutoDropDown = True
        DataField = 'TIPOCALCREALIZADO'
        DataSource = ds
        DropDownCount = 8
        ItemHeight = 0
        Items.Strings = (
          'Valor Informado Manualmente'#9'V'
          'Contabilidade'#9'P'
          'Fluxo de Caixa'#9'X'
          'Arquivos Genéricos'#9'G'
          'Valor Fixo Informado'#9'I'
          'Fórmula'#9'M'
          'Composição de Outras Contas'#9'F'
          'Valor Acumulado'#9'A'
          'Título'#9'T'
          'Condicional'#9'C')
        Sorted = False
        TabOrder = 3
        UnboundDataType = wwDefault
        OnCloseUp = dbcboTipoCalcRealCloseUp
        OnExit = dbcboTipoCalcRealExit
      end
      object dbcboTipoCalcOrc: TwwDBComboBox
        Left = 256
        Top = 56
        Width = 225
        Height = 21
        ShowButton = True
        Style = csDropDownList
        MapList = True
        AllowClearKey = True
        AutoDropDown = True
        DataField = 'TIPOCALCORCADO'
        DataSource = ds
        DropDownCount = 8
        ItemHeight = 0
        Items.Strings = (
          'Valor Informado Manualmente'#9'V'
          'Valor Fixo Informado'#9'I'
          'Fórmula'#9'M'
          'Composição de Outras Contas'#9'F'
          'Valor Acumulado'#9'A'
          'Título'#9'T'
          'Condicional'#9'C')
        Sorted = False
        TabOrder = 4
        UnboundDataType = wwDefault
        OnCloseUp = dbcboTipoCalcOrcCloseUp
        OnExit = dbcboTipoCalcOrcExit
      end
      object dbcboCalcValor: TwwDBComboBox
        Left = 183
        Top = 96
        Width = 275
        Height = 21
        ShowButton = True
        Style = csDropDownList
        MapList = True
        AllowClearKey = True
        AutoDropDown = True
        DataField = 'FLGACUMULADO'
        DataSource = ds
        DropDownCount = 8
        ItemHeight = 0
        Items.Strings = (
          'Calcula o Valor quando emite'#9'S'
          'Soma as parcelas por período'#9'N'
          'Repete o valor da última parcela'#9'U'
          'Calcula quando emite pela fórmula do Orçado'#9'O'
          'Calcula quando emite pela fórmula do Realizado'#9'R'
          'Acumula com o valor do período anterior'#9'A')
        Sorted = False
        TabOrder = 6
        UnboundDataType = wwDefault
      end
      object dteDataInativa: TCMDateTimePicker
        Left = 183
        Top = 136
        Width = 105
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAINATIVA'
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
        ShowButton = True
        TabOrder = 8
      end
      object dbchkInativa: TDBCheckBox
        Left = 410
        Top = 137
        Width = 105
        Height = 17
        Caption = 'Conta Inativa?'
        DataField = 'FLGATIVA'
        DataSource = ds
        TabOrder = 10
        ValueChecked = 'I'
        ValueUnchecked = 'A'
        OnClick = dbchkInativaClick
      end
      object dteDataAtiva: TCMDateTimePicker
        Left = 290
        Top = 136
        Width = 113
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAATIVA'
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
        ShowButton = True
        TabOrder = 9
      end
      object btnTransf: TfcShapeBtn
        Left = 8
        Top = 128
        Width = 169
        Height = 33
        Caption = 'Transfere composição entre '#13#10'Orçado/Realizado'
        Color = clBtnFace
        DitherColor = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Enabled = False
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000016000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888F88888008888588888888887F88888008885588888888877FFF888008855
          55588888877777FF88008555555588887777777FF80088555555588887777777
          FF008885588555888877F8777F008888588855888F8788877F008D8888888588
          7F8888887F008D88888885887FF888F878008DD888D8888877F887FF88008DDD
          88DD8888777FF77FF80088DDDDDDD88887777777FF00888DDDDDDD8888777777
          78008888DDDDD888888777778800888888DD8888888887788800888888D88888
          888887888800888888888888888888888800}
        NumGlyphs = 2
        ParentClipping = True
        ParentFont = False
        RoundRectBias = 25
        ShadeStyle = fbsHighlight
        TabOrder = 13
        TextOptions.Alignment = taCenter
        TextOptions.LineSpacing = 0
        TextOptions.VAlignment = vaVCenter
        OnClick = btnTransfClick
      end
      object dbeGrupo: TCMProcuraMask
        Left = 488
        Top = 0
        Width = 230
        Height = 76
        Caption = ' Grupo '
        TabOrder = 2
        OnExit = dbeGrupoExit
        MostraMensagens = True
        MostraDescricao = True
        DataSource = ds
        DataField = 'CODGRUPOORC'
        Mensagens.EmBranco = 'Grupo não pode estar em branco'
        Mensagens.NaoExiste = 'Grupo não existe'
        Mensagens.Sintetica = 'Grupo não pode ser sintético'
        Mensagens.Analitica = 'Grupo não pode ser analítico'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = False
        AceitaTipoConta = SoAnalitica
        MontaSelect = MontaSelectGrupo
        LookupQuery = CdsGrupo
        LookupSQLParams = qryGrupo
        LookupParam = 'CODGRUPOORC'
        LookupChave = 'CODGRUPOORC'
        LookupTipo = 'FLGANALSINT'
        LookupDescricao = 'NOMEGRUPOORCAMEN'
      end
      object dbeCodigoContaOrc: TwwDBEdit
        Left = 8
        Top = 16
        Width = 169
        Height = 21
        DataField = 'IDCONTAORCAMEN'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object pgbStatus: TProgressBar
        Left = 360
        Top = 0
        Width = 116
        Height = 16
        Min = 0
        Max = 100
        Smooth = True
        TabOrder = 14
        Visible = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 165
      Width = 742
      Height = 208
      Tabs.Strings = (
        'Contabilidade'
        'Fórmulas/Acumulado'
        'Contas Orçado'
        'Contas Realizado'
        'Fluxo de Caixa'
        'Valor Fixo Informado'
        'Condicionais'
        'Arquivos Genéricos'
        'Observações'
        'Parâmetros da Conta')
      detdbGrids.Strings = (
        'dbgrdDet'
        ''
        'dbgrdContaOrc'
        'dbgrdContaRea'
        'dbgrdFluxo'
        ''
        'dbgrdCond'
        ''
        ''
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 644
        Height = 149
        ActivePage = tbsContasOrc
        inherited tbsDet: TTabSheet
          Caption = 'Contabilidade'
          OnShow = tbsDetShow
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 636
            Height = 121
            Selected.Strings = (
              'DESCPLANO'#9'20'#9'Plano Contábil'
              'PLACONTA'#9'20'#9'Conta Contábil'#9'F'
              'NOMECC'#9'25'#9'Centro de Custo'
              'UNECODIGO'#9'10'#9'Cód. Ativ/Projeto'
              'NOMEAP'#9'25'#9'Atividade/Projeto'
              'NOMEPLANO'#9'35'#9'Plano Previdenciário'
              'NOMEPATRO'#9'35'#9'Patrocinadora')
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 636
            Height = 121
            object lblCCusto: TLabel
              Left = 213
              Top = 0
              Width = 92
              Height = 13
              Caption = 'Centro do Custo'
            end
            object lblAtividade: TLabel
              Left = 427
              Top = 0
              Width = 100
              Height = 13
              Caption = 'Atividade/Projeto'
            end
            object Label24: TLabel
              Left = 2
              Top = 0
              Width = 83
              Height = 13
              Caption = 'Plano Contábil'
            end
            object lblAtividade1: TLabel
              Left = 545
              Top = 0
              Width = 74
              Height = 13
              Alignment = taRightJustify
              Caption = 'lblAtividade1'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object dblcCCusto: TwwDBLookupCombo
              Left = 211
              Top = 16
              Width = 201
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Nome'#9'F'
                'CODEXTERNO'#9'10'#9'Código'#9'F')
              DataField = 'CODCENTROCUSTO'
              DataSource = dsDet
              LookupTable = CdsCCusto
              LookupField = 'CODCENTROCUSTO'
              Options = [loColLines]
              Style = csDropDownList
              DropDownCount = 5
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnEnter = dblcCCustoEnter
            end
            object dblcAtividade: TwwDBLookupCombo
              Left = 425
              Top = 16
              Width = 201
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'25'#9'NOME'
                'UNECODIGO'#9'10'#9'Código'#9'F')
              DataField = 'UNIDNEGOC'
              DataSource = dsDet
              LookupTable = CdsUnidNegoc
              LookupField = 'UNIDNEGOC'
              Options = [loColLines]
              Style = csDropDownList
              DropDownCount = 5
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = dblcAtividadeCloseUp
              OnExit = dblcAtividadeExit
            end
            object cmccConta: TCMProcuraMaskContabil
              Left = 1
              Top = 38
              Width = 202
              Height = 72
              Caption = ' Conta Contábil '
              TabOrder = 1
              MostraMensagens = True
              MostraDescricao = True
              DataSource = dsDet
              DataField = 'PLACONTA'
              Mensagens.EmBranco = 'Conta não pode estar em branco'
              Mensagens.NaoExiste = 'Conta não existe'
              Mensagens.Sintetica = 'Conta não pode ser sintética'
              Mensagens.Analitica = 'Conta não pode ser analítica'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = False
              AceitaTipoConta = Indiferente
              Plano = 0
              Status = scSoAtiva
            end
            object pnlPlanoPatroC: TPanel
              Left = 208
              Top = 37
              Width = 418
              Height = 49
              BevelOuter = bvNone
              TabOrder = 4
              object lblPlanoPrevC: TLabel
                Left = 219
                Top = 8
                Width = 118
                Height = 13
                Caption = 'Plano Previdenciário'
              end
              object lblPatroC: TLabel
                Left = 3
                Top = 8
                Width = 80
                Height = 13
                Caption = 'Patrocinadora'
              end
              object dblcPlanoPrevC: TwwDBLookupCombo
                Left = 217
                Top = 24
                Width = 201
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'50'#9'NOME'#9'F')
                DataField = 'IDPLANOPREV'
                DataSource = dsDet
                LookupTable = CdsPlanoPrev
                LookupField = 'IDPLANOPREV'
                Options = [loColLines]
                DropDownCount = 5
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
              object dblcPatroC: TwwDBLookupCombo
                Left = 2
                Top = 24
                Width = 201
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'30'#9'Nome')
                DataField = 'IDPATRO'
                DataSource = dsDet
                LookupTable = CdsPatro
                LookupField = 'IDPESSOA'
                Options = [loColLines]
                DropDownCount = 5
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
            end
            object dblcPlanoContabil: TwwDBLookupCombo
              Left = 2
              Top = 16
              Width = 201
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCPLANO'#9'20'#9'Plano'#9'F')
              DataField = 'PLANO'
              DataSource = dsDet
              LookupTable = CdsPlanoContabil
              LookupField = 'PLANO'
              Options = [loColLines]
              Style = csDropDownList
              DropDownCount = 5
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = dblcPlanoContabilCloseUp
              OnExit = dblcPlanoContabilExit
            end
          end
        end
        object tbsFormulas: TTabSheet
          Caption = 'Fórmulas/Acumulado'
          object lblFormulaOrc: TLabel
            Left = 9
            Top = 5
            Width = 108
            Height = 13
            Caption = 'Fórmula do Orçado'
          end
          object lblFormulaReal: TLabel
            Left = 9
            Top = 53
            Width = 123
            Height = 13
            Caption = 'Fórmula do Realizado'
          end
          object spbOrcado: TSpeedButton
            Left = 594
            Top = 21
            Width = 25
            Height = 22
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
            OnClick = spbOrcadoClick
          end
          object spbRealizado: TSpeedButton
            Left = 594
            Top = 69
            Width = 25
            Height = 22
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
            OnClick = spbRealizadoClick
          end
          object dbreFormulaOrcado: TwwDBEdit
            Left = 9
            Top = 21
            Width = 585
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'FORMULAORCADO'
            DataSource = ds
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
            OnEnter = dbreFormulaOrcadoEnter
            OnExit = dbreFormulaOrcadoExit
          end
          object dbreFormulaReal: TwwDBEdit
            Left = 9
            Top = 69
            Width = 585
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'FORMULAREALIZADO'
            DataSource = ds
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
            OnEnter = dbreFormulaRealEnter
            OnExit = dbreFormulaRealExit
          end
        end
        object tbsContasOrc: TTabSheet
          Caption = 'Contas Orçado'
          object dbgrdContaOrc: TwwDBGrid
            Left = 0
            Top = 0
            Width = 636
            Height = 121
            Selected.Strings = (
              'IDCONTAREFORCADO'#9'18'#9'Conta Orçamentária'
              'NOMECONTAORCAMEN'#9'60'#9'Nome da Conta Orçamentária'
              'PERCCONTAREFORC'#9'10'#9'Percentual')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsDetContaOrc
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
          object pnlContasOrc: TPanel
            Left = 0
            Top = 0
            Width = 636
            Height = 121
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object lblContaRefOrc: TLabel
              Left = 30
              Top = 2
              Width = 118
              Height = 13
              Caption = 'Conta de Referência'
            end
            object lblPercOrc: TLabel
              Left = 456
              Top = 1
              Width = 62
              Height = 13
              Caption = 'Percentual'
            end
            object Label14: TLabel
              Left = 30
              Top = 45
              Width = 35
              Height = 13
              Caption = 'Inicial'
            end
            object Label15: TLabel
              Left = 87
              Top = 45
              Width = 42
              Height = 13
              Caption = 'Dígitos'
            end
            object Label16: TLabel
              Left = 144
              Top = 45
              Width = 55
              Height = 13
              Caption = 'Conteúdo'
            end
            object dblcContaRefOrc: TwwDBLookupCombo
              Left = 30
              Top = 18
              Width = 392
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'IDCONTAORCAMEN'#9'15'#9'IDCONTAORCAMEN'#9'T'
                'NOMECONTAORCAMEN'#9'50'#9'NOMECONTAORCAMEN'#9'T')
              DataField = 'IDCONTAREFORCADO'
              DataSource = dsDetContaOrc
              LookupTable = CdsContasOrc
              LookupField = 'IDCONTAORCAMEN'
              Options = [loColLines]
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnEnter = dblcContaRefOrcEnter
            end
            object dbrPercOrc: TDBRealEdit
              Left = 456
              Top = 17
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 1
              WordWrap = False
              IntDigits = 4
              DecDigits = 4
              NumberFormat = fNumber
              Signal = False
              DataField = 'PERCCONTAREFORC'
              DataSource = dsDetContaOrc
            end
            object sePosIni1: TwwDBSpinEdit
              Left = 30
              Top = 59
              Width = 49
              Height = 21
              Increment = 1
              TabOrder = 2
              UnboundDataType = wwDefault
            end
            object sePosFim1: TwwDBSpinEdit
              Left = 87
              Top = 59
              Width = 49
              Height = 21
              Increment = 1
              TabOrder = 3
              UnboundDataType = wwDefault
            end
            object edConteudo1: TEdit
              Left = 144
              Top = 59
              Width = 277
              Height = 21
              TabOrder = 4
            end
          end
        end
        object tbsContaRea: TTabSheet
          Caption = 'Contas Realizado'
          object dbgrdContaRea: TwwDBGrid
            Left = 0
            Top = 0
            Width = 636
            Height = 121
            Selected.Strings = (
              'IDCONTAREFREAL'#9'18'#9'Conta Orçamentária'
              'NOMECONTAORCAMEN'#9'60'#9'Nome da Conta Orçamentária'
              'PERCCONTAREFREA'#9'10'#9'Percentual')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsDetContaRea
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
          object pnlContasRea: TPanel
            Left = 0
            Top = 0
            Width = 636
            Height = 121
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object lblPercRea: TLabel
              Left = 456
              Top = 4
              Width = 62
              Height = 13
              Caption = 'Percentual'
            end
            object lblContaRefRea: TLabel
              Left = 29
              Top = 4
              Width = 118
              Height = 13
              Caption = 'Conta de Referência'
            end
            object Label17: TLabel
              Left = 30
              Top = 45
              Width = 35
              Height = 13
              Caption = 'Inicial'
            end
            object Label18: TLabel
              Left = 87
              Top = 45
              Width = 42
              Height = 13
              Caption = 'Dígitos'
            end
            object Label19: TLabel
              Left = 144
              Top = 45
              Width = 55
              Height = 13
              Caption = 'Conteúdo'
            end
            object dbrPercRea: TDBRealEdit
              Left = 456
              Top = 20
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 0
              WordWrap = False
              IntDigits = 4
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'PERCCONTAREFREA'
              DataSource = dsDetContaRea
            end
            object dblcContaRefRea: TwwDBLookupCombo
              Left = 29
              Top = 20
              Width = 390
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'IDCONTAORCAMEN'#9'10'#9'Conta'
                'NOMECONTAORCAMEN'#9'60'#9'Nome')
              DataField = 'IDCONTAREFREAL'
              DataSource = dsDetContaRea
              LookupTable = CdsContasOrc
              LookupField = 'IDCONTAORCAMEN'
              Options = [loColLines]
              Style = csDropDownList
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnEnter = dblcContaRefReaEnter
            end
            object sePosIni2: TwwDBSpinEdit
              Left = 29
              Top = 59
              Width = 49
              Height = 21
              Increment = 1
              TabOrder = 2
              UnboundDataType = wwDefault
            end
            object sePosFim2: TwwDBSpinEdit
              Left = 86
              Top = 59
              Width = 49
              Height = 21
              Increment = 1
              TabOrder = 3
              UnboundDataType = wwDefault
            end
            object edConteudo2: TEdit
              Left = 143
              Top = 59
              Width = 277
              Height = 21
              TabOrder = 4
            end
          end
        end
        object tbsFluxoCaixa: TTabSheet
          Caption = 'Fluxo de Caixa'
          OnShow = tbsFluxoCaixaShow
          object dbgrdFluxo: TwwDBGrid
            Left = 0
            Top = 0
            Width = 636
            Height = 121
            Selected.Strings = (
              'CODTIPRECDES'#9'15'#9'Tipo de Recebimento/Desembolso'
              'RECPAG'#9'1'#9'R/P'
              'NOMETR'#9'35'#9'Nome Tipo Recebimento/Desembolso'
              'CODCENTRORESPON'#9'10'#9'Centro de Responsabilidade'
              'NOMECR'#9'30'#9'Nome Centro de Responsabilidade'
              'UNIDNEGOC'#9'10'#9'Atividade/Projeto'
              'NOMEAP'#9'25'#9'Nome Atividade/Projeto'
              'CODCENTROCUSTO'#9'10'#9'Centro de Custo'
              'NOMECC'#9'30'#9'Nome Centro de Custo'
              'NOMEPLANO'#9'50'#9'Nome Plano Previdenciário'
              'NOMEPATRO'#9'60'#9'Nome Patrocinadora')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsDetFluxo
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
          object pnlFluxoCaixa: TPanel
            Left = 0
            Top = 0
            Width = 636
            Height = 121
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object lblUnidNegoc: TLabel
              Left = 4
              Top = 8
              Width = 54
              Height = 13
              Caption = 'Atividade'
            end
            object lblCentroRespon: TLabel
              Left = 204
              Top = 8
              Width = 160
              Height = 13
              Caption = 'Centro de Responsabilidade'
            end
            object lblTipoRD: TLabel
              Left = 420
              Top = 8
              Width = 196
              Height = 13
              Caption = 'Tipo de Recebimento/Desembolso'
            end
            object Label2: TLabel
              Left = 4
              Top = 48
              Width = 92
              Height = 13
              Caption = 'Centro do Custo'
            end
            object lblAtividade2: TLabel
              Left = 115
              Top = 8
              Width = 74
              Height = 13
              Alignment = taRightJustify
              Caption = 'lblAtividade2'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object dblcUnidNegoc: TwwDBLookupCombo
              Left = 4
              Top = 24
              Width = 185
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'25'#9'NOME'
                'UNECODIGO'#9'10'#9'Código'#9'F')
              DataField = 'UNIDNEGOC'
              DataSource = dsDetFluxo
              LookupTable = CdsUnidNegoc
              LookupField = 'UNIDNEGOC'
              Options = [loColLines]
              DropDownCount = 5
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = dblcUnidNegocCloseUp
              OnExit = dblcUnidNegocExit
            end
            object dblcCentroRespon: TwwDBLookupCombo
              Left = 204
              Top = 24
              Width = 201
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Nome'#9'F'
                'CODEXTERNO'#9'10'#9'Código'#9'F')
              DataField = 'CODCENTRORESPON'
              DataSource = dsDetFluxo
              LookupTable = CdsCentroRespon
              LookupField = 'CODCENTRORESPON'
              Options = [loColLines]
              DropDownCount = 5
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblcTipoRD: TwwDBLookupCombo
              Left = 420
              Top = 24
              Width = 201
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'35'#9'Descrição'
                'RECPAG'#9'1'#9'R/P'
                'CODTIPRECDES'#9'15'#9'Código'
                'ANASINT'#9'1'#9'A/S')
              DataField = 'CODTIPRECDES'
              DataSource = dsDetFluxo
              LookupTable = CdsTipoRD
              LookupField = 'CODTIPRECDES'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              DropDownCount = 5
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblkCCustoFluxo: TwwDBLookupCombo
              Left = 4
              Top = 64
              Width = 185
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'NOME'
                'CODCENTROCUSTO'#9'10'#9'CODCENTROCUSTO')
              DataField = 'CODCENTROCUSTO'
              DataSource = dsDetFluxo
              LookupTable = CdsCCustoFluxo
              LookupField = 'CODCENTROCUSTO'
              Options = [loColLines]
              DropDownCount = 5
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object pnlPlanoPatroF: TPanel
              Left = 198
              Top = 45
              Width = 439
              Height = 60
              BevelOuter = bvNone
              TabOrder = 4
              object lblPlanPrevF: TLabel
                Left = 222
                Top = 4
                Width = 33
                Height = 13
                Caption = 'Plano'
              end
              object lblPlatroF: TLabel
                Left = 6
                Top = 4
                Width = 80
                Height = 13
                Caption = 'Patrocinadora'
              end
              object dblcPlanPrevF: TwwDBLookupCombo
                Left = 222
                Top = 20
                Width = 201
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'50'#9'NOME'#9'F')
                DataField = 'IDPLANOPREV'
                DataSource = dsDetFluxo
                LookupTable = CdsPlanoPrev
                LookupField = 'IDPLANOPREV'
                Options = [loColLines]
                DropDownCount = 5
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
              object dblcPatroF: TwwDBLookupCombo
                Left = 6
                Top = 20
                Width = 201
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'30'#9'Nome')
                DataField = 'IDPATRO'
                DataSource = dsDetFluxo
                LookupTable = CdsPatro
                LookupField = 'IDPESSOA'
                Options = [loColLines]
                DropDownCount = 5
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
            end
          end
        end
        object tbsValorInformado: TTabSheet
          Caption = 'Valor Fixo Informado'
          object gbValorInformadoRea: TGroupBox
            Left = 32
            Top = 24
            Width = 181
            Height = 64
            Caption = 'Realizado'
            TabOrder = 0
            object dbrValorRealizado: TDBRealEdit
              Left = 30
              Top = 24
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 0
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRINFORMADOREAL'
              DataSource = ds
            end
          end
          object gbValorInformadoOrc: TGroupBox
            Left = 232
            Top = 24
            Width = 181
            Height = 64
            Caption = 'Orçado'
            TabOrder = 1
            object dbrValorOrcado: TDBRealEdit
              Left = 30
              Top = 24
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 0
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRINFORMADOORC'
              DataSource = ds
            end
          end
          object dbrgGeracaoDados: TDBRadioGroup
            Left = 432
            Top = 24
            Width = 181
            Height = 64
            Caption = 'Geração de Dados'
            DataField = 'FLGINFDIAMES'
            DataSource = ds
            Items.Strings = (
              'Por Período'
              'Diária')
            TabOrder = 2
            Values.Strings = (
              'P'
              'D')
          end
        end
        object tbsCond: TTabSheet
          Caption = 'Condicionais'
          object dbgrdCond: TwwDBGrid
            Left = 0
            Top = 0
            Width = 636
            Height = 121
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsDetCond
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 636
            Height = 121
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object Label9: TLabel
              Left = 32
              Top = 8
              Width = 34
              Height = 13
              Caption = 'Conta'
            end
            object Label7: TLabel
              Left = 6
              Top = 28
              Width = 16
              Height = 13
              Caption = 'Se'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label8: TLabel
              Left = 480
              Top = 8
              Width = 34
              Height = 13
              Caption = 'Conta'
            end
            object Label10: TLabel
              Left = 344
              Top = 8
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object Image1: TImage
              Left = 208
              Top = 67
              Width = 16
              Height = 16
              AutoSize = True
              Picture.Data = {
                07544269746D6170F6000000424DF60000000000000076000000280000001000
                0000100000000100040000000000800000000000000000000000100000001000
                0000000000000000800000800000008080008000000080008000808000008080
                8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
                FF00888888888888888888888888888888888887777777777788880000000000
                0788880FFFFFFFFF0788880FFFFFFFFF07888800000000000888888888888888
                888888877777777777888800000000000788880FFFFFFFFF0788880FFFFFFFFF
                0788880000000000088888888888888888888888888888888888888888888888
                8888}
              Transparent = True
            end
            object Label11: TLabel
              Left = 248
              Top = 8
              Width = 26
              Height = 13
              Caption = 'Tipo'
            end
            object dblkContaIni: TwwDBLookupCombo
              Left = 32
              Top = 24
              Width = 145
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'IDCONTAORCAMEN'#9'12'#9'IDCONTAORCAMEN'#9'F'
                'NOMECONTAORCAMEN'#9'100'#9'NOMECONTAORCAMEN'#9'F')
              DataField = 'IDCONTACONDINI'
              DataSource = dsDetCond
              LookupTable = CdsContaCondIni
              LookupField = 'IDCONTAORCAMEN'
              Options = [loColLines]
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnEnter = dblcContaRefReaEnter
            end
            object dbcboCondicao: TwwDBComboBox
              Left = 192
              Top = 24
              Width = 41
              Height = 21
              ShowButton = True
              Style = csDropDown
              MapList = False
              AllowClearKey = False
              DataField = 'CONDICAO'
              DataSource = dsDetCond
              DropDownCount = 8
              ItemHeight = 0
              Items.Strings = (
                '<='
                '<'
                '='
                '>'
                '>='
                '<>')
              Sorted = False
              TabOrder = 1
              UnboundDataType = wwDefault
            end
            object dbcboTipoIni: TwwDBComboBox
              Left = 248
              Top = 24
              Width = 81
              Height = 21
              ShowButton = True
              Style = csDropDown
              MapList = True
              AllowClearKey = False
              DataField = 'TIPOCONDINI'
              DataSource = dsDetCond
              DropDownCount = 8
              ItemHeight = 0
              Items.Strings = (
                'ao Valor'#9'V'
                'a Conta'#9'C')
              Sorted = False
              TabOrder = 2
              UnboundDataType = wwDefault
              OnCloseUp = dbcboTipoIniCloseUp
            end
            object dblkContaFim: TwwDBLookupCombo
              Left = 480
              Top = 24
              Width = 145
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'IDCONTAORCAMEN'#9'12'#9'Conta'
                'NOMECONTAORCAMEN'#9'60'#9'Nome')
              DataField = 'IDCONTACONDFIM'
              DataSource = dsDetCond
              LookupTable = CdsContaCondFim
              LookupField = 'IDCONTAORCAMEN'
              Options = [loColLines]
              Enabled = False
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnEnter = dblkContaFimEnter
            end
            object dbrValorIni: TDBRealEdit
              Left = 344
              Top = 24
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Enabled = False
              Lines.Strings = (
                '      0,00')
              TabOrder = 3
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRCONDINI'
              DataSource = dsDetCond
            end
            object dblkContaRes: TwwDBLookupCombo
              Left = 480
              Top = 64
              Width = 145
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'IDCONTAORCAMEN'#9'12'#9'Conta'
                'NOMECONTAORCAMEN'#9'60'#9'Nome')
              DataField = 'IDCONTACONDRES'
              DataSource = dsDetCond
              LookupTable = CdsContaCondRes
              LookupField = 'IDCONTAORCAMEN'
              Options = [loColLines]
              Enabled = False
              TabOrder = 7
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnEnter = dblkContaResEnter
            end
            object dbcboTipoRes: TwwDBComboBox
              Left = 248
              Top = 64
              Width = 81
              Height = 21
              ShowButton = True
              Style = csDropDown
              MapList = True
              AllowClearKey = False
              DataField = 'TIPOCONDRES'
              DataSource = dsDetCond
              DropDownCount = 8
              ItemHeight = 0
              Items.Strings = (
                'ao Valor'#9'V'
                'a Conta'#9'C')
              Sorted = False
              TabOrder = 5
              UnboundDataType = wwDefault
              OnCloseUp = dbcboTipoResCloseUp
            end
            object dbrValorRes: TDBRealEdit
              Left = 344
              Top = 64
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Enabled = False
              Lines.Strings = (
                '      0,00')
              TabOrder = 6
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRCONDRES'
              DataSource = dsDetCond
            end
          end
        end
        object tbsArquivoGen: TTabSheet
          Caption = 'Arquivos Genéricos'
          object Label3: TLabel
            Left = 16
            Top = 8
            Width = 52
            Height = 13
            Caption = 'Pesquisa'
          end
          object btnCriaSQL: TBitBtn
            Left = 536
            Top = 27
            Width = 105
            Height = 49
            Caption = 'C&ria Consulta'
            Enabled = False
            TabOrder = 1
            Visible = False
            OnClick = btnCriaSQLClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00370777033333
              3330337F3F7F33333F3787070003333707303F737773333373F7007703333330
              700077337F3333373777887007333337007733F773F333337733700070333333
              077037773733333F7F37703707333300080737F373333377737F003333333307
              78087733FFF3337FFF7F33300033330008073F3777F33F777F73073070370733
              078073F7F7FF73F37FF7700070007037007837773777F73377FF007777700730
              70007733FFF77F37377707700077033707307F37773F7FFF7337080777070003
              3330737F3F7F777F333778080707770333333F7F737F3F7F3333080787070003
              33337F73FF737773333307800077033333337337773373333333}
            Layout = blGlyphTop
            NumGlyphs = 2
          end
          object memlegenda: TMemo
            Left = 16
            Top = 112
            Width = 505
            Height = 17
            BorderStyle = bsNone
            Color = clBtnFace
            Ctl3D = True
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              
                'A consulta no Banco de Dados deve conter apenas 2 campos: DATA e' +
                ' VALOR, nesta ordem.')
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 2
          end
          object memSQL: TMemo
            Left = 16
            Top = 24
            Width = 505
            Height = 81
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
        object tbsObs: TTabSheet
          Caption = 'Observações'
          object lblObservacao: TLabel
            Left = 16
            Top = 13
            Width = 209
            Height = 13
            Caption = 'Observações da Conta Orçamentária'
          end
          object dbeObservacao: TwwDBEdit
            Left = 16
            Top = 29
            Width = 600
            Height = 21
            DataField = 'OBSERVACAO'
            DataSource = ds
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
        object TabSheet1: TTabSheet
          Caption = 'Parâmetros da Conta'
          ImageIndex = 9
          OnShow = TabSheet1Show
          object Label20: TLabel
            Left = 2
            Top = 50
            Width = 92
            Height = 13
            Caption = 'Centro do Custo'
          end
          object Label21: TLabel
            Left = 2
            Top = 11
            Width = 54
            Height = 13
            Caption = 'Atividade'
          end
          object lblAtividade3: TLabel
            Left = 233
            Top = 11
            Width = 74
            Height = 13
            Alignment = taRightJustify
            Caption = 'lblAtividade3'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label25: TLabel
            Left = 2
            Top = 90
            Width = 121
            Height = 13
            Caption = 'Fórmula de Apuração'
          end
          object dblcCCustoParamConta: TwwDBLookupCombo
            Left = 2
            Top = 66
            Width = 305
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'Nome'#9'F'
              'CODEXTERNO'#9'10'#9'Código'#9'F')
            DataField = 'CODCENTROCUSTO'
            DataSource = ds
            LookupTable = CdsCCustoConta
            LookupField = 'CODCENTROCUSTO'
            Options = [loColLines]
            Style = csDropDownList
            DropDownCount = 5
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dblcAtivParamConta: TwwDBLookupCombo
            Left = 2
            Top = 27
            Width = 305
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'25'#9'NOME')
            DataField = 'UNIDNEGOC'
            DataSource = ds
            LookupTable = CdsUnidNegocConta
            LookupField = 'UNIDNEGOC'
            Options = [loColLines]
            Style = csDropDownList
            DropDownCount = 5
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
            OnCloseUp = dblcAtivParamContaCloseUp
            OnExit = dblcAtivParamContaExit
          end
          object pnlPlanoPatroP: TPanel
            Left = 319
            Top = 9
            Width = 328
            Height = 89
            BevelOuter = bvNone
            TabOrder = 2
            object Label22: TLabel
              Left = 8
              Top = 43
              Width = 33
              Height = 13
              Caption = 'Plano'
            end
            object Label23: TLabel
              Left = 8
              Top = 2
              Width = 80
              Height = 13
              Caption = 'Patrocinadora'
            end
            object dblcPatroParamConta: TwwDBLookupCombo
              Left = 8
              Top = 18
              Width = 305
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Nome')
              DataField = 'IDPATRO'
              DataSource = ds
              LookupTable = CdsPatroConta
              LookupField = 'IDPESSOA'
              Options = [loColLines]
              Style = csDropDownList
              DropDownCount = 5
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object wwDBLookupCombo1: TwwDBLookupCombo
              Left = 9
              Top = 59
              Width = 305
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'50'#9'NOME'#9'F')
              DataField = 'IDPLANOPREV'
              DataSource = ds
              LookupTable = CdsPlanoPrevConta
              LookupField = 'IDPLANOPREV'
              TabOrder = 1
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
          end
          object DbLkFormulaApuracao: TwwDBLookupCombo
            Left = 2
            Top = 106
            Width = 305
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'40'#9'NOME'#9'F')
            DataField = 'IDFORMORCADO'
            DataSource = ds
            LookupTable = CdsFormulaApuracao
            LookupField = 'IDFORMORCADO'
            Options = [loColLines]
            Style = csDropDownList
            DropDownCount = 5
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
      end
      inherited Dock973: TDock97
        Width = 734
      end
      inherited Dock974: TDock97
        Left = 648
        Height = 149
      end
    end
  end
  inherited Dock972: TDock97
    Width = 744
    inherited Toolbar971: TToolbar97
      object btnImportaContab: TToolbarButton97
        Left = 248
        Top = 0
        Width = 120
        Height = 41
        AllowAllUp = True
        DropdownArrow = False
        Caption = 'I&mporta da Contab.'
        Enabled = False
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333700007
          3333330000003333337FBFB03003000000003330707BFBF03333330000003337
          337FB77733333300000033303337733333333300000033373333333333333300
          00003330337000073333330000003337337FBFB03003000000003330707BFBF0
          3333330000003337337FB7773333330000003330333773333333330000003337
          3333333333333300000037000073333333333300000037FBFB03003000333300
          000037BFBF03333333333300000037FB77733333333333000000337733333333
          333333000000333333333333333333000000}
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        OnClick = btnImportaContabClick
      end
      object ToolbarSep973: TToolbarSep97
        Left = 240
        Top = 0
        Blank = True
        SizeHorz = 8
      end
    end
  end
  inherited Dock971: TDock97
    Top = 421
    Width = 744
    inherited tb97Fundo: TToolbar97
      Left = 359
      DockPos = 359
      inherited bbtnSair: TBitBtn
        Tag = 999
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 520023
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnCancelar: TBitBtn
        Tag = 999
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 45
    Top = 363
  end
  inherited ds: TwwDataSource
    Left = 228
    Top = 363
  end
  inherited ImlPadrao: TImageList
    Left = 107
    Top = 363
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 611
    Top = 9
  end
  inherited Cds: TCMClientDataSet
    Left = 58
    Top = 91
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CONTASORCAMEN.IDCONTAORCAMEN'
      'CONTASORCAMEN.NOMECONTAORCAMEN'
      'CENTRESPON.CODEXTERNO AS CODCENTRORESPON'
      'CENTRESPON.NOME'
      'CONTASORCAMEN.OBSERVACAO'
      'CONTASORCAMEN.TIPOCALCREALIZADO'
      'CONTASORCAMEN.TIPOCALCORCADO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código da Conta'
      'Nome da Conta'
      'Cód.Cent.Respon.'
      'Centro de Responsabilidade'
      'Observação'
      'Tipo de Cálculo Realizado'
      'Tipo de Cálculo Orçado')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONTASORCAMEN'
      'CENTRESPON')
    CamposChave.Strings = (
      'CONTASORCAMEN.IDPLANOORCAMEN'
      'CONTASORCAMEN.IDCONTAORCAMEN')
    Filtro.Strings = (
      'CENTRESPON.CODCENTRORESPON(+) = CONTASORCAMEN.CODCENTRORESPON')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '25'
      '60'
      '10'
      '30'
      '60'
      '1'
      '1')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    Left = 416
    Top = 347
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 679
    Top = 9
  end
  inherited dsDet: TwwDataSource
    AutoEdit = True
    DataSet = CdsDet
    Left = 264
    Top = 297
  end
  object dsDetContaOrc: TwwDataSource
    DataSet = CdsDetContaOrc
    Left = 408
    Top = 120
  end
  object dsDetFluxo: TwwDataSource
    DataSet = CdsDetFluxo
    Left = 384
    Top = 120
  end
  object dsDetContaRea: TwwDataSource
    DataSet = CdsDetContaRea
    Left = 360
    Top = 120
  end
  object dsContaContabil: TwwDataSource
    DataSet = CdsContaContabil
    Left = 336
    Top = 120
  end
  object dsGrupo: TwwDataSource
    DataSet = CdsGrupo
    Left = 312
    Top = 120
  end
  object MontaSelectGrupo: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'GRUPOORCAMEN.CODGRUPOORC'
      'GRUPOORCAMEN.NOMEGRUPOORCAMEN'
      'GRUPOORCAMEN.FLGANALSINT')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Nome'
      'A/S')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'GRUPOORCAMEN')
    CamposChave.Strings = (
      'GRUPOORCAMEN.CODGRUPOORC'
      'GRUPOORCAMEN.FLGSINALGRUPO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '1')
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
    Left = 512
    Top = 240
  end
  object dsDetCond: TwwDataSource
    DataSet = CdsDetCond
    Left = 288
    Top = 120
  end
  object dsDataView: TwwDataSource
    DataSet = CdsDataView
    Left = 264
    Top = 120
  end
  object MontaSelectContaContab: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PLANOCONTA.PLACONTA'
      'PLANOCONTA.PLANOME'
      'PLANOCONTA.PLAREDUZ'
      'PLANOCONTA.PLANOMEOUTLING')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Nome'
      'Código Reduzido'
      'Nome em outra língua')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PLANOCONTA')
    CamposChave.Strings = (
      'PLANOCONTA.PLACONTA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '18'
      '40'
      '10'
      '40')
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
    Left = 528
    Top = 312
  end
  object dsTodoDet: TwwDataSource
    DataSet = CdsTodoDet
    Left = 462
    Top = 120
  end
  object dsMovOrcamento: TwwDataSource
    DataSet = CdsMovOrcamento
    Left = 435
    Top = 120
  end
  object CdsDet: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 61
    Top = 145
    Data = {
      320200009619E0BD010000001800000012000000000003000000320205504C41
      4E4F080004000000000008504C41434F4E544101004900000002000753554254
      595045020049000A004669786564436861720005574944544802000200120009
      554E49444E45474F4308000400000000000E434F4443454E54524F435553544F
      01004900000002000753554254595045020049000A0046697865644368617200
      055749445448020002000A000B4944504C414E4F505245560800040000000000
      074944504154524F0800040000000000094944454D5052455341080004000000
      0000084944504553534F4108000400000000000E4944434F4E54414F5243414D
      454E0100490000000100055749445448020002001E000E4944504C414E4F4F52
      43414D454E08000400000000000F4944434F4D50434F4E5441534F5243080004
      000000000007504C414E4F4D4501004900000001000557494454480200020028
      00064E4F4D4543430100490000000100055749445448020002001E00064E4F4D
      4541500100490000000100055749445448020002001900094E4F4D45504C414E
      4F0100490000000100055749445448020002003200094E4F4D45504154524F01
      00490000000100055749445448020002003C0009554E45434F4449474F010049
      0000000100055749445448020002000A000944455343504C414E4F0100490000
      0002000753554254595045020049000A00466978656443686172000557494454
      480200020014000100044C4349440400010009080000}
  end
  object CdsDetContaOrc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 174
    Top = 416
  end
  object CdsDetFluxo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 141
    Top = 416
  end
  object CdsDetContaRea: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 108
    Top = 416
  end
  object CdsContaContabil: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 75
    Top = 416
  end
  object CdsGrupo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 653
    Top = 106
  end
  object CdsDataView: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 41
    Top = 417
  end
  object CdsDetCond: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 388
    Top = 234
    object CdsDetCondCONDDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      FieldKind = fkCalculated
      FieldName = 'CONDDESCRICAO'
      Size = 130
      Calculated = True
    end
    object CdsDetCondIDCONTACONDINI: TStringField
      DisplayLabel = 'Conta Inicial'
      FieldName = 'IDCONTACONDINI'
      Size = 25
    end
    object CdsDetCondIDCONTACONDFIM: TStringField
      DisplayLabel = 'Conta Final'
      FieldName = 'IDCONTACONDFIM'
      Size = 25
    end
    object CdsDetCondIDCONTACONDRES: TStringField
      DisplayLabel = 'Conta Resultado'
      FieldName = 'IDCONTACONDRES'
      Size = 25
    end
    object CdsDetCondCONDICAO: TStringField
      DisplayLabel = 'Condição'
      FieldName = 'CONDICAO'
      FixedChar = True
      Size = 2
    end
    object CdsDetCondTIPOCONDINI: TStringField
      DisplayLabel = 'Tipo Inicial'
      FieldName = 'TIPOCONDINI'
      FixedChar = True
      Size = 1
    end
    object CdsDetCondTIPOCONDRES: TStringField
      DisplayLabel = 'Tipo Resultado'
      FieldName = 'TIPOCONDRES'
      FixedChar = True
      Size = 1
    end
    object CdsDetCondVLRCONDINI: TFloatField
      DisplayLabel = 'Valor Inicial'
      FieldName = 'VLRCONDINI'
    end
    object CdsDetCondVLRCONDRES: TFloatField
      DisplayLabel = 'Valor Resultado'
      FieldName = 'VLRCONDRES'
    end
    object CdsDetCondIDCONTAORCAMEN: TStringField
      DisplayLabel = 'Conta Orçamentária'
      FieldName = 'IDCONTAORCAMEN'
      Size = 25
    end
    object CdsDetCondIDPLANOORCAMEN: TFloatField
      DisplayLabel = 'Plano Orçamentário'
      FieldName = 'IDPLANOORCAMEN'
    end
    object CdsDetCondIDCOMPCONTASORC: TFloatField
      DisplayLabel = 'Composição'
      FieldName = 'IDCOMPCONTASORC'
    end
  end
  object CdsMovOrcamento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 207
    Top = 416
  end
  object CdsTodoDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 416
  end
  object CdsCCustoConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 539
    Top = 416
  end
  object CdsPlanoPrevConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 605
    Top = 416
  end
  object CdsPatroConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 639
    Top = 416
  end
  object CdsUnidNegocConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 572
    Top = 416
  end
  object CdsCenRespConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 506
    Top = 416
  end
  object CdsContasOrc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 572
    Top = 378
  end
  object CdsContaCondIni: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 606
    Top = 378
  end
  object CdsContaCondFim: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 639
    Top = 378
  end
  object CdsContaCondRes: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 672
    Top = 378
  end
  object CdsTipoRD: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 705
    Top = 378
  end
  object CdsCentroRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 705
    Top = 416
  end
  object CdsUnidNegoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 672
    Top = 416
  end
  object CdsCCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 274
    Top = 416
  end
  object CdsCCustoFluxo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 340
    Top = 416
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 373
    Top = 416
  end
  object CdsGrupoAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 307
    Top = 416
  end
  object CdsTestaComposicao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 539
    Top = 378
  end
  object CdsPlanoPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 473
    Top = 416
  end
  object CdsPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 506
    Top = 378
  end
  object CdsPlanoContabil: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 473
    Top = 378
  end
  object CdsContasRef: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 406
    Top = 416
  end
  object CdsContaContab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 440
    Top = 416
  end
  object qryGrupo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     IDGRUPOORCAMEN, NOMEGRUPOORCAMEN,'
      '     FLGANALSINT, CODGRUPOORC, FLGSINALGRUPO'
      'FROM'
      '     GRUPOORCAMEN'
      'WHERE'
      '    (RTRIM(CODGRUPOORC) = :CODGRUPOORC)'
      ''
      ''
      ' ')
    ClientDataSet = CdsGrupo
    Left = 720
    Top = 107
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 683
    Top = 107
  end
  object QryDet: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  C.PLANO,'
      '  C.PLACONTA,'
      '  C.UNIDNEGOC,'
      '  C.CODCENTROCUSTO,'
      '  C.IDPLANOPREV,'
      '  C.IDPATRO,'
      '  C.IDEMPRESA,'
      '  C.IDPESSOA,'
      '  C.IDCONTAORCAMEN,'
      '  C.IDPLANOORCAMEN,'
      '  C.IDCOMPCONTASORC,'
      '  P.PLANOME,'
      '  CC.NOME AS NOMECC,'
      '  U.NOME  AS NOMEAP,'
      '  PP.NOME AS NOMEPLANO,'
      '  PT.NOME AS NOMEPATRO,'
      '  U.UNECODIGO,'
      '  PC.DESCPLANO'
      'FROM COMPCONTASORCAMEN C, PLANOCONTA P,'
      '     CENTCUST CC, UNIDNEGOCIO U,'
      '     PLANPREV PP,PESSOA PT, PLANO PC'
      'WHERE (C.IDPLANOORCAMEN = -1)'
      '  AND (C.IDCONTAORCAMEN = -1)'
      '  AND (C.PLACONTA IS NOT NULL)'
      '  AND (C.PLANO = PC.PLANO(+))'
      '  AND (C.PLACONTA = P.PLACONTA(+))'
      '  AND (C.PLANO    = P.PLANO(+))'
      '  AND (C.UNIDNEGOC = U.UNIDNEGOC(+))'
      '  AND (C.IDPESSOA  = U.IDPESSOA(+))'
      '  AND (C.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))'
      '  AND (C.IDEMPRESA  = CC.IDEMPRESA(+))'
      '  AND (C.IDPATRO = PT.IDPESSOA(+))'
      '  AND (C.IDPLANOPREV = PP.IDPLANOPREV(+))'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = CdsDet
    Left = 460
    Top = 228
  end
  object CdsFormulaApuracao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 69
    Top = 306
    object CdsFormulaApuracaoNOME: TStringField
      DisplayWidth = 40
      FieldName = 'NOME'
      Size = 60
    end
    object CdsFormulaApuracaoIDFORMORCADO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFORMORCADO'
      Visible = False
    end
    object CdsFormulaApuracaoDESCRICAO: TMemoField
      DisplayWidth = 10
      FieldName = 'DESCRICAO'
      Visible = False
      BlobType = ftMemo
      Size = 400
    end
    object CdsFormulaApuracaoBASEARREDONDAMENTO: TStringField
      DisplayWidth = 1
      FieldName = 'BASEARREDONDAMENTO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsFormulaApuracaoBASECALCULO: TStringField
      DisplayWidth = 1
      FieldName = 'BASECALCULO'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object CMSqlParams2: TCMSqlParams
    SQL.Strings = (
      'select IDPLANOPREV, NOME from planprevcontabil'
      '')
    ClientDataSet = CdsPlanoPrev
    Left = 230
    Top = 229
  end
end
