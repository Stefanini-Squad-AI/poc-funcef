inherited frmCadLancamAutomMT: TfrmCadLancamAutomMT
  Left = 333
  Top = 80
  Caption = 'Lançamentos automáticos'
  ClientHeight = 548
  ClientWidth = 684
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 684
    Height = 462
    inherited pnlMestre: TPanel
      Width = 682
      Height = 168
      object lblPrePronta: TLabel
        Left = 16
        Top = 1
        Width = 46
        Height = 13
        Caption = 'Planilha'
      end
      object Label4: TLabel
        Left = 288
        Top = 1
        Width = 28
        Height = 13
        Caption = 'Fase'
      end
      object Label8: TLabel
        Left = 288
        Top = 73
        Width = 77
        Height = 13
        Caption = 'Parcela Atual'
      end
      object Label7: TLabel
        Left = 192
        Top = 73
        Width = 68
        Height = 13
        Caption = 'Nº Parcelas'
      end
      object Label6: TLabel
        Left = 16
        Top = 73
        Width = 57
        Height = 13
        Caption = 'Valor Fixo'
      end
      object Label11: TLabel
        Left = 17
        Top = 36
        Width = 118
        Height = 13
        Caption = 'Data da Composição'
      end
      object edDescAutomatico: TDBEdit
        Left = 16
        Top = 14
        Width = 257
        Height = 21
        DataField = 'PANDESCRICAO'
        DataSource = ds
        TabOrder = 0
      end
      object edFase: TDBEdit
        Left = 288
        Top = 14
        Width = 83
        Height = 21
        DataField = 'PANFASE'
        DataSource = ds
        TabOrder = 1
      end
      object redParcelaAtual: TDBRealEdit
        Left = 288
        Top = 86
        Width = 81
        Height = 21
        Alignment = taRightJustify
        Enabled = False
        Lines.Strings = (
          '0')
        TabOrder = 4
        WordWrap = False
        IntDigits = 10
        DecDigits = 0
        NumberFormat = iNumber
        Signal = False
        DataField = 'PANPARCATUAL'
        DataSource = ds
      end
      object redNumParcelas: TDBRealEdit
        Left = 192
        Top = 86
        Width = 81
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0')
        TabOrder = 3
        WordWrap = False
        IntDigits = 10
        DecDigits = 0
        NumberFormat = iNumber
        Signal = False
        DataField = 'PANNUMPARC'
        DataSource = ds
      end
      object redValorFixo: TDBRealEdit
        Left = 16
        Top = 88
        Width = 161
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 2
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'PANVALORFIXO'
        DataSource = ds
      end
      object dbgrDiaPer: TDBRadioGroup
        Left = 384
        Top = 36
        Width = 280
        Height = 70
        Caption = ' Gerar Planilha por '
        DataField = 'FLGPERIODOGERA'
        DataSource = ds
        Items.Strings = (
          'Todo &Período'
          'Todo &Dia'
          'Período &Específico')
        TabOrder = 5
        Values.Strings = (
          'P'
          'D'
          'E')
        OnClick = dbgrDiaPerClick
      end
      object rgBase: TDBRadioGroup
        Left = 384
        Top = 2
        Width = 280
        Height = 33
        Caption = 'Natureza do Resultado da base'
        Columns = 2
        DataField = 'PANCONTAPERC'
        DataSource = ds
        Items.Strings = (
          'Débito'
          'Crédito')
        TabOrder = 6
        Values.Strings = (
          'D'
          'C')
      end
      object dbsePeriodo: TwwDBSpinEdit
        Left = 558
        Top = 55
        Width = 94
        Height = 21
        Increment = 1
        DataField = 'PANPERIODOGERA'
        DataSource = ds
        TabOrder = 7
        UnboundDataType = wwDefault
      end
      object rdgSegregacao: TDBRadioGroup
        Left = 16
        Top = 111
        Width = 257
        Height = 33
        Caption = 'Conta base para segregação'
        Columns = 2
        DataField = 'FLGSEGREGACRITER'
        DataSource = ds
        Items.Strings = (
          'Débito'
          'Crédito')
        TabOrder = 8
        Values.Strings = (
          'D'
          'C')
      end
      object dbchkIntegraPlanilha: TDBCheckBox
        Left = 15
        Top = 148
        Width = 194
        Height = 17
        Caption = 'Integra planilha manualmente'
        DataField = 'FLGINTEGRAPLAN'
        DataSource = ds
        TabOrder = 9
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbckInativo: TDBCheckBox
        Left = 288
        Top = 123
        Width = 65
        Height = 13
        Caption = 'Inativo'
        DataField = 'PANINATIVO'
        DataSource = ds
        TabOrder = 10
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dtDataComposicao: TCMDateTimePicker
        Left = 16
        Top = 51
        Width = 121
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
        TabOrder = 11
        UnboundDataType = wwDTEdtDate
        OnCloseUp = dtDataComposicaoCloseUp
        OnExit = dtDataComposicaoCloseUp
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 171
      Width = 682
      Height = 290
      Align = alBottom
      inherited pgctrlDetalhe: TPageControl
        Width = 584
        Height = 231
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 576
            Height = 203
            Selected.Strings = (
              'PLACONTA'#9'12'#9'Conta'#9'F'
              'CODEXTERNO'#9'10'#9'Centro de Custo'#9'F'
              'PANPERC'#9'10'#9'Percentual'#9'F'
              'TIPOBASE'#9'14'#9'Base do Rateio'#9'F'
              'HITCODHIST'#9'8'#9'Histórico '#9'F'
              'debito'#9'7'#9'Débito'#9'F'
              'credito'#9'5'#9'Crédito'#9'F'
              'Base'#9'1'#9'Base'#9'F'
              'PANORIGEM'#9'1'#9'Ordem'#9'F'
              'PANTIPOBASE'#9'1'#9'Sinal'#9'F'
              'NUMDOC'#9'15'#9'Num.Documento'#9'F'
              'NOMEPLANO'#9'30'#9'Plano Previdenciário'#9'F'
              'RAZAOSOCIAL'#9'30'#9'Patrocinadora'#9'F')
            UseTFields = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 576
            Height = 203
            object lblPanperc: TLabel
              Left = 6
              Top = 46
              Width = 62
              Height = 13
              Caption = 'Percentual'
            end
            object Label2: TLabel
              Left = 94
              Top = 46
              Width = 29
              Height = 13
              Caption = 'Sinal'
            end
            object Label3: TLabel
              Left = 158
              Top = 46
              Width = 37
              Height = 13
              Caption = 'Ordem'
            end
            object Label9: TLabel
              Left = 238
              Top = 46
              Width = 65
              Height = 13
              Caption = 'Documento'
            end
            object Label1: TLabel
              Left = 390
              Top = 46
              Width = 83
              Height = 13
              Caption = 'Base do rateio'
            end
            object lblPPPCentroCusto: TLabel
              Left = 6
              Top = 80
              Width = 92
              Height = 13
              Caption = 'Centro de Custo'
            end
            object Label5: TLabel
              Left = 198
              Top = 80
              Width = 60
              Height = 13
              Caption = 'Sub-Conta'
            end
            object Label15: TLabel
              Left = 390
              Top = 80
              Width = 100
              Height = 13
              Caption = 'Atividade/Projeto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblPPPHistPadrao: TLabel
              Left = 6
              Top = 116
              Width = 95
              Height = 13
              Caption = 'Histórico Padrão'
            end
            object Label10: TLabel
              Left = 318
              Top = 116
              Width = 103
              Height = 13
              Caption = 'Tipo de Operação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object cmpConta: TCMProcuraMaskContabil
              Left = 6
              Top = -2
              Width = 310
              Height = 47
              Caption = ' Conta Contábil '
              TabOrder = 0
              OnExit = cmpContaExit
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
            object rgNatureza: TDBRadioGroup
              Left = 330
              Top = 4
              Width = 225
              Height = 40
              Caption = ' Tipo '
              Columns = 3
              DataField = 'PANTIPO'
              DataSource = dsDet
              Items.Strings = (
                'Débito'
                'Crédito'
                'Base')
              TabOrder = 1
              Values.Strings = (
                'D'
                'C'
                'B')
              OnClick = rgNaturezaClick
            end
            object edPerc: TwwDBEdit
              Left = 6
              Top = 59
              Width = 65
              Height = 21
              DataField = 'PANPERC'
              DataSource = dsDet
              Enabled = False
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object cboSinal: TwwDBComboBox
              Left = 94
              Top = 59
              Width = 49
              Height = 21
              ShowButton = True
              Style = csDropDown
              MapList = False
              AllowClearKey = False
              DataField = 'PANTIPOBASE'
              DataSource = dsDet
              DropDownCount = 8
              Enabled = False
              ItemHeight = 0
              Items.Strings = (
                '+'
                '-'
                '*'
                '/')
              Sorted = False
              TabOrder = 3
              UnboundDataType = wwDefault
            end
            object edOrdem: TwwDBEdit
              Left = 158
              Top = 59
              Width = 65
              Height = 21
              DataField = 'PANORIGEM'
              DataSource = dsDet
              Enabled = False
              TabOrder = 4
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbeNumDoc: TwwDBEdit
              Left = 238
              Top = 59
              Width = 137
              Height = 21
              DataField = 'NUMDOC'
              DataSource = dsDet
              TabOrder = 5
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object cboBase: TwwDBComboBox
              Left = 390
              Top = 59
              Width = 169
              Height = 21
              ShowButton = True
              Style = csDropDownList
              MapList = True
              AllowClearKey = True
              AutoDropDown = True
              ShowMatchText = True
              DataField = 'PANBASE'
              DataSource = dsDet
              DropDownCount = 8
              DropDownWidth = 350
              Enabled = False
              ItemHeight = 0
              Items.Strings = (
                'Movimentação'#9'M'
                'Saldo Anterior'#9'A'
                'Saldo Atual'#9'S')
              Sorted = False
              TabOrder = 6
              UnboundDataType = wwDefault
            end
            object dblkCCusto: TwwDBLookupCombo
              Left = 6
              Top = 96
              Width = 177
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Descrição'#9'F'
                'CODEXTERNO'#9'10'#9'Centro Custo'#9'F')
              DataField = 'CODCENTROCUSTO'
              DataSource = dsDet
              LookupTable = CdsCentroCusto
              LookupField = 'CODCENTROCUSTO'
              Options = [loTitles]
              DropDownWidth = 350
              Enabled = False
              TabOrder = 7
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dblkSubConta: TwwDBLookupCombo
              Left = 198
              Top = 94
              Width = 177
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMESUBCONTA'#9'60'#9'NOMESUBCONTA')
              DataField = 'CODSUBCONTA'
              DataSource = dsDet
              LookupTable = CdsSubConta
              LookupField = 'CODSUBCONTA'
              DropDownWidth = 350
              Enabled = False
              TabOrder = 8
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object dblkAtivProj: TwwDBLookupCombo
              Left = 390
              Top = 94
              Width = 169
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'25'#9'NOME'
                'UNECODIGO'#9'10'#9'UNECODIGO')
              DataField = 'UNIDNEGOC'
              DataSource = dsDet
              LookupTable = CdsAtivProj
              LookupField = 'UNIDNEGOC'
              Style = csDropDownList
              DropDownWidth = 350
              ParentFont = False
              TabOrder = 9
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dblkcmbHistPadrao: TwwDBLookupCombo
              Left = 6
              Top = 130
              Width = 297
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'HITCODHIST'#9'4'#9'Histórico'
                'HITDESCR1'#9'40'#9'Descrição')
              DataField = 'HITCODHIST'
              DataSource = dsDet
              LookupTable = CdsHistoPadrao
              LookupField = 'HITCODHIST'
              Style = csDropDownList
              TabOrder = 10
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblkTipoOper: TwwDBLookupCombo
              Left = 318
              Top = 130
              Width = 241
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'TIPDESCRICAO'#9'25'#9'TIPDESCRICAO')
              DataField = 'TIPCODIGO'
              DataSource = dsDet
              LookupTable = CdsTipoOper
              LookupField = 'TIPCODIGO'
              ParentFont = False
              TabOrder = 11
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object pnlPlanoPatroC: TPanel
              Left = -2
              Top = 150
              Width = 564
              Height = 40
              BevelOuter = bvNone
              TabOrder = 12
              object lblPlanoPrevC: TLabel
                Left = 8
                Top = 2
                Width = 33
                Height = 13
                Caption = 'Plano'
              end
              object lblPatroC: TLabel
                Left = 322
                Top = 2
                Width = 80
                Height = 13
                Caption = 'Patrocinadora'
              end
              object dblcPlanoPrevC: TwwDBLookupCombo
                Left = 8
                Top = 16
                Width = 294
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'30'#9'Nome')
                DataField = 'IDPLANOPREV'
                DataSource = dsDet
                LookupTable = CdsPlanoPrev
                LookupField = 'IDPLANOPREV'
                Options = [loColLines]
                DropDownCount = 5
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
              object dblcPatroC: TwwDBLookupCombo
                Left = 322
                Top = 16
                Width = 239
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
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 674
      end
      inherited Dock974: TDock97
        Left = 588
        Height = 231
        inherited tb97Detalhe: TToolbar97
          inherited bbtnCancelarDet: TBitBtn
            Tag = 999
          end
          inherited bbtnVoltarDet: TBitBtn
            Tag = 999
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 684
    inherited Toolbar971: TToolbar97
      object sbtnDuplicaPlanilha: TToolbarButton97
        Left = 240
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Duplicar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
          000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
          FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
          00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
          00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
          FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
          0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
          05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
          55557F7777777555555500000005555555557777777555555555}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        WordWrap = True
        OnClick = sbtnDuplicaPlanilhaClick
      end
      object sbtnCriaData: TToolbarButton97
        Left = 300
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = -1
        Caption = '&Criar Data'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333FFFFFFFFFFFFFFF000000000000000077777777777777770FF7FF7FF7FF
          7FF07FF7FF7FF7F37F3709F79F79F7FF7FF077F77F77F7FF7FF7077777777777
          777077777777777777770FF7FF7FF7FF7FF07FF7FF7FF7FF7FF709F79F79F79F
          79F077F77F77F77F77F7077777777777777077777777777777770FF7FF7FF7FF
          7FF07FF7FF7FF7FF7FF709F79F79F79F79F077F77F77F77F77F7077777777777
          777077777777777777770FFFFF7FF7FF7FF07F33337FF7FF7FF70FFFFF79F79F
          79F07FFFFF77F77F77F700000000000000007777777777777777CCCCCC8888CC
          CCCC777777FFFF777777CCCCCCCCCCCCCCCC7777777777777777}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = sbtnCriaDataClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 509
    Width = 684
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnSair: TBitBtn
        Tag = 999
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
    Left = 18
    Top = 479
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 509
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 136
    Top = 471
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 399
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 467
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PREPLANILHA.PANDESCRICAO'
      'PREDETALHE.DATAVIGPREPLANILHA')
    TipodeDado.Strings = (
      'C'
      'D')
    Descricao.Strings = (
      'Descrição'
      'Data de Vigência')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PREPLANILHA'
      'PREDETALHE')
    CamposChave.Strings = (
      'PREPLANILHA.PANDESCRICAO'
      'PREPLANILHA.PANCODIGO'
      'PREPLANILHA.PANIDENTIFICACAO'
      'PREDETALHE.DATAVIGPREPLANILHA')
    Filtro.Strings = (
      'PREPLANILHA.PANIDENTIFICACAO = '#39'L'#39
      'PREDETALHE.PANCODIGO = PREPLANILHA.PANCODIGO ')
    Mascaras.Strings = (
      ''
      'DD/MM/YYYY')
    Larguras.Strings = (
      '60'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1')
    UsaDistinct = True
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 431
    Top = 7
  end
  inherited CmeDetalhe: TCmEventosCadastro
    BeforeConfirma = CmeDetalheBeforeConfirma
    Left = 612
    Top = 290
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsPreDetalhe
    Left = 614
    Top = 362
  end
  object CdsCentroCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 341
    Top = 216
  end
  object CdsSubConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 413
    Top = 216
  end
  object CdsTipoOper: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 570
    Top = 216
  end
  object CdsAtivProj: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 469
    Top = 216
  end
  object CdsPlanoPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 264
    Top = 216
  end
  object CdsPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 624
    Top = 216
  end
  object CdsHistoPadrao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 525
    Top = 216
  end
  object CdsPreDetalhe: TwwClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    BeforePost = CdsPreDetalheBeforePost
    ValidateWithMask = True
    Left = 613
    Top = 322
    Data = {
      C20400009619E0BD01000000180000001F000000000003000000C2040950414E
      434F4449474F08000400000000000A50414E4E554D4C414E4308000400000000
      0005504C414E4F08000400000000000C50414E434F4E54414241534501004900
      000002000753554254595045020049000A004669786564436861720005574944
      54480200020012000E434F4443454E54524F435553544F010049000000020007
      53554254595045020049000A0046697865644368617200055749445448020002
      000A000D50414E43435553544F42415345010049000000020007535542545950
      45020049000A0046697865644368617200055749445448020002000A00094944
      454D50524553410800040000000000084944504553534F410800040000000000
      08504C41434F4E544101004900000002000753554254595045020049000A0046
      6978656443686172000557494454480200020012001149445553554152494F49
      4E434C5553414F08000400000000000A484954434F4448495354010049000000
      02000753554254595045020049000A0046697865644368617200055749445448
      0200020004000750414E5045524308000400000000000750414E5449504F0100
      4900000002000753554254595045020049000A00466978656443686172000557
      494454480200020001000950414E4F524947454D010049000000020007535542
      54595045020049000A0046697865644368617200055749445448020002000100
      0750414E4241534501004900000002000753554254595045020049000A004669
      78656443686172000557494454480200020001000B50414E5449504F42415345
      01004900000002000753554254595045020049000A0046697865644368617200
      0557494454480200020001000B434F44535542434F4E54410800040000000000
      09554E49444E45474F430800040000000000064E554D444F4301004900000001
      00055749445448020002000F0009544950434F4449474F010049000000020007
      53554254595045020049000A0046697865644368617200055749445448020002
      0002000B4944504C414E4F505245560800040000000000074944504154524F08
      000400000000000B52415A414F534F4349414C01004900000001000557494454
      48020002003C00094E4F4D45504C414E4F010049000000010005574944544802
      00020032000644454249544F0100490000000200075355425459504502004900
      0A0046697865644368617200055749445448020002000100074352454449544F
      01004900000002000753554254595045020049000A0046697865644368617200
      0557494454480200020001000442415345010049000000020007535542545950
      45020049000A004669786564436861720005574944544802000200010005414D
      424F5301004900000002000753554254595045020049000A0046697865644368
      617200055749445448020002000200085449504F424153450100490000000100
      055749445448020002000E000A434F4445585445524E4F010049000000020007
      53554254595045020049000A0046697865644368617200055749445448020002
      000A001F4445434F444528442E50414E424153452C2753272C2753414C444F41
      5455410100490000000100055749445448020002000E000100044C4349440400
      010009080000}
  end
end
