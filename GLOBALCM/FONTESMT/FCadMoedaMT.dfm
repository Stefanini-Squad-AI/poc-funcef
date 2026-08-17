inherited frmCadMoeda: TfrmCadMoeda
  Left = 364
  Top = 187
  HelpContext = 20007
  Caption = 'Cadastro de Moedas'
  ClientHeight = 428
  ClientWidth = 385
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 385
    Height = 342
    object lblMoeSigla: TLabel
      Left = 11
      Top = 13
      Width = 29
      Height = 13
      Caption = 'Sigla'
    end
    object lblMoeDesc: TLabel
      Left = 11
      Top = 57
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object lblMoePeriodicidade: TLabel
      Left = 200
      Top = 100
      Width = 78
      Height = 13
      Caption = 'Periodicidade'
    end
    object Label5: TLabel
      Left = 11
      Top = 100
      Width = 98
      Height = 13
      Caption = 'Unidade da Taxa'
    end
    object cmbPeriodo: TwwDBComboBox
      Left = 200
      Top = 116
      Width = 174
      Height = 21
      ShowButton = True
      Style = csDropDown
      MapList = True
      AllowClearKey = False
      DataField = 'MOEPERIODICIDADE'
      DataSource = ds
      DropDownCount = 8
      ItemHeight = 0
      Items.Strings = (
        'Anual'#9'A'
        'Diária'#9'D'
        'Mensal'#9'M'
        'Quinzenal'#9'Q'
        'Semestral'#9'S'
        'Trimestral'#9'T')
      Sorted = True
      TabOrder = 5
      UnboundDataType = wwDefault
    end
    object dbedMoeSigla: TwwDBEdit
      Left = 11
      Top = 28
      Width = 181
      Height = 21
      DataField = 'MOESIGLA'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedMoeDesc: TwwDBEdit
      Left = 11
      Top = 72
      Width = 181
      Height = 21
      DataField = 'MOEDESC'
      DataSource = ds
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object pnlMoeInativo: TPanel
      Left = 199
      Top = 61
      Width = 175
      Height = 34
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 3
      object DBCkbInativa: TDBCheckBox
        Left = 9
        Top = 9
        Width = 128
        Height = 17
        Caption = 'Moeda Inativa'
        DataField = 'MOEINATIVO'
        DataSource = ds
        TabOrder = 0
        ValueChecked = 'I'
        ValueUnchecked = 'A'
      end
    end
    object dbRdgpTipo: TDBRadioGroup
      Left = 197
      Top = 13
      Width = 176
      Height = 39
      Caption = 'Tipo'
      Columns = 2
      DataField = 'FLGPERCVALOR'
      DataSource = ds
      Items.Strings = (
        'Valor'
        'Percentual')
      TabOrder = 1
      Values.Strings = (
        'V'
        'P')
    end
    object GroupBox1: TGroupBox
      Left = 11
      Top = 142
      Width = 363
      Height = 123
      Caption = 'Referência'
      TabOrder = 6
      object Label1: TLabel
        Left = 9
        Top = 13
        Width = 105
        Height = 13
        Caption = 'Moeda Referência'
      end
      object Label2: TLabel
        Left = 201
        Top = 10
        Width = 112
        Height = 13
        Caption = 'Fator de Conversão'
      end
      object Label3: TLabel
        Left = 9
        Top = 47
        Width = 65
        Height = 13
        Caption = 'Data Início'
      end
      object Label4: TLabel
        Left = 201
        Top = 47
        Width = 51
        Height = 13
        Caption = 'Data Fim'
      end
      object dblkMoeRef: TwwDBLookupCombo
        Left = 9
        Top = 26
        Width = 181
        Height = 21
        Hint = 'Moeda Substitutiva'
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'MOEDESC'#9'20'#9'Moeda de Referência'
          'MOESIGLA'#9'5'#9' ')
        DataField = 'MOEDAREFERENCIA'
        DataSource = ds
        LookupTable = CdsMoedaRef
        LookupField = 'MOECODIGO'
        Options = [loColLines, loTitles]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dbredFator: TDBRealEdit
        Left = 201
        Top = 26
        Width = 151
        Height = 21
        Hint = 
          'Valor ultilizado para '#39'dividir'#39' um valor registrado para a moeda' +
          ' em questão'
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00000000')
        MaxLength = 18
        OEMConvert = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        WordWrap = False
        IntDigits = 6
        DecDigits = 8
        NumberFormat = fFixed
        Signal = False
        DataField = 'FATORCONVERSAO'
        DataSource = ds
      end
      object dbdtIni: TCMDateTimePicker
        Left = 9
        Top = 62
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAINICIO'
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
      object dbdtFim: TCMDateTimePicker
        Left = 201
        Top = 62
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAFIM'
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
    end
    object DbEdTaxa: TwwDBEdit
      Left = 11
      Top = 116
      Width = 181
      Height = 21
      DataField = 'DESCUNIDADETAXA'
      DataSource = ds
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object DbCkbTestaDatas: TDBCheckBox
      Left = 11
      Top = 322
      Width = 290
      Height = 17
      Caption = 'Permitir mais de uma cotação para um período'
      DataField = 'FLGTESTADATASCOT'
      DataSource = ds
      TabOrder = 7
      ValueChecked = 'N'
      ValueUnchecked = 'S'
    end
    object GroupBox2: TGroupBox
      Left = 12
      Top = 264
      Width = 361
      Height = 53
      Caption = 'Meses Rentabilidade Acumulada'
      TabOrder = 8
      object Label6: TLabel
        Left = 5
        Top = 24
        Width = 257
        Height = 13
        Caption = 'Nº Meses Calculo Rentabilidade Acumulada :'
      end
      object dbredMesesFator: TDBRealEdit
        Left = 265
        Top = 21
        Width = 68
        Height = 21
        Hint = 'Quantidade de meses para calculo do fator'
        Alignment = taRightJustify
        Lines.Strings = (
          '0')
        MaxLength = 18
        OEMConvert = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        WordWrap = False
        IntDigits = 6
        DecDigits = 0
        NumberFormat = fFixed
        Signal = False
        DataField = 'MESESFATOR'
        DataSource = ds
      end
    end
  end
  inherited Dock972: TDock97
    Width = 385
  end
  inherited Dock971: TDock97
    Top = 389
    Width = 385
    inherited tb97Fundo: TToolbar97
      Left = 213
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 44
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 302
    Top = 65535
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 358
    Top = 3
  end
  inherited ImlPadrao: TImageList
    Left = 356
    Top = 59
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 244
    Top = 65535
  end
  inherited Cds: TCMClientDataSet
    Left = 304
    Top = 59
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'MOEDA.MOESIGLA'
      'MOEDA.MOEDESC'
      'MOEDA.MOECODIGO'
      'MOEDA.DESCUNIDADETAXA')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Sigla'
      'Descrição'
      'Código'
      'Unidade de Taxa')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'MOEDA')
    CamposChave.Strings = (
      'MOEDA.MOECODIGO')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '20'
      '10'
      '30')
    Left = 248
    Top = 107
  end
  object CdsMoedaRef: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 248
    Top = 55
  end
end
