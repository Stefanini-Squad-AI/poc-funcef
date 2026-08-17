inherited frmEmiteChequeMT: TfrmEmiteChequeMT
  Caption = 'Emissão de Cheque'
  ClientHeight = 390
  ClientWidth = 672
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 672
    Height = 351
    object Label1: TLabel
      Left = 25
      Top = 15
      Width = 111
      Height = 13
      Caption = 'Modelo do Cheque:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object labelfavorecido: TLabel
      Left = 345
      Top = 15
      Width = 68
      Height = 13
      Caption = 'Favorecido:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 345
      Top = 64
      Width = 169
      Height = 13
      Caption = 'Local de Emissão do Cheque:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 345
      Top = 112
      Width = 152
      Height = 13
      Caption = 'Local de Emissão Diferido:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 176
      Top = 64
      Width = 100
      Height = 13
      Caption = 'Data de Emissão:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 176
      Top = 112
      Width = 148
      Height = 13
      Caption = 'Data de Emissão Diferido:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 25
      Top = 63
      Width = 113
      Height = 13
      Caption = 'Número do Cheque:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dblcModeloCheque: TwwDBLookupCombo
      Left = 25
      Top = 32
      Width = 305
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'LAYOUT'#9'60'#9'LAYOUT')
      LookupTable = cdsModeloCheque
      LookupField = 'IDTEMPLCHEQUE'
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnChange = dblcModeloChequeChange
    end
    object edFavorecido: TEdit
      Left = 345
      Top = 32
      Width = 305
      Height = 21
      TabOrder = 1
    end
    object edLocalEmissCheque: TEdit
      Left = 345
      Top = 80
      Width = 305
      Height = 21
      TabOrder = 2
    end
    object edLocalDiferido: TEdit
      Left = 345
      Top = 128
      Width = 305
      Height = 21
      TabOrder = 3
    end
    object DtEmis: TCMDateTimePicker
      Left = 176
      Top = 80
      Width = 153
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
      TabOrder = 4
    end
    object DtDiferido: TCMDateTimePicker
      Left = 176
      Top = 128
      Width = 153
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
      TabOrder = 5
    end
    object edNumChq: TRealEdit
      Left = 25
      Top = 80
      Width = 138
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0')
      TabOrder = 6
      WordWrap = False
      IntDigits = 15
      DecDigits = 0
      NumberFormat = iNumber
      Signal = False
    end
    object pgcCheque: TPageControl
      Left = 5
      Top = 158
      Width = 662
      Height = 188
      ActivePage = tbsImpressoraCheque
      Align = alBottom
      TabOrder = 7
      object tbsImpressoraCheque: TTabSheet
        Caption = 'Impressora de Cheques'
        object GpMaqCheque: TGroupBox
          Left = 9
          Top = 40
          Width = 632
          Height = 117
          Caption = ' Parâmetros Para Impressão '
          Enabled = False
          TabOrder = 0
          object Label6: TLabel
            Left = 13
            Top = 20
            Width = 125
            Height = 13
            Caption = 'Modelo de Impressora'
          end
          object Label7: TLabel
            Left = 13
            Top = 67
            Width = 67
            Height = 13
            Caption = 'Porta Serial'
          end
          object CmbModelo: TComboBox
            Left = 13
            Top = 37
            Width = 276
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
          end
          object ComboBoxDeviceName: TComboBox
            Left = 13
            Top = 85
            Width = 98
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 1
            Items.Strings = (
              'COM1'
              'COM2'
              'COM3'
              'COM4')
          end
        end
        object CkbMaquina: TCheckBox
          Left = 9
          Top = 12
          Width = 267
          Height = 17
          Caption = 'Ultiliza Máquina de Impressão de Cheques'
          TabOrder = 1
          OnClick = CkbMaquinaClick
        end
      end
      object tbsVersoCheque: TTabSheet
        Caption = 'Verso do Cheque'
        object lblLinha: TLabel
          Left = 592
          Top = 16
          Width = 56
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0'
        end
        object CkbVersoCheque: TCheckBox
          Left = 9
          Top = 12
          Width = 162
          Height = 17
          Caption = 'Imprime verso do cheque'
          TabOrder = 0
          OnClick = CkbVersoChequeClick
        end
        object memVersoCheque: TMemo
          Left = 0
          Top = 40
          Width = 654
          Height = 120
          Align = alBottom
          Enabled = False
          ScrollBars = ssBoth
          TabOrder = 1
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 351
    Width = 672
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 347
    TargetsData = (
      1
      2
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  object GImpCheque: TGImp
    DataBaseName = 'BaseDados'
    TipoFonte = TfNormal
    MostraPrinterSetup = False
    EjetarPagina = False
    Condensado = False
    Sublinhado = False
    SaltodeLinhaCondensado = False
    RegConfigImpressora.ValueNameId = 'IdImpressora'
    RegConfigImpressora.ValueNamePrinter = 'Impressora\Porta'
    Left = 472
    Top = 184
  end
  object CmCheque: TCmImprimeCheque
    NomeImpressora = niChronos_ACC100
    BaudRate = br9600
    DataBits = db8
    StopBits = sb1
    Parity = paNone
    DeviceName = 'COM1'
    Left = 536
    Top = 184
  end
  object Extenso: TExtensoCM
    TamanhoLinha = 0
    Idioma = iePortugues
    CompletaExtenso = False
    Left = 592
    Top = 184
  end
  object cdsModeloCheque: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDTEMPLCHEQUE'
        DataType = ftFloat
      end
      item
        Name = 'LAYOUT'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'QTDEDIGITOSANO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'FLGIMPCONDENSADO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NUMCHQSALTO'
        DataType = ftFloat
      end
      item
        Name = 'NUMLINHASSALTO'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'cdsDetIndex1'
      end>
    Params = <>
    StoreDefs = True
    Left = 144
    Top = 8
  end
  object sqlpModeloCheque: TCMSqlParams
    SQL.Strings = (
      'SELECT IDTEMPLCHEQUE,'
      '       LAYOUT,'
      '       QTDEDIGITOSANO,'
      '       FLGIMPCONDENSADO,'
      '       NUMCHQSALTO,'
      '       NUMLINHASSALTO'
      'FROM TEMPLCHEQUE')
    ClientDataSet = cdsModeloCheque
    Left = 240
    Top = 8
  end
  object sqlpTesteCheque: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   FLGCONTROLACHEQUE'
      'FROM'
      '   PARAMCAP'
      'WHERE'
      '   (RECPAG = '#39'P'#39') AND'
      '   (IDPESSOA = :IDPessoa)')
    ClientDataSet = cdsTesteCheque
    Left = 592
    Top = 240
  end
  object cdsTesteCheque: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'FLGCONTROLACHEQUE'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'cdsDetIndex1'
      end>
    Params = <>
    StoreDefs = True
    Left = 496
    Top = 240
  end
end
