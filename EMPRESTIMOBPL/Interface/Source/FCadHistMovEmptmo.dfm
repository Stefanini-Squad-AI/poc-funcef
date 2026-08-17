inherited frmCadHistMovEmptmo: TfrmCadHistMovEmptmo
  Left = 299
  Top = 120
  Caption = ''
  ClientHeight = 530
  ClientWidth = 567
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label10: TLabel [0]
    Left = 392
    Top = 42
    Width = 44
    Height = 13
    Caption = 'Parcela'
  end
  inherited pnlFundo: TPanel
    Width = 567
    Height = 462
    object Bevel1: TBevel
      Left = 16
      Top = 189
      Width = 225
      Height = 50
    end
    object Label1: TLabel
      Left = 16
      Top = 10
      Width = 109
      Height = 13
      Caption = 'Contrato/Protocolo'
    end
    object Label3: TLabel
      Left = 16
      Top = 58
      Width = 101
      Height = 13
      Caption = 'Mês Competência'
    end
    object Label4: TLabel
      Left = 136
      Top = 58
      Width = 82
      Height = 13
      Caption = 'Mês Cobranca'
    end
    object Label5: TLabel
      Left = 304
      Top = 10
      Width = 44
      Height = 13
      Caption = 'Parcela'
    end
    object Label6: TLabel
      Left = 440
      Top = 10
      Width = 23
      Height = 13
      Caption = 'Seq'
    end
    object Label7: TLabel
      Left = 16
      Top = 146
      Width = 80
      Height = 13
      Caption = 'Valor Previsto'
    end
    object Label8: TLabel
      Left = 128
      Top = 146
      Width = 74
      Height = 13
      Caption = 'Valor Efetivo'
    end
    object Label9: TLabel
      Left = 352
      Top = 106
      Width = 85
      Height = 13
      Caption = 'Saldo Devedor'
    end
    object Label11: TLabel
      Left = 504
      Top = 10
      Width = 43
      Height = 13
      Caption = 'Restam'
    end
    object Label12: TLabel
      Left = 16
      Top = 106
      Width = 78
      Height = 13
      Caption = 'Data Prevista'
    end
    object Label13: TLabel
      Left = 240
      Top = 106
      Width = 72
      Height = 13
      Caption = 'Data Efetiva'
    end
    object Label14: TLabel
      Left = 128
      Top = 106
      Width = 72
      Height = 13
      Caption = 'Data Vencto'
    end
    object Label15: TLabel
      Left = 112
      Top = 196
      Width = 97
      Height = 13
      Caption = 'Data Quit/Abono'
    end
    object Label16: TLabel
      Left = 352
      Top = 218
      Width = 91
      Height = 13
      Caption = 'Cod Documento'
    end
    object Label17: TLabel
      Left = 416
      Top = 164
      Width = 54
      Height = 13
      Caption = 'Planilha: '
    end
    object Label18: TLabel
      Left = 152
      Top = 10
      Width = 41
      Height = 13
      Caption = 'Evento'
    end
    object Label19: TLabel
      Left = 232
      Top = 10
      Width = 25
      Height = 13
      Caption = 'Item'
    end
    object Bevel2: TBevel
      Left = 16
      Top = 248
      Width = 225
      Height = 77
    end
    object Label2: TLabel
      Left = 112
      Top = 252
      Width = 75
      Height = 13
      Caption = 'Data Estorno'
    end
    object Label20: TLabel
      Left = 456
      Top = 106
      Width = 77
      Height = 13
      Caption = 'Data Atualiza'
    end
    object Label21: TLabel
      Left = 124
      Top = 298
      Width = 19
      Height = 13
      Caption = 'Pln'
    end
    object Label22: TLabel
      Left = 456
      Top = 218
      Width = 67
      Height = 13
      Caption = 'IDTmpDesc'
    end
    object Label23: TLabel
      Left = 240
      Top = 146
      Width = 62
      Height = 13
      Caption = 'Valor Base'
    end
    object Label24: TLabel
      Left = 368
      Top = 10
      Width = 63
      Height = 13
      Caption = 'Parcela Alt'
    end
    object Label25: TLabel
      Left = 112
      Top = 336
      Width = 67
      Height = 13
      Caption = 'IDTipoSusp'
    end
    object Label26: TLabel
      Left = 352
      Top = 146
      Width = 49
      Height = 13
      Caption = 'Tx.Juros'
    end
    object lblObservacao: TLabel
      Left = 16
      Top = 385
      Width = 69
      Height = 13
      Caption = 'Observação'
    end
    object dbredtObservacao: TDBRichEdit
      Left = 52
      Top = 384
      Width = 158
      Height = 36
      TabStop = False
      DataField = 'HMEOBSERVACAO'
      DataSource = ds
      Enabled = False
      ReadOnly = True
      TabOrder = 44
      Visible = False
    end
    object DBspnParcela: TwwDBSpinEdit
      Left = 304
      Top = 24
      Width = 49
      Height = 21
      Increment = 1
      DataField = 'HMEPARCELA'
      DataSource = ds
      TabOrder = 3
      UnboundDataType = wwDefault
    end
    object DBspnSeq: TwwDBSpinEdit
      Left = 440
      Top = 24
      Width = 49
      Height = 21
      Increment = 1
      DataField = 'HMESEQCOBRANCA'
      DataSource = ds
      TabOrder = 5
      UnboundDataType = wwDefault
    end
    object dbsParcRest: TwwDBSpinEdit
      Left = 504
      Top = 24
      Width = 49
      Height = 21
      Increment = 1
      DataField = 'HMENUMPARCELAS'
      DataSource = ds
      TabOrder = 6
      UnboundDataType = wwDefault
    end
    object DBedtDtCancelamento: TCMDateTimePicker
      Left = 16
      Top = 120
      Width = 97
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'HMEDATAPREVISTA'
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
      TabOrder = 13
    end
    object DBedtDtEfetiva: TCMDateTimePicker
      Left = 240
      Top = 120
      Width = 97
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'HMEDATAEFETIVA'
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
      TabOrder = 15
      OnExit = DBedtDtEfetivaExit
    end
    object DBedtContrato: TwwDBEdit
      Left = 16
      Top = 24
      Width = 121
      Height = 21
      Color = clBtnFace
      DataField = 'IDCONTRATOEMPTMO'
      DataSource = ds
      Enabled = False
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeValorPrevisto: TwwDBEdit
      Left = 16
      Top = 160
      Width = 97
      Height = 21
      DataField = 'HMEVLRPREVISTO'
      DataSource = ds
      TabOrder = 18
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dbeValorPrevistoExit
    end
    object dbeValorEfetivo: TwwDBEdit
      Left = 128
      Top = 160
      Width = 97
      Height = 21
      DataField = 'HMEVLREFETIVO'
      DataSource = ds
      TabOrder = 19
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dbeValorEfetivoExit
    end
    object dbeSaldoDeve: TwwDBEdit
      Left = 352
      Top = 120
      Width = 89
      Height = 21
      DataField = 'HMESALDODEV'
      DataSource = ds
      TabOrder = 16
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object DBchkDivergPend: TDBCheckBox
      Left = 264
      Top = 264
      Width = 89
      Height = 17
      Caption = 'Divergente'
      DataField = 'FLGDIVERGPEND'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 34
      ValueChecked = '1'
      ValueUnchecked = '0'
      OnClick = DBchkDivergPendClick
    end
    object CMDateTimePicker1: TCMDateTimePicker
      Left = 128
      Top = 120
      Width = 97
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'HMEDATAVENCTO'
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
      TabOrder = 14
    end
    object DBCheckBox3: TDBCheckBox
      Left = 24
      Top = 194
      Width = 73
      Height = 17
      Caption = 'Abonado'
      DataField = 'FLGABONADO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 23
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBCheckBox4: TDBCheckBox
      Left = 24
      Top = 218
      Width = 73
      Height = 17
      Caption = 'Quitado'
      DataField = 'FLGQUITADO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 24
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBCheckBox5: TDBCheckBox
      Left = 352
      Top = 192
      Width = 105
      Height = 17
      Caption = 'Baixa Manual'
      DataField = 'FLGBAIXAMANUAL'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 27
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBcboTipoDiverg: TwwDBComboBox
      Left = 352
      Top = 262
      Width = 201
      Height = 21
      ShowButton = True
      Style = csDropDown
      MapList = True
      AllowClearKey = False
      DataField = 'FLGTIPODIVERG'
      DataSource = ds
      DropDownCount = 8
      ItemHeight = 0
      Items.Strings = (
        'Valores ainda não recebidos'#9'1'
        'Recebimentos Inesperados'#9'2'
        'Valores recebidos a menor'#9'3'
        'Valores recebidos a maior'#9'4'
        'Divergência de datas'#9'5'
        'Valores não recebidos'#9'6')
      Sorted = False
      TabOrder = 35
      UnboundDataType = wwDefault
    end
    object DBchkEnviado: TDBCheckBox
      Left = 264
      Top = 232
      Width = 73
      Height = 17
      Caption = 'Enviado'
      DataField = 'FLGENVIO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 28
      ValueChecked = '1'
      ValueUnchecked = '0'
      OnClick = DBchkDivergPendClick
    end
    object CMDateTimePicker2: TCMDateTimePicker
      Left = 112
      Top = 210
      Width = 105
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'HMEDATAQUITABONO'
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
      TabOrder = 25
    end
    object wwDBEdit1: TwwDBEdit
      Left = 472
      Top = 160
      Width = 81
      Height = 21
      DataField = 'PLNCODIGO'
      DataSource = ds
      TabOrder = 22
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 408
      Top = 56
      Width = 145
      Height = 41
      Columns = 2
      DataField = 'HMETIPOFOLHA'
      DataSource = ds
      Items.Strings = (
        'Benef'
        'Patro')
      TabOrder = 12
      Values.Strings = (
        'B'
        'P')
    end
    object DBRadioGroup2: TDBRadioGroup
      Left = 256
      Top = 56
      Width = 137
      Height = 41
      Columns = 2
      DataField = 'HMEFORMACOBRANCA'
      DataSource = ds
      Items.Strings = (
        'Folha'
        'Banco')
      TabOrder = 11
      Values.Strings = (
        'F'
        'C')
    end
    object wwDBEdit2: TwwDBEdit
      Left = 352
      Top = 232
      Width = 89
      Height = 21
      DataField = 'CODDOCUMENTO'
      DataSource = ds
      TabOrder = 29
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object DBedtItem: TwwDBEdit
      Left = 232
      Top = 24
      Width = 57
      Height = 21
      DataField = 'IDITEMEMPTMO'
      DataSource = ds
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object DBedtEvento: TwwDBEdit
      Left = 152
      Top = 24
      Width = 65
      Height = 21
      DataField = 'HMETIPOMOV'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object DBCheckBox1: TDBCheckBox
      Left = 264
      Top = 192
      Width = 81
      Height = 17
      Caption = 'Baixado'
      DataField = 'FLGBAIXADO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 26
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBchkSuspensao: TDBCheckBox
      Left = 24
      Top = 352
      Width = 81
      Height = 17
      Caption = 'Suspenso'
      DataField = 'FLGSUSPENSAO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 38
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBchkEstornado: TDBCheckBox
      Left = 24
      Top = 266
      Width = 81
      Height = 17
      Caption = 'Estornado'
      DataField = 'FLGESTORNADO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 31
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object CMDateTimePicker3: TCMDateTimePicker
      Left = 112
      Top = 266
      Width = 105
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'HMEDATAESTORNO'
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
      TabOrder = 32
    end
    object wwDBEdit3: TwwDBEdit
      Left = 16
      Top = 72
      Width = 49
      Height = 21
      DataField = 'HMEMESCOMPETENCIA'
      DataSource = ds
      MaxLength = 2
      TabOrder = 7
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = wwDBEdit3Exit
    end
    object wwDBEdit5: TwwDBEdit
      Left = 64
      Top = 72
      Width = 57
      Height = 21
      DataField = 'HMEANOCOMPETENCIA'
      DataSource = ds
      MaxLength = 4
      TabOrder = 8
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = wwDBEdit5Exit
    end
    object wwDBEdit4: TwwDBEdit
      Left = 136
      Top = 72
      Width = 49
      Height = 21
      DataField = 'HMEMESCOBRANCA'
      DataSource = ds
      MaxLength = 2
      TabOrder = 9
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit6: TwwDBEdit
      Left = 184
      Top = 72
      Width = 57
      Height = 21
      DataField = 'HMEANOCOBRANCA'
      DataSource = ds
      MaxLength = 4
      TabOrder = 10
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object DBCheckBox6: TDBCheckBox
      Left = 264
      Top = 288
      Width = 145
      Height = 17
      Caption = 'Divergência Tratada'
      DataField = 'FLGDIVERGTRAT'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 36
      ValueChecked = '1'
      ValueUnchecked = '0'
      OnClick = DBchkDivergPendClick
    end
    object CMDateTimePicker4: TCMDateTimePicker
      Left = 456
      Top = 120
      Width = 97
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'HMEDATAATUALIZA'
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
      TabOrder = 17
    end
    object wwDBEdit7: TwwDBEdit
      Left = 148
      Top = 294
      Width = 69
      Height = 21
      DataField = 'PLNCODIGOESTORNO'
      DataSource = ds
      TabOrder = 33
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object DBCheckBox7: TDBCheckBox
      Left = 264
      Top = 312
      Width = 145
      Height = 17
      Caption = 'Entrada Manual'
      DataField = 'FLGENTRADAMANUAL'
      DataSource = ds
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 37
      ValueChecked = '1'
      ValueUnchecked = '0'
      OnClick = DBchkDivergPendClick
    end
    object DBCheckBox8: TDBCheckBox
      Left = 472
      Top = 336
      Width = 89
      Height = 17
      Caption = 'Centraliza'
      DataField = 'HMECENTRALIZA'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 40
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBCheckBox9: TDBCheckBox
      Left = 472
      Top = 352
      Width = 89
      Height = 17
      Caption = 'Destacado'
      DataField = 'HMEDESTACADO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 41
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object wwDBEdit8: TwwDBEdit
      Left = 456
      Top = 232
      Width = 97
      Height = 21
      DataField = 'IDTMPDESC'
      DataSource = ds
      TabOrder = 30
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit9: TwwDBEdit
      Left = 240
      Top = 160
      Width = 97
      Height = 21
      DataField = 'HMEVLRBASE'
      DataSource = ds
      TabOrder = 20
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dbeValorEfetivoExit
    end
    object wwDBSpinEdit1: TwwDBSpinEdit
      Left = 368
      Top = 24
      Width = 49
      Height = 21
      Increment = 1
      DataField = 'HMEPARCELAALT'
      DataSource = ds
      TabOrder = 4
      UnboundDataType = wwDefault
    end
    object wwDBEdit10: TwwDBEdit
      Left = 112
      Top = 350
      Width = 81
      Height = 21
      DataField = 'IDTIPOSUSPEMPTMO'
      DataSource = ds
      TabOrder = 39
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit11: TwwDBEdit
      Left = 352
      Top = 160
      Width = 49
      Height = 21
      DataField = 'HMETXJUROS'
      DataSource = ds
      TabOrder = 21
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dbeValorEfetivoExit
    end
    object DBRadioGroup3: TDBRadioGroup
      Left = 264
      Top = 330
      Width = 193
      Height = 41
      Columns = 2
      DataField = 'HMERECPAG'
      DataSource = ds
      Items.Strings = (
        'A Pagar'
        'A Receber')
      TabOrder = 42
      Values.Strings = (
        'P'
        'R')
    end
    object redtObservacao: TRichEdit
      Left = 1
      Top = 380
      Width = 565
      Height = 81
      Align = alBottom
      TabOrder = 43
    end
  end
  inherited Dock972: TDock97
    Width = 567
    inherited Toolbar971: TToolbar97
      Visible = False
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Enabled = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Enabled = False
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
      end
      inherited btnRefresh: TToolbarButton97
        Enabled = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 497
    Width = 567
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      4
      (
        'TMemo'
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0)
      (
        'TRichEdit'
        'Text'
        0)
      (
        'TDBRichEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Top = 0
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTMOVEMPTMO'
      'set'
      '  IDITEMEMPTMO = :IDITEMEMPTMO,'
      '  HMEPARCELA = :HMEPARCELA,'
      '  HMETIPOMOV = :HMETIPOMOV,'
      '  HMEORIGEM = :HMEORIGEM,'
      '  HMERECPAG = :HMERECPAG,'
      '  HMEFORMACOBRANCA = :HMEFORMACOBRANCA,'
      '  HMESEQCOBRANCA = :HMESEQCOBRANCA,'
      '  HMEDATA = :HMEDATA,'
      '  HMEDATAPREVISTA = :HMEDATAPREVISTA,'
      '  HMEDATAEFETIVA = :HMEDATAEFETIVA,'
      '  HMEDATAATUALIZA = :HMEDATAATUALIZA,'
      '  HMEANOCOMPETENCIA = :HMEANOCOMPETENCIA,'
      '  HMEMESCOMPETENCIA = :HMEMESCOMPETENCIA,'
      '  HMEANOCOBRANCA = :HMEANOCOBRANCA,'
      '  HMEMESCOBRANCA = :HMEMESCOBRANCA,'
      '  HMEVLRPREVISTO = :HMEVLRPREVISTO,'
      '  HMEVLREFETIVO = :HMEVLREFETIVO,'
      '  HMECENTRALIZA = :HMECENTRALIZA,'
      '  HMEDESTACADO = :HMEDESTACADO,'
      '  HMESALDODEV = :HMESALDODEV,'
      '  HMENUMPARCELAS = :HMENUMPARCELAS,'
      '  HMEDATAVENCTO = :HMEDATAVENCTO,'
      '  HMEDATAQUITABONO = :HMEDATAQUITABONO,'
      '  HMEDATAESTORNO = :HMEDATAESTORNO,'
      '  FLGTIPODIVERG = :FLGTIPODIVERG,'
      '  HMETIPOFOLHA = :HMETIPOFOLHA,'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  PLNCODIGOESTORNO = :PLNCODIGOESTORNO,'
      '  IDUSUARIOESTORNO = :IDUSUARIOESTORNO,'
      '  HMEDATAESTORNOALT = :HMEDATAESTORNOALT,'
      '  HMETXJUROS = :HMETXJUROS,'
      '  VERSAO = :VERSAO,'
      '  IDTMPDESC = :IDTMPDESC,'
      '  IDTIPOSUSPEMPTMO = :IDTIPOSUSPEMPTMO,'
      '  HMEVLRBASE = :HMEVLRBASE,'
      '  HMEPARCELAALT = :HMEPARCELAALT,'
      '  FLGENTRADAMANUAL = :FLGENTRADAMANUAL,'
      '  FLGDIVERGPEND = :FLGDIVERGPEND,'
      '  FLGDIVERGTRAT = :FLGDIVERGTRAT,'
      '  FLGBAIXADO = :FLGBAIXADO,'
      '  FLGENVIO = :FLGENVIO,'
      '  FLGABONADO = :FLGABONADO,'
      '  FLGQUITADO = :FLGQUITADO,'
      '  FLGBAIXAMANUAL = :FLGBAIXAMANUAL,'
      '  FLGSUSPENSAO = :FLGSUSPENSAO,'
      '  FLGESTORNADO = :FLGESTORNADO,'
      '  HMEOBSERVACAO = :HMEOBSERVACAO'
      'where'
      '  IDHISTMOVEMPTMO = :OLD_IDHISTMOVEMPTMO')
    InsertSQL.Strings = (
      'insert into HISTMOVEMPTMO'
      '  (IDHISTMOVEMPTMO, IDCONTRATOEMPTMO, IDITEMEMPTMO, '
      'HMEPARCELA, HMETIPOMOV, '
      '   HMEORIGEM, HMERECPAG, HMEFORMACOBRANCA, HMESEQCOBRANCA, '
      'HMEDATA, HMEDATAPREVISTA, '
      '   HMEDATAEFETIVA, HMEDATAATUALIZA, HMEANOCOMPETENCIA, '
      'HMEMESCOMPETENCIA, '
      '   HMEANOCOBRANCA, HMEMESCOBRANCA, HMEVLRPREVISTO, '
      'HMEVLREFETIVO, HMECENTRALIZA, '
      '   HMEDESTACADO, HMESALDODEV, HMENUMPARCELAS, HMEDATAVENCTO, '
      'HMEDATAQUITABONO, '
      '   HMEDATAESTORNO, FLGTIPODIVERG, HMETIPOFOLHA, CODDOCUMENTO, '
      'PLNCODIGO, '
      '   PLNCODIGOESTORNO, IDUSUARIOESTORNO, HMEDATAESTORNOALT, '
      'HMETXJUROS, VERSAO, '
      '   IDTMPDESC, IDTIPOSUSPEMPTMO, HMEVLRBASE, HMEPARCELAALT, '
      'FLGENTRADAMANUAL, '
      
        '   FLGDIVERGPEND, FLGDIVERGTRAT, FLGBAIXADO, FLGENVIO, FLGABONAD' +
        'O, '
      'FLGQUITADO, '
      '   FLGBAIXAMANUAL, FLGSUSPENSAO, FLGESTORNADO, HMEOBSERVACAO)'
      'values'
      '  (:IDHISTMOVEMPTMO, :IDCONTRATOEMPTMO, :IDITEMEMPTMO, '
      ':HMEPARCELA, :HMETIPOMOV, '
      '   :HMEORIGEM, :HMERECPAG, :HMEFORMACOBRANCA, :HMESEQCOBRANCA, '
      ':HMEDATA, '
      '   :HMEDATAPREVISTA, :HMEDATAEFETIVA, :HMEDATAATUALIZA, '
      ':HMEANOCOMPETENCIA, '
      '   :HMEMESCOMPETENCIA, :HMEANOCOBRANCA, :HMEMESCOBRANCA, '
      ':HMEVLRPREVISTO, '
      '   :HMEVLREFETIVO, :HMECENTRALIZA, :HMEDESTACADO, :HMESALDODEV, '
      ':HMENUMPARCELAS, '
      '   :HMEDATAVENCTO, :HMEDATAQUITABONO, :HMEDATAESTORNO, '
      ':FLGTIPODIVERG, '
      '   :HMETIPOFOLHA, :CODDOCUMENTO, :PLNCODIGO, :PLNCODIGOESTORNO, '
      ':IDUSUARIOESTORNO, '
      '   :HMEDATAESTORNOALT, :HMETXJUROS, :VERSAO, :IDTMPDESC, '
      ':IDTIPOSUSPEMPTMO, '
      '   :HMEVLRBASE, :HMEPARCELAALT, :FLGENTRADAMANUAL, '
      ':FLGDIVERGPEND, :FLGDIVERGTRAT, '
      
        '   :FLGBAIXADO, :FLGENVIO, :FLGABONADO, :FLGQUITADO, :FLGBAIXAMA' +
        'NUAL, '
      ':FLGSUSPENSAO, '
      '   :FLGESTORNADO, :HMEOBSERVACAO)')
    DeleteSQL.Strings = (
      'delete from HISTMOVEMPTMO'
      'where'
      '  IDHISTMOVEMPTMO = :OLD_IDHISTMOVEMPTMO')
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Left = 760
    Top = 0
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 696
    Top = 0
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   IDHISTMOVEMPTMO,'
      '   IDCONTRATOEMPTMO,'
      '   IDITEMEMPTMO,'
      '   HMEPARCELA,'
      '   HMETIPOMOV,'
      '   HMEORIGEM,'
      ''
      '   HMERECPAG,'
      '   HMEFORMACOBRANCA,'
      '   HMESEQCOBRANCA,'
      '   HMEDATA,'
      '   HMEDATAPREVISTA,'
      '   HMEDATAEFETIVA,'
      '   HMEDATAATUALIZA,'
      '   HMEANOCOMPETENCIA,'
      '   HMEMESCOMPETENCIA,'
      '   HMEANOCOBRANCA,'
      '   HMEMESCOBRANCA,'
      '   HMEVLRPREVISTO,'
      '   HMEVLREFETIVO,'
      '   HMECENTRALIZA,'
      '   HMEDESTACADO,'
      '   HMESALDODEV,'
      '   HMENUMPARCELAS,'
      '   HMEDATAVENCTO,'
      '   HMEDATAQUITABONO,'
      '   HMEDATAESTORNO,'
      '   FLGTIPODIVERG,'
      '   HMETIPOFOLHA,'
      '   CODDOCUMENTO,'
      '   PLNCODIGO,'
      '   PLNCODIGOESTORNO,'
      ''
      '   IDUSUARIOESTORNO,'
      '   HMEDATAESTORNOALT,'
      ''
      '   HMETXJUROS,'
      ''
      '   VERSAO, IDTMPDESC,'
      ''
      '   IDTIPOSUSPEMPTMO,'
      ''
      '   HMEVLRBASE, HMEPARCELAALT,'
      ''
      '   NVL(FLGENTRADAMANUAL, 0)   AS FLGENTRADAMANUAL,'
      ''
      '   NVL(FLGDIVERGPEND, 0)      AS FLGDIVERGPEND,'
      '   NVL(FLGDIVERGTRAT, 0)      AS FLGDIVERGTRAT,'
      '   NVL(FLGBAIXADO, 1)         AS FLGBAIXADO,'
      '   NVL(FLGENVIO, 1)           AS FLGENVIO,'
      '   NVL(FLGABONADO, 0)         AS FLGABONADO,'
      '   NVL(FLGQUITADO, 0)         AS FLGQUITADO,'
      '   NVL(FLGBAIXAMANUAL, 0)     AS FLGBAIXAMANUAL,'
      '   NVL(FLGSUSPENSAO, 0)       AS FLGSUSPENSAO,'
      '   NVL(FLGESTORNADO, 0)       AS FLGESTORNADO,'
      '  HMEOBSERVACAO'
      ''
      'FROM'
      '   HISTMOVEMPTMO'
      ''
      'WHERE'
      '   IDHISTMOVEMPTMO =:IDHISTMOVEMPTMO')
    Top = 0
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHISTMOVEMPTMO'
        ParamType = ptUnknown
      end>
    object qryIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.IDHISTMOVEMPTMO'
    end
    object qryIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.IDCONTRATOEMPTMO'
    end
    object qryIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.IDITEMEMPTMO'
    end
    object qryHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEPARCELA'
    end
    object qryHMETIPOMOV: TFloatField
      FieldName = 'HMETIPOMOV'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMETIPOMOV'
    end
    object qryHMEORIGEM: TFloatField
      FieldName = 'HMEORIGEM'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEORIGEM'
    end
    object qryHMEFORMACOBRANCA: TStringField
      FieldName = 'HMEFORMACOBRANCA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEFORMACOBRANCA'
      FixedChar = True
      Size = 1
    end
    object qryHMESEQCOBRANCA: TFloatField
      FieldName = 'HMESEQCOBRANCA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMESEQCOBRANCA'
    end
    object qryHMEDATA: TDateTimeField
      FieldName = 'HMEDATA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEDATA'
    end
    object qryHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEDATAPREVISTA'
    end
    object qryHMEDATAEFETIVA: TDateTimeField
      FieldName = 'HMEDATAEFETIVA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEDATAEFETIVA'
    end
    object qryHMEDATAATUALIZA: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEDATAATUALIZA'
    end
    object qryHMEANOCOMPETENCIA: TFloatField
      FieldName = 'HMEANOCOMPETENCIA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEANOCOMPETENCIA'
      DisplayFormat = '0000'
      EditFormat = '0000'
    end
    object qryHMEMESCOMPETENCIA: TFloatField
      FieldName = 'HMEMESCOMPETENCIA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEMESCOMPETENCIA'
      DisplayFormat = '00'
      EditFormat = '00'
    end
    object qryHMEANOCOBRANCA: TFloatField
      FieldName = 'HMEANOCOBRANCA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEANOCOBRANCA'
      DisplayFormat = '0000'
      EditFormat = '0000'
    end
    object qryHMEMESCOBRANCA: TFloatField
      FieldName = 'HMEMESCOBRANCA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEMESCOBRANCA'
      DisplayFormat = '00'
      EditFormat = '00'
    end
    object qryHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEVLRPREVISTO'
    end
    object qryHMEVLREFETIVO: TFloatField
      DefaultExpression = 'Null'
      FieldName = 'HMEVLREFETIVO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEVLREFETIVO'
    end
    object qryHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMESALDODEV'
    end
    object qryHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMENUMPARCELAS'
    end
    object qryFLGBAIXADO: TFloatField
      FieldName = 'FLGBAIXADO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.FLGBAIXADO'
    end
    object qryHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEDATAVENCTO'
    end
    object qryHMECENTRALIZA: TFloatField
      FieldName = 'HMECENTRALIZA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMECENTRALIZA'
    end
    object qryHMEDESTACADO: TFloatField
      FieldName = 'HMEDESTACADO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEDESTACADO'
    end
    object qryFLGDIVERGPEND: TFloatField
      FieldName = 'FLGDIVERGPEND'
    end
    object qryFLGTIPODIVERG: TFloatField
      FieldName = 'FLGTIPODIVERG'
    end
    object qryFLGENVIO: TFloatField
      FieldName = 'FLGENVIO'
    end
    object qryHMEDATAQUITABONO: TDateTimeField
      FieldName = 'HMEDATAQUITABONO'
    end
    object qryFLGABONADO: TFloatField
      FieldName = 'FLGABONADO'
    end
    object qryFLGQUITADO: TFloatField
      FieldName = 'FLGQUITADO'
    end
    object qryFLGBAIXAMANUAL: TFloatField
      FieldName = 'FLGBAIXAMANUAL'
    end
    object qryHMETIPOFOLHA: TStringField
      FieldName = 'HMETIPOFOLHA'
      FixedChar = True
      Size = 1
    end
    object qryCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryFLGSUSPENSAO: TFloatField
      FieldName = 'FLGSUSPENSAO'
    end
    object qryHMEDATAESTORNO: TDateTimeField
      FieldName = 'HMEDATAESTORNO'
    end
    object qryFLGESTORNADO: TFloatField
      FieldName = 'FLGESTORNADO'
    end
    object qryFLGDIVERGTRAT: TFloatField
      FieldName = 'FLGDIVERGTRAT'
    end
    object qryPLNCODIGOESTORNO: TFloatField
      FieldName = 'PLNCODIGOESTORNO'
    end
    object qryFLGENTRADAMANUAL: TFloatField
      FieldName = 'FLGENTRADAMANUAL'
    end
    object qryVERSAO: TStringField
      FieldName = 'VERSAO'
      Size = 10
    end
    object qryIDTMPDESC: TFloatField
      FieldName = 'IDTMPDESC'
    end
    object qryHMEVLRBASE: TFloatField
      FieldName = 'HMEVLRBASE'
    end
    object qryHMEPARCELAALT: TFloatField
      FieldName = 'HMEPARCELAALT'
    end
    object qryIDTIPOSUSPEMPTMO: TFloatField
      FieldName = 'IDTIPOSUSPEMPTMO'
    end
    object qryHMETXJUROS: TFloatField
      FieldName = 'HMETXJUROS'
      DisplayFormat = '#0.00'
    end
    object qryHMERECPAG: TStringField
      FieldName = 'HMERECPAG'
      FixedChar = True
      Size = 1
    end
    object qryIDUSUARIOESTORNO: TFloatField
      FieldName = 'IDUSUARIOESTORNO'
    end
    object qryHMEDATAESTORNOALT: TDateTimeField
      FieldName = 'HMEDATAESTORNOALT'
    end
    object qryHMEOBSERVACAO: TMemoField
      FieldName = 'HMEOBSERVACAO'
      BlobType = ftMemo
    end
  end
  object QryOld: TwwQuery
    DatabaseName = 'BASEDADOS'
    ValidateWithMask = True
    Left = 648
    Top = 195
  end
end
