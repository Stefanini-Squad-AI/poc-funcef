inherited FrmCadFeriados: TFrmCadFeriados
  Left = 389
  Top = 109
  HelpContext = 20013
  Caption = 'Cadastro de Feriados'
  ClientHeight = 426
  ClientWidth = 425
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 425
    Height = 340
    object Label1: TLabel
      Left = 16
      Top = 12
      Width = 43
      Height = 13
      Caption = 'Feriado'
    end
    object Label8: TLabel
      Left = 16
      Top = 172
      Width = 113
      Height = 13
      Caption = 'Sindicato da Classe'
    end
    object DBrdgAmbito: TDBRadioGroup
      Left = 144
      Top = 56
      Width = 265
      Height = 41
      Caption = ' Âmbito '
      Columns = 3
      DataField = 'FLGAMBITO'
      DataSource = ds
      Items.Strings = (
        'Federal'
        'Estadual'
        'Municipal')
      TabOrder = 2
      TabStop = True
      Values.Strings = (
        'F'
        'E'
        'M')
      OnClick = DBrdgAmbitoClick
    end
    object DBedtFeriado: TDBEdit
      Left = 16
      Top = 28
      Width = 393
      Height = 21
      DataField = 'DESCFERIADO'
      DataSource = ds
      TabOrder = 0
    end
    object GroupBox1: TGroupBox
      Left = 144
      Top = 104
      Width = 265
      Height = 61
      Caption = ' Ocorrência '
      TabOrder = 4
      object Label3: TLabel
        Left = 144
        Top = 16
        Width = 64
        Height = 13
        Caption = 'Repetir por'
      end
      object Label4: TLabel
        Left = 214
        Top = 36
        Width = 28
        Height = 13
        Caption = 'anos'
      end
      object Label2: TLabel
        Left = 16
        Top = 16
        Width = 92
        Height = 13
        Caption = 'Data do Feriado'
      end
      object DBedtData: TCMDateTimePicker
        Left = 16
        Top = 32
        Width = 105
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAFERIADO'
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
      object spnRepeteAnos: TSpinEdit
        Left = 144
        Top = 32
        Width = 65
        Height = 22
        MaxLength = 3
        MaxValue = 100
        MinValue = 0
        TabOrder = 1
        Value = 0
      end
    end
    object Panel2: TPanel
      Left = 16
      Top = 220
      Width = 393
      Height = 105
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 5
      object Label5: TLabel
        Left = 16
        Top = 8
        Width = 27
        Height = 13
        Caption = 'País'
      end
      object Label6: TLabel
        Left = 234
        Top = 8
        Width = 40
        Height = 13
        Caption = 'Estado'
      end
      object Label7: TLabel
        Left = 16
        Top = 56
        Width = 40
        Height = 13
        Caption = 'Cidade'
      end
      object DBcboPais: TCMDBLookupCombo
        Left = 17
        Top = 24
        Width = 203
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEPAIS'#9'30'#9'Pais')
        DataField = 'IDPAIS'
        DataSource = ds
        LookupTable = CdsPais
        LookupField = 'IDPAIS'
        Options = [loTitles]
        Style = csDropDownList
        Enabled = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = DBcboPaisCloseUp
      end
      object DBcboEstado: TCMDBLookupCombo
        Left = 234
        Top = 24
        Width = 142
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEESTADO'#9'30'#9'Estado'
          'CODESTADO'#9'3'#9' '
          'NOMEPAIS'#9'30'#9'Pais')
        DataField = 'IDESTADO'
        DataSource = ds
        LookupTable = CdsEstado
        LookupField = 'IDESTADO'
        Options = [loTitles]
        Style = csDropDownList
        Enabled = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = DBcboEstadoCloseUp
      end
      object DBcboCidade: TCMDBLookupCombo
        Left = 17
        Top = 72
        Width = 360
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'25'#9'Cidade'
          'NOMEESTADO'#9'25'#9'Estado'
          'NOMEPAIS'#9'25'#9'Pais')
        DataField = 'IDCIDADES'
        DataSource = ds
        LookupTable = CdsCidade
        LookupField = 'IDCIDADES'
        Options = [loTitles]
        Style = csDropDownList
        Enabled = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = DBcboCidadeCloseUp
      end
    end
    object DBrdgTipo: TDBRadioGroup
      Left = 16
      Top = 56
      Width = 121
      Height = 109
      Caption = ' Tipo '
      DataField = 'FLGTIPO'
      DataSource = ds
      Items.Strings = (
        'Bancário'
        'Classista'
        'Extraordinário'
        'Ordinário')
      TabOrder = 1
      Values.Strings = (
        'B'
        'C'
        'E'
        'O')
      OnClick = DBrdgTipoClick
    end
    object DBcboSindicato: TCMDBLookupCombo
      Left = 17
      Top = 188
      Width = 392
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'NOME')
      DataField = 'IDSINDICATO'
      DataSource = ds
      LookupTable = CdsSindicato
      LookupField = 'IDPESSOA'
      Options = [loTitles]
      Style = csDropDownList
      DropDownWidth = 8
      Enabled = False
      TabOrder = 3
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock972: TDock97
    Width = 425
  end
  inherited Dock971: TDock97
    Top = 387
    Width = 425
    inherited tb97Fundo: TToolbar97
      Left = 253
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 84
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 262
    Top = 59
  end
  inherited ds: TwwDataSource
    Left = 314
    Top = 11
  end
  inherited ImlPadrao: TImageList
    Left = 260
    Top = 11
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 368
    Top = 11
  end
  inherited Cds: TCMClientDataSet
    Left = 312
    Top = 59
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'FERIADOS.DESCFERIADO'
      'FERIADOS.DATAFERIADO')
    TipodeDado.Strings = (
      'C'
      'D')
    Descricao.Strings = (
      'Descrição'
      'Data')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'FERIADOS')
    CamposChave.Strings = (
      'FERIADOS.IDFERIADO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '30'
      '18')
    Left = 368
    Top = 59
  end
  object CdsSindicato: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 156
    Top = 59
  end
  object CdsCidade: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 156
    Top = 15
  end
  object CdsEstado: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 208
    Top = 59
  end
  object CdsPais: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 208
    Top = 15
  end
end
