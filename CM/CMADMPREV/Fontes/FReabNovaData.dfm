inherited frmReabNovaData: TfrmReabNovaData
  Left = 707
  Top = 127
  Caption = 'Datas para Reabertura de Benefício'
  ClientHeight = 400
  ClientWidth = 342
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 342
    Height = 361
    object GroupBox2: TGroupBox
      Left = 18
      Top = 133
      Width = 307
      Height = 63
      TabOrder = 1
      object lblDtInicio: TLabel
        Left = 15
        Top = 11
        Width = 92
        Height = 26
        Caption = 'Informe a Nova Data de Início'
        WordWrap = True
      end
      object lblDtFinal: TLabel
        Left = 171
        Top = 11
        Width = 92
        Height = 26
        Caption = 'Informe a Nova Data Final'
        WordWrap = True
      end
      object dtInicio: TCMDateTimePicker
        Left = 15
        Top = 36
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
        TabOrder = 0
      end
      object dtFinal: TCMDateTimePicker
        Left = 171
        Top = 36
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
        TabOrder = 1
        OnExit = dtFinalExit
      end
    end
    object rgrpReabertura: TRadioGroup
      Left = 18
      Top = 74
      Width = 298
      Height = 51
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Renovação'
        'Reabertura')
      TabOrder = 2
      OnClick = rgrpReaberturaClick
    end
    object rgrpEncerramento: TGroupBox
      Left = 18
      Top = 82
      Width = 307
      Height = 51
      Caption = '   Motivo do Encerramento   '
      TabOrder = 5
    end
    object rgrpDataPrevEfet: TRadioGroup
      Left = 18
      Top = 187
      Width = 307
      Height = 51
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Data Prevista'
        'Data Efetiva')
      TabOrder = 3
      OnClick = rgrpReaberturaClick
    end
    object GroupBox1: TGroupBox
      Left = 18
      Top = 7
      Width = 307
      Height = 67
      Caption = ' Situação até o momento '
      TabOrder = 0
      object lblDtInicioAntes: TLabel
        Left = 15
        Top = 20
        Width = 83
        Height = 13
        Caption = 'Data de Início'
      end
      object lblDtFinalAntes: TLabel
        Left = 170
        Top = 20
        Width = 59
        Height = 13
        Caption = 'Data Final'
      end
      object edDtInicioAntes: TEdit
        Left = 15
        Top = 35
        Width = 121
        Height = 21
        Color = clSilver
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object edDtFinalAntes: TEdit
        Left = 170
        Top = 35
        Width = 121
        Height = 21
        Color = clSilver
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
    object grbMatricula: TGroupBox
      Left = 18
      Top = 291
      Width = 307
      Height = 65
      Caption = ' (opcional) '
      TabOrder = 4
      object Label1: TLabel
        Left = 14
        Top = 22
        Width = 93
        Height = 13
        Caption = 'Nova Matrícula '
      end
      object Label2: TLabel
        Left = 186
        Top = 22
        Width = 61
        Height = 13
        Caption = 'financeiro.'
      end
      object Bevel1: TBevel
        Left = 159
        Top = 10
        Width = 3
        Height = 50
      end
      object edtMatricula: TEdit
        Left = 14
        Top = 38
        Width = 115
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object ChBxEfetuaAcerto: TCheckBox
        Left = 167
        Top = 10
        Width = 130
        Height = 13
        Caption = 'Não efetuar acerto'
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = ChBxEfetuaAcertoClick
      end
    end
    object rgrpRetornaPatro: TRadioGroup
      Left = 18
      Top = 239
      Width = 307
      Height = 51
      Caption = ' Participante Retornará a Patrocinadora ? '
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 6
    end
    object dbcbMotivore: TwwDBLookupCombo
      Left = 32
      Top = 104
      Width = 273
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DS_MOTIVO'#9'30'#9'DS_MOTIVO'#9'F')
      LookupTable = qryMotivore
      LookupField = 'ID_MOTIVO'
      ParentShowHint = False
      ShowHint = False
      TabOrder = 7
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnChange = dbcbMotivoreChange
      OnExit = dbcbMotivoreExit
    end
  end
  inherited Dock971: TDock97
    Top = 361
    Width = 342
    inherited tb97Fundo: TToolbar97
      Left = 170
      DockPos = 254
      inherited bbtnAjuda: TmaHelpBitBtn
        OnClick = bbtnAjudaClick
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 1
      DockPos = 85
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 592
    Top = 427
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryUpdElegpatro: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 4
    Top = 377
  end
  object qryMotivore: TwwQuery
    DatabaseName = 'BASEDADOS'
    RequestLive = True
    SQL.Strings = (
      'SELECT ID_MOTIVO,DS_MOTIVO,FLGNPERMFINANC FROM MOTIVORE'
      'WHERE ((TP_MOTIVO = '#39'T'#39') OR (TP_MOTIVO = :Tipo) )'
      'AND       (FLGATIVO =  1 )')
    ValidateWithMask = True
    Left = 208
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Tipo'
        ParamType = ptUnknown
      end>
  end
  object dsMotivore: TwwDataSource
    DataSet = qryMotivore
    Left = 290
    Top = 331
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 104
    Top = 368
  end
end
