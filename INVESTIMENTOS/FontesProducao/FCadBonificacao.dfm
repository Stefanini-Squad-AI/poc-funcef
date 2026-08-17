inherited frmCadBonificacao: TfrmCadBonificacao
  Left = 253
  Top = 94
  HelpContext = 790285
  Caption = 'Operação'
  ClientHeight = 479
  ClientWidth = 760
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 760
    Height = 393
    inherited Bevel1: TBevel
      Width = 758
    end
    inherited pnlMestre: TPanel
      Width = 758
      Height = 126
      object Label3: TLabel
        Left = 17
        Top = 42
        Width = 49
        Height = 13
        Caption = 'Empresa'
      end
      object Label4: TLabel
        Left = 17
        Top = 82
        Width = 57
        Height = 13
        Caption = 'Data AGE'
      end
      object Label5: TLabel
        Left = 117
        Top = 82
        Width = 60
        Height = 13
        Caption = 'Data Base'
      end
      object Label16: TLabel
        Left = 217
        Top = 82
        Width = 54
        Height = 13
        Caption = 'Data  Ex '
      end
      object Label6: TLabel
        Left = 319
        Top = 82
        Width = 78
        Height = 13
        Caption = 'Data Prevista'
      end
      object Label14: TLabel
        Left = 421
        Top = 3
        Width = 69
        Height = 13
        Caption = 'Observação'
      end
      object Label28: TLabel
        Left = 17
        Top = 3
        Width = 85
        Height = 13
        Caption = 'Tipo Operação'
      end
      object lblPercentual: TLabel
        Left = 294
        Top = 42
        Width = 62
        Height = 13
        Caption = 'Percentual'
      end
      object dblEmissor: TwwDBLookupCombo
        Left = 17
        Top = 57
        Width = 264
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SIGLAEMISSOR'#9'15'#9'Descrição')
        DataField = 'IDEMISSOR'
        DataSource = ds
        LookupTable = QryEmissor
        LookupField = 'IDEMISSOR'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object dbdAGE: TCMDateTimePicker
        Left = 17
        Top = 97
        Width = 96
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAAGE'
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
      object dbdEX: TCMDateTimePicker
        Left = 117
        Top = 97
        Width = 96
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAEX'
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
      object dbdOper: TCMDateTimePicker
        Left = 217
        Top = 97
        Width = 97
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAOPER'
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
        TabOrder = 5
      end
      object dbdCOM: TCMDateTimePicker
        Left = 319
        Top = 97
        Width = 98
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATACOM'
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
        TabOrder = 6
        OnExit = dbdCOMExit
      end
      object dbmObservacao: TDBMemo
        Left = 421
        Top = 17
        Width = 319
        Height = 100
        DataField = 'OBSERVACAO'
        DataSource = ds
        TabOrder = 7
      end
      object dblTipoOperacao: TwwDBLookupCombo
        Left = 17
        Top = 17
        Width = 400
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOOPERACAO'#9'35'#9'Descrição')
        DataField = 'IDTIPOOPERACAO'
        DataSource = ds
        LookupTable = qryTipoOperacao
        LookupField = 'IDTIPOOPERACAO'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnExit = dblTipoOperacaoExit
      end
      object dbePercentual: TDBRealEdit
        Left = 294
        Top = 57
        Width = 122
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,0000000000')
        TabOrder = 2
        WordWrap = False
        IntDigits = 14
        DecDigits = 10
        NumberFormat = fNumber
        Signal = False
        DataField = 'PERCENTUAL'
        DataSource = ds
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 170
      Width = 758
      Height = 222
      Tabs.Strings = (
        'Investimentos'
        'Origem'
        'Destino')
      detdbGrids.Strings = (
        'dbgrdDet'
        'dbgProvisao'
        'dbgRecebimento')
      inherited pgctrlDetalhe: TPageControl
        Width = 660
        Height = 163
        ActivePage = tbsOrigem
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel [0]
            Width = 652
            Height = 135
            object Label18: TLabel
              Left = 6
              Top = 6
              Width = 73
              Height = 13
              Caption = 'Investimento'
            end
            object Label13: TLabel
              Left = 6
              Top = 49
              Width = 97
              Height = 13
              Caption = 'Origem / Destino'
            end
            object dblInvestimento: TwwDBLookupCombo
              Left = 6
              Top = 21
              Width = 400
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCINVESTIMENTO'#9'60'#9'Descrição'#9'F')
              DataField = 'IDINVESTIMENTO'
              DataSource = dsDet
              LookupTable = qryInvestimentoAcao
              LookupField = 'IDINVESTIMENTO'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
            object dblOrigDest: TwwDBLookupCombo
              Left = 6
              Top = 64
              Width = 168
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'7'#9'Descrição'#9'F')
              DataField = 'ORIGDEST'
              DataSource = dsDet
              LookupTable = qryOrigDestino
              LookupField = 'ORIGDEST'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
          end
          inherited dbgrdDet: TwwDBGrid [1]
            Width = 652
            Height = 135
            Selected.Strings = (
              'DESCINVESTIMENTO'#9'80'#9'Investimento'
              'DESCRICAO'#9'19'#9'Origem / Destino'#9'F')
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTabExitsOnLastCol]
            ParentFont = False
            TitleAlignment = taCenter
            TitleFont.Color = clMaroon
          end
        end
        object tbsOrigem: TTabSheet
          Caption = 'Origem'
          ImageIndex = 1
          object dbgProvisao: TwwDBGrid
            Left = 0
            Top = 0
            Width = 652
            Height = 135
            Selected.Strings = (
              'NUMDOCUMENTO'#9'12'#9'Boleta'
              'PLANPRVCONTABPATRO'#9'40'#9'Plano / Patrocinadora'
              'DESCTIPOOPERACAO'#9'34'#9'Tipo de Operação'
              'DESCINVESTIMENTO'#9'21'#9'Investimento'
              'DESCCARTINVEST'#9'40'#9'Carteira'
              'SGLCUSTODIANTE'#9'15'#9'Custodiante'
              'SIGLAMOTBLOQ'#9'7'#9'Bloqueio'
              'QTDEOPERACAO'#9'20'#9'Quantidade'
              'VLROPERACAO'#9'18'#9'Valor'
              'DATABASE'#9'10'#9'Data Base'
              'DATAOPERACAO'#9'15'#9'Data Operação'
              'DATAVENCOPER'#9'15'#9'Data Vencimento')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsOrigem
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTabExitsOnLastCol]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clMaroon
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object pnlDetProvisao: TPanel
            Left = 0
            Top = 0
            Width = 652
            Height = 135
            Align = alClient
            TabOrder = 1
            object Label1: TLabel
              Left = 6
              Top = 49
              Width = 139
              Height = 13
              Caption = 'Carteira de Investimento'
            end
            object Label2: TLabel
              Left = 6
              Top = 90
              Width = 98
              Height = 13
              Caption = 'Quantidade Base'
            end
            object Label11: TLabel
              Left = 278
              Top = 49
              Width = 68
              Height = 13
              Caption = 'Custodiante'
            end
            object Label12: TLabel
              Left = 437
              Top = 49
              Width = 50
              Height = 13
              Caption = 'Bloqueio'
            end
            object Label39: TLabel
              Left = 6
              Top = 6
              Width = 37
              Height = 13
              Caption = 'Boleta'
              FocusControl = dbeBoletaProv
            end
            object Label17: TLabel
              Left = 138
              Top = 6
              Width = 103
              Height = 13
              Caption = 'Tipo de Operação'
            end
            object Label7: TLabel
              Left = 138
              Top = 91
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object dblCarteiraProvisao: TwwDBLookupCombo
              Left = 6
              Top = 64
              Width = 268
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCCARTINVEST'#9'60'#9'Descrição'#9'F')
              DataField = 'IDCARTEIRA'
              DataSource = dsOrigem
              LookupTable = qryCarteiraOrig
              LookupField = 'IDCARTEIRA'
              Options = [loColLines, loRowLines, loTitles]
              Enabled = False
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnExit = dblCarteiraProvisaoExit
            end
            object dbrQtdProv: TDBRealEdit
              Left = 6
              Top = 105
              Width = 127
              Height = 21
              Alignment = taRightJustify
              Enabled = False
              Lines.Strings = (
                '0')
              TabOrder = 5
              WordWrap = False
              OnExit = dbrQtdProvExit
              IntDigits = 14
              DecDigits = 0
              NumberFormat = fNumber
              Signal = False
              DataField = 'QTDEOPERACAO'
              DataSource = dsOrigem
            end
            object dblCustodianteProv: TwwDBLookupCombo
              Left = 278
              Top = 64
              Width = 154
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'SGLCUSTODIANTE'#9'10'#9'Descrição'#9'F')
              DataField = 'IDCUSTODIANTE'
              DataSource = dsOrigem
              LookupTable = qryCustodianteOrig
              LookupField = 'IDCUSTODIANTE'
              Options = [loColLines, loRowLines, loTitles]
              Enabled = False
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dbeBoletaProv: TDBEdit
              Left = 6
              Top = 21
              Width = 127
              Height = 21
              TabStop = False
              DataField = 'NUMDOCUMENTO'
              DataSource = dsOrigem
              Enabled = False
              TabOrder = 0
            end
            object dblMotivoBloqueioProv: TwwDBLookupCombo
              Left = 437
              Top = 64
              Width = 188
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCMOTBLOQ'#9'30'#9'Descrição'#9'F')
              DataField = 'IDMOTIVOBLOQUEIO'
              DataSource = dsOrigem
              LookupTable = qryMotBloqOrig
              LookupField = 'IDMOTIVOBLOQUEIO'
              Options = [loColLines, loRowLines, loTitles]
              Enabled = False
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblTipoOperProv: TwwDBLookupCombo
              Left = 138
              Top = 21
              Width = 347
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCTIPOOPERACAO'#9'60'#9'Descrição'#9'F')
              DataField = 'IDTIPOOPERACAO'
              DataSource = dsOrigem
              LookupTable = qryTipoOperOrig
              LookupField = 'IDTIPOOPERACAO'
              Options = [loColLines, loRowLines, loTitles]
              Enabled = False
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dbrVlrProv: TDBRealEdit
              Left = 138
              Top = 105
              Width = 134
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 6
              WordWrap = False
              IntDigits = 14
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLROPERACAO'
              DataSource = dsOrigem
            end
          end
        end
        object tbsDestino: TTabSheet
          Caption = 'Destino'
          ImageIndex = 2
          object dbgRecebimento: TwwDBGrid
            Left = 0
            Top = 0
            Width = 652
            Height = 135
            Selected.Strings = (
              'NUMDOCUMENTO'#9'12'#9'Boleta'
              'PLANPRVCONTABPATRO'#9'40'#9'Plano / Patrocinadora'
              'DESCTIPOOPERACAO'#9'34'#9'Tipo de Operação'
              'DESCINVESTIMENTO'#9'21'#9'Investimento'
              'DESCCARTINVEST'#9'40'#9'Carteira'
              'SGLCUSTODIANTE'#9'15'#9'Custodiante'
              'SIGLAMOTBLOQ'#9'7'#9'Bloqueio'
              'QTDEOPERACAO'#9'20'#9'Quantidade'
              'VLROPERACAO'#9'18'#9'Valor'
              'DATABASE'#9'10'#9'Data Base'
              'DATAOPERACAO'#9'10'#9'Data Operação'
              'DATAVENCOPER'#9'10'#9'Data Vencimento')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsDestino
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTabExitsOnLastCol]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clMaroon
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object pnlDetRecebimento: TPanel
            Left = 0
            Top = 0
            Width = 652
            Height = 135
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object Label15: TLabel
              Left = 6
              Top = 6
              Width = 37
              Height = 13
              Caption = 'Boleta'
              FocusControl = dbeBoletaRec
            end
            object Label20: TLabel
              Left = 278
              Top = 6
              Width = 103
              Height = 13
              Caption = 'Tipo de Operação'
            end
            object Label19: TLabel
              Left = 6
              Top = 49
              Width = 139
              Height = 13
              Caption = 'Carteira de Investimento'
            end
            object Label21: TLabel
              Left = 278
              Top = 49
              Width = 68
              Height = 13
              Caption = 'Custodiante'
            end
            object Label22: TLabel
              Left = 437
              Top = 49
              Width = 50
              Height = 13
              Caption = 'Bloqueio'
            end
            object Label23: TLabel
              Left = 6
              Top = 90
              Width = 98
              Height = 13
              Caption = 'Quantidade Base'
            end
            object Label29: TLabel
              Left = 138
              Top = 6
              Width = 87
              Height = 13
              Caption = 'Data Operação'
            end
            object Label24: TLabel
              Left = 138
              Top = 90
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object dblCarteiraRec: TwwDBLookupCombo
              Left = 6
              Top = 64
              Width = 268
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCCARTINVEST'#9'60'#9'Descrição'#9'F')
              DataField = 'IDCARTEIRA'
              DataSource = dsDestino
              LookupTable = qryCarteiraRec
              LookupField = 'IDCARTEIRA'
              Options = [loColLines, loRowLines, loTitles]
              Enabled = False
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnExit = dblCarteiraRecExit
            end
            object dbeBoletaRec: TDBEdit
              Left = 6
              Top = 21
              Width = 127
              Height = 21
              TabStop = False
              DataField = 'NUMDOCUMENTO'
              DataSource = dsDestino
              Enabled = False
              TabOrder = 6
            end
            object dblTipoOperRec: TwwDBLookupCombo
              Left = 278
              Top = 21
              Width = 347
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCTIPOOPERACAO'#9'60'#9'Descrição'#9'F')
              DataField = 'IDTIPOOPERACAO'
              DataSource = dsDestino
              LookupTable = qryTipoOperRec
              LookupField = 'IDTIPOOPERACAO'
              Options = [loColLines, loRowLines, loTitles]
              Enabled = False
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblCustodianteRec: TwwDBLookupCombo
              Left = 278
              Top = 64
              Width = 154
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'SGLCUSTODIANTE'#9'10'#9'Descrição'#9'F')
              DataField = 'IDCUSTODIANTE'
              DataSource = dsDestino
              LookupTable = qryCustodianteRec
              LookupField = 'IDCUSTODIANTE'
              Options = [loColLines, loRowLines, loTitles]
              Enabled = False
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblMotivoBloqueioRec: TwwDBLookupCombo
              Left = 437
              Top = 64
              Width = 188
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCMOTBLOQ'#9'30'#9'Descrição'#9'F')
              DataField = 'IDMOTIVOBLOQUEIO'
              DataSource = dsDestino
              LookupTable = qryMotBloqRec
              LookupField = 'IDMOTIVOBLOQUEIO'
              Options = [loColLines, loRowLines, loTitles]
              Enabled = False
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dbrQtdRec: TDBRealEdit
              Left = 6
              Top = 105
              Width = 127
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0')
              TabOrder = 5
              WordWrap = False
              OnExit = dbrQtdProvExit
              IntDigits = 14
              DecDigits = 0
              NumberFormat = fNumber
              Signal = False
              DataField = 'QTDEOPERACAO'
              DataSource = dsDestino
            end
            object dbdDataOperacaoRec: TCMDateTimePicker
              Left = 138
              Top = 21
              Width = 136
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAOPERACAO'
              DataSource = dsDestino
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
              OnExit = dbdDataOperacaoRecExit
            end
            object dbrVlrRec: TDBRealEdit
              Left = 138
              Top = 105
              Width = 134
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 7
              WordWrap = False
              IntDigits = 14
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLROPERACAO'
              DataSource = dsDestino
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 750
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnInsDet: TToolbarButton97
            Height = 24
          end
          inherited sbtnConsDet: TToolbarButton97
            Visible = True
          end
          object bbtnGeraOperacoes: TToolbarButton97
            Left = 100
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Gera Recebimentos'
            AllowAllUp = True
            GroupIndex = 2
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FF0000000F0
              000033F77777773777773FFF0CCC0FF09990333F73F37337F33733FFF0C0FFF0
              99903333F7373337F337333FFF0FFFF0999033333F73FFF7FFF73333FFF000F0
              0000333333F77737777733333F07B70FFFFF3333337F337F33333333330BBB0F
              FFFF3333337F337F333333333307B70FFFFF33333373FF733F333333333000FF
              0FFF3333333777337FF3333333333FF000FF33FFFFF3333777FF300000333300
              000F377777F33377777F30EEE0333000000037F337F33777777730EEE0333330
              00FF37F337F3333777F330EEE033333000FF37FFF7F3333777F3300000333330
              00FF3777773333F77733333333333000033F3333333337777333}
            ImageIndex = 1
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            Visible = False
            OnClick = bbtnGeraOperacoesClick
          end
        end
      end
      inherited Dock974: TDock97
        Left = 664
        Height = 163
      end
    end
    inherited pnlTitulo: TPanel
      Width = 758
      inherited lbNomItem: TfcLabel
        Width = 119
        Caption = 'Bonificação'
      end
    end
  end
  inherited Dock972: TDock97
    Width = 760
  end
  inherited Dock971: TDock97
    Top = 440
    Width = 760
    inherited tb97Fundo: TToolbar97
      Left = 588
      DockPos = 605
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 419
      DockPos = 436
    end
    inherited fraMens: TfraMensagem
      Width = 412
      inherited pnlProgresso: TPanel
        Width = 412
        inherited pnlProgressoMensagem: TPanel
          Width = 346
          inherited lblProgressoMensagem: TfcLabel
            Width = 344
          end
        end
        inherited pnlProgressoBarra: TPanel
          Left = 347
          Width = 64
          inherited pgbProcesso: TProgressBar
            Width = 62
          end
        end
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      3
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited dsDet: TwwDataSource
    Left = 464
    Top = 210
  end
  inherited ds: TwwDataSource
    AutoEdit = False
    Left = 330
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERACAODIREITO'
      'set'
      '  INVORIGEM = :INVORIGEM,'
      '  DATAAGE = :DATAAGE,'
      '  DATAEX = :DATAEX,'
      '  DATACOM = :DATACOM,'
      '  PERCENTUAL = :PERCENTUAL,'
      '  PARIDADE = :PARIDADE,'
      '  PRZBOLSA = :PRZBOLSA,'
      '  PRZEMPRESA = :PRZEMPRESA,'
      '  ATADECISAO = :ATADECISAO,'
      '  FORMAPAGREC = :FORMAPAGREC,'
      '  DIVPORACAO = :DIVPORACAO,'
      '  INIPAGTO = :INIPAGTO,'
      '  JUROSCAP = :JUROSCAP,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDEMISSOR = :IDEMISSOR,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  STATUS = :STATUS,'
      '  ISENCAOIR = :ISENCAOIR,'
      '  IRLITIGIO = :IRLITIGIO,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  PLANO = :PLANO,'
      '  QTDEACOESDIRPROV = :QTDEACOESDIRPROV,'
      '  IDPEDIDOFUNDO = :IDPEDIDOFUNDO,'
      '  QTDERECDIRPARC = :QTDERECDIRPARC,'
      '  DATAOPER = :DATAOPER,'
      '  QTDDIREITO = :QTDDIREITO,'
      '  FLGTIPODIREITO = :FLGTIPODIREITO'
      'where'
      '  IDOPERACAODIREITO = :OLD_IDOPERACAODIREITO')
    InsertSQL.Strings = (
      'insert into OPERACAODIREITO'
      '  (IDOPERACAODIREITO, INVORIGEM, DATAAGE, DATAEX, DATACOM, '
      'PERCENTUAL, '
      '   PARIDADE, PRZBOLSA, PRZEMPRESA, ATADECISAO, FORMAPAGREC, '
      'DIVPORACAO, '
      '   INIPAGTO, JUROSCAP, IDTIPOINVEST, IDTIPOOPERACAO, IDEMISSOR, '
      'OBSERVACAO, '
      
        '   STATUS, ISENCAOIR, IRLITIGIO, PLNCODIGO, CODDOCUMENTO, PLANO,' +
        ' '
      'QTDEACOESDIRPROV, '
      '   IDPEDIDOFUNDO, QTDERECDIRPARC, DATAOPER, QTDDIREITO, '
      'FLGTIPODIREITO)'
      'values'
      '  (:IDOPERACAODIREITO, :INVORIGEM, :DATAAGE, :DATAEX, :DATACOM, '
      ':PERCENTUAL, '
      
        '   :PARIDADE, :PRZBOLSA, :PRZEMPRESA, :ATADECISAO, :FORMAPAGREC,' +
        ' '
      ':DIVPORACAO, '
      
        '   :INIPAGTO, :JUROSCAP, :IDTIPOINVEST, :IDTIPOOPERACAO, :IDEMIS' +
        'SOR, '
      ':OBSERVACAO, '
      
        '   :STATUS, :ISENCAOIR, :IRLITIGIO, :PLNCODIGO, :CODDOCUMENTO, :' +
        'PLANO, '
      
        '   :QTDEACOESDIRPROV, :IDPEDIDOFUNDO, :QTDERECDIRPARC, :DATAOPER' +
        ', '
      ':QTDDIREITO, '
      '   :FLGTIPODIREITO)')
    DeleteSQL.Strings = (
      'delete from OPERACAODIREITO'
      'where'
      '  IDOPERACAODIREITO = :OLD_IDOPERACAODIREITO')
    Left = 355
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOOPERACAO.DESCTIPOOPERACAO'
      'EMISSOR.SIGLAEMISSOR'
      'DECODE(OPERACAODIREITO.IDPEDIDOFUNDO, NULL,'#39' NÃO'#39','#39'SIM'#39')'
      
        'NVL(DECODE(OPERACAODIREITO.QTDEACOESDIRPROV, 0,(ROUND(((OPERACAO' +
        'DIREITO.QTDDIREITO-NVL(OPERACAODIREITO.QTDERECDIRPARC,0))*(NVL(O' +
        'PERACAODIREITO.DIVPORACAO,1)/ACOESXBOLSA.QTDELOTE))-0.0049,2)+NV' +
        'L(OPERACAOINVEST.VLRREMUNERACAO,0)), DECODE((NVL(OPERACAODIREITO' +
        '.QTDEACOESDIRPROV,0)-NVL(OPERACAODIREITO.QTDERECDIRPARC,0)),0, R' +
        'OUND((NVL(OPERACAODIREITO.QTDEACOESDIRPROV,0) * NVL(OPERACAODIRE' +
        'ITO.DIVPORACAO,0))-0.0049,2), ROUND(((NVL(OPERACAODIREITO.QTDEAC' +
        'OESDIRPROV,0)-NVL(OPERACAODIREITO.QTDERECDIRPARC,0))* NVL(OPERAC' +
        'AODIREITO.DIVPORACAO,1))-0.0049,2))),0)'
      'NVL(OPERACAODIREITO.QTDEACOESDIRPROV,0)'
      'OPERACAODIREITO.DATACOM'
      'OPERACAODIREITO.DATAOPER'
      'OPERACAODIREITO.DATAAGE'
      'OPERACAODIREITO.DATAEX'
      'OPERACAODIREITO.DIVPORACAO'
      'OPERACAODIREITO.PRZBOLSA'
      'OPERACAODIREITO.PRZEMPRESA'
      'OPERACAODIREITO.ATADECISAO'
      'OPERACAODIREITO.PERCENTUAL'
      'OPERACAODIREITO.PARIDADE'
      'OPERACAODIREITO.FORMAPAGREC'
      'OPERACAODIREITO.INIPAGTO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N'
      'N'
      'D'
      'D'
      'D'
      'D'
      'N'
      'D'
      'D'
      'D'
      'N'
      'N'
      'C'
      'D')
    Descricao.Strings = (
      'Tipo de Operação'
      'Empresa'
      'Resg. Fdo'
      'Valor a Receber'
      'Quantidade Fundos'
      'Data Prevista'
      'Data Ex'
      'Data AGE'
      'Data Base'
      'Dividendos por Ação'
      'Prazo Bolsa'
      'Prazo Empresa'
      'Ata Decisão'
      'Percentual'
      'Paridade'
      'Forma de Pagamento/Recebimento'
      'Inicio Pagamento')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'OPERACAOINVEST'
      'EMISSOR'
      'PEDIDOFUNDO'
      'OPERACAODIREITO'
      'TIPOOPERACAO'
      'OPERDIREITOXINV'
      'ACOESXBOLSA'
      'PARAMINVEST')
    CamposChave.Strings = (
      'OPERACAODIREITO.IDOPERACAODIREITO'
      'OPERACAODIREITO.PLNCODIGO'
      'OPERACAODIREITO.CODDOCUMENTO')
    Filtro.Strings = (
      'OPERACAODIREITO.IDTIPOOPERACAO = PARAMINVEST.IDTIPOOPERDIRBON'
      'OPERACAODIREITO.IDTIPOOPERACAO = TIPOOPERACAO.IDTIPOOPERACAO(+)'
      'OPERACAODIREITO.IDEMISSOR = EMISSOR.IDEMISSOR(+)'
      'PEDIDOFUNDO.IDPEDIDOFUNDO(+) = OPERACAODIREITO.IDPEDIDOFUNDO'
      
        'OPERACAOINVEST.IDOPERACAODIREITO(+) = OPERACAODIREITO.IDOPERACAO' +
        'DIREITO'
      
        'OPERDIREITOXINV.IDOPERACAODIREITO(+) = OPERACAODIREITO.IDOPERACA' +
        'ODIREITO'
      'ACOESXBOLSA.IDACAO(+) =OPERDIREITOXINV.IDINVESTIMENTO ')
    Mascaras.Strings = (
      ''
      ''
      ''
      '###,###,###,###0.00'
      '###,###,###,###0'
      ''
      ''
      ''
      ''
      ',#0.0000000000'
      ''
      ''
      ''
      ',#0.00'
      ''
      ''
      '')
    Larguras.Strings = (
      '28'
      '18'
      '5'
      '18'
      '18'
      '10'
      '10'
      '10'
      '10'
      '15'
      '10'
      '10'
      '10'
      '15'
      '15'
      '20'
      '10')
    UsaDistinct = True
  end
  inherited ImlPadrao: TImageList
    Left = 241
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 300
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      
        'SELECT TPO.DESCTIPOOPERACAO AS DESCTIPOOPERACAO, TPP.DESCTIPOOPE' +
        'RACAO AS DESCTIPOOPERACAORESG,'
      
        '       OPD.IDOPERACAODIREITO, OPD.INVORIGEM, OPD.DATAAGE, OPD.DA' +
        'TAEX, OPD.DATACOM, OPD.PERCENTUAL,'
      
        '       OPD.PARIDADE, OPD.PRZBOLSA, OPD.PRZEMPRESA, OPD.ATADECISA' +
        'O, OPD.FORMAPAGREC, OPD.DIVPORACAO,'
      
        '       OPD.INIPAGTO, OPD.JUROSCAP, OPD.TRGDTINCLUSAO, OPD.TRGUSE' +
        'RINCLUSAO, OPD.IDTIPOINVEST,'
      
        '       OPD.IDTIPOOPERACAO, OPD.IDEMISSOR, OPD.OBSERVACAO, OPD.IS' +
        'ENCAOIR, OPD.IRLITIGIO,'
      
        '       OPD.STATUS, OPD.PLANO, OPD.PLNCODIGO, OPD.CODDOCUMENTO, O' +
        'PD.QTDEACOESDIRPROV, OPD.IDPEDIDOFUNDO,'
      
        '       OPD.QTDERECDIRPARC, OPD.DATAOPER, OPD.FLGTIPODIREITO, OPD' +
        '.QTDDIREITO'
      ''
      
        'FROM OPERACAODIREITO OPD, PEDIDOFUNDO PDF, TIPOOPERACAO TPO, TIP' +
        'OOPERACAO TPP,'
      '     PARAMINVEST PI'
      ''
      'WHERE OPD.IDOPERACAODIREITO = :IDOPERACAODIREITO'
      '  AND PDF.IDPEDIDOFUNDO(+)  = OPD.IDPEDIDOFUNDO'
      '  AND OPD.IDTIPOOPERACAO    = PI.IDTIPOOPERDIRBON'
      '  AND TPP.IDTIPOOPERACAO(+) = PDF.IDTIPOOPERACAO'
      '  AND TPO.IDTIPOOPERACAO(+) = OPD.IDTIPOOPERACAO'
      ' '
      ' '
      ' '
      ' ')
    Left = 383
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptResult
      end>
    object qryDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryDESCTIPOOPERACAORESG: TStringField
      FieldName = 'DESCTIPOOPERACAORESG'
      Size = 60
    end
    object qryIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
    end
    object qryINVORIGEM: TFloatField
      FieldName = 'INVORIGEM'
    end
    object qryDATAAGE: TDateTimeField
      FieldName = 'DATAAGE'
    end
    object qryDATAEX: TDateTimeField
      FieldName = 'DATAEX'
    end
    object qryDATACOM: TDateTimeField
      FieldName = 'DATACOM'
    end
    object qryPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
    end
    object qryPARIDADE: TFloatField
      FieldName = 'PARIDADE'
    end
    object qryPRZBOLSA: TDateTimeField
      FieldName = 'PRZBOLSA'
    end
    object qryPRZEMPRESA: TDateTimeField
      FieldName = 'PRZEMPRESA'
    end
    object qryATADECISAO: TDateTimeField
      FieldName = 'ATADECISAO'
    end
    object qryFORMAPAGREC: TStringField
      FieldName = 'FORMAPAGREC'
      Size = 30
    end
    object qryDIVPORACAO: TFloatField
      FieldName = 'DIVPORACAO'
    end
    object qryINIPAGTO: TDateTimeField
      FieldName = 'INIPAGTO'
    end
    object qryJUROSCAP: TStringField
      FieldName = 'JUROSCAP'
      FixedChar = True
      Size = 1
    end
    object qryIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object qryIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
    end
    object qryOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 300
    end
    object qryISENCAOIR: TStringField
      FieldName = 'ISENCAOIR'
      FixedChar = True
      Size = 1
    end
    object qryIRLITIGIO: TStringField
      FieldName = 'IRLITIGIO'
      FixedChar = True
      Size = 1
    end
    object qrySTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object qryPLANO: TFloatField
      FieldName = 'PLANO'
    end
    object qryPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryQTDEACOESDIRPROV: TFloatField
      FieldName = 'QTDEACOESDIRPROV'
    end
    object qryQTDERECDIRPARC: TFloatField
      FieldName = 'QTDERECDIRPARC'
    end
    object qryDATAOPER: TDateTimeField
      FieldName = 'DATAOPER'
    end
    object qryFLGTIPODIREITO: TStringField
      FieldName = 'FLGTIPODIREITO'
      FixedChar = True
      Size = 1
    end
    object qryIDPEDIDOFUNDO: TFloatField
      FieldName = 'IDPEDIDOFUNDO'
    end
    object qryQTDDIREITO: TFloatField
      FieldName = 'QTDDIREITO'
    end
  end
  inherited CmeDetalhe: TCmEventosCadastro
    ApplyInsert = CmeDetalheApplyInsert
    ApplyEdit = CmeDetalheApplyInsert
    Left = 371
    Top = 210
  end
  inherited updDetalhe: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERDIREITOXINV'
      'set'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDOPERACAODIREITO = :IDOPERACAODIREITO,'
      '  ORIGDEST = :ORIGDEST'
      'where'
      '  IDOPERDIREITOXINV = :OLD_IDOPERDIREITOXINV')
    InsertSQL.Strings = (
      'insert into OPERDIREITOXINV'
      
        '  (IDOPERDIREITOXINV, IDINVESTIMENTO, IDOPERACAODIREITO, ORIGDES' +
        'T)'
      'values'
      '  (:IDOPERDIREITOXINV, :IDINVESTIMENTO, :IDOPERACAODIREITO, '
      ':ORIGDEST)')
    DeleteSQL.Strings = (
      'delete from OPERDIREITOXINV'
      'where'
      '  IDOPERDIREITOXINV = :OLD_IDOPERDIREITOXINV')
    Left = 436
    Top = 210
  end
  inherited qryDetalhe: TwwQuery
    SQL.Strings = (
      
        'SELECT O.IDOPERDIREITOXINV, O.IDINVESTIMENTO, I.DESCINVESTIMENTO' +
        ', O.IDOPERACAODIREITO,'
      '       O.ORIGDEST, OD.DESCRICAO'
      'FROM OPERDIREITOXINV O, INVESTIMENTO I,'
      ''
      '     (SELECT '#39'O'#39' AS ORIGDEST, '#39'Origem'#39' AS DESCRICAO FROM DUAL'
      '      UNION'
      
        '      SELECT '#39'D'#39' AS ORIGDEST, '#39'Destino'#39' AS DESCRICAO FROM DUAL) ' +
        'OD'
      ''
      'WHERE O.IDOPERACAODIREITO = :IDOPERACAODIREITO'
      '  AND O.IDINVESTIMENTO    = I.IDINVESTIMENTO'
      '  AND O.ORIGDEST          = OD.ORIGDEST'
      'ORDER BY ORIGDEST DESC, DESCINVESTIMENTO'
      ' ')
    Left = 408
    Top = 210
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptResult
      end>
    object qryDetalheDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 80
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object qryDetalheDESCRICAO: TStringField
      DisplayLabel = 'Origem / Destino'
      DisplayWidth = 19
      FieldName = 'DESCRICAO'
      Size = 7
    end
    object qryDetalheORIGDEST: TStringField
      DisplayLabel = 'Origem / Destino'
      DisplayWidth = 15
      FieldName = 'ORIGDEST'
      Origin = 'BASEDADOS.OPERDIREITOXINV.ORIGDEST'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryDetalheIDOPERDIREITOXINV: TFloatField
      FieldName = 'IDOPERDIREITOXINV'
      Origin = 'BASEDADOS.OPERDIREITOXINV.IDOPERDIREITOXINV'
      Visible = False
    end
    object qryDetalheIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.OPERDIREITOXINV.IDINVESTIMENTO'
      Visible = False
    end
    object qryDetalheIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
      Origin = 'BASEDADOS.OPERDIREITOXINV.IDOPERACAODIREITO'
      Visible = False
    end
  end
  object qryOrigem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT OI.NUMDOCUMENTO, PP.PLANPRVCONTABPATRO, IV.DESCINVESTIMEN' +
        'TO, TP.DESCTIPOOPERACAO,'
      
        '       CI.DESCCARTINVEST, OI.QTDEOPERACAO, OI.VLROPERACAO, OI.VL' +
        'RIRREMUNER,'
      
        '       OI.VLRIR,  (OI.VLROPERACAO - OI.VLRIR + OI.VLRIRREMUNER) ' +
        'AS VLRLIQUIDO,'
      
        '       CT.SGLCUSTODIANTE, MB.SIGLAMOTBLOQ, OD.DATAEX AS DATABASE' +
        ','
      
        '       OI.IDOPERACAOINVEST, OI.MOECODIGO, OI.IDMODULO, OI.ORIGDE' +
        'ST, OI.EMPRESAPROP,'
      
        '       OI.IDINVESTIMENTO, OI.IDCARTEIRAINVEST, OI.IDTIPOINVEST, ' +
        'OI.IDTIPOOPERACAO,'
      '       OI.DATAOPERACAO, OI.NUMDOCUMENTO, OI.PRECOUNITOPERACAO,'
      
        '       OI.DATAVENCOPER, OI.IDFORCLI, OI.IDLOTE, OI.IDCUSTODIANTE' +
        ', OI.FLGSTATUSFECHBOL,'
      
        '       OI.FLGSTATUSORDMOV, OI.IDOPERACAODIREITO, OI.VLRREMUNERAC' +
        'AO, OI.PERCENTUAL,'
      
        '       OI.IDCARTEIRAGERENC, OI.IDPLANPREVCTBPATR, OI.IDOPERCUSTO' +
        'DIA, OI.IDCUSTORIG,'
      
        '       OI.IDMOTIVOBLOQUEIO, TP.NATUREZAOPERACAO, CI.IDCARTEIRA, ' +
        '0 AS QTDEEXERCIDA,'
      '       '#39'N'#39' AS ALTERADO'
      
        'FROM OPERACAOINVEST OI, INVESTIMENTO IV, CUSTODIANTE CT, VWPLANP' +
        'REVCTBPATR PP,'
      '     (SELECT IDMOTIVOBLOQUEIO,'
      
        '             DECODE(IDMOTIVOBLOQUEIO, -1,'#39#39', SIGLAMOTBLOQ) AS SI' +
        'GLAMOTBLOQ,'
      
        '             DECODE(IDMOTIVOBLOQUEIO, -1,'#39#39', DESCMOTBLOQ) AS DES' +
        'CMOTBLOQ'
      '      FROM MOTIVOBLOQUEIO) MB,'
      '      OPERACAODIREITO OD, TIPOOPERACAO TP,'
      
        '     (SELECT LPAD(IDCARTEIRAINVEST,2,'#39'0'#39') || NULL AS IDCARTEIRA,' +
        ' IDCARTEIRAINVEST, NULL AS IDCARTEIRAGERENC, DESCCARTINVEST'
      '      FROM CARTEIRAINVEST'
      '      WHERE IDTIPOINVEST = 2'
      '      UNION'
      
        '      SELECT LPAD(CG.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(CG.IDCARTEI' +
        'RAGERENC,2,'#39'0'#39') AS IDCARTEIRA, CG.IDCARTEIRAINVEST, CG.IDCARTEIR' +
        'AGERENC, CG.DESCCARTGERENC AS DESCCARTINVEST'
      '      FROM'
      '        CARTEIRAGERENC CG, CARTEIRAINVEST CI, PARAMINVEST PI'
      '      WHERE CG.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST'
      '         AND ((PI.FLGCARTGERENC = '#39'S'#39') OR'
      
        '              ((NVL(PI.FLGCARTGERENC, '#39'N'#39') = '#39'N'#39') AND (PI.DATAMO' +
        'VCDBLIB > TO_DATE(:DATAEX,'#39'DD/MM/YYYY'#39'))))) CI'
      ''
      'WHERE OI.IDOPERACAODIREITO = :IDOPERACAODIREITO'
      '  AND OD.IDOPERACAODIREITO = :IDOPERACAODIREITO'
      '  AND OI.ORIGDEST          = '#39'O'#39
      '  AND OI.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR'
      '  AND OI.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO'
      '  AND OI.IDINVESTIMENTO    = IV.IDINVESTIMENTO'
      
        '  AND ((LPAD(OI.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(OI.IDCARTEIRAGER' +
        'ENC,2,'#39'0'#39')) = CI.IDCARTEIRA)'
      '  AND OI.IDCUSTODIANTE     = CT.IDCUSTODIANTE(+)'
      '  AND OI.IDMOTIVOBLOQUEIO  = MB.IDMOTIVOBLOQUEIO(+)'
      'ORDER BY OI.DATAOPERACAO, OI.IDOPERACAOINVEST'
      ' '
      ' ')
    UpdateObject = updOrigem
    ValidateWithMask = True
    Left = 504
    Top = 210
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAEX'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptInput
      end>
    object qryOrigemNUMDOCUMENTO: TStringField
      DisplayLabel = 'Boleta'
      DisplayWidth = 12
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryOrigemPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 40
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryOrigemDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 34
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryOrigemDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 21
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryOrigemDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 40
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryOrigemSGLCUSTODIANTE: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 15
      FieldName = 'SGLCUSTODIANTE'
      Size = 10
    end
    object qryOrigemSIGLAMOTBLOQ: TStringField
      DisplayLabel = 'Bloqueio'
      DisplayWidth = 7
      FieldName = 'SIGLAMOTBLOQ'
      Size = 3
    end
    object qryOrigemQTDEOPERACAO: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 20
      FieldName = 'QTDEOPERACAO'
      DisplayFormat = '###,###,###,##0'
    end
    object qryOrigemVLROPERACAO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 18
      FieldName = 'VLROPERACAO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryOrigemDATABASE: TDateTimeField
      DisplayLabel = 'Data Base'
      DisplayWidth = 10
      FieldName = 'DATABASE'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryOrigemDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Data Operação'
      DisplayWidth = 15
      FieldName = 'DATAOPERACAO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryOrigemDATAVENCOPER: TDateTimeField
      DisplayLabel = 'Data Vencimento'
      DisplayWidth = 15
      FieldName = 'DATAVENCOPER'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryOrigemPRECOUNITOPERACAO: TFloatField
      DisplayLabel = 'Preço Unitário'
      DisplayWidth = 20
      FieldName = 'PRECOUNITOPERACAO'
      Visible = False
      DisplayFormat = '#,##0.00#######'
    end
    object qryOrigemVLRREMUNERACAO: TFloatField
      DisplayLabel = 'Remuneração'
      DisplayWidth = 15
      FieldName = 'VLRREMUNERACAO'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryOrigemVLRIRREMUNER: TFloatField
      DisplayLabel = 'IR s/ Remuneração'
      DisplayWidth = 15
      FieldName = 'VLRIRREMUNER'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryOrigemVLRIR: TFloatField
      DisplayLabel = 'I.R.'
      DisplayWidth = 15
      FieldName = 'VLRIR'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryOrigemVLRLIQUIDO: TFloatField
      DisplayLabel = 'Valor Líquido'
      DisplayWidth = 18
      FieldName = 'VLRLIQUIDO'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryOrigemIDOPERACAOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERACAOINVEST'
      Visible = False
    end
    object qryOrigemMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object qryOrigemIDMODULO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMODULO'
      Visible = False
    end
    object qryOrigemORIGDEST: TStringField
      DisplayWidth = 1
      FieldName = 'ORIGDEST'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOrigemEMPRESAPROP: TFloatField
      DisplayWidth = 10
      FieldName = 'EMPRESAPROP'
      Visible = False
    end
    object qryOrigemIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryOrigemIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryOrigemIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object qryOrigemIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object qryOrigemNUMDOCUMENTO_1: TStringField
      DisplayWidth = 30
      FieldName = 'NUMDOCUMENTO_1'
      Visible = False
      Size = 30
    end
    object qryOrigemIDFORCLI: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFORCLI'
      Visible = False
    end
    object qryOrigemIDLOTE: TStringField
      DisplayWidth = 10
      FieldName = 'IDLOTE'
      Visible = False
      Size = 10
    end
    object qryOrigemIDCUSTODIANTE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object qryOrigemFLGSTATUSFECHBOL: TStringField
      DisplayWidth = 1
      FieldName = 'FLGSTATUSFECHBOL'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOrigemFLGSTATUSORDMOV: TStringField
      DisplayWidth = 1
      FieldName = 'FLGSTATUSORDMOV'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOrigemIDOPERACAODIREITO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERACAODIREITO'
      Visible = False
    end
    object qryOrigemPERCENTUAL: TFloatField
      DisplayWidth = 10
      FieldName = 'PERCENTUAL'
      Visible = False
      DisplayFormat = '##0.#########'
    end
    object qryOrigemIDCARTEIRAGERENC: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAGERENC'
      Visible = False
    end
    object qryOrigemIDPLANPREVCTBPATR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryOrigemIDOPERCUSTODIA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERCUSTODIA'
      Visible = False
    end
    object qryOrigemIDCUSTORIG: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCUSTORIG'
      Visible = False
    end
    object qryOrigemIDMOTIVOBLOQUEIO: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
      Visible = False
    end
    object qryOrigemNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOrigemIDCARTEIRA: TStringField
      DisplayWidth = 4
      FieldName = 'IDCARTEIRA'
      Visible = False
      Size = 4
    end
    object qryOrigemQTDEEXERCIDA: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDEEXERCIDA'
      Visible = False
    end
    object qryOrigemALTERADO: TStringField
      DisplayWidth = 1
      FieldName = 'ALTERADO'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object updOrigem: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERACAOINVEST'
      'set'
      '  NUMDOCUMENTO = :NUMDOCUMENTO,'
      '  QTDEOPERACAO = :QTDEOPERACAO,'
      '  VLROPERACAO = :VLROPERACAO,'
      '  VLRIRREMUNER = :VLRIRREMUNER,'
      '  VLRIR = :VLRIR,'
      '  MOECODIGO = :MOECODIGO,'
      '  IDMODULO = :IDMODULO,'
      '  ORIGDEST = :ORIGDEST,'
      '  EMPRESAPROP = :EMPRESAPROP,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  DATAOPERACAO = :DATAOPERACAO,'
      '  PRECOUNITOPERACAO = :PRECOUNITOPERACAO,'
      '  DATAVENCOPER = :DATAVENCOPER,'
      '  IDFORCLI = :IDFORCLI,'
      '  IDLOTE = :IDLOTE,'
      '  IDCUSTODIANTE = :IDCUSTODIANTE,'
      '  FLGSTATUSFECHBOL = :FLGSTATUSFECHBOL,'
      '  FLGSTATUSORDMOV = :FLGSTATUSORDMOV,'
      '  IDOPERACAODIREITO = :IDOPERACAODIREITO,'
      '  VLRREMUNERACAO = :VLRREMUNERACAO,'
      '  PERCENTUAL = :PERCENTUAL,'
      '  IDCARTEIRAGERENC = :IDCARTEIRAGERENC,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  IDOPERCUSTODIA = :IDOPERCUSTODIA,'
      '  IDCUSTORIG = :IDCUSTORIG,'
      '  IDMOTIVOBLOQUEIO = :IDMOTIVOBLOQUEIO'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    InsertSQL.Strings = (
      'insert into OPERACAOINVEST'
      '  (NUMDOCUMENTO, QTDEOPERACAO, VLROPERACAO, VLRIRREMUNER, '
      'VLRIR, IDOPERACAOINVEST, '
      '   MOECODIGO, IDMODULO, ORIGDEST, EMPRESAPROP, IDINVESTIMENTO, '
      'IDCARTEIRAINVEST, '
      
        '   IDTIPOINVEST, IDTIPOOPERACAO, DATAOPERACAO, PRECOUNITOPERACAO' +
        ', '
      'DATAVENCOPER, '
      '   IDFORCLI, IDLOTE, IDCUSTODIANTE, FLGSTATUSFECHBOL, '
      'FLGSTATUSORDMOV, '
      '   IDOPERACAODIREITO, VLRREMUNERACAO, PERCENTUAL, '
      'IDCARTEIRAGERENC, IDPLANPREVCTBPATR, '
      '   IDOPERCUSTODIA, IDCUSTORIG, IDMOTIVOBLOQUEIO)'
      'values'
      '  (:NUMDOCUMENTO, :QTDEOPERACAO, :VLROPERACAO, :VLRIRREMUNER, '
      ':VLRIR, :IDOPERACAOINVEST, '
      
        '   :MOECODIGO, :IDMODULO, :ORIGDEST, :EMPRESAPROP, :IDINVESTIMEN' +
        'TO, '
      ':IDCARTEIRAINVEST, '
      '   :IDTIPOINVEST, :IDTIPOOPERACAO, :DATAOPERACAO, '
      ':PRECOUNITOPERACAO, :DATAVENCOPER, '
      '   :IDFORCLI, :IDLOTE, :IDCUSTODIANTE, :FLGSTATUSFECHBOL, '
      ':FLGSTATUSORDMOV, '
      '   :IDOPERACAODIREITO, :VLRREMUNERACAO, :PERCENTUAL, '
      ':IDCARTEIRAGERENC, '
      '   :IDPLANPREVCTBPATR, :IDOPERCUSTODIA, :IDCUSTORIG, '
      ':IDMOTIVOBLOQUEIO)')
    DeleteSQL.Strings = (
      'delete from OPERACAOINVEST'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    Left = 532
    Top = 210
  end
  object dsOrigem: TwwDataSource
    AutoEdit = False
    DataSet = qryOrigem
    OnStateChange = dsOrigemStateChange
    Left = 560
    Top = 210
  end
  object qryDestino: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT OI.NUMDOCUMENTO, PP.PLANPRVCONTABPATRO, IV.DESCINVESTIMEN' +
        'TO, TP.DESCTIPOOPERACAO,'
      
        '       CI.DESCCARTINVEST, OI.QTDEOPERACAO, OI.VLROPERACAO, OI.VL' +
        'RIRREMUNER,'
      
        '       OI.VLRIR,  (OI.VLROPERACAO - OI.VLRIR + OI.VLRIRREMUNER) ' +
        'AS VLRLIQUIDO,'
      
        '       CT.SGLCUSTODIANTE, MB.SIGLAMOTBLOQ, OD.DATAEX AS DATABASE' +
        ','
      
        '       OI.IDOPERACAOINVEST, OI.MOECODIGO, OI.IDMODULO, OI.ORIGDE' +
        'ST, OI.EMPRESAPROP,'
      
        '       OI.IDINVESTIMENTO, OI.IDCARTEIRAINVEST, OI.IDTIPOINVEST, ' +
        'OI.IDTIPOOPERACAO,'
      '       OI.DATAOPERACAO, OI.NUMDOCUMENTO, OI.PRECOUNITOPERACAO,'
      
        '       OI.DATAVENCOPER, OI.IDFORCLI, OI.IDLOTE, OI.IDCUSTODIANTE' +
        ', OI.FLGSTATUSFECHBOL,'
      
        '       OI.FLGSTATUSORDMOV, OI.IDOPERACAODIREITO, OI.VLRREMUNERAC' +
        'AO, OI.PERCENTUAL,'
      
        '       OI.IDCARTEIRAGERENC, OI.IDPLANPREVCTBPATR, OI.IDOPERCUSTO' +
        'DIA, OI.IDCUSTORIG,'
      
        '       OI.IDMOTIVOBLOQUEIO, TP.NATUREZAOPERACAO, CI.IDCARTEIRA, ' +
        'OI.IDOPERACAOORIGEM,'
      '       '#39'N'#39' AS ALTERADO, TP.FLGCONTAINVEST'
      
        'FROM OPERACAOINVEST OI, INVESTIMENTO IV, CUSTODIANTE CT, VWPLANP' +
        'REVCTBPATR PP,'
      '     (SELECT IDMOTIVOBLOQUEIO,'
      
        '             DECODE(IDMOTIVOBLOQUEIO, -1,'#39#39', SIGLAMOTBLOQ) AS SI' +
        'GLAMOTBLOQ,'
      
        '             DECODE(IDMOTIVOBLOQUEIO, -1,'#39#39', DESCMOTBLOQ) AS DES' +
        'CMOTBLOQ'
      '      FROM MOTIVOBLOQUEIO) MB,'
      '      OPERACAODIREITO OD, TIPOOPERACAO TP,'
      
        '     (SELECT LPAD(IDCARTEIRAINVEST,2,'#39'0'#39') || NULL AS IDCARTEIRA,' +
        ' IDCARTEIRAINVEST, NULL AS IDCARTEIRAGERENC, DESCCARTINVEST'
      '      FROM CARTEIRAINVEST'
      '      WHERE IDTIPOINVEST = 2'
      '      UNION'
      
        '      SELECT LPAD(CG.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(CG.IDCARTEI' +
        'RAGERENC,2,'#39'0'#39') AS IDCARTEIRA, CG.IDCARTEIRAINVEST, CG.IDCARTEIR' +
        'AGERENC, CG.DESCCARTGERENC AS DESCCARTINVEST'
      '      FROM'
      '        CARTEIRAGERENC CG, CARTEIRAINVEST CI, PARAMINVEST PI'
      '      WHERE CG.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST'
      '         AND ((PI.FLGCARTGERENC = '#39'S'#39') OR'
      
        '              ((NVL(PI.FLGCARTGERENC, '#39'N'#39') = '#39'N'#39') AND (PI.DATAMO' +
        'VCDBLIB > TO_DATE(:DATAEX,'#39'DD/MM/YYYY'#39'))))) CI'
      ''
      'WHERE OI.IDOPERACAODIREITO = :IDOPERACAODIREITO'
      '  AND OD.IDOPERACAODIREITO = :IDOPERACAODIREITO'
      '  AND OI.ORIGDEST          = '#39'D'#39
      '  AND OI.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO'
      '  AND OI.IDINVESTIMENTO    = IV.IDINVESTIMENTO'
      '  AND OI.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR'
      
        '  AND ((LPAD(OI.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(OI.IDCARTEIRAGER' +
        'ENC,2,'#39'0'#39')) = CI.IDCARTEIRA)'
      '  AND OI.IDCUSTODIANTE     = CT.IDCUSTODIANTE(+)'
      '  AND OI.IDMOTIVOBLOQUEIO  = MB.IDMOTIVOBLOQUEIO(+)'
      'ORDER BY OI.DATAOPERACAO, OI.IDOPERACAOINVEST'
      ''
      ''
      ''
      ' '
      ' ')
    UpdateObject = updDestino
    ValidateWithMask = True
    Left = 600
    Top = 210
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAEX'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptInput
      end>
    object qryDestinoNUMDOCUMENTO: TStringField
      DisplayLabel = 'Boleta'
      DisplayWidth = 12
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryDestinoPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 40
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryDestinoDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 34
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryDestinoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 21
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryDestinoDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 40
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryDestinoSGLCUSTODIANTE: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 15
      FieldName = 'SGLCUSTODIANTE'
      Size = 10
    end
    object qryDestinoSIGLAMOTBLOQ: TStringField
      DisplayLabel = 'Bloqueio'
      DisplayWidth = 7
      FieldName = 'SIGLAMOTBLOQ'
      Size = 3
    end
    object qryDestinoQTDEOPERACAO: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 20
      FieldName = 'QTDEOPERACAO'
      DisplayFormat = '###,###,###,##0'
    end
    object qryDestinoVLROPERACAO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 18
      FieldName = 'VLROPERACAO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryDestinoDATABASE: TDateTimeField
      DisplayLabel = 'Data Base'
      DisplayWidth = 10
      FieldName = 'DATABASE'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryDestinoDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Data Operação'
      DisplayWidth = 10
      FieldName = 'DATAOPERACAO'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryDestinoDATAVENCOPER: TDateTimeField
      DisplayLabel = 'Data Vencimento'
      DisplayWidth = 10
      FieldName = 'DATAVENCOPER'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryDestinoPRECOUNITOPERACAO: TFloatField
      DisplayLabel = 'Preço Unitário'
      DisplayWidth = 20
      FieldName = 'PRECOUNITOPERACAO'
      Visible = False
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryDestinoVLRREMUNERACAO: TFloatField
      DisplayLabel = 'Remuneração'
      DisplayWidth = 15
      FieldName = 'VLRREMUNERACAO'
      Visible = False
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryDestinoVLRIRREMUNER: TFloatField
      DisplayLabel = 'IR s/ Remuneração'
      DisplayWidth = 15
      FieldName = 'VLRIRREMUNER'
      Visible = False
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryDestinoVLRIR: TFloatField
      DisplayLabel = 'I.R.'
      DisplayWidth = 15
      FieldName = 'VLRIR'
      Visible = False
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryDestinoVLRLIQUIDO: TFloatField
      DisplayLabel = 'Valor Líquido'
      DisplayWidth = 18
      FieldName = 'VLRLIQUIDO'
      Visible = False
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryDestinoIDOPERACAOINVEST: TFloatField
      DisplayWidth = 17
      FieldName = 'IDOPERACAOINVEST'
      Visible = False
    end
    object qryDestinoMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object qryDestinoIDMODULO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMODULO'
      Visible = False
    end
    object qryDestinoORIGDEST: TStringField
      DisplayWidth = 9
      FieldName = 'ORIGDEST'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryDestinoEMPRESAPROP: TFloatField
      DisplayWidth = 13
      FieldName = 'EMPRESAPROP'
      Visible = False
    end
    object qryDestinoIDINVESTIMENTO: TFloatField
      DisplayWidth = 15
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryDestinoIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 17
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryDestinoIDTIPOINVEST: TFloatField
      DisplayWidth = 12
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object qryDestinoIDTIPOOPERACAO: TFloatField
      DisplayWidth = 15
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object qryDestinoNUMDOCUMENTO_1: TStringField
      DisplayWidth = 30
      FieldName = 'NUMDOCUMENTO_1'
      Visible = False
      Size = 30
    end
    object qryDestinoIDFORCLI: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFORCLI'
      Visible = False
    end
    object qryDestinoIDLOTE: TStringField
      DisplayWidth = 10
      FieldName = 'IDLOTE'
      Visible = False
      Size = 10
    end
    object qryDestinoIDCUSTODIANTE: TFloatField
      DisplayWidth = 14
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object qryDestinoFLGSTATUSFECHBOL: TStringField
      DisplayWidth = 18
      FieldName = 'FLGSTATUSFECHBOL'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryDestinoFLGSTATUSORDMOV: TStringField
      DisplayWidth = 18
      FieldName = 'FLGSTATUSORDMOV'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryDestinoIDOPERACAODIREITO: TFloatField
      DisplayWidth = 18
      FieldName = 'IDOPERACAODIREITO'
      Visible = False
    end
    object qryDestinoPERCENTUAL: TFloatField
      DisplayWidth = 11
      FieldName = 'PERCENTUAL'
      Visible = False
    end
    object qryDestinoIDCARTEIRAGERENC: TFloatField
      DisplayWidth = 18
      FieldName = 'IDCARTEIRAGERENC'
      Visible = False
    end
    object qryDestinoIDPLANPREVCTBPATR: TFloatField
      DisplayWidth = 19
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryDestinoIDOPERCUSTODIA: TFloatField
      DisplayWidth = 15
      FieldName = 'IDOPERCUSTODIA'
      Visible = False
    end
    object qryDestinoIDCUSTORIG: TFloatField
      DisplayWidth = 11
      FieldName = 'IDCUSTORIG'
      Visible = False
    end
    object qryDestinoIDMOTIVOBLOQUEIO: TFloatField
      DisplayWidth = 17
      FieldName = 'IDMOTIVOBLOQUEIO'
      Visible = False
    end
    object qryDestinoNATUREZAOPERACAO: TStringField
      DisplayWidth = 19
      FieldName = 'NATUREZAOPERACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryDestinoIDCARTEIRA: TStringField
      FieldName = 'IDCARTEIRA'
      Visible = False
      Size = 4
    end
    object qryDestinoIDOPERACAOORIGEM: TFloatField
      FieldName = 'IDOPERACAOORIGEM'
      Visible = False
    end
    object qryDestinoALTERADO: TStringField
      FieldName = 'ALTERADO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryDestinoFLGCONTAINVEST: TFloatField
      FieldName = 'FLGCONTAINVEST'
    end
  end
  object updDestino: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERACAOINVEST'
      'set'
      '  NUMDOCUMENTO = :NUMDOCUMENTO,'
      '  QTDEOPERACAO = :QTDEOPERACAO,'
      '  VLROPERACAO = :VLROPERACAO,'
      '  VLRIRREMUNER = :VLRIRREMUNER,'
      '  VLRIR = :VLRIR,'
      '  MOECODIGO = :MOECODIGO,'
      '  IDMODULO = :IDMODULO,'
      '  ORIGDEST = :ORIGDEST,'
      '  EMPRESAPROP = :EMPRESAPROP,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  DATAOPERACAO = :DATAOPERACAO,'
      '  PRECOUNITOPERACAO = :PRECOUNITOPERACAO,'
      '  DATAVENCOPER = :DATAVENCOPER,'
      '  IDFORCLI = :IDFORCLI,'
      '  IDLOTE = :IDLOTE,'
      '  IDCUSTODIANTE = :IDCUSTODIANTE,'
      '  FLGSTATUSFECHBOL = :FLGSTATUSFECHBOL,'
      '  FLGSTATUSORDMOV = :FLGSTATUSORDMOV,'
      '  IDOPERACAODIREITO = :IDOPERACAODIREITO,'
      '  VLRREMUNERACAO = :VLRREMUNERACAO,'
      '  PERCENTUAL = :PERCENTUAL,'
      '  IDCARTEIRAGERENC = :IDCARTEIRAGERENC,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  IDOPERCUSTODIA = :IDOPERCUSTODIA,'
      '  IDCUSTORIG = :IDCUSTORIG,'
      '  IDMOTIVOBLOQUEIO = :IDMOTIVOBLOQUEIO,'
      '  IDOPERACAOORIGEM = :IDOPERACAOORIGEM'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    InsertSQL.Strings = (
      'insert into OPERACAOINVEST'
      '  (NUMDOCUMENTO, QTDEOPERACAO, VLROPERACAO, VLRIRREMUNER, '
      'VLRIR, IDOPERACAOINVEST, '
      '   MOECODIGO, IDMODULO, ORIGDEST, EMPRESAPROP, IDINVESTIMENTO, '
      'IDCARTEIRAINVEST, '
      
        '   IDTIPOINVEST, IDTIPOOPERACAO, DATAOPERACAO, PRECOUNITOPERACAO' +
        ', '
      'DATAVENCOPER, '
      '   IDFORCLI, IDLOTE, IDCUSTODIANTE, FLGSTATUSFECHBOL, '
      'FLGSTATUSORDMOV, '
      '   IDOPERACAODIREITO, VLRREMUNERACAO, PERCENTUAL, '
      'IDCARTEIRAGERENC, IDPLANPREVCTBPATR, '
      '   IDOPERCUSTODIA, IDCUSTORIG, IDMOTIVOBLOQUEIO, '
      'IDOPERACAOORIGEM)'
      'values'
      '  (:NUMDOCUMENTO, :QTDEOPERACAO, :VLROPERACAO, :VLRIRREMUNER, '
      ':VLRIR, :IDOPERACAOINVEST, '
      
        '   :MOECODIGO, :IDMODULO, :ORIGDEST, :EMPRESAPROP, :IDINVESTIMEN' +
        'TO, '
      ':IDCARTEIRAINVEST, '
      '   :IDTIPOINVEST, :IDTIPOOPERACAO, :DATAOPERACAO, '
      ':PRECOUNITOPERACAO, :DATAVENCOPER, '
      '   :IDFORCLI, :IDLOTE, :IDCUSTODIANTE, :FLGSTATUSFECHBOL, '
      ':FLGSTATUSORDMOV, '
      '   :IDOPERACAODIREITO, :VLRREMUNERACAO, :PERCENTUAL, '
      ':IDCARTEIRAGERENC, '
      '   :IDPLANPREVCTBPATR, :IDOPERCUSTODIA, :IDCUSTORIG, '
      ':IDMOTIVOBLOQUEIO, :IDOPERACAOORIGEM)'
      '')
    DeleteSQL.Strings = (
      'delete from OPERACAOINVEST'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    Left = 628
    Top = 210
  end
  object dsDestino: TwwDataSource
    AutoEdit = False
    DataSet = qryDestino
    OnStateChange = dsDetStateChange
    Left = 656
    Top = 210
  end
  object QryEmissor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT EM.IDEMISSOR, EM.SIGLAEMISSOR'
      'FROM EMISSOR EM, INVESTIMENTO IV'
      'WHERE IV.IDTIPOINVEST = 2'
      '  AND EM.IDEMISSOR = IV.IDEMISSOR'
      'ORDER BY EM.SIGLAEMISSOR')
    ValidateWithMask = True
    Left = 193
    Top = 52
    object QryEmissorSIGLAEMISSOR: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 15
      FieldName = 'SIGLAEMISSOR'
      Size = 15
    end
    object QryEmissorIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Visible = False
    end
  end
  object qryTipoDireito: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#39'A'#39' AS FLGTIPODIREITO, '#39'Antigo                   '#39' AS DES' +
        'CRICAO FROM DUAL'
      'UNION'
      
        'SELECT '#39'N'#39' AS FLGTIPODIREITO, '#39'Novo                     '#39' AS DES' +
        'CRICAO FROM DUAL'
      'UNION'
      
        'SELECT '#39'P'#39' AS FLGTIPODIREITO, '#39'Proporcional             '#39' AS DES' +
        'CRICAO FROM DUAL'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 441
    Top = 52
    object qryTipoDireitoDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 25
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 25
    end
    object qryTipoDireitoFLGTIPODIREITO: TStringField
      FieldName = 'FLGTIPODIREITO'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object qryInvestimentoAcao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '    I.IDINVESTIMENTO, I.DESCINVESTIMENTO, C.QTDTITLOTE,'
      '    I.IDTIPOINVEST, I.IDEMISSOR, I.IDMOEDACONTAB'
      'FROM  INVESTIMENTO I, COTACAOINVEST C'
      'WHERE (I.IDTIPOINVEST = 2)'
      '  AND (I.IDINVESTIMENTO||C.DATACOTACAO IN ('
      
        '                       SELECT I.IDINVESTIMENTO||MAX(C1.DATACOTAC' +
        'AO)'
      '                       FROM INVESTIMENTO I, COTACAOINVEST C1'
      '                       WHERE  (I.IDTIPOINVEST = 2)'
      
        '                         AND ((:DATACOTACAO IS NULL) OR (C1.DATA' +
        'COTACAO <= TO_DATE(:DATACOTACAO,'#39'DD/MM/YYYY'#39')))'
      
        '                         AND  (I.IDINVESTIMENTO = C1.IDINVESTIME' +
        'NTO)'
      '   '#9'               GROUP BY I.IDINVESTIMENTO))'
      '  AND (I.IDINVESTIMENTO = C.IDINVESTIMENTO)'
      'ORDER BY I.DESCINVESTIMENTO'
      ''
      '')
    ValidateWithMask = True
    Left = 618
    Top = 334
    ParamData = <
      item
        DataType = ftString
        Name = 'DATACOTACAO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATACOTACAO'
        ParamType = ptResult
      end>
    object qryInvestimentoAcaoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object qryInvestimentoAcaoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.IDINVESTIMENTO'
      Visible = False
    end
    object qryInvestimentoAcaoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.INVESTIMENTO.IDTIPOINVEST'
      Visible = False
    end
    object qryInvestimentoAcaoIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Origin = 'BASEDADOS.INVESTIMENTO.IDEMISSOR'
      Visible = False
    end
    object qryInvestimentoAcaoIDMOEDACONTAB: TFloatField
      FieldName = 'IDMOEDACONTAB'
      Origin = 'BASEDADOS.INVESTIMENTO.IDMOEDACONTAB'
    end
    object qryInvestimentoAcaoQTDTITLOTE: TFloatField
      FieldName = 'QTDTITLOTE'
    end
  end
  object qryTipoOperacao: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT T.FLGAGE, T.FLGDATAEX, T.FLGDATACOM, T.FLGPRZBOLSA, T.FLG' +
        'PRZEMP, T.FLGATADEC,'
      
        '       T.FLGFORMAPAGREC, T.FLGDIVACAO, T.FLGINIPAG, T.FLGJUROS, ' +
        'T.FLGPARIDADE,'
      
        '       T.FLGINVORIGEM, T.FLGPERC, T.DESCTIPOOPERACAO, T.IDTIPOOP' +
        'ERACAO, T.IDTIPOINVEST,'
      
        '       T.FLGGRAVAIRLITIGIO, T.FLGISENTOIR, T.NATUREZAOPERACAO, T' +
        '.IDMERCADO, T.FLGTRATAIR,'
      
        '       T.TIPCREDOR, T.RECPAG, T.VENCIMENTO, T.FLGGERACONTAB, T.F' +
        'LGGERACAPCAR'
      'FROM TIPOOPERACAO T, PARAMINVEST P'
      'WHERE (T.IDTIPOOPERACAO = P.IDTIPOOPERDIRBON)'
      'ORDER BY DESCTIPOOPERACAO'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 353
    Top = 54
    object qryTipoOperacaoFLGAGE: TStringField
      FieldName = 'FLGAGE'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGDATAEX: TStringField
      FieldName = 'FLGDATAEX'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGDATACOM: TStringField
      FieldName = 'FLGDATACOM'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGPRZBOLSA: TStringField
      FieldName = 'FLGPRZBOLSA'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGPRZEMP: TStringField
      FieldName = 'FLGPRZEMP'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGATADEC: TStringField
      FieldName = 'FLGATADEC'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGFORMAPAGREC: TStringField
      FieldName = 'FLGFORMAPAGREC'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGDIVACAO: TStringField
      FieldName = 'FLGDIVACAO'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGINIPAG: TStringField
      FieldName = 'FLGINIPAG'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGJUROS: TStringField
      FieldName = 'FLGJUROS'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGPARIDADE: TStringField
      FieldName = 'FLGPARIDADE'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGINVORIGEM: TStringField
      FieldName = 'FLGINVORIGEM'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGPERC: TStringField
      FieldName = 'FLGPERC'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryTipoOperacaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryTipoOperacaoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object qryTipoOperacaoFLGGRAVAIRLITIGIO: TStringField
      FieldName = 'FLGGRAVAIRLITIGIO'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGISENTOIR: TStringField
      FieldName = 'FLGISENTOIR'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDMERCADO'
    end
    object qryTipoOperacaoFLGTRATAIR: TStringField
      FieldName = 'FLGTRATAIR'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGTRATAIR'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoTIPCREDOR: TStringField
      FieldName = 'TIPCREDOR'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPCREDOR'
      Size = 2
    end
    object qryTipoOperacaoRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'BASEDADOS.TIPOOPERACAO.RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoVENCIMENTO: TFloatField
      FieldName = 'VENCIMENTO'
      Origin = 'BASEDADOS.TIPOOPERACAO.VENCIMENTO'
    end
    object qryTipoOperacaoFLGGERACONTAB: TFloatField
      FieldName = 'FLGGERACONTAB'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGERACONTAB'
    end
    object qryTipoOperacaoFLGGERACAPCAR: TFloatField
      FieldName = 'FLGGERACAPCAR'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGERACAPCAR'
    end
  end
  object QryBuscaOperDireito: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM OPERACAODIREITO O,'
      '     (SELECT * FROM OPERDIREITOXINV WHERE ORIGDEST = '#39'O'#39') ORIG,'
      '     (SELECT * FROM OPERDIREITOXINV WHERE ORIGDEST = '#39'D'#39') DEST'
      'WHERE IDTIPOOPERACAO = :P_IDTIPOOPERACAO'
      '  AND IDEMISSOR      = :P_IDEMISSOR'
      '  AND DATAEX         = TO_DATE(:P_DATAEX,'#39'DD/MM/YYYY'#39')'
      '  AND DATAAGE        = TO_DATE(:P_DATAAGE,'#39'DD/MM/YYYY'#39')'
      '  AND DATACOM        = TO_DATE(:P_DATACOM,'#39'DD/MM/YYYY'#39')'
      '  AND ORIG.IDOPERACAODIREITO = O.IDOPERACAODIREITO'
      '  AND DEST.IDOPERACAODIREITO = O.IDOPERACAODIREITO'
      '  AND ORIG.IDINVESTIMENTO = :INVORIG'
      '  AND DEST.IDINVESTIMENTO = :INVDEST')
    ValidateWithMask = True
    Left = 483
    Top = 1
    ParamData = <
      item
        DataType = ftInteger
        Name = 'P_IDTIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'P_IDEMISSOR'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'P_DATAEX'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'P_DATAAGE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'P_DATACOM'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'INVORIG'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'INVDEST'
        ParamType = ptResult
      end>
  end
  object QrySaldoOrigem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT TT.TIPO,'
      
        '       PP.PLANPRVCONTABPATRO, IV.DESCINVESTIMENTO, TT.DESCCARTIN' +
        'VEST, CT.SGLCUSTODIANTE,'
      '       TT.SIGLAMOTBLOQ, TT.IDLOTE,'
      '       TT.QTDE,'
      '       TT.DATAREFERENCIA,'
      
        '       TT.QTDEDIREITO, TT.VALOREXERCIDO, TT.VLRREMUNERACAO, TT.I' +
        'R, TT.VLRLIQ,'
      '       TT.VLRIRREMUNERACAO, TT.VLRCUSTOATUAL, TT.VLRCUSTO,'
      
        '       TT.IDPLANPREVCTBPATR, TT.IDCARTEIRAINVEST, TT.IDCARTEIRAG' +
        'ERENC, TT.IDINVESTIMENTO, TT.IDCUSTODIANTE,'
      '       TT.IDCARTEIRA,'
      '       TT.IDMOTIVOBLOQUEIO, TT.IDCUSTODIA, TT.QTDTITLOTE'
      'FROM'
      '     (SELECT DISTINCT 1 AS TIPO,'
      '             CA.DESCCARTINVEST,'
      
        '             DECODE(HC.IDMOTIVOBLOQUEIO, -1, NULL, MB.SIGLAMOTBL' +
        'OQ) SIGLAMOTBLOQ, HC.IDLOTE,'
      
        '             ROUND(DECODE(HC.IDMOTIVOBLOQUEIO, -1, HC.SALDOLIBER' +
        'ADO, SALDOBLOQUEADO)*PERC.PERCC,0)  AS QTDE,'
      '             SYSDATE  AS DATAREFERENCIA,'
      
        '             0 AS QTDEDIREITO, 0 AS VALOREXERCIDO, 0 AS VLRREMUN' +
        'ERACAO, 0 AS IR, 0 AS VLRLIQ,'
      
        '             0 AS VLRIRREMUNERACAO, 0 AS VLRCUSTOATUAL, 0 AS VLR' +
        'CUSTO,'
      
        '             HC.IDCARTEIRAINVEST, NULL AS IDCARTEIRAGERENC, HC.I' +
        'DINVESTIMENTO, HC.IDCUSTODIANTE,'
      
        '             LPAD(HC.IDCARTEIRAINVEST,2,'#39'0'#39') || NULL AS IDCARTEI' +
        'RA,'
      
        '             HC.IDMOTIVOBLOQUEIO, HC.IDCUSTODIA, QTL.QTDTITLOTE,' +
        ' HC.IDPLANPREVCTBPATR'
      ''
      
        '      FROM HISTCUSTODIA HC, MOTIVOBLOQUEIO MB, CARTEIRAINVEST CA' +
        ','
      '           (SELECT IDINVESTIMENTO, QTDTITLOTE'
      '            FROM COTACAOINVEST'
      '            WHERE IDINVESTIMENTO = :IDINVESTIMENTO'
      '              AND DATACOTACAO = (SELECT MAX(DATACOTACAO)'
      '                                 FROM COTACAOINVEST'
      
        '                                 WHERE DATACOTACAO <= TO_DATE(:D' +
        'ATAAGE,'#39'DD/MM/YYYY'#39')'
      
        '                                   AND IDINVESTIMENTO = :IDINVES' +
        'TIMENTO)) QTL,'
      '           (SELECT (SALDOQTDECPMF/SALDOQTDEINVCART) AS PERCC,'
      
        '                   ((SALDOQTDEINVCART-SALDOQTDECPMF)/SALDOQTDEIN' +
        'VCART) AS PERCCI,'
      '                   SALDOQTDECPMF AS SALDOCC,'
      '                   SALDOQTDEINVCART-SALDOQTDECPMF AS SALDOCCI,'
      
        '                   IDINVESTIMENTO, IDCARTEIRAINVEST, IDPLANPREVC' +
        'TBPATR'
      '            FROM HISTCARTINV'
      '            WHERE (IDHISTCARTINV  IN'
      '                           (SELECT MAX(HI1.IDHISTCARTINV)'
      '                            FROM HISTCARTINV HI1'
      '                            WHERE (HI1.IDTIPOINVEST   = 2)'
      
        '                              AND ((:IDPLANPREVCTBPATR IS NULL) ' +
        'OR (HI1.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      '                              AND (HI1.IDCARTEIRAGERENC IS NULL)'
      
        '                              AND ((HI1.IDINVESTIMENTO || HI1.DA' +
        'TAMOVCARTINV) IN'
      
        '                                          (SELECT (HI2.IDINVESTI' +
        'MENTO || MAX(HI2.DATAMOVCARTINV))'
      '                                           FROM HISTCARTINV HI2'
      
        '                                           WHERE (HI2.IDTIPOINVE' +
        'ST    = 2)'
      
        '                                             AND ((:IDPLANPREVCT' +
        'BPATR IS NULL) OR (HI2.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                                             AND (HI2.IDINVESTIM' +
        'ENTO  = :IDINVESTIMENTO)'
      
        '                                             AND (HI2.IDCARTEIRA' +
        'GERENC IS NULL)'
      
        '                                             AND (HI2.DATAMOVCAR' +
        'TINV <= TO_DATE(:DATAAGE,'#39'DD/MM/YYYY'#39'))'
      
        '                                           GROUP BY HI2.IDTIPOIN' +
        'VEST, HI2.IDPLANPREVCTBPATR, HI2.IDINVESTIMENTO, HI2.IDCARTEIRAI' +
        'NVEST))'
      
        '                            GROUP BY HI1.IDTIPOINVEST, HI1.IDPLA' +
        'NPREVCTBPATR, HI1.IDINVESTIMENTO, HI1.IDCARTEIRAINVEST))'
      '              AND (NVL(SALDOQTDEINVCART,0) <> 0)      ) PERC'
      ''
      '      WHERE HC.IDCUSTODIA  IN (SELECT MAX(IDCUSTODIA)'
      '                               FROM HISTCUSTODIA'
      
        '                               WHERE IDINVESTIMENTO = :IDINVESTI' +
        'MENTO'
      
        '                                 AND DATAMOVCUSTOD <= TO_DATE(:D' +
        'ATAAGE,'#39'DD/MM/YYYY'#39')'
      
        '                               GROUP BY IDPLANPREVCTBPATR, IDCAR' +
        'TEIRAINVEST, IDCUSTODIANTE, IDMOTIVOBLOQUEIO)'
      
        '        AND DECODE(HC.IDMOTIVOBLOQUEIO, -1, HC.SALDOLIBERADO, SA' +
        'LDOBLOQUEADO) <> 0'
      '        AND QTL.IDINVESTIMENTO(+) = HC.IDINVESTIMENTO'
      '        AND HC.IDCARTEIRAINVEST   = CA.IDCARTEIRAINVEST'
      '        AND HC.IDMOTIVOBLOQUEIO   = MB.IDMOTIVOBLOQUEIO(+)'
      '        AND PERC.IDPLANPREVCTBPATR = HC.IDPLANPREVCTBPATR'
      '        AND PERC.IDINVESTIMENTO   = HC.IDINVESTIMENTO'
      '        AND PERC.IDCARTEIRAINVEST = HC.IDCARTEIRAINVEST'
      ''
      '      UNION ALL'
      ''
      '      SELECT DISTINCT 2 AS TIPO,'
      '             CA.DESCCARTINVEST,'
      
        '             DECODE(HC.IDMOTIVOBLOQUEIO, -1, NULL, MB.SIGLAMOTBL' +
        'OQ) SIGLAMOTBLOQ, HC.IDLOTE,'
      ''
      
        '             DECODE(HC.IDMOTIVOBLOQUEIO, -1, HC.SALDOLIBERADO, S' +
        'ALDOBLOQUEADO)-'
      
        '              ROUND(DECODE(HC.IDMOTIVOBLOQUEIO, -1, HC.SALDOLIBE' +
        'RADO, SALDOBLOQUEADO)*PERC.PERCC,0) AS QTDE,'
      ''
      '             SYSDATE  AS DATAREFERENCIA,'
      
        '             0 AS QTDEDIREITO, 0 AS VALOREXERCIDO, 0 AS VLRREMUN' +
        'ERACAO, 0 AS IR, 0 AS VLRLIQ,'
      
        '             0 AS VLRIRREMUNERACAO, 0 AS VLRCUSTOATUAL, 0 AS VLR' +
        'CUSTO,'
      
        '             HC.IDCARTEIRAINVEST, NULL AS IDCARTEIRAGERENC, HC.I' +
        'DINVESTIMENTO, HC.IDCUSTODIANTE,'
      
        '             LPAD(HC.IDCARTEIRAINVEST,2,'#39'0'#39') || NULL AS IDCARTEI' +
        'RA,'
      
        '             HC.IDMOTIVOBLOQUEIO, HC.IDCUSTODIA, QTL.QTDTITLOTE,' +
        ' HC.IDPLANPREVCTBPATR'
      ''
      
        '      FROM HISTCUSTODIA HC, MOTIVOBLOQUEIO MB, CARTEIRAINVEST CA' +
        ','
      '           (SELECT IDINVESTIMENTO, QTDTITLOTE'
      '            FROM COTACAOINVEST'
      '            WHERE IDINVESTIMENTO = :IDINVESTIMENTO'
      '            AND DATACOTACAO = (SELECT MAX(DATACOTACAO)'
      '                               FROM COTACAOINVEST'
      
        '                               WHERE DATACOTACAO <= TO_DATE(:DAT' +
        'AAGE,'#39'DD/MM/YYYY'#39')'
      
        '                                 AND IDINVESTIMENTO = :IDINVESTI' +
        'MENTO)) QTL,'
      '           (SELECT (SALDOQTDECPMF/SALDOQTDEINVCART) AS PERCC,'
      
        '                   ((SALDOQTDEINVCART-SALDOQTDECPMF)/SALDOQTDEIN' +
        'VCART) AS PERCCI,'
      '                   SALDOQTDECPMF AS SALDOCC,'
      '                   SALDOQTDEINVCART-SALDOQTDECPMF AS SALDOCCI,'
      
        '                   IDINVESTIMENTO, IDCARTEIRAINVEST, IDPLANPREVC' +
        'TBPATR'
      '            FROM HISTCARTINV'
      '            WHERE (IDHISTCARTINV  IN'
      '                      (SELECT MAX(HI1.IDHISTCARTINV)'
      '                       FROM HISTCARTINV HI1'
      '                       WHERE (HI1.IDTIPOINVEST   = 2)'
      
        '                         AND ((:IDPLANPREVCTBPATR IS NULL) OR (H' +
        'I1.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      '                         AND (HI1.IDCARTEIRAGERENC IS NULL)'
      
        '                         AND ((HI1.IDINVESTIMENTO || HI1.DATAMOV' +
        'CARTINV) IN'
      
        '                                       (SELECT (HI2.IDINVESTIMEN' +
        'TO || MAX(HI2.DATAMOVCARTINV))'
      '                                        FROM HISTCARTINV HI2'
      
        '                                        WHERE (HI2.IDTIPOINVEST ' +
        '   = 2)'
      
        '                                          AND ((:IDPLANPREVCTBPA' +
        'TR IS NULL) OR (HI2.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                                          AND (HI2.IDINVESTIMENT' +
        'O  = :IDINVESTIMENTO)'
      
        '                                          AND (HI2.IDCARTEIRAGER' +
        'ENC IS NULL)'
      
        '                                          AND (HI2.DATAMOVCARTIN' +
        'V <= TO_DATE(:DATAAGE,'#39'DD/MM/YYYY'#39'))'
      
        '                                        GROUP BY HI2.IDTIPOINVES' +
        'T, HI2.IDPLANPREVCTBPATR, HI2.IDINVESTIMENTO, HI2.IDCARTEIRAINVE' +
        'ST))'
      
        '                       GROUP BY HI1.IDTIPOINVEST, HI1.IDPLANPREV' +
        'CTBPATR, HI1.IDINVESTIMENTO, HI1.IDCARTEIRAINVEST))'
      '              AND (NVL(SALDOQTDEINVCART,0) <> 0)      ) PERC'
      ''
      '      WHERE HC.IDCUSTODIA  IN (SELECT MAX(IDCUSTODIA)'
      '                               FROM HISTCUSTODIA'
      
        '                               WHERE IDINVESTIMENTO = :IDINVESTI' +
        'MENTO'
      
        '                                 AND DATAMOVCUSTOD <= TO_DATE(:D' +
        'ATAAGE,'#39'DD/MM/YYYY'#39')'
      
        '                               GROUP BY IDPLANPREVCTBPATR, IDCAR' +
        'TEIRAINVEST, IDCUSTODIANTE, IDMOTIVOBLOQUEIO)'
      
        '        AND DECODE(HC.IDMOTIVOBLOQUEIO, -1, HC.SALDOLIBERADO, SA' +
        'LDOBLOQUEADO) <> 0'
      '        AND QTL.IDINVESTIMENTO(+) = HC.IDINVESTIMENTO'
      '        AND HC.IDCARTEIRAINVEST   = CA.IDCARTEIRAINVEST'
      '        AND HC.IDMOTIVOBLOQUEIO   = MB.IDMOTIVOBLOQUEIO(+)'
      '        AND PERC.IDPLANPREVCTBPATR = HC.IDPLANPREVCTBPATR'
      '        AND PERC.IDINVESTIMENTO   = HC.IDINVESTIMENTO'
      '        AND PERC.IDCARTEIRAINVEST = HC.IDCARTEIRAINVEST'
      ''
      '      UNION ALL'
      ''
      '      SELECT DISTINCT 3 AS TIPO,'
      '             CA.DESCCARTGERENC AS DESCCARTINVEST,'
      '             '#39#39' AS SIGLAMOTBLOQ,  HI.IDLOTE,'
      
        '             ROUND(NVL(HI.SALDOQTDEINVCART,0)*PERC.PERCC,0)  AS ' +
        'QTDE,'
      '             SYSDATE AS DATAREFERENCIA,'
      
        '             0 AS QTDEDIREITO, 0 AS VALOREXERCICIO, 0 AS VLRREMU' +
        'NERACAO, 0 AS IR,'
      
        '             0 AS VLRLIQ, 0 AS VLRIRREMUNERACAO, 0 AS VLRCUSTOAT' +
        'UAL, 0 AS VLRCUSTO,'
      
        '             HI.IDCARTEIRAINVEST, HI.IDCARTEIRAGERENC, HI.IDINVE' +
        'STIMENTO, NULL AS IDCUSTODIANTE,'
      
        '             LPAD(HI.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(HI.IDCARTEI' +
        'RAGERENC,2,'#39'0'#39') AS IDCARTEIRA,'
      
        '             NULL AS IDMOTIVOBLOQUEIO, NULL AS IDCUSTODIA, QTL.Q' +
        'TDTITLOTE, HI.IDPLANPREVCTBPATR'
      '      FROM HISTCARTINV HI,'
      '      '
      
        '          (SELECT LPAD(CG.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(CG.IDC' +
        'ARTEIRAGERENC,2,'#39'0'#39') AS IDCARTEIRA, CG.IDCARTEIRAINVEST,'
      '                       CG.IDCARTEIRAGERENC, CG.DESCCARTGERENC'
      '           FROM'
      
        '             CARTEIRAGERENC CG, CARTEIRAINVEST CI, PARAMINVEST P' +
        'I'
      '           WHERE CG.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST'
      '              AND ((PI.FLGCARTGERENC = '#39'S'#39') OR'
      
        '                   ((NVL(PI.FLGCARTGERENC, '#39'N'#39') = '#39'N'#39') AND (PI.D' +
        'ATAMOVCDBLIB > TO_DATE(:DATAAGE,'#39'DD/MM/YYYY'#39'))))) CA,'
      ''
      '           (SELECT IDINVESTIMENTO, QTDTITLOTE'
      '            FROM COTACAOINVEST'
      '            WHERE IDINVESTIMENTO = :IDINVESTIMENTO'
      '              AND DATACOTACAO = (SELECT MAX(DATACOTACAO)'
      '                                 FROM COTACAOINVEST'
      
        '                                 WHERE DATACOTACAO <= TO_DATE(:D' +
        'ATAAGE,'#39'DD/MM/YYYY'#39')'
      
        '                                   AND IDINVESTIMENTO = :IDINVES' +
        'TIMENTO)) QTL,'
      '           (SELECT (SALDOQTDECPMF/SALDOQTDEINVCART) AS PERCC,'
      
        '                   ((SALDOQTDEINVCART-SALDOQTDECPMF)/SALDOQTDEIN' +
        'VCART) AS PERCCI,'
      '                   SALDOQTDECPMF AS SALDOCC,'
      '                   SALDOQTDEINVCART-SALDOQTDECPMF AS SALDOCCI,'
      
        '                   IDPLANPREVCTBPATR, IDINVESTIMENTO, IDCARTEIRA' +
        'INVEST, IDCARTEIRAGERENC'
      '            FROM HISTCARTINV'
      '            WHERE (IDHISTCARTINV  IN'
      '                      (SELECT MAX(HI1.IDHISTCARTINV)'
      '                       FROM HISTCARTINV HI1'
      '                       WHERE (HI1.IDTIPOINVEST   = 2)'
      
        '                         AND ((:IDPLANPREVCTBPATR IS NULL) OR (H' +
        'I1.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      '                         AND (HI1.IDCARTEIRAGERENC IS NOT NULL)'
      
        '                         AND ((HI1.IDINVESTIMENTO || HI1.DATAMOV' +
        'CARTINV) IN'
      
        '                                     (SELECT (HI2.IDINVESTIMENTO' +
        ' || MAX(HI2.DATAMOVCARTINV))'
      '                                      FROM HISTCARTINV HI2'
      
        '                                      WHERE (HI2.IDTIPOINVEST   ' +
        ' = 2)'
      
        '                                        AND ((:IDPLANPREVCTBPATR' +
        ' IS NULL) OR (HI2.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                                        AND (HI2.IDINVESTIMENTO ' +
        ' = :IDINVESTIMENTO)'
      
        '                                        AND (HI2.IDCARTEIRAGEREN' +
        'C IS NOT NULL)'
      
        '                                        AND (HI2.DATAMOVCARTINV ' +
        '<= TO_DATE(:DATAAGE,'#39'DD/MM/YYYY'#39'))'
      
        '                                      GROUP BY HI2.IDTIPOINVEST,' +
        ' HI2.IDPLANPREVCTBPATR, HI2.IDINVESTIMENTO, HI2.IDCARTEIRAINVEST' +
        ', HI2.IDCARTEIRAGERENC))'
      
        '                       GROUP BY HI1.IDTIPOINVEST, HI1.IDPLANPREV' +
        'CTBPATR, HI1.IDINVESTIMENTO, HI1.IDCARTEIRAINVEST, HI1.IDCARTEIR' +
        'AGERENC))'
      '              AND (NVL(SALDOQTDEINVCART,0) <> 0)  ) PERC'
      ''
      '      WHERE (HI.IDHISTCARTINV  IN'
      '            (SELECT MAX(HI1.IDHISTCARTINV)'
      '             FROM HISTCARTINV HI1'
      '             WHERE (HI1.IDTIPOINVEST   = 2)'
      
        '               AND ((:IDPLANPREVCTBPATR IS NULL) OR (HI1.IDPLANP' +
        'REVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '               AND ((HI1.IDINVESTIMENTO || HI1.DATAMOVCARTINV) I' +
        'N'
      
        '                             (SELECT (HI2.IDINVESTIMENTO || MAX(' +
        'HI2.DATAMOVCARTINV))'
      '                              FROM HISTCARTINV HI2'
      '                              WHERE'
      '                                  (HI2.IDTIPOINVEST    = 2)'
      
        '                              AND   ((:IDPLANPREVCTBPATR IS NULL' +
        ') OR (HI2.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                              AND (HI2.IDINVESTIMENTO  = :IDINVE' +
        'STIMENTO)'
      
        '                              AND (HI2.DATAMOVCARTINV <= TO_DATE' +
        '(:DATAAGE,'#39'DD/MM/YYYY'#39'))'
      
        '                              GROUP BY HI2.IDTIPOINVEST, HI2.IDP' +
        'LANPREVCTBPATR, HI2.IDINVESTIMENTO, HI2.IDCARTEIRAINVEST, HI2.ID' +
        'CARTEIRAGERENC))'
      
        '             GROUP BY HI1.IDTIPOINVEST, HI1.IDPLANPREVCTBPATR, H' +
        'I1.IDINVESTIMENTO, HI1.IDCARTEIRAINVEST, HI1.IDCARTEIRAGERENC))'
      '        AND (NVL(HI.SALDOQTDEINVCART,0) <> 0)'
      '        AND (HI.IDCARTEIRAGERENC   = CA.IDCARTEIRAGERENC)'
      '        AND (QTL.IDINVESTIMENTO(+) = HI.IDINVESTIMENTO)'
      '        AND (PERC.IDPLANPREVCTBPATR= HI.IDPLANPREVCTBPATR)'
      '        AND (PERC.IDINVESTIMENTO   = HI.IDINVESTIMENTO)'
      '        AND (PERC.IDCARTEIRAINVEST = HI.IDCARTEIRAINVEST)'
      '        AND (PERC.IDCARTEIRAGERENC = HI.IDCARTEIRAGERENC)'
      ''
      '      UNION ALL'
      ''
      '      SELECT DISTINCT 4 AS TIPO,'
      '             CA.DESCCARTGERENC AS DESCCARTINVEST,'
      '             '#39#39' AS SIGLAMOTBLOQ,  HI.IDLOTE,'
      
        '            (NVL(HI.SALDOQTDEINVCART,0)-ROUND(NVL(HI.SALDOQTDEIN' +
        'VCART,0)*PERC.PERCC,0)) AS QTDE,'
      '             SYSDATE AS DATAREFERENCIA,'
      
        '             0 AS QTDEDIREITO, 0 AS VALOREXERCICIO, 0 AS VLRREMU' +
        'NERACAO, 0 AS IR,'
      
        '             0 AS VLRLIQ, 0 AS VLRIRREMUNERACAO, 0 AS VLRCUSTOAT' +
        'UAL, 0 AS VLRCUSTO,'
      
        '             HI.IDCARTEIRAINVEST, HI.IDCARTEIRAGERENC, HI.IDINVE' +
        'STIMENTO, NULL AS IDCUSTODIANTE,'
      
        '             LPAD(HI.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(HI.IDCARTEI' +
        'RAGERENC,2,'#39'0'#39') AS IDCARTEIRA,'
      
        '             NULL AS IDMOTIVOBLOQUEIO, NULL AS IDCUSTODIA, QTL.Q' +
        'TDTITLOTE, HI.IDPLANPREVCTBPATR'
      '      FROM HISTCARTINV HI,'
      ''
      
        '          (SELECT LPAD(CG.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(CG.IDC' +
        'ARTEIRAGERENC,2,'#39'0'#39') AS IDCARTEIRA, CG.IDCARTEIRAINVEST,'
      '                       CG.IDCARTEIRAGERENC, CG.DESCCARTGERENC'
      '           FROM'
      
        '             CARTEIRAGERENC CG, CARTEIRAINVEST CI, PARAMINVEST P' +
        'I'
      '           WHERE CG.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST'
      '              AND ((PI.FLGCARTGERENC = '#39'S'#39') OR'
      
        '                   ((NVL(PI.FLGCARTGERENC, '#39'N'#39') = '#39'N'#39') AND (PI.D' +
        'ATAMOVCDBLIB > TO_DATE(:DATAAGE,'#39'DD/MM/YYYY'#39'))))) CA,'
      ''
      '           (SELECT IDINVESTIMENTO, QTDTITLOTE'
      '            FROM COTACAOINVEST'
      '            WHERE IDINVESTIMENTO = :IDINVESTIMENTO'
      '                 AND DATACOTACAO = (SELECT MAX(DATACOTACAO)'
      '                                    FROM COTACAOINVEST'
      
        '                                    WHERE DATACOTACAO <= TO_DATE' +
        '(:DATAAGE,'#39'DD/MM/YYYY'#39')'
      
        '                                      AND IDINVESTIMENTO = :IDIN' +
        'VESTIMENTO)) QTL,'
      '           (SELECT (SALDOQTDECPMF/SALDOQTDEINVCART) AS PERCC,'
      
        '                   ((SALDOQTDEINVCART-SALDOQTDECPMF)/SALDOQTDEIN' +
        'VCART) AS PERCCI,'
      '                   SALDOQTDECPMF AS SALDOCC,'
      '                   SALDOQTDEINVCART-SALDOQTDECPMF AS SALDOCCI,'
      
        '                   IDPLANPREVCTBPATR, IDINVESTIMENTO, IDCARTEIRA' +
        'INVEST, IDCARTEIRAGERENC'
      '            FROM HISTCARTINV'
      '            WHERE (IDHISTCARTINV  IN'
      '                  (SELECT MAX(HI1.IDHISTCARTINV)'
      '                   FROM HISTCARTINV HI1'
      '                   WHERE (HI1.IDTIPOINVEST   = 2)'
      
        '                     AND ((:IDPLANPREVCTBPATR IS NULL) OR (HI1.I' +
        'DPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      '                     AND (HI1.IDCARTEIRAGERENC IS NOT NULL)'
      
        '                     AND ((HI1.IDINVESTIMENTO || HI1.DATAMOVCART' +
        'INV) IN'
      
        '                                (SELECT (HI2.IDINVESTIMENTO || M' +
        'AX(HI2.DATAMOVCARTINV))'
      '                                 FROM HISTCARTINV HI2'
      '                                 WHERE (HI2.IDTIPOINVEST    = 2)'
      
        '                                   AND ((:IDPLANPREVCTBPATR IS N' +
        'ULL) OR (HI2.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                                   AND (HI2.IDINVESTIMENTO  = :I' +
        'DINVESTIMENTO)'
      
        '                                   AND (HI2.IDCARTEIRAGERENC IS ' +
        'NOT NULL)'
      
        '                                   AND (HI2.DATAMOVCARTINV <= TO' +
        '_DATE(:DATAAGE,'#39'DD/MM/YYYY'#39'))'
      
        '                                 GROUP BY HI2.IDTIPOINVEST, HI2.' +
        'IDPLANPREVCTBPATR, HI2.IDINVESTIMENTO, HI2.IDCARTEIRAINVEST, HI2' +
        '.IDCARTEIRAGERENC))'
      
        '                   GROUP BY HI1.IDTIPOINVEST, HI1.IDPLANPREVCTBP' +
        'ATR, HI1.IDINVESTIMENTO, HI1.IDCARTEIRAINVEST, HI1.IDCARTEIRAGER' +
        'ENC))'
      '              AND (NVL(SALDOQTDEINVCART,0) <> 0)  ) PERC'
      ''
      '      WHERE (HI.IDHISTCARTINV  IN'
      '                 (SELECT MAX(HI1.IDHISTCARTINV)'
      '                  FROM HISTCARTINV HI1'
      '                  WHERE (HI1.IDINVESTIMENTO = :IDINVESTIMENTO)'
      
        '                    AND ((:IDPLANPREVCTBPATR IS NULL) OR (HI1.ID' +
        'PLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                    AND ((HI1.IDINVESTIMENTO || HI1.DATAMOVCARTI' +
        'NV) IN'
      
        '                              (SELECT (HI2.IDINVESTIMENTO || MAX' +
        '(HI2.DATAMOVCARTINV))'
      '                               FROM HISTCARTINV HI2'
      '                               WHERE (HI2.IDTIPOINVEST    = 2)'
      
        '                                 AND ((:IDPLANPREVCTBPATR IS NUL' +
        'L) OR (HI2.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                                 AND (HI2.IDINVESTIMENTO  = :IDI' +
        'NVESTIMENTO)'
      
        '                                 AND (HI2.DATAMOVCARTINV <= TO_D' +
        'ATE(:DATAAGE,'#39'DD/MM/YYYY'#39'))'
      
        '                               GROUP BY HI2.IDTIPOINVEST, HI2.ID' +
        'PLANPREVCTBPATR, HI2.IDINVESTIMENTO, HI2.IDCARTEIRAINVEST, HI2.I' +
        'DCARTEIRAGERENC))'
      
        '                  GROUP BY HI1.IDTIPOINVEST, HI1.IDPLANPREVCTBPA' +
        'TR, HI1.IDINVESTIMENTO, HI1.IDCARTEIRAINVEST, HI1.IDCARTEIRAGERE' +
        'NC))'
      '        AND (NVL(HI.SALDOQTDEINVCART,0) <> 0)'
      '        AND (HI.IDCARTEIRAGERENC   = CA.IDCARTEIRAGERENC)'
      '        AND (QTL.IDINVESTIMENTO(+) = HI.IDINVESTIMENTO)'
      '        AND (PERC.IDPLANPREVCTBPATR= HI.IDPLANPREVCTBPATR)'
      '        AND (PERC.IDINVESTIMENTO   = HI.IDINVESTIMENTO)'
      '        AND (PERC.IDCARTEIRAINVEST = HI.IDCARTEIRAINVEST)'
      
        '        AND (PERC.IDCARTEIRAGERENC = HI.IDCARTEIRAGERENC) ) TT, ' +
        'VWPLANPREVCTBPATR PP, INVESTIMENTO IV, CUSTODIANTE CT'
      'WHERE TT.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR'
      '  AND TT.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '  AND TT.IDCUSTODIANTE = CT.IDCUSTODIANTE(+)'
      '  AND TT.QTDE > 0'
      
        'ORDER BY IDCARTEIRAGERENC DESC, PLANPRVCONTABPATRO, DESCCARTINVE' +
        'ST')
    UpdateObject = UpdSaldoOrigem
    ValidateWithMask = True
    Left = 426
    Top = 1
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAAGE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAAGE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAAGE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAAGE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAAGE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAAGE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAAGE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAAGE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAAGE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAAGE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAAGE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAAGE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAAGE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAAGE'
        ParamType = ptInput
      end>
    object QrySaldoOrigemDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object QrySaldoOrigemDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object QrySaldoOrigemSGLCUSTODIANTE: TStringField
      FieldName = 'SGLCUSTODIANTE'
      Size = 10
    end
    object QrySaldoOrigemSIGLAMOTBLOQ: TStringField
      FieldName = 'SIGLAMOTBLOQ'
      Size = 3
    end
    object QrySaldoOrigemIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object QrySaldoOrigemDATAREFERENCIA: TDateTimeField
      FieldName = 'DATAREFERENCIA'
    end
    object QrySaldoOrigemQTDE: TFloatField
      FieldName = 'QTDE'
    end
    object QrySaldoOrigemQTDEDIREITO: TFloatField
      FieldName = 'QTDEDIREITO'
    end
    object QrySaldoOrigemVALOREXERCIDO: TFloatField
      FieldName = 'VALOREXERCIDO'
    end
    object QrySaldoOrigemVLRREMUNERACAO: TFloatField
      FieldName = 'VLRREMUNERACAO'
    end
    object QrySaldoOrigemIR: TFloatField
      FieldName = 'IR'
    end
    object QrySaldoOrigemVLRLIQ: TFloatField
      FieldName = 'VLRLIQ'
    end
    object QrySaldoOrigemVLRIRREMUNERACAO: TFloatField
      FieldName = 'VLRIRREMUNERACAO'
    end
    object QrySaldoOrigemVLRCUSTOATUAL: TFloatField
      FieldName = 'VLRCUSTOATUAL'
    end
    object QrySaldoOrigemVLRCUSTO: TFloatField
      FieldName = 'VLRCUSTO'
    end
    object QrySaldoOrigemIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object QrySaldoOrigemIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object QrySaldoOrigemIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object QrySaldoOrigemIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
    end
    object QrySaldoOrigemIDCARTEIRA: TStringField
      FieldName = 'IDCARTEIRA'
      Size = 4
    end
    object QrySaldoOrigemIDMOTIVOBLOQUEIO: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
    end
    object QrySaldoOrigemIDCUSTODIA: TFloatField
      FieldName = 'IDCUSTODIA'
    end
    object QrySaldoOrigemQTDTITLOTE: TFloatField
      FieldName = 'QTDTITLOTE'
    end
    object QrySaldoOrigemTIPO: TFloatField
      FieldName = 'TIPO'
    end
    object QrySaldoOrigemPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object QrySaldoOrigemIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
  end
  object UpdSaldoOrigem: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCUSTODIA'
      'set'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDCUSTODIANTE = :IDCUSTODIANTE,'
      '  IDLOTE = :IDLOTE,'
      '  IDMOTIVOBLOQUEIO = :IDMOTIVOBLOQUEIO,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO and'
      '  IDCUSTODIANTE = :OLD_IDCUSTODIANTE and'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDMOTIVOBLOQUEIO = :OLD_IDMOTIVOBLOQUEIO')
    InsertSQL.Strings = (
      'insert into HISTCUSTODIA'
      
        '  (IDCARTEIRAINVEST, IDINVESTIMENTO, IDCUSTODIANTE, IDLOTE, IDMO' +
        'TIVOBLOQUEIO, '
      '   IDPLANPREVCTBPATR)'
      'values'
      
        '  (:IDCARTEIRAINVEST, :IDINVESTIMENTO, :IDCUSTODIANTE, :IDLOTE, ' +
        ':IDMOTIVOBLOQUEIO, '
      '   :IDPLANPREVCTBPATR)')
    DeleteSQL.Strings = (
      'delete from HISTCUSTODIA'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO and'
      '  IDCUSTODIANTE = :OLD_IDCUSTODIANTE and'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDMOTIVOBLOQUEIO = :OLD_IDMOTIVOBLOQUEIO')
    Left = 444
    Top = 1
  end
  object QryBuscaBolsaValores: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDBOLSAVALORES'
      'FROM'
      '   BOLSAVALORES'
      'WHERE'
      '   IDCUSTODIANTE =:IDCUSTODIANTE      ')
    ValidateWithMask = True
    Left = 528
    Top = 52
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptUnknown
      end>
  end
  object qryAcoesxBolsa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDBOLSAVALORES,'
      '   QTDELOTE'
      'FROM'
      '   ACOESXBOLSA'
      'WHERE'
      '   IDACAO = :IDINVESTIMENTO'
      ' ')
    ValidateWithMask = True
    Left = 688
    Top = 52
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryBoleta: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDBOLETA, STATUS, DATABOLETA, TIPMOVBOLETA, IDFORCLI, PLA' +
        'NO, PLNCODIGO, CODDOCUMENTO,'
      '       '#39'N'#39' AS EXCLUIBOLETA, 0 AS CONTACCI'
      'FROM BOLETA'
      'WHERE IDBOLETA IN (SELECT NUMDOCUMENTO'
      '                   FROM OPERACAOINVEST'
      '                   WHERE IDOPERACAODIREITO = :IDOPERACAODIREITO)'
      ''
      ' ')
    UpdateObject = updBoleta
    ValidateWithMask = True
    Left = 529
    Top = 1
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptResult
      end>
    object qryBoletaIDBOLETA: TStringField
      FieldName = 'IDBOLETA'
      Origin = 'BASEDADOS.BOLETA.IDBOLETA'
      Size = 30
    end
    object qryBoletaSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'BASEDADOS.BOLETA.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryBoletaDATABOLETA: TDateTimeField
      FieldName = 'DATABOLETA'
      Origin = 'BASEDADOS.BOLETA.DATABOLETA'
    end
    object qryBoletaTIPMOVBOLETA: TStringField
      FieldName = 'TIPMOVBOLETA'
      Origin = 'BASEDADOS.BOLETA.TIPMOVBOLETA'
      Size = 3
    end
    object qryBoletaIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'BASEDADOS.BOLETA.IDFORCLI'
    end
    object qryBoletaPLANO: TFloatField
      FieldName = 'PLANO'
    end
    object qryBoletaPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryBoletaCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryBoletaEXCLUIBOLETA: TStringField
      FieldName = 'EXCLUIBOLETA'
      FixedChar = True
      Size = 1
    end
    object qryBoletaCONTACCI: TFloatField
      FieldName = 'CONTACCI'
    end
  end
  object updBoleta: TUpdateSQL
    ModifySQL.Strings = (
      'update BOLETA'
      'set'
      '  STATUS = :STATUS,'
      '  DATABOLETA = :DATABOLETA,'
      '  TIPMOVBOLETA = :TIPMOVBOLETA,'
      '  IDFORCLI = :IDFORCLI,'
      '  PLANO = :PLANO,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  CODDOCUMENTO = :CODDOCUMENTO'
      'where'
      '  IDBOLETA = :OLD_IDBOLETA')
    InsertSQL.Strings = (
      'insert into BOLETA'
      
        '  (IDBOLETA, STATUS, DATABOLETA, TIPMOVBOLETA, IDFORCLI, PLANO, ' +
        'PLNCODIGO, '
      '   CODDOCUMENTO)'
      'values'
      
        '  (:IDBOLETA, :STATUS, :DATABOLETA, :TIPMOVBOLETA, :IDFORCLI, :P' +
        'LANO, :PLNCODIGO, '
      '   :CODDOCUMENTO)')
    DeleteSQL.Strings = (
      'delete from BOLETA'
      'where'
      '  IDBOLETA = :OLD_IDBOLETA')
    Left = 547
    Top = 1
  end
  object qryCarteiraOrig: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT LPAD(IDCARTEIRAINVEST,2,'#39'0'#39') || NULL AS IDCARTEIRA, IDCAR' +
        'TEIRAINVEST, NULL AS IDCARTEIRAGERENC, DESCCARTINVEST'
      'FROM CARTEIRAINVEST'
      'WHERE IDTIPOINVEST = 2'
      'UNION'
      
        'SELECT LPAD(CG.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(CG.IDCARTEIRAGERE' +
        'NC,2,'#39'0'#39') AS IDCARTEIRA, CG.IDCARTEIRAINVEST, CG.IDCARTEIRAGEREN' +
        'C, CG.DESCCARTGERENC AS DESCCARTINVEST'
      'FROM'
      '  CARTEIRAGERENC CG, CARTEIRAINVEST CI, PARAMINVEST PI'
      'WHERE CG.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST'
      '   AND ((PI.FLGCARTGERENC = '#39'S'#39') OR'
      
        '        ((NVL(PI.FLGCARTGERENC, '#39'N'#39') = '#39'N'#39') AND (PI.DATAMOVCDBLI' +
        'B > TO_DATE(:DATALIMGER,'#39'DD/MM/YYYY'#39'))))')
    ValidateWithMask = True
    Left = 645
    Top = 374
    ParamData = <
      item
        DataType = ftString
        Name = 'DATALIMGER'
        ParamType = ptInput
      end>
    object qryCarteiraOrigDESCCARTINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCCARTINVEST'
      Origin = 'BASEDADOS.CARTEIRAINVEST.DESCCARTINVEST'
      Size = 60
    end
    object qryCarteiraOrigIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.CARTEIRAINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
    object qryCarteiraOrigIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
      Visible = False
    end
    object qryCarteiraOrigIDCARTEIRA: TStringField
      FieldName = 'IDCARTEIRA'
      Size = 4
    end
  end
  object qryCustodianteOrig: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  IDCUSTODIANTE,'
      '  SGLCUSTODIANTE'
      'FROM'
      '  CUSTODIANTE'
      'ORDER BY'
      '  SGLCUSTODIANTE')
    ValidateWithMask = True
    Left = 673
    Top = 374
    object qryCustodianteOrigIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'BASEDADOS.CUSTODIANTE.IDCUSTODIANTE'
    end
    object qryCustodianteOrigSGLCUSTODIANTE: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 10
      FieldName = 'SGLCUSTODIANTE'
      Origin = 'BASEDADOS.CUSTODIANTE.SGLCUSTODIANTE'
      Size = 10
    end
  end
  object qryMotBloqOrig: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDMOTIVOBLOQUEIO, '
      
        '       DECODE(IDMOTIVOBLOQUEIO, -1,'#39#39', SIGLAMOTBLOQ) AS SIGLAMOT' +
        'BLOQ, '
      
        '       DECODE(IDMOTIVOBLOQUEIO, -1,'#39#39', DESCMOTBLOQ) AS DESCMOTBL' +
        'OQ'
      'FROM MOTIVOBLOQUEIO')
    ValidateWithMask = True
    Left = 701
    Top = 374
    object qryMotBloqOrigDESCMOTBLOQ: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'DESCMOTBLOQ'
      Origin = 'BASEDADOS.MOTIVOBLOQUEIO.DESCMOTBLOQ'
      Size = 30
    end
    object qryMotBloqOrigIDMOTIVOBLOQUEIO: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
      Origin = 'BASEDADOS.MOTIVOBLOQUEIO.IDMOTIVOBLOQUEIO'
      Visible = False
    end
    object qryMotBloqOrigSIGLAMOTBLOQ: TStringField
      FieldName = 'SIGLAMOTBLOQ'
      Origin = 'BASEDADOS.MOTIVOBLOQUEIO.SIGLAMOTBLOQ'
      Visible = False
      Size = 3
    end
  end
  object qryTipoOperOrig: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT T.*'
      'FROM TIPOOPERACAO T, PARAMINVEST P'
      
        'WHERE ((T.IDTIPOOPERACAO = P.IDTIPOOPERDIRBON) OR (T.IDTIPOOPERA' +
        'CAO = P.IDTIPOOPERDIRBON+10000))'
      'ORDER BY DESCTIPOOPERACAO'
      ' ')
    ValidateWithMask = True
    Left = 617
    Top = 374
    object qryTipoOperOrigDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryTipoOperOrigIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object qryTipoOperOrigIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object qryTipoOperOrigIDMERCADO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMERCADO'
      Visible = False
    end
    object qryTipoOperOrigCODTIPDOC: TFloatField
      DisplayWidth = 10
      FieldName = 'CODTIPDOC'
      Visible = False
    end
    object qryTipoOperOrigNATUREZAOPERACAO: TStringField
      DisplayWidth = 1
      FieldName = 'NATUREZAOPERACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperOrigTIPOCUSTODIA: TStringField
      DisplayWidth = 1
      FieldName = 'TIPOCUSTODIA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperOrigVENCIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'VENCIMENTO'
      Visible = False
    end
    object qryTipoOperOrigFLGGERACONTAB: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGGERACONTAB'
      Visible = False
    end
    object qryTipoOperOrigFLGGERACAPCAR: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGGERACAPCAR'
      Visible = False
    end
    object qryTipoOperOrigRECPAG: TStringField
      DisplayWidth = 1
      FieldName = 'RECPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperOrigTIPCREDOR: TStringField
      DisplayWidth = 2
      FieldName = 'TIPCREDOR'
      Visible = False
      Size = 2
    end
    object qryTipoOperOrigFLGGERACAF: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGGERACAF'
      Visible = False
    end
    object qryTipoOperOrigFLGTRANSF: TStringField
      DisplayWidth = 1
      FieldName = 'FLGTRANSF'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperOrigTRGDTINCLUSAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TRGDTINCLUSAO'
      Visible = False
    end
    object qryTipoOperOrigTRGUSERINCLUSAO: TStringField
      DisplayWidth = 30
      FieldName = 'TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object qryTipoOperOrigFLGCORRET: TStringField
      DisplayWidth = 1
      FieldName = 'FLGCORRET'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperOrigFLGORDMOVINV: TStringField
      DisplayWidth = 1
      FieldName = 'FLGORDMOVINV'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperOrigIDMOTIVOBLOQUEIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMOTIVOBLOQUEIO'
      Visible = False
    end
    object qryTipoOperOrigFLGOPDIREITO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGOPDIREITO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperOrigFLGAGE: TStringField
      DisplayWidth = 1
      FieldName = 'FLGAGE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperOrigFLGDATAEX: TStringField
      DisplayWidth = 1
      FieldName = 'FLGDATAEX'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperOrigFLGDATACOM: TStringField
      DisplayWidth = 1
      FieldName = 'FLGDATACOM'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperOrigFLGINVORIGEM: TStringField
      DisplayWidth = 1
      FieldName = 'FLGINVORIGEM'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperOrigFLGPERC: TStringField
      DisplayWidth = 1
      FieldName = 'FLGPERC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperOrigFLGPARIDADE: TStringField
      DisplayWidth = 1
      FieldName = 'FLGPARIDADE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperOrigFLGPRZBOLSA: TStringField
      DisplayWidth = 1
      FieldName = 'FLGPRZBOLSA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperOrigFLGPRZEMP: TStringField
      DisplayWidth = 1
      FieldName = 'FLGPRZEMP'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperOrigFLGATADEC: TStringField
      DisplayWidth = 1
      FieldName = 'FLGATADEC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperOrigFLGFORMAPAGREC: TStringField
      DisplayWidth = 1
      FieldName = 'FLGFORMAPAGREC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperOrigFLGDIVACAO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGDIVACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperOrigFLGINIPAG: TStringField
      DisplayWidth = 1
      FieldName = 'FLGINIPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperOrigFLGJUROS: TStringField
      DisplayWidth = 1
      FieldName = 'FLGJUROS'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperOrigMOTBLOQCARTORIG: TFloatField
      DisplayWidth = 10
      FieldName = 'MOTBLOQCARTORIG'
      Visible = False
    end
    object qryTipoOperOrigMOTBLOQCARTDEST: TFloatField
      DisplayWidth = 10
      FieldName = 'MOTBLOQCARTDEST'
      Visible = False
    end
    object qryTipoOperOrigTIPSALDOCARTORIG: TStringField
      DisplayWidth = 1
      FieldName = 'TIPSALDOCARTORIG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperOrigTIPSALDOCARTDEST: TStringField
      DisplayWidth = 1
      FieldName = 'TIPSALDOCARTDEST'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperOrigFLGTRATAIR: TStringField
      DisplayWidth = 1
      FieldName = 'FLGTRATAIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperOrigSIGLATIPOOPER: TStringField
      DisplayWidth = 4
      FieldName = 'SIGLATIPOOPER'
      Visible = False
      Size = 4
    end
    object qryTipoOperOrigFLGISENTOIR: TStringField
      DisplayWidth = 1
      FieldName = 'FLGISENTOIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperOrigFLGGRAVAIRLITIGIO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGGRAVAIRLITIGIO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperOrigFLGOPGERENC: TStringField
      DisplayWidth = 1
      FieldName = 'FLGOPGERENC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperOrigTIPOMOVTO: TStringField
      DisplayWidth = 3
      FieldName = 'TIPOMOVTO'
      Visible = False
      Size = 3
    end
    object qryTipoOperOrigSTAATIVO: TStringField
      DisplayWidth = 1
      FieldName = 'STAATIVO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperOrigFLGRENTABILIDADE: TStringField
      DisplayWidth = 1
      FieldName = 'FLGRENTABILIDADE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperOrigFLGCONTAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGCONTAINVEST'
      Visible = False
    end
    object qryTipoOperOrigFLGMOVCOTA: TStringField
      DisplayWidth = 1
      FieldName = 'FLGMOVCOTA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperOrigFLGCOTARECDES: TStringField
      DisplayWidth = 1
      FieldName = 'FLGCOTARECDES'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperOrigFLGDATAVENCIMENTO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGDATAVENCIMENTO'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object qryHistCartInv: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDHISTCARTINV, IDTIPOOPERACAO, IDOPERACAOINVEST, DATAMOVC' +
        'ARTINV, HISTMOVCARTINV'
      'FROM HISTCARTINV'
      'WHERE IDOPERACAOINVEST IN (SELECT IDOPERACAOINVEST'
      '                           FROM OPERACAOINVEST'
      
        '                           WHERE IDOPERACAODIREITO = :IDOPERACAO' +
        'DIREITO)'
      'ORDER BY DATAMOVCARTINV, IDHISTCARTINV')
    UpdateObject = updHistCartInv
    ValidateWithMask = True
    Left = 585
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptResult
      end>
    object qryHistCartInvIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
    end
    object qryHistCartInvIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryHistCartInvIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object qryHistCartInvDATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
    end
    object qryHistCartInvHISTMOVCARTINV: TStringField
      FieldName = 'HISTMOVCARTINV'
      Size = 60
    end
  end
  object updHistCartInv: TUpdateSQL
    InsertSQL.Strings = (
      '')
    DeleteSQL.Strings = (
      'delete from HISTCARTINV'
      'where'
      '  IDHISTCARTINV = :OLD_IDHISTCARTINV')
    Left = 603
    Top = 4
  end
  object qryAuxiliar: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 623
    Top = 54
  end
  object qryCarteiraRec: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT LPAD(IDCARTEIRAINVEST,2,'#39'0'#39') || NULL AS IDCARTEIRA, IDCAR' +
        'TEIRAINVEST, NULL AS IDCARTEIRAGERENC, DESCCARTINVEST'
      'FROM CARTEIRAINVEST'
      'WHERE IDTIPOINVEST = 2'
      'UNION'
      
        'SELECT LPAD(CG.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(CG.IDCARTEIRAGERE' +
        'NC,2,'#39'0'#39') AS IDCARTEIRA, CG.IDCARTEIRAINVEST, CG.IDCARTEIRAGEREN' +
        'C, CG.DESCCARTGERENC AS DESCCARTINVEST'
      'FROM'
      '  CARTEIRAGERENC CG, CARTEIRAINVEST CI, PARAMINVEST PI'
      'WHERE CG.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST'
      '   AND ((PI.FLGCARTGERENC = '#39'S'#39') OR'
      
        '        ((NVL(PI.FLGCARTGERENC, '#39'N'#39') = '#39'N'#39') AND (PI.DATAMOVCDBLI' +
        'B > TO_DATE(:DATALIMGER,'#39'DD/MM/YYYY'#39'))))')
    ValidateWithMask = True
    Left = 645
    Top = 420
    ParamData = <
      item
        DataType = ftString
        Name = 'DATALIMGER'
        ParamType = ptInput
      end>
    object qryCarteiraRecDESCCARTINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryCarteiraRecIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryCarteiraRecIDCARTEIRAGERENC: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAGERENC'
      Visible = False
    end
    object qryCarteiraRecIDCARTEIRA: TStringField
      DisplayWidth = 4
      FieldName = 'IDCARTEIRA'
      Visible = False
      Size = 4
    end
  end
  object qryCustodianteRec: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  IDCUSTODIANTE,'
      '  SGLCUSTODIANTE'
      'FROM'
      '  CUSTODIANTE'
      'ORDER BY'
      '  SGLCUSTODIANTE')
    ValidateWithMask = True
    Left = 673
    Top = 420
    object qryCustodianteRecIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'BASEDADOS.CUSTODIANTE.IDCUSTODIANTE'
    end
    object qryCustodianteRecSGLCUSTODIANTE: TStringField
      FieldName = 'SGLCUSTODIANTE'
      Origin = 'BASEDADOS.CUSTODIANTE.SGLCUSTODIANTE'
      Size = 10
    end
  end
  object qryMotBloqRec: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDMOTIVOBLOQUEIO, '
      
        '       DECODE(IDMOTIVOBLOQUEIO, -1,'#39#39', SIGLAMOTBLOQ) AS SIGLAMOT' +
        'BLOQ, '
      
        '       DECODE(IDMOTIVOBLOQUEIO, -1,'#39#39', DESCMOTBLOQ) AS DESCMOTBL' +
        'OQ'
      'FROM MOTIVOBLOQUEIO')
    ValidateWithMask = True
    Left = 701
    Top = 420
    object qryMotBloqRecIDMOTIVOBLOQUEIO: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
    end
    object qryMotBloqRecSIGLAMOTBLOQ: TStringField
      FieldName = 'SIGLAMOTBLOQ'
      Size = 3
    end
    object qryMotBloqRecDESCMOTBLOQ: TStringField
      FieldName = 'DESCMOTBLOQ'
      Size = 30
    end
  end
  object qryTipoOperRec: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT T.*'
      'FROM TIPOOPERACAO T, PARAMINVEST P'
      
        'WHERE ((T.IDTIPOOPERACAO = P.IDTIPOOPERDIRBON) OR (T.IDTIPOOPERA' +
        'CAO = P.IDTIPOOPERDIRBON+10000))'
      'ORDER BY DESCTIPOOPERACAO'
      ' ')
    ValidateWithMask = True
    Left = 617
    Top = 421
    object qryTipoOperRecFLGAGE: TStringField
      FieldName = 'FLGAGE'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGAGE'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperRecFLGDATAEX: TStringField
      FieldName = 'FLGDATAEX'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGDATAEX'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperRecFLGDATACOM: TStringField
      FieldName = 'FLGDATACOM'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGDATACOM'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperRecFLGPRZBOLSA: TStringField
      FieldName = 'FLGPRZBOLSA'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGPRZBOLSA'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperRecFLGPRZEMP: TStringField
      FieldName = 'FLGPRZEMP'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGPRZEMP'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperRecFLGATADEC: TStringField
      FieldName = 'FLGATADEC'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGATADEC'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperRecFLGFORMAPAGREC: TStringField
      FieldName = 'FLGFORMAPAGREC'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGFORMAPAGREC'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperRecFLGDIVACAO: TStringField
      FieldName = 'FLGDIVACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGDIVACAO'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperRecFLGINIPAG: TStringField
      FieldName = 'FLGINIPAG'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGINIPAG'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperRecFLGJUROS: TStringField
      FieldName = 'FLGJUROS'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGJUROS'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperRecFLGPARIDADE: TStringField
      FieldName = 'FLGPARIDADE'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGPARIDADE'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperRecFLGINVORIGEM: TStringField
      FieldName = 'FLGINVORIGEM'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGINVORIGEM'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperRecFLGPERC: TStringField
      FieldName = 'FLGPERC'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGPERC'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperRecDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object qryTipoOperRecIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDTIPOOPERACAO'
    end
    object qryTipoOperRecIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDTIPOINVEST'
    end
    object qryTipoOperRecFLGGRAVAIRLITIGIO: TStringField
      FieldName = 'FLGGRAVAIRLITIGIO'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGRAVAIRLITIGIO'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperRecFLGISENTOIR: TStringField
      FieldName = 'FLGISENTOIR'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGISENTOIR'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperRecNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperRecIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDMERCADO'
    end
    object qryTipoOperRecFLGTRATAIR: TStringField
      FieldName = 'FLGTRATAIR'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGTRATAIR'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperRecTIPCREDOR: TStringField
      FieldName = 'TIPCREDOR'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPCREDOR'
      Size = 2
    end
    object qryTipoOperRecRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'BASEDADOS.TIPOOPERACAO.RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperRecVENCIMENTO: TFloatField
      FieldName = 'VENCIMENTO'
      Origin = 'BASEDADOS.TIPOOPERACAO.VENCIMENTO'
    end
  end
  object qryOrigDestino: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#39'O'#39' AS ORIGDEST, '#39'Origem'#39' AS DESCRICAO FROM DUAL'
      'UNION'
      'SELECT '#39'D'#39' AS ORIGDEST, '#39'Destino'#39' AS DESCRICAO FROM DUAL'
      ''
      'ORDER BY 1 DESC')
    ValidateWithMask = True
    Left = 646
    Top = 334
    object qryOrigDestinoDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 7
      FieldName = 'DESCRICAO'
      Size = 7
    end
    object qryOrigDestinoORIGDEST: TStringField
      FieldName = 'ORIGDEST'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object qryPlanPrevCtbPatr: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PA.IDPLANPREVCTBPATR,'
      '   PA.IDPLANOPREV,'
      '   PA.IDPATRO,'
      '   (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      'FROM'
      '   PESSOA PE,'
      '   PLANPREVCONTABPATRO PA,'
      '   PLANPREVCONTABIL PL'
      'WHERE'
      '   (PA.IDPATRO = PE.IDPESSOA(+))  AND'
      '   (PA.IDPLANOPREV = PL.IDPLANOPREV)')
    ValidateWithMask = True
    Left = 263
    Top = 54
    object qryPlanPrevCtbPatrIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryPlanPrevCtbPatrIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryPlanPrevCtbPatrIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryPlanPrevCtbPatrPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
  end
end
