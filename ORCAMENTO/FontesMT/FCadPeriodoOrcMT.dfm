inherited frmCadPeriodoOrcMT: TfrmCadPeriodoOrcMT
  Left = 322
  Top = 109
  HelpContext = 520025
  Caption = 'Cadastro de Períodos Orçamentários'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 505
      Height = 199
      ActivePage = TbsBlqPeriodo
      Align = alClient
      TabOrder = 0
      object TbsInsPeriodo: TTabSheet
        Caption = 'Periodos Orcamentarios'
        object Label1: TLabel
          Left = 15
          Top = 18
          Width = 53
          Height = 13
          Caption = 'Exercicio'
        end
        object Label2: TLabel
          Left = 142
          Top = 18
          Width = 44
          Height = 13
          Caption = 'Periodo'
        end
        object Label3: TLabel
          Left = 202
          Top = 18
          Width = 66
          Height = 13
          Caption = 'Data Inicial'
        end
        object Label4: TLabel
          Left = 316
          Top = 18
          Width = 59
          Height = 13
          Caption = 'Data Final'
        end
        object Label5: TLabel
          Left = 18
          Top = 80
          Width = 33
          Height = 13
          Caption = 'Nome'
          Visible = False
        end
        object dbrPeriodo: TDBRealEdit
          Left = 142
          Top = 33
          Width = 49
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          Lines.Strings = (
            '1,00')
          TabOrder = 0
          WordWrap = False
          IntDigits = 0
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
          DataField = 'PERIODO'
          DataSource = ds
        end
        object dbrExercicio: TwwDBSpinEdit
          Left = 14
          Top = 33
          Width = 81
          Height = 21
          Increment = 1
          MaxValue = 9999
          MinValue = 1990
          Value = 1990
          DataField = 'EXERCICIO'
          DataSource = ds
          MaxLength = 4
          TabOrder = 1
          UnboundDataType = wwDefault
        end
        object dbedDataIni: TCMDateTimePicker
          Left = 200
          Top = 33
          Width = 97
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATAINIPERIODO'
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
        object dbedDataFim: TCMDateTimePicker
          Left = 316
          Top = 33
          Width = 97
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATAFIMPERIODO'
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
          OnEnter = dbedDataFimEnter
        end
        object dbeNomePeriodo: TwwDBEdit
          Left = 16
          Top = 94
          Width = 385
          Height = 21
          DataField = 'NOMEPERIODO'
          DataSource = ds
          TabOrder = 4
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
          OnEnter = dbeNomePeriodoEnter
        end
      end
      object TbsBlqPeriodo: TTabSheet
        Caption = 'Bloqueio dos Periodos'
        ImageIndex = 1
        object Label6: TLabel
          Left = 15
          Top = 18
          Width = 53
          Height = 13
          Caption = 'Exercicio'
          Visible = False
        end
        object wwDBSpinEdit1: TwwDBSpinEdit
          Left = 14
          Top = 33
          Width = 81
          Height = 21
          Increment = 1
          MaxValue = 9999
          MinValue = 1990
          Value = 1990
          DataField = 'EXERCICIO'
          DataSource = ds
          Enabled = False
          MaxLength = 4
          TabOrder = 0
          UnboundDataType = wwDefault
          Visible = False
        end
        object Chk1: TCheckBox
          Left = 124
          Top = 56
          Width = 97
          Height = 17
          Caption = 'Janeiro'
          TabOrder = 1
          Visible = False
        end
        object Chk3: TCheckBox
          Left = 124
          Top = 113
          Width = 97
          Height = 17
          Caption = 'Marco'
          TabOrder = 2
          Visible = False
        end
        object Chk2: TCheckBox
          Left = 124
          Top = 84
          Width = 97
          Height = 17
          Caption = 'Fevereiro'
          TabOrder = 3
          Visible = False
        end
        object Chk4: TCheckBox
          Left = 124
          Top = 141
          Width = 97
          Height = 17
          Caption = 'Abril'
          TabOrder = 4
          Visible = False
        end
        object Chk6: TCheckBox
          Left = 250
          Top = 84
          Width = 97
          Height = 17
          Caption = 'Junho'
          TabOrder = 5
          Visible = False
        end
        object Chk5: TCheckBox
          Left = 250
          Top = 56
          Width = 97
          Height = 17
          Caption = 'Maio'
          TabOrder = 6
          Visible = False
        end
        object Chk7: TCheckBox
          Left = 250
          Top = 113
          Width = 97
          Height = 17
          Caption = 'Julho'
          TabOrder = 7
          Visible = False
        end
        object Chk8: TCheckBox
          Left = 250
          Top = 141
          Width = 97
          Height = 17
          Caption = 'Agosto'
          TabOrder = 8
          Visible = False
        end
        object Chk9: TCheckBox
          Left = 370
          Top = 56
          Width = 97
          Height = 16
          Caption = 'Setembro'
          TabOrder = 9
          Visible = False
        end
        object Chk10: TCheckBox
          Left = 370
          Top = 84
          Width = 97
          Height = 17
          Caption = 'Outubro'
          TabOrder = 10
          Visible = False
        end
        object Chk11: TCheckBox
          Left = 370
          Top = 113
          Width = 97
          Height = 17
          Caption = 'Novembro'
          TabOrder = 11
          Visible = False
        end
        object Chk12: TCheckBox
          Left = 370
          Top = 141
          Width = 97
          Height = 17
          Caption = 'Dezembro'
          TabOrder = 12
          Visible = False
        end
        object ChkTodos: TCheckBox
          Left = 124
          Top = 28
          Width = 132
          Height = 17
          Caption = 'Selecionar Todos'
          TabOrder = 13
          Visible = False
          OnClick = ChkTodosClick
        end
      end
    end
  end
  inherited Dock971: TDock97
    inherited tb97Fundo: TToolbar97
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 520025
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 262
    Top = 11
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 355
    Top = 19
  end
  inherited ImlPadrao: TImageList
    Left = 477
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 394
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    Left = 312
    Top = 11
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PERIODOORCAMEN.EXERCICIO'
      'PERIODOORCAMEN.PERIODO'
      'PERIODOORCAMEN.DATAINIPERIODO'
      'PERIODOORCAMEN.DATAFIMPERIODO'
      'PERIODOORCAMEN.NOMEPERIODO'
      'PERIODOORCAMEN.FLGBLOQUEADO')
    TipodeDado.Strings = (
      'N'
      'N'
      'D'
      'D'
      'C'
      'C')
    Descricao.Strings = (
      'Exercício'
      'Período'
      'Início'
      'Fim'
      'Nome do Período'
      'Bloqueado')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PERIODOORCAMEN')
    CamposChave.Strings = (
      'PERIODOORCAMEN.IDPESSOA'
      'PERIODOORCAMEN.EXERCICIO'
      'PERIODOORCAMEN.PERIODO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '18'
      '18'
      '60'
      '1')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BASEDADOS'
    LookupSQL.Strings = (
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
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 437
    Top = 11
  end
  object Query1: TQuery
    DatabaseName = 'BASEDADOS'
    Left = 33
    Top = 196
  end
end
