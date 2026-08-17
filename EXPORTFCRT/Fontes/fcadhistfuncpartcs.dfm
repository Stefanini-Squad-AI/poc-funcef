inherited frmCadHistFuncPartCS: TfrmCadHistFuncPartCS
  Left = 5
  Top = 64
  HelpContext = 160040
  Caption = 'Cadastro de Histórico Anterior à Patrocinadora'
  ClientHeight = 448
  ClientWidth = 787
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 787
    Height = 362
    inherited tbcDetalhe: TTabControlDetalhe [0]
      Top = 52
      Width = 785
      Height = 309
      Tabs.Strings = (
        'Histórico')
      inherited pgctrlDetalhe: TPageControl
        Width = 687
        Height = 250
        inherited tbsDet: TTabSheet
          Caption = 'Histórico'
          inherited dbgrdDet: TwwDBGrid
            Width = 679
            Height = 222
            Selected.Strings = (
              'SEQHISTFUNC'#9'4'#9'Seq.'#9'F'
              'DATAINICIO'#9'10'#9'Data de ~Início'#9'F'
              'DATAFINAL'#9'10'#9'Data ~Final'#9'F'
              'FLGCONCOMITANTE'#9'4'#9'Conc.'#9'F'
              'EMPRESA'#9'34'#9'Empresa'#9'F'
              'CARGO'#9'20'#9'Cargo'#9'F'
              'VALORCARGO'#9'10'#9'Salário'#9'F'
              'MATRICULA'#9'12'#9'Matrícula'#9'F'
              'DESCRICAO'#9'30'#9'Tipo de Insalubridade'#9'F'
              'FUNCAO'#9'20'#9'Função'#9'F'
              'VINCEMPREGATICIO'#9'30'#9'Vínculo Empregatício'#9'F'
              'FLGCONTATS'#9'6'#9'Tempo ~Válido'#9'F'
              'FATOR'#9'5'#9'Fator'#9'F'
              'TEMPOSERVEXTENSO'#9'50'#9'Tempo de Serviço'#9'F'
              'TEMPODEMONS'#9'10'#9'Tempo em dias'#9'F'
              'NOMEDOCUMENTO'#9'30'#9'Tipo do Documento Apresentado'#9'F'
              'NUMDOCUMENTO'#9'13'#9'Número Doc.'#9'F')
            TitleLines = 2
          end
          inherited pnlControlesDet: TPanel
            Width = 679
            Height = 222
            object Label1: TLabel
              Left = 4
              Top = 13
              Width = 83
              Height = 13
              Caption = 'Data de Início'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label2: TLabel
              Left = 146
              Top = 13
              Width = 59
              Height = 13
              Caption = 'Data Final'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblEmpresa: TLabel
              Left = 427
              Top = 13
              Width = 49
              Height = 13
              Caption = 'Empresa'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label4: TLabel
              Left = 427
              Top = 55
              Width = 55
              Height = 13
              Caption = 'Matrícula'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label17: TLabel
              Left = 283
              Top = 55
              Width = 40
              Height = 13
              Caption = 'Salário'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object label5: TLabel
              Left = 4
              Top = 54
              Width = 34
              Height = 13
              Caption = 'Cargo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label6: TLabel
              Left = 4
              Top = 94
              Width = 213
              Height = 13
              Caption = 'Tipo de Periculosidade/Insalubridade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label10: TLabel
              Left = 283
              Top = 93
              Width = 43
              Height = 13
              Caption = 'Função'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label16: TLabel
              Left = 4
              Top = 133
              Width = 124
              Height = 13
              Caption = 'Vínculo Empregatício'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label7: TLabel
              Left = 283
              Top = 133
              Width = 184
              Height = 13
              Caption = 'Tipo de documento apresentado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label9: TLabel
              Left = 561
              Top = 133
              Width = 75
              Height = 13
              Caption = 'Número Doc.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label18: TLabel
              Left = 4
              Top = 199
              Width = 38
              Height = 13
              Caption = 'Total :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedEmpresa: TwwDBEdit
              Left = 427
              Top = 28
              Width = 233
              Height = 21
              CharCase = ecUpperCase
              DataField = 'EMPRESA'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dblkpcmbPatro: TwwDBLookupCombo
              Left = 427
              Top = 28
              Width = 233
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'Patrocinadora')
              DataField = 'IDPESSJUR'
              DataSource = dsDet
              LookupTable = qryPatroFund
              LookupField = 'IDPESSOA'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 14
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnExit = dblkpcmbPatroExit
            end
            object rgrpTipoEmpresa: TRadioGroup
              Left = 283
              Top = 2
              Width = 134
              Height = 47
              BiDiMode = bdLeftToRight
              Caption = 'Tipo de Empresa '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ItemIndex = 1
              Items.Strings = (
                'Patrocinadora'
                'Outra')
              ParentBiDiMode = False
              ParentFont = False
              TabOrder = 2
              OnClick = rgrpTipoEmpresaClick
            end
            object dbedDataFinal: TwwDBDateTimePicker
              Left = 144
              Top = 28
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsEllipsis
              DataField = 'DATAFINAL'
              DataSource = dsDet
              Epoch = 1950
              ShowButton = True
              TabOrder = 1
              OnExit = dbedDataFinalExit
            end
            object dbedDataInicio: TwwDBDateTimePicker
              Left = 4
              Top = 28
              Width = 117
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsEllipsis
              DataField = 'DATAINICIO'
              DataSource = dsDet
              Epoch = 1950
              ShowButton = True
              TabOrder = 0
              OnExit = dbedDataFinalExit
            end
            object dbedCargo: TwwDBEdit
              Left = 4
              Top = 69
              Width = 261
              Height = 21
              DataField = 'CARGO'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedValor: TwwDBEdit
              Left = 283
              Top = 68
              Width = 121
              Height = 21
              DataField = 'VALORCARGO'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedMatricula: TwwDBEdit
              Left = 427
              Top = 68
              Width = 121
              Height = 21
              DataField = 'MATRICULA'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dblkpcmbCodTpInsalubri: TwwDBLookupCombo
              Left = 4
              Top = 109
              Width = 261
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'40'#9'Tipo de Insalubridade'
                'FATOR'#9'10'#9'Fator ')
              DataField = 'CODTPINSALUBRI'
              DataSource = dsDet
              LookupTable = qryTpInsalubri
              LookupField = 'CODTPINSALUBRI'
              Options = [loColLines, loTitles]
              ParentFont = False
              TabOrder = 7
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dbedFuncao: TwwDBEdit
              Left = 283
              Top = 107
              Width = 316
              Height = 21
              DataField = 'FUNCAO'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 8
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbcbVincEmp: TwwDBComboBox
              Left = 4
              Top = 147
              Width = 261
              Height = 21
              ShowButton = True
              Style = csDropDown
              MapList = True
              AllowClearKey = True
              AutoDropDown = True
              DataField = 'VINCEMPREG'
              DataSource = dsDet
              DropDownCount = 8
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 0
              Items.Strings = (
                'Funcionário Público'#9'0'
                'Iniciativa Privada (CLT)'#9'1')
              ParentFont = False
              Sorted = False
              TabOrder = 9
              UnboundDataType = wwDefault
            end
            object dblkpcmbIdDocumento: TwwDBLookupCombo
              Left = 283
              Top = 147
              Width = 250
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEDOCUMENTO'#9'30'#9'Tipo de Documento')
              DataField = 'IDDOCUMENTO'
              DataSource = dsDet
              LookupTable = qryTipoDocPessoa
              LookupField = 'IDDOCUMENTO'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 10
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnChange = dblkpcmbIdDocumentoChange
            end
            object dbedNumDocumento: TwwDBEdit
              Left = 561
              Top = 147
              Width = 99
              Height = 21
              DataField = 'NUMDOCUMENTO'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 11
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbchkFlgContaTS: TDBCheckBox
              Left = 4
              Top = 176
              Width = 238
              Height = 17
              Caption = 'Período conta para tempo de serviço'
              DataField = 'FLGCONTATS'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 12
              ValueChecked = '1'
              ValueUnchecked = '0'
              OnClick = dbchkFlgContaTSClick
            end
            object dbchkFlgTempoManut: TDBCheckBox
              Left = 404
              Top = 176
              Width = 266
              Height = 17
              Caption = 'Período conta como tempo de Manutenção'
              DataField = 'FLGTEMPOMANUT'
              DataSource = dsDet
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 13
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 777
        object Label11: TLabel [0]
          Left = 96
          Top = 8
          Width = 65
          Height = 13
          Caption = 'Sequencia:'
        end
        object dbedSeqHistFunc: TwwDBEdit
          Left = 165
          Top = 3
          Width = 44
          Height = 26
          BorderStyle = bsNone
          Color = clSilver
          DataField = 'SEQHISTFUNC'
          DataSource = dsDet
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
      inherited Dock974: TDock97
        Left = 691
        Height = 250
        inherited tb97Detalhe: TToolbar97
          inherited bbtnOkDet: TBitBtn
            Default = True
          end
        end
      end
    end
    inherited pnlMestre: TPanel [1]
      Width = 785
      Height = 51
      Caption = '|'
      object Label3: TLabel
        Left = 224
        Top = 4
        Width = 69
        Height = 13
        Caption = 'Participante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 8
        Top = 4
        Width = 24
        Height = 13
        Caption = 'CPF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 107
        Top = 4
        Width = 55
        Height = 13
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 544
        Top = 4
        Width = 85
        Height = 13
        Caption = 'Data Admissão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 643
        Top = 3
        Width = 132
        Height = 13
        Caption = 'Tempo Total Calculado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 749
        Top = 26
        Width = 26
        Height = 13
        Caption = 'Dias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edParticipante: TEdit
        Left = 224
        Top = 17
        Width = 313
        Height = 21
        Color = clInactiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object edMatricula: TEdit
        Left = 107
        Top = 17
        Width = 110
        Height = 21
        Color = clInactiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object dtAdmissao: TCMDateTimePicker
        Left = 545
        Top = 17
        Width = 91
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Color = clInactiveCaption
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
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ShowButton = True
        TabOrder = 3
      end
      object edDocumento: TMaskEdit
        Left = 8
        Top = 17
        Width = 91
        Height = 21
        Color = clInactiveCaption
        EditMask = '999.999.999-99;0;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 14
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object PnlTempoTotal: TPanel
        Left = 643
        Top = 17
        Width = 102
        Height = 21
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
      end
    end
    object PnlTempoINSS: TPanel
      Left = 501
      Top = 47
      Width = 250
      Height = 21
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      TabOrder = 2
    end
    object PnlTempoSC: TPanel
      Left = 246
      Top = 47
      Width = 250
      Height = 21
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      TabOrder = 3
    end
  end
  inherited Dock972: TDock97
    Width = 787
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 409
    Width = 787
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        Default = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 16
    Top = 514
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 102
    Top = 130
  end
  inherited ds: TwwDataSource
    Left = 514
    Top = 2
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTFUNCPREV'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  SEQHISTFUNC = :SEQHISTFUNC,'
      '  DATAINICIO = :DATAINICIO,'
      '  DATAFINAL = :DATAFINAL,'
      '  EMPRESA = :EMPRESA,'
      '  VALORCARGO = :VALORCARGO,'
      '  FUNCAO = :FUNCAO,'
      '  CODTPINSALUBRI = :CODTPINSALUBRI,'
      '  IDDOCUMENTO = :IDDOCUMENTO,'
      '  NUMDOCUMENTO = :NUMDOCUMENTO,'
      '  TEMPOCALCINSALUB = :TEMPOCALCINSALUB,'
      '  CARGO = :CARGO,'
      '  FLGCONTATS = :FLGCONTATS,'
      '  VINCEMPREG = :VINCEMPREG,'
      '  MATRICULA = :MATRICULA,'
      '  TEMPOCALC = :TEMPOCALC,'
      '  FLGCONCOMITANTE = :FLGCONCOMITANTE'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQHISTFUNC = :OLD_SEQHISTFUNC')
    InsertSQL.Strings = (
      'insert into HISTFUNCPREV'
      
        '  (IDPESSOA, IDPESSJUR, SEQHISTFUNC, DATAINICIO, DATAFINAL, EMPR' +
        'ESA, VALORCARGO,'
      
        '   FUNCAO, CODTPINSALUBRI, IDDOCUMENTO, NUMDOCUMENTO, TEMPOCALCI' +
        'NSALUB, '
      
        '   CARGO, FLGCONTATS, VINCEMPREG, MATRICULA, TEMPOCALC, FLGCONCO' +
        'MITANTE)'
      'values'
      
        '  (:IDPESSOA, :IDPESSJUR, :SEQHISTFUNC, :DATAINICIO, :DATAFINAL,' +
        ' :EMPRESA,'
      
        '   :VALORCARGO, :FUNCAO, :CODTPINSALUBRI, :IDDOCUMENTO, :NUMDOCU' +
        'MENTO,'
      
        '   :TEMPOCALCINSALUB, :CARGO, :FLGCONTATS, :VINCEMPREG, :MATRICU' +
        'LA, :TEMPOCALC,'
      '   :FLGCONCOMITANTE)'
      '')
    DeleteSQL.Strings = (
      'delete from HISTFUNCPREV'
      'where'
      '  SEQHISTFUNC = :OLD_SEQHISTFUNC and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 474
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Histórico Cadastrado'
    Colunas.Strings = (
      'EL.MATRICULA'
      'P.NOME'
      'P2.NOME'
      'P.NUMDOCUMENTO'
      'PP .INSCRICAONUMERO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Matrícula Atual'
      'Nome do Funcionário'
      'Patrocinadora Atual'
      'Documento Nº'
      'Inscrição Número')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'S'
      'N')
    Tabelas.Strings = (
      'PESSOA P'
      'PESSOA P2'
      'ELEGPATRO EL'
      'PARTPREVPLAN PP ')
    CamposChave.Strings = (
      'P.IDPESSOA'
      'P.NOME'
      'P.NUMDOCUMENTO'
      'EL.IDPESSJUR ')
    Filtro.Strings = (
      'P.IDPESSOA       = EL.IDPESSOA'
      'EL.IDPESSJUR     = P2.IDPESSOA'
      'P.IDPESSOA       = PP.IDPESSOA'
      'PP.FLGDESATIVADO = 0')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '60'
      '60'
      '15'
      '10')
    UsaDistinct = True
    Left = 283
    Top = 2
  end
  inherited ImlPadrao: TImageList
    Left = 57
    Top = 514
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    OnFind = CmeCadastroFind
    Left = 356
    Top = 2
  end
  inherited qry: TwwQuery
    AfterInsert = qryAfterInsert
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      'SELECT 1'
      'FROM DUAL'
      ' ')
    Left = 433
    Top = 2
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 401
    Top = 2
  end
  object qryDet: TwwQuery
    Active = True
    CachedUpdates = True
    AfterOpen = qryDetAfterOpen
    AfterInsert = qryDetAfterInsert
    AfterScroll = qryDetAfterScroll
    OnCalcFields = qryDetCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  HF.IDPESSOA,'
      '  HF.IDPESSJUR,'
      '  HF.SEQHISTFUNC,'
      '  HF.IDDOCUMENTO,'
      '  HF.CODTPINSALUBRI,'
      '  HF.FLGCONTATS,'
      '  HF.DATAINICIO,'
      '  HF.DATAFINAL,'
      '  HF.CARGO,'
      '  HF.VALORCARGO,'
      '  HF.FUNCAO,'
      '  HF.VINCEMPREG,'
      '  HF.MATRICULA,'
      '  HF.EMPRESA,'
      '  HF.TEMPOCALC,'
      '  HF.TEMPOCALCINSALUB,'
      '  HF.FLGCONCOMITANTE,'
      '  HF.NUMDOCUMENTO,'
      '  HF.TEMPOSIMPLES,'
      '  TI.FATOR,'
      '  EL.TEMPOSERVANTERIOR,'
      '  EL.TEMPOSITESPECIAL,'
      '  EL.TEMPONAOCREDITADO,'
      '  PE.NOME,'
      '  HF.FLGTEMPOMANUT,'
      '  M.PROXSEQHISTFUNC,'
      '  TP.NOMEDOCUMENTO,'
      '  TI.DESCRICAO,'
      
        '  DECODE(HF.VINCEMPREG, 0, '#39'Funcionário Público'#39', 1, '#39'Iniciativa' +
        ' Privada (CLT)'#39', NULL) AS VINCEMPREGATICIO'
      'FROM'
      '  PESSOA       PE,'
      '  ELEGPATRO    EL,'
      '  HISTFUNCPREV HF,'
      '  TPINSALUBRI  TI,'
      '  TIPODOCPESSOA TP,'
      '  (SELECT MAX(SEQHISTFUNC) AS PROXSEQHISTFUNC'
      '   FROM HISTFUNCPREV'
      '   WHERE IDPESSOA = :PIDPESSOA) M'
      'WHERE (HF.IDPESSOA       = :PIDPESSOA)'
      '  AND (EL.IDPESSJUR(+)   = HF.IDPESSJUR)'
      '  AND (EL.IDPESSOA(+)    = HF.IDPESSOA)'
      '  AND (PE.IDPESSOA       = HF.IDPESSOA)'
      '  AND (HF.CODTPINSALUBRI = TI.CODTPINSALUBRI(+)) '
      '  AND (HF.IDDOCUMENTO    = TP.IDDOCUMENTO(+))'
      'ORDER BY HF.DATAINICIO, HF.SEQHISTFUNC')
    UpdateObject = UpdDet
    ControlType.Strings = (
      'FLGCONCOMITANTE;CheckBox;1;0'
      'FLGCONTATS;CheckBox;1;0')
    ValidateWithMask = True
    Left = 104
    Top = 82
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryDetSEQHISTFUNC: TFloatField
      DisplayLabel = 'Seq.'
      DisplayWidth = 4
      FieldName = 'SEQHISTFUNC'
    end
    object qryDetDATAINICIO: TDateTimeField
      DisplayLabel = 'Data de ~Início'
      DisplayWidth = 10
      FieldName = 'DATAINICIO'
    end
    object qryDetDATAFINAL: TDateTimeField
      DisplayLabel = 'Data ~Final'
      DisplayWidth = 10
      FieldName = 'DATAFINAL'
    end
    object qryDetFLGCONCOMITANTE: TFloatField
      DisplayLabel = 'Conc.'
      DisplayWidth = 4
      FieldName = 'FLGCONCOMITANTE'
    end
    object qryDetEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      DisplayWidth = 34
      FieldName = 'EMPRESA'
      Size = 60
    end
    object qryDetCARGO: TStringField
      DisplayLabel = 'Cargo'
      DisplayWidth = 20
      FieldName = 'CARGO'
      Size = 40
    end
    object qryDetVALORCARGO: TFloatField
      DisplayLabel = 'Salário'
      DisplayWidth = 10
      FieldName = 'VALORCARGO'
    end
    object qryDetMATRICULA: TStringField
      DisplayLabel = 'Matrícula'
      DisplayWidth = 12
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryDetDESCRICAO: TStringField
      DisplayLabel = 'Tipo de Insalubridade'
      DisplayWidth = 30
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object qryDetFUNCAO: TStringField
      DisplayLabel = 'Função'
      DisplayWidth = 20
      FieldName = 'FUNCAO'
      Size = 40
    end
    object qryDetVINCEMPREGATICIO: TStringField
      DisplayLabel = 'Vínculo Empregatício'
      DisplayWidth = 30
      FieldName = 'VINCEMPREGATICIO'
      Size = 24
    end
    object qryDetFLGCONTATS: TFloatField
      DisplayLabel = 'Tempo ~Válido'
      DisplayWidth = 6
      FieldName = 'FLGCONTATS'
    end
    object qryDetFATOR: TFloatField
      DisplayLabel = 'Fator'
      DisplayWidth = 5
      FieldName = 'FATOR'
    end
    object qryDetTEMPOSERVEXTENSO: TStringField
      DisplayLabel = 'Tempo de Serviço'
      DisplayWidth = 50
      FieldKind = fkCalculated
      FieldName = 'TEMPOSERVEXTENSO'
      Size = 50
      Calculated = True
    end
    object qryDetTEMPODEMONS: TIntegerField
      DisplayLabel = 'Tempo em dias'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'TEMPODEMONS'
      Calculated = True
    end
    object qryDetNOMEDOCUMENTO: TStringField
      DisplayLabel = 'Tipo do Documento Apresentado'
      DisplayWidth = 30
      FieldName = 'NOMEDOCUMENTO'
      Size = 30
    end
    object qryDetNUMDOCUMENTO: TStringField
      DisplayLabel = 'Número Doc.'
      DisplayWidth = 13
      FieldName = 'NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object qryDetTEMPOSIMPLES: TFloatField
      DisplayLabel = 'Tempo em dias'
      DisplayWidth = 10
      FieldName = 'TEMPOSIMPLES'
      Visible = False
    end
    object qryDetPROXSEQHISTFUNC: TFloatField
      DisplayWidth = 10
      FieldName = 'PROXSEQHISTFUNC'
      Visible = False
    end
    object qryDetTEMPOCALC: TFloatField
      DisplayLabel = 'Tempo dias~Calculado'
      DisplayWidth = 9
      FieldName = 'TEMPOCALC'
      Visible = False
    end
    object qryDetIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryDetIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object qryDetIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
      Visible = False
    end
    object qryDetCODTPINSALUBRI: TStringField
      FieldName = 'CODTPINSALUBRI'
      Visible = False
      Size = 10
    end
    object qryDetTempoSer: TIntegerField
      DisplayLabel = 'Tempo de ~Serviço'
      DisplayWidth = 7
      FieldKind = fkCalculated
      FieldName = 'TempoSer'
      Visible = False
      Calculated = True
    end
    object qryDetTemposeresp: TIntegerField
      DisplayLabel = 'Tempo de ~Sit. Especial'
      DisplayWidth = 8
      FieldKind = fkCalculated
      FieldName = 'Temposeresp'
      Visible = False
      Calculated = True
    end
    object qryDetTemposernaocred: TIntegerField
      DisplayLabel = 'Tempo Não ~Creditado'
      DisplayWidth = 8
      FieldKind = fkCalculated
      FieldName = 'Temposernaocred'
      Visible = False
      Calculated = True
    end
    object qryDetChkConc: TBooleanField
      DisplayLabel = 'Concomitante'
      FieldKind = fkCalculated
      FieldName = 'ChkConc'
      Visible = False
      Calculated = True
    end
    object qryDetVINCEMPREG: TStringField
      FieldName = 'VINCEMPREG'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object qryDetTEMPOCALCINSALUB: TFloatField
      FieldName = 'TEMPOCALCINSALUB'
      Visible = False
    end
    object qryDetTEMPOSERVANTERIOR: TFloatField
      FieldName = 'TEMPOSERVANTERIOR'
      Visible = False
    end
    object qryDetTEMPOSITESPECIAL: TFloatField
      FieldName = 'TEMPOSITESPECIAL'
      Visible = False
    end
    object qryDetTEMPONAOCREDITADO: TFloatField
      FieldName = 'TEMPONAOCREDITADO'
      Visible = False
    end
    object qryDetNOME: TStringField
      FieldName = 'NOME'
      Visible = False
      Size = 60
    end
    object qryDetFLGTEMPOMANUT: TFloatField
      FieldName = 'FLGTEMPOMANUT'
      Visible = False
    end
  end
  object UpdDet: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTFUNCPREV'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  SEQHISTFUNC = :SEQHISTFUNC,'
      '  DATAINICIO = :DATAINICIO,'
      '  DATAFINAL = :DATAFINAL,'
      '  EMPRESA = :EMPRESA,'
      '  VALORCARGO = :VALORCARGO,'
      '  FUNCAO = :FUNCAO,'
      '  CODTPINSALUBRI = :CODTPINSALUBRI,'
      '  IDDOCUMENTO = :IDDOCUMENTO,'
      '  NUMDOCUMENTO = :NUMDOCUMENTO,'
      '  TEMPOCALCINSALUB = :TEMPOCALCINSALUB,'
      '  CARGO = :CARGO,'
      '  FLGCONTATS = :FLGCONTATS,'
      '  VINCEMPREG = :VINCEMPREG,'
      '  MATRICULA = :MATRICULA,'
      '  TEMPOCALC = :TEMPOCALC,'
      '  FLGCONCOMITANTE = :FLGCONCOMITANTE,'
      '  FLGTEMPOMANUT = :FLGTEMPOMANUT'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQHISTFUNC = :OLD_SEQHISTFUNC'
      ''
      ' ')
    InsertSQL.Strings = (
      'insert into HISTFUNCPREV'
      
        '  (IDPESSOA, IDPESSJUR, SEQHISTFUNC, DATAINICIO, DATAFINAL, EMPR' +
        'ESA, VALORCARGO,'
      
        '   FUNCAO, CODTPINSALUBRI, IDDOCUMENTO, NUMDOCUMENTO, TEMPOCALCI' +
        'NSALUB,'
      
        '   CARGO, FLGCONTATS, VINCEMPREG, MATRICULA, TEMPOCALC, FLGCONCO' +
        'MITANTE,'
      '   FLGTEMPOMANUT)'
      'values'
      
        '  (:IDPESSOA, :IDPESSJUR, :SEQHISTFUNC, :DATAINICIO, :DATAFINAL,' +
        ' :EMPRESA,'
      
        '   :VALORCARGO, :FUNCAO, :CODTPINSALUBRI, :IDDOCUMENTO, :NUMDOCU' +
        'MENTO,'
      
        '   :TEMPOCALCINSALUB, :CARGO, :FLGCONTATS, :VINCEMPREG, :MATRICU' +
        'LA, :TEMPOCALC,'
      '   :FLGCONCOMITANTE, :FLGTEMPOMANUT)'
      ' ')
    DeleteSQL.Strings = (
      'delete from HISTFUNCPREV'
      'where'
      '  SEQHISTFUNC = :OLD_SEQHISTFUNC and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 147
    Top = 130
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 690
    Top = 242
  end
  object qryPatroFund: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  P.IDPESSOA, P.NOME'
      'FROM'
      '  PESSOA P, PATRO PT'
      'WHERE'
      '  PT.IDFUNDACAO = :IDFUNDACAO AND'
      '  P.IDPESSOA = PT.IDPESSOA')
    ValidateWithMask = True
    Left = 270
    Top = 130
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
        Value = 1
      end>
  end
  object qryTpInsalubri: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODTPINSALUBRI,    DESCRICAO,       FATOR, IDREGRAINSALUBRI,'
      '  TEMPOPERMANMINIMO, FLGTEMPOCONTINUO'
      'FROM'
      '  TPINSALUBRI'
      'ORDER BY'
      '  DESCRICAO')
    ValidateWithMask = True
    Left = 393
    Top = 106
  end
  object qryTipoDocPessoa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDDOCUMENTO, NOMEDOCUMENTO'
      'FROM TIPODOCPESSOA'
      'ORDER BY NOMEDOCUMENTO')
    ValidateWithMask = True
    Left = 337
    Top = 130
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 742
    Top = 242
  end
  object qryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 690
    Top = 290
  end
  object qryAux3: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT H.IDPESSOA,H.IDPESSJUR,H.SEQHISTFUNC,H.IDDOCUMENTO,H.CODT' +
        'PINSALUBRI,H.DATAINICIO,'
      
        '       H.DATAFINAL,H.EMPRESA,H.CARGO,H.VALORCARGO,H.FUNCAO,H.FLG' +
        'CONTATS,H.VINCEMPREG,'
      
        '       EL.TEMPOSERVANTERIOR, EL.TEMPOSITESPECIAL,EL.TEMPONAOCRED' +
        'ITADO, P.NOME,'
      '       H.NUMDOCUMENTO AS CPF'
      'FROM   HISTFUNCPREV H, ELEGPATRO EL, PESSOA P'
      'WHERE  H.IDPESSOA = :pIdPessoa    AND'
      '       EL.IDPESSOA =  H.IDPESSOA  AND'
      '       P.IDPESSOA = H.IDPESSOA'
      'ORDER BY H.SEQHISTFUNC')
    ValidateWithMask = True
    Left = 690
    Top = 338
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdPessoa'
        ParamType = ptUnknown
        Value = 64081
      end>
  end
  object MontaSelectPart: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona participante para cadastro'
    Colunas.Strings = (
      'EL.MATRICULA'
      'P.NOME'
      'P.NUMDOCUMENTO'
      'PARTPREVPLAN.INSCRICAONUMERO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'CPF'
      'Inscrição')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'S'
      'N')
    Tabelas.Strings = (
      'ELEGPATRO EL'
      'PESSOA P'
      'PARTPREVPLAN')
    CamposChave.Strings = (
      'P.IDPESSOA'
      'P.NOME'
      'P.NUMDOCUMENTO'
      'EL.MATRICULA'
      'EL.DATAADMISSAO'
      'EL.IDPESSJUR')
    Filtro.Strings = (
      'P.TIPO = '#39'F'#39
      'P.IDPESSOA = EL.IDPESSOA'
      'P.IDPESSOA = PARTPREVPLAN.IDPESSOA(+)'
      'PARTPREVPLAN.FLGDESATIVADO = 0 ')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '18'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 602
    Top = 2
  end
end
