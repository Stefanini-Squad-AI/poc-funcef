inherited frmApurHstMov: TfrmApurHstMov
  Caption = 'Apuração de Tipos de Operações'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited dbGrd: TwwDBGrid [0]
      Top = 65
      Height = 135
      Selected.Strings = (
        'DATA'#9'18'#9'Data'
        'VALOR'#9'14'#9'Valor'
        'IDCPIMPORTACAO'#9'16'#9'Lote Importação'
        'SITUACAO'#9'15'#9'Situação Cota'#9'F')
    end
    inherited pnlControles: TPanel [1]
      Top = 65
      Height = 135
      object Label3: TLabel
        Left = 8
        Top = 16
        Width = 28
        Height = 13
        Caption = 'Data'
      end
      object Label4: TLabel
        Left = 8
        Top = 64
        Width = 30
        Height = 13
        Caption = 'Valor'
        FocusControl = DBEdit2
      end
      object Label5: TLabel
        Left = 256
        Top = 16
        Width = 93
        Height = 13
        Caption = 'Lote Importação'
        FocusControl = DBEdit3
      end
      object Label6: TLabel
        Left = 256
        Top = 64
        Width = 51
        Height = 13
        Caption = 'Situação'
        FocusControl = DBEdit4
      end
      object DBEdit2: TDBEdit
        Left = 8
        Top = 80
        Width = 121
        Height = 21
        DataField = 'VALOR'
        DataSource = ds
        TabOrder = 0
      end
      object DBEdit3: TDBEdit
        Left = 256
        Top = 32
        Width = 97
        Height = 21
        Color = clMenu
        DataField = 'IDCPIMPORTACAO'
        DataSource = ds
        TabOrder = 1
      end
      object DBEdit4: TDBEdit
        Left = 256
        Top = 80
        Width = 97
        Height = 21
        Color = clMenu
        DataField = 'SITUACAO'
        DataSource = ds
        TabOrder = 2
      end
      object CMDateTimePicker3: TCMDateTimePicker
        Left = 8
        Top = 32
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATA'
        DataSource = ds
        Date = 38353
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
        Time = 38353
        ShowButton = True
        TabOrder = 3
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 505
      Height = 64
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 83
        Height = 13
        Caption = 'Conta / Fundo'
      end
      object Label2: TLabel
        Left = 256
        Top = 8
        Width = 85
        Height = 13
        Caption = 'Tipo Operação'
      end
      object ComboBox1: TComboBox
        Left = 8
        Top = 24
        Width = 241
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Text = 'V+ RENDA - CONCEDIDO'
      end
      object ComboBox2: TComboBox
        Left = 256
        Top = 24
        Width = 241
        Height = 21
        ItemHeight = 13
        TabOrder = 1
        Text = 'QTDE COTAS RESGATE'
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 34
    Top = 7
  end
  inherited ds: TwwDataSource
    Left = 246
    Top = 65535
  end
  inherited ImlPadrao: TImageList
    Left = 104
    Top = 15
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 304
    Top = 65535
  end
  inherited Cds: TCMClientDataSet
    Active = True
    Left = 276
    Top = 65535
    Data = {
      2F0100009619E0BD010000001800000008000200000003000000C7000A494443
      504853544D4F5608000400000000000949444350434F4E544108000400000000
      000C494443505449504F4F504552080004000000000004444154410800080000
      0000000556414C4F5208000400000000000E49444350434F544143414F415456
      08000400000000000E49444350494D504F52544143414F080004000000000008
      534954554143414F0100490000000100055749445448020002000B000100044C
      4349440400010009080000000010000000000000F03F00000000000000400000
      00000000F03F0000BA7221C2CC4211C1DDFE01654B40000000000000F03F0944
      6976756C67616461000054000000000000F03F00000000000000400000000000
      00F03F0000589F38C2CC427B061E29EC475040}
    object CdsDATA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 18
      FieldName = 'DATA'
    end
    object CdsVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 14
      FieldName = 'VALOR'
    end
    object CdsIDCPIMPORTACAO: TFloatField
      DisplayLabel = 'Lote Importação'
      DisplayWidth = 16
      FieldName = 'IDCPIMPORTACAO'
    end
    object CdsSITUACAO: TStringField
      DisplayLabel = 'Situação Cota'
      DisplayWidth = 15
      FieldName = 'SITUACAO'
      Size = 11
    end
    object CdsIDCPHSTMOV: TFloatField
      FieldName = 'IDCPHSTMOV'
      Visible = False
    end
    object CdsIDCPCONTA: TFloatField
      FieldName = 'IDCPCONTA'
      Visible = False
    end
    object CdsIDCPTIPOOPER: TFloatField
      FieldName = 'IDCPTIPOOPER'
      Visible = False
    end
    object CdsIDCPCOTACAOATV: TFloatField
      FieldName = 'IDCPCOTACAOATV'
      Visible = False
    end
  end
  inherited MontaSelect: TMontaSelect
    Left = 336
    Top = 65535
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      
        'SELECT H.*, DECODE(C.SITUACAO, '#39'P'#39', '#39'Pendente'#39', '#39'R'#39', '#39'Recalculad' +
        'a'#39', '#39'D'#39', '#39'Divulgada'#39', '#39#39') as SITUACAO'
      'FROM CPHSTMOV H, CPCOTACAOATV C '
      'WHERE H.IDCPCOTACAOATV = C.IDCPCOTACAOATV(+)')
    ClientDataSet = Cds
    Left = 408
    Top = 9
  end
end
