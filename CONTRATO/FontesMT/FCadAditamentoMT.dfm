inherited frmCadAditamentoMT: TfrmCadAditamentoMT
  Left = 424
  Top = 228
  BorderStyle = bsDialog
  Caption = 'Cadastro de Aditamentos'
  ClientHeight = 412
  ClientWidth = 631
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 631
    Height = 373
    object Label2: TLabel
      Left = 6
      Top = 131
      Width = 143
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'DescriÁ„o do Aditamento'
    end
    object pnlTopo: TPanel
      Left = 1
      Top = 1
      Width = 629
      Height = 121
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 4
        Width = 91
        Height = 13
        Caption = 'Data Assinatura'
      end
      object Label3: TLabel
        Left = 151
        Top = 4
        Width = 40
        Height = 13
        Caption = 'CÛdigo'
      end
      object lblTipo: TLabel
        Left = 11
        Top = 58
        Width = 30
        Height = 13
        Caption = 'Tipo:'
      end
      object lblValorAditamento: TLabel
        Left = 289
        Top = 4
        Width = 115
        Height = 13
        Caption = 'Valor do Aditamento'
      end
      object Label4: TLabel
        Left = 348
        Top = 59
        Width = 270
        Height = 13
        Caption = '(Contrato e Aditamentos anteriores ser„o indispobilizados)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -7
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dbtpDataAssinatura: TCMDateTimePicker
        Left = 8
        Top = 20
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAASSADITAMENTO'
        DataSource = dsAditamento
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
      object dbeCodAditamento: TDBEdit
        Tag = 1
        Left = 151
        Top = 20
        Width = 121
        Height = 21
        DataField = 'CODADITAMENTO'
        DataSource = dsAditamento
        TabOrder = 1
      end
      object rbAditamento: TRadioButton
        Left = 48
        Top = 58
        Width = 87
        Height = 17
        Caption = 'Aditamento'
        Checked = True
        TabOrder = 3
        TabStop = True
        OnClick = rbAditamentoClick
      end
      object rbOutros: TRadioButton
        Left = 48
        Top = 78
        Width = 101
        Height = 17
        Caption = 'Outros'
        TabOrder = 4
        OnClick = rbOutrosClick
      end
      object edtValorAditado: TDBRealEdit
        Left = 288
        Top = 20
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 2
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = True
        DataField = 'VL_ADITAMENTO'
        DataSource = dsAditamento
      end
      object chkReqReinicioParc: TDBCheckBox
        Left = 199
        Top = 58
        Width = 148
        Height = 17
        Caption = 'Reinicia as parcelas ?'
        DataField = 'FLGREINICIODASPARCELAS'
        DataSource = dsAditamento
        TabOrder = 5
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object rbRegula: TRadioButton
        Left = 48
        Top = 97
        Width = 160
        Height = 17
        Caption = 'RegularizaÁ„o Legado'
        TabOrder = 6
        OnClick = rbRegulaClick
      end
      object stCondicao: TStaticText
        Left = 380
        Top = 100
        Width = 235
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Contrato com condiÁ„o: "N„o se aplica"'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
      end
    end
    object dbmemDescricao: TDBMemo
      Tag = 2
      Left = 1
      Top = 149
      Width = 629
      Height = 223
      Align = alBottom
      DataField = 'DESCADITAMENTO'
      DataSource = dsAditamento
      MaxLength = 4000
      ScrollBars = ssVertical
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 373
    Width = 631
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
    end
  end
  object chkbImportaSaldo: TCheckBox [2]
    Left = 423
    Top = 22
    Width = 110
    Height = 17
    Hint = 'Importar saldo do Contrato ou do ˙ltimo Aditamento com valor'
    TabStop = False
    Caption = 'Importar saldo'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = chkbImportaSaldoClick
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 546
    Top = 21
    TargetsData = (
      1
      3
      (
        'TDBMemo'
        'Text'
        0)
      (
        ''
        'Filter'
        0)
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  object cdsAditamento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 233
    Top = 135
  end
  object dsAditamento: TDataSource
    DataSet = cdsAditamento
    Left = 235
    Top = 199
  end
  object cdsCtrlParcelaMedicao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 86
    Top = 138
  end
  object cdsServProdXItemContr: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 86
    Top = 203
  end
  object cdsSaldoContrato: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 235
    Top = 261
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT ID_TIPO_SERVICO, DS_TIPO_SERVICO '
      'FROM CM.TIPO_SERVICO '
      'ORDER BY TRANSLATE (DS_TIPO_SERVICO, '
      #39'äéöûü¡«…Õ”⁄¿»Ã“Ÿ¬ Œ‘€√’À‹œ÷—›Â·ÁÈÌÛ˙‡ËÏÚ˘‚ÍÓÙ˚„ıÎ¸ÔˆÒ˝ˇ'#39','
      #39'SZszYACEIOUAEIOUAEIOUAOEUIONYaaceiouaeiouaeiouaoeuionyy'#39')')
    ValidateWithMask = True
    Left = 351
    Top = 135
  end
  object qryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT ID_TIPO_SERVICO, DS_TIPO_SERVICO '
      'FROM CM.TIPO_SERVICO '
      'ORDER BY TRANSLATE (DS_TIPO_SERVICO, '
      #39'äéöûü¡«…Õ”⁄¿»Ã“Ÿ¬ Œ‘€√’À‹œ÷—›Â·ÁÈÌÛ˙‡ËÏÚ˘‚ÍÓÙ˚„ıÎ¸ÔˆÒ˝ˇ'#39','
      #39'SZszYACEIOUAEIOUAEIOUAOEUIONYaaceiouaeiouaeiouaoeuionyy'#39')')
    ValidateWithMask = True
    Left = 349
    Top = 196
  end
end
