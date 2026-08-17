inherited frmHistoricoSuspensaoCob: TfrmHistoricoSuspensaoCob
  Left = 668
  Top = 161
  HelpContext = 150035
  Caption = 'Cadastro de Suspensão de Cobrança'
  ClientHeight = 566
  ClientWidth = 632
  FormStyle = fsNormal
  Visible = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 35
    Width = 632
    Height = 409
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object Label2: TLabel
      Left = 16
      Top = 80
      Width = 110
      Height = 13
      Caption = 'Tipo de Suspensão'
    end
    object Label6: TLabel
      Left = 144
      Top = 160
      Width = 171
      Height = 13
      Caption = 'Início de Cobrança (mês/ano)'
    end
    object Label1: TLabel
      Left = 424
      Top = 80
      Width = 73
      Height = 13
      Caption = 'Nº de Meses'
    end
    object Label15: TLabel
      Left = 16
      Top = 120
      Width = 118
      Height = 13
      Caption = 'Início de Suspensão'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 144
      Top = 120
      Width = 112
      Height = 13
      Caption = 'Final de Suspensão'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 16
      Top = 160
      Width = 106
      Height = 13
      Caption = 'Data de Liberação'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 512
      Top = 80
      Width = 88
      Height = 13
      Caption = 'Prazo Restante'
    end
    object lblObservacao: TLabel
      Left = 18
      Top = 200
      Width = 69
      Height = 13
      Caption = 'Observação'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 16
      Top = 43
      Width = 91
      Height = 13
      Caption = 'Prestação Atual'
    end
    object Label9: TLabel
      Left = 144
      Top = 43
      Width = 116
      Height = 13
      Caption = 'Prestação Projetada'
    end
    object Label10: TLabel
      Left = 328
      Top = 43
      Width = 151
      Height = 13
      Caption = 'Margem Consignável Atual'
    end
    inline molContratoEmptmo: TmolContratoEmptmo
      Left = 8
      Top = 1
      Width = 609
      inherited edtNome: TEdit
        Width = 353
      end
      inherited btnBuscaContrato: TBitBtn
        Left = 552
        OnClick = molContratoEmptmobtnBuscaContratoClick
      end
      inherited btnLimpaContrato: TBitBtn
        Left = 576
      end
    end
    object dbcboSuspensao: TwwDBLookupCombo
      Left = 16
      Top = 94
      Width = 393
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TSEDESCRICAO'#9'60'#9'Descrição'#9'F')
      DataField = 'IDTIPOSUSPEMPTMO'
      DataSource = ds
      LookupTable = dtmLookEmptmo.qryLookTipoSusp
      LookupField = 'IDTIPOSUSPEMPTMO'
      DropDownWidth = 8
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnCloseUp = dbcboSuspensaoCloseUp
      OnEnter = dbcboSuspensaoEnter
    end
    object chkFerias: TDBCheckBox
      Left = 272
      Top = 134
      Width = 145
      Height = 17
      Caption = 'Suspensão por Férias'
      DataField = 'FLGFERIAS'
      DataSource = ds
      TabOrder = 5
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBcboMes: TwwDBComboBox
      Left = 144
      Top = 174
      Width = 145
      Height = 21
      ShowButton = True
      Style = csDropDown
      MapList = True
      AllowClearKey = False
      DataField = 'HSCMESCOBRANCA'
      DataSource = ds
      DropDownCount = 8
      ItemHeight = 0
      Items.Strings = (
        'Janeiro'#9'1'
        'Fevereiro'#9'2'
        'Março'#9'3'
        'Abril'#9'4'
        'Maio'#9'5'
        'Junho'#9'6'
        'Julho'#9'7'
        'Agosto'#9'8'
        'Setembro'#9'9'
        'Outubro'#9'10'
        'Novembro'#9'11'
        'Dezembro'#9'12')
      Sorted = False
      TabOrder = 8
      UnboundDataType = wwDefault
    end
    object DBspnAno: TwwDBSpinEdit
      Left = 288
      Top = 174
      Width = 65
      Height = 21
      Increment = 1
      DataField = 'HSCANOCOBRANCA'
      DataSource = ds
      TabOrder = 9
      UnboundDataType = wwDefault
    end
    object DBspnMeses: TwwDBSpinEdit
      Left = 424
      Top = 94
      Width = 73
      Height = 21
      Increment = 1
      MaxValue = 999
      MinValue = 1
      Value = 1
      DataField = 'HSCMESES'
      DataSource = ds
      TabOrder = 2
      UnboundDataType = wwDefault
      OnEnter = DBspnMesesEnter
      OnExit = DBspnMesesExit
    end
    object edtDataInicio: TCMDateTimePicker
      Left = 16
      Top = 134
      Width = 113
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'HSCINICIOSUSP'
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
      Enabled = False
      ShowButton = True
      TabOrder = 3
      UnboundDataType = wwDTEdtDate
      OnExit = edtDataInicioExit
    end
    object edtDataFinal: TCMDateTimePicker
      Left = 144
      Top = 134
      Width = 113
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'HSCFINALSUSP'
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
      Enabled = False
      ShowButton = True
      TabOrder = 4
      UnboundDataType = wwDTEdtDate
    end
    object edtDataLibSusp: TCMDateTimePicker
      Left = 16
      Top = 174
      Width = 113
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'HSCDATALIBER'
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
      TabOrder = 7
      UnboundDataType = wwDTEdtDate
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 274
      Width = 593
      Height = 93
      TabOrder = 10
      object Label11: TLabel
        Left = 16
        Top = 10
        Width = 104
        Height = 13
        Caption = 'Atendido em / Por'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 16
        Top = 50
        Width = 113
        Height = 13
        Caption = 'Atualizado em / Por'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit6: TDBEdit
        Left = 16
        Top = 24
        Width = 154
        Height = 21
        Color = clInactiveBorder
        DataField = 'HSCDATAATEND'
        DataSource = ds
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit7: TDBEdit
        Left = 176
        Top = 24
        Width = 401
        Height = 21
        Color = clInactiveBorder
        DataField = 'HSCUSUATEND'
        DataSource = ds
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit9: TDBEdit
        Left = 16
        Top = 64
        Width = 154
        Height = 21
        Color = clInactiveBorder
        DataField = 'HSCDATAATU'
        DataSource = ds
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit10: TDBEdit
        Left = 176
        Top = 64
        Width = 401
        Height = 21
        Color = clInactiveBorder
        DataField = 'HSCUSULIBER'
        DataSource = ds
        ReadOnly = True
        TabOrder = 3
      end
    end
    object edtPrazoRestante: TEdit
      Left = 512
      Top = 94
      Width = 97
      Height = 21
      Color = 12648447
      Enabled = False
      TabOrder = 11
    end
    object rdgStatus: TDBRadioGroup
      Left = 512
      Top = 122
      Width = 98
      Height = 73
      Caption = ' Status '
      DataField = 'FLGSTATUS'
      DataSource = ds
      Items.Strings = (
        'Ativa'
        'Encerrada'
        'Cancelada')
      TabOrder = 6
      Values.Strings = (
        'A'
        'E'
        'C')
    end
    object MmObservacao: TDBMemo
      Left = 16
      Top = 217
      Width = 558
      Height = 56
      DataField = 'OBSERVACAO'
      DataSource = ds
      ScrollBars = ssVertical
      TabOrder = 12
    end
    object edtPretAtual: TEdit
      Left = 16
      Top = 56
      Width = 97
      Height = 21
      Enabled = False
      TabOrder = 13
    end
    object edtPretProj: TEdit
      Left = 144
      Top = 56
      Width = 120
      Height = 21
      Enabled = False
      TabOrder = 14
    end
    object edtMargCons: TEdit
      Left = 328
      Top = 56
      Width = 182
      Height = 21
      Enabled = False
      TabOrder = 15
    end
  end
  inherited pnlFundo: TPanel
    Top = 444
    Width = 632
    Height = 89
    Align = alBottom
    inherited pnlControles: TPanel
      Top = 15
      Width = 655
      Height = 194
      Align = alNone
    end
    inherited dbGrd: TwwDBGrid
      Width = 630
      Height = 87
      Selected.Strings = (
        'TSEDESCRICAO'#9'40'#9'Tipo de Suspensão'
        'STATUS'#9'9'#9'Status'
        'HSCMESES'#9'3'#9'Nº Meses'
        'HSCINICIOSUSP'#9'10'#9'Início Susp.'
        'HSCFINALSUSP'#9'10'#9'Final Susp.'
        'FERIAS'#9'3'#9'Férias'
        'HSCDATALIBER'#9'10'#9'Liberação'
        'HSCMESCOBRANCA'#9'3'#9'Mês Cobr.'
        'HSCANOCOBRANCA'#9'5'#9'Ano Cobr.'
        'HSCDATAATEND'#9'10'#9'Data Atend.'
        'HSCUSUATEND'#9'30'#9'Usuário Atendimento'
        'HSCDATAATU'#9'10'#9'Data Atual.'
        'HSCUSULIBER'#9'30'#9'Usuário Atual.'
        'OBSERVACAO'#9'70'#9'Observação'#9'F')
      OnCellChanged = dbGrdCellChanged
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgWordWrap]
      ReadOnly = True
    end
    object dbGridHstAlteracao: TwwDBGrid
      Left = 176
      Top = 1
      Width = 459
      Height = 101
      Selected.Strings = (
        'DESCOPERACAO'#9'45'#9'Descrição da Alteração'
        'NOME'#9'25'#9'Usuário'
        'DATA'#9'12'#9'Data/Hora'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsAux
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgWordWrap]
      ReadOnly = True
      TabOrder = 2
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      OnCalcCellColors = dbGrdCalcCellColors
      IndicatorColor = icBlack
    end
  end
  inherited Dock972: TDock97
    Width = 632
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Width = 82
        Enabled = True
        Visible = True
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited ToolbarSep972: TToolbarSep97
        Left = 337
        Visible = False
      end
      inherited btnRefresh: TToolbarButton97
        Left = 343
        Width = 17
        Enabled = False
        Visible = False
      end
      inherited btnTrazer: TToolbarButton97
        Left = 360
        Width = 17
      end
    end
    object chkExcepcional: TCheckBox
      Left = 425
      Top = 8
      Width = 201
      Height = 17
      Caption = 'Excepcional'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 533
    Width = 632
    inherited tb97Fundo: TToolbar97
      Left = 459
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 257
    end
  end
  object btnObserva: TBitBtn [4]
    Left = 582
    Top = 252
    Width = 23
    Height = 20
    Hint = 'Visualizar o conteúdo do campo observação'
    TabOrder = 4
    OnClick = btnObservaClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      8888888888888888888888888888888888888888888888888888888188888888
      88888887F88888888888888118888888888888877F8888888888888111888888
      8888888777F888888888888811100008888888887777777888888888810E8E80
      88888888877888878888888880E8E8E80888888887F8888878888888808E8E8E
      0888888887F888887888888880E8E8E80888888887F8888878888888808E8E8E
      08888888878F8888788888888808E8E0888888888878FFF78888888888800008
      8888888888877778888888888888888888888888888888888888888888888888
      8888888888888888888888888888888888888888888888888888}
    NumGlyphs = 2
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      2
      (
        'TDBMemo'
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited ds: TwwDataSource
    Top = 0
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTSUSPCOBEP'
      'set'
      '  IDHISTSUSPCOBEP = :IDHISTSUSPCOBEP,'
      '  IDTIPOSUSPEMPTMO = :IDTIPOSUSPEMPTMO,'
      '  IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO,'
      '  FLGSTATUS = :FLGSTATUS,'
      '  FLGFERIAS = :FLGFERIAS,'
      '  HSCINICIOSUSP = :HSCINICIOSUSP,'
      '  HSCFINALSUSP = :HSCFINALSUSP,'
      '  HSCMESES = :HSCMESES,'
      '  HSCUSUATEND = :HSCUSUATEND,'
      '  HSCDATAATEND = :HSCDATAATEND,'
      '  HSCDATALIBER = :HSCDATALIBER,'
      '  HSCUSULIBER = :HSCUSULIBER,'
      '  HSCDATAATU = :HSCDATAATU,'
      '  HSCANOCOBRANCA = :HSCANOCOBRANCA,'
      '  HSCMESCOBRANCA = :HSCMESCOBRANCA,'
      '  OBSERVACAO = :OBSERVACAO'
      'where'
      '  IDHISTSUSPCOBEP = :OLD_IDHISTSUSPCOBEP')
    InsertSQL.Strings = (
      'insert into HISTSUSPCOBEP'
      '  (IDHISTSUSPCOBEP, IDTIPOSUSPEMPTMO, IDCONTRATOEMPTMO, '
      'FLGSTATUS, FLGFERIAS, '
      '   HSCINICIOSUSP, HSCFINALSUSP, HSCMESES, HSCUSUATEND, '
      'HSCDATAATEND, HSCDATALIBER, '
      '   HSCUSULIBER, HSCDATAATU, HSCANOCOBRANCA, HSCMESCOBRANCA, '
      '   OBSERVACAO)'
      'values'
      '  (:IDHISTSUSPCOBEP, :IDTIPOSUSPEMPTMO, :IDCONTRATOEMPTMO, '
      ':FLGSTATUS, '
      '   :FLGFERIAS, :HSCINICIOSUSP, :HSCFINALSUSP, :HSCMESES, '
      ':HSCUSUATEND, '
      '   :HSCDATAATEND, :HSCDATALIBER, :HSCUSULIBER, :HSCDATAATU, '
      ':HSCANOCOBRANCA, '
      '   :HSCMESCOBRANCA, :OBSERVACAO)')
    DeleteSQL.Strings = (
      'delete from HISTSUSPCOBEP'
      'where'
      '  IDHISTSUSPCOBEP = :OLD_IDHISTSUSPCOBEP')
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      
        'DECODE(CNT.FLGSITUACAO, '#39'A'#39', '#39'Ativo'#39', '#39'E'#39', '#39'Encerrado'#39', '#39'J'#39', '#39'Em' +
        ' Cobrança Jurídica'#39', '#39'K'#39', '#39'Em Quitação'#39', '#39'Q'#39', '#39'Quitado'#39', '#39'R'#39', '#39'R' +
        'enovado'#39','#39'C'#39','#39'Cancelado'#39','#39'P'#39','#39'Pendente'#39')'
      'CNT.IDCONTRATOEMPTMO'
      'CNT.MATRICULA'
      'CNT.NOME_MUTUARIO'
      'TSE.TSEDESCRICAO'
      'HSC.IDTIPOSUSPEMPTMO')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Situação Contratual'
      'Nº do Contrato'
      'Matrícula'
      'Mutuário'
      'Tipo de Suspensão'
      'ID Suspensao')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'TIPOSUSPEMPTMO TSE'
      'HISTSUSPCOBEP HSC'
      'VWCONTRATOEP CNT')
    CamposChave.Strings = (
      'CNT.IDCONTRATOEMPTMO'
      'CNT.IDBENEF')
    Filtro.Strings = (
      'HSC.IDCONTRATOEMPTMO = CNT.IDCONTRATOEMPTMO'
      'TSE.IDTIPOSUSPEMPTMO   = HSC.IDTIPOSUSPEMPTMO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '12'
      '15'
      '13'
      '30'
      '25'
      '9')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    UsaDistinct = True
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
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 769
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 532
    Top = 212
  end
  inherited qry: TwwQuery
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      'SELECT'
      '    CNT.IDPESSOA,'
      '    CNT.IDBENEF,'
      '    CNT.IDPATRO,'
      '    CNT.IDTIPOCONTREMPTMO,'
      '    CNT.MATRICULA,'
      '    CNT.NOME_MUTUARIO,'
      '    CNT.FLGINTERNO,'
      '    HSC.IDHISTSUSPCOBEP,'
      '    HSC.IDTIPOSUSPEMPTMO,'
      '    HSC.IDCONTRATOEMPTMO,'
      '    HSC.FLGSTATUS,'
      '    HSC.FLGFERIAS,'
      '    HSC.HSCINICIOSUSP,'
      '    HSC.HSCFINALSUSP,'
      '    HSC.HSCMESES,'
      '    HSC.HSCUSUATEND,'
      '    HSC.HSCDATAATEND,'
      '    HSC.HSCDATALIBER,'
      '    HSC.HSCUSULIBER,'
      '    HSC.HSCDATAATU,'
      '    HSC.HSCANOCOBRANCA,'
      '    TSE.TSEDESCRICAO,'
      '    HSC.HSCMESCOBRANCA,'
      '    HSC.OBSERVACAO,'
      ''
      '    DECODE(HSC.FLGSTATUS, '#39'A'#39','#39'Ativa'#39','
      '                          '#39'C'#39','#39'Cancelada'#39','
      '                          '#39'E'#39','#39'Encerrada'#39
      '         ) AS STATUS,'
      ''
      '    DECODE(HSC.FLGFERIAS, 1, '#39'Sim'#39','
      '                             '#39'Não'#39
      '         ) AS FERIAS'
      ''
      'FROM'
      '    HISTSUSPCOBEP  HSC,'
      '    TIPOSUSPEMPTMO TSE,'
      '    VWCONTRATOEP   CNT'
      ''
      'WHERE'
      '       HSC.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO'
      '   AND TSE.IDTIPOSUSPEMPTMO = HSC.IDTIPOSUSPEMPTMO'
      '   AND CNT.IDCONTRATOEMPTMO = HSC.IDCONTRATOEMPTMO'
      ''
      'ORDER BY'
      '   HSC.HSCDATAATEND DESC'
      ' ')
    Top = 0
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
        Value = '172'
      end>
    object qryTSEDESCRICAO: TStringField
      DisplayLabel = 'Tipo de Suspensão'
      DisplayWidth = 40
      FieldName = 'TSEDESCRICAO'
      Origin = 'BASEDADOS.TIPOSUSPEMPTMO.TSEDESCRICAO'
      Size = 60
    end
    object qrySTATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 9
      FieldName = 'STATUS'
      Size = 9
    end
    object qryHSCMESES: TFloatField
      DisplayLabel = 'Nº Meses'
      DisplayWidth = 3
      FieldName = 'HSCMESES'
      Origin = 'BASEDADOS.HISTSUSPCOBEP.HSCMESES'
    end
    object qryHSCINICIOSUSP: TDateTimeField
      DisplayLabel = 'Início Susp.'
      DisplayWidth = 10
      FieldName = 'HSCINICIOSUSP'
      Origin = 'BASEDADOS.HISTSUSPCOBEP.HSCINICIOSUSP'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryHSCFINALSUSP: TDateTimeField
      DisplayLabel = 'Final Susp.'
      DisplayWidth = 10
      FieldName = 'HSCFINALSUSP'
      Origin = 'BASEDADOS.HISTSUSPCOBEP.HSCFINALSUSP'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryFERIAS: TStringField
      DisplayLabel = 'Férias'
      DisplayWidth = 3
      FieldName = 'FERIAS'
      Size = 3
    end
    object qryHSCDATALIBER: TDateTimeField
      DisplayLabel = 'Liberação'
      DisplayWidth = 10
      FieldName = 'HSCDATALIBER'
      Origin = 'BASEDADOS.HISTSUSPCOBEP.HSCDATALIBER'
    end
    object qryHSCMESCOBRANCA: TFloatField
      DisplayLabel = 'Mês Cobr.'
      DisplayWidth = 3
      FieldName = 'HSCMESCOBRANCA'
      Origin = 'BASEDADOS.HISTSUSPCOBEP.HSCMESCOBRANCA'
    end
    object qryHSCANOCOBRANCA: TFloatField
      DisplayLabel = 'Ano Cobr.'
      DisplayWidth = 5
      FieldName = 'HSCANOCOBRANCA'
      Origin = 'BASEDADOS.HISTSUSPCOBEP.HSCANOCOBRANCA'
    end
    object qryHSCDATAATEND: TDateTimeField
      DisplayLabel = 'Data Atend.'
      DisplayWidth = 10
      FieldName = 'HSCDATAATEND'
      Origin = 'BASEDADOS.HISTSUSPCOBEP.HSCDATAATEND'
    end
    object qryHSCUSUATEND: TStringField
      DisplayLabel = 'Usuário Atendimento'
      DisplayWidth = 30
      FieldName = 'HSCUSUATEND'
      Origin = 'BASEDADOS.HISTSUSPCOBEP.HSCUSUATEND'
      Size = 30
    end
    object qryHSCDATAATU: TDateTimeField
      DisplayLabel = 'Data Atual.'
      DisplayWidth = 10
      FieldName = 'HSCDATAATU'
      Origin = 'BASEDADOS.HISTSUSPCOBEP.HSCDATAATU'
    end
    object qryHSCUSULIBER: TStringField
      DisplayLabel = 'Usuário Atual.'
      DisplayWidth = 30
      FieldName = 'HSCUSULIBER'
      Origin = 'BASEDADOS.HISTSUSPCOBEP.HSCUSULIBER'
      Size = 30
    end
    object qryMATRICULA: TStringField
      DisplayWidth = 15
      FieldName = 'MATRICULA'
      Visible = False
      Size = 15
    end
    object qryNOME_MUTUARIO: TStringField
      DisplayWidth = 60
      FieldName = 'NOME_MUTUARIO'
      Visible = False
      Size = 60
    end
    object qryFLGSTATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 3
      FieldName = 'FLGSTATUS'
      Origin = 'BASEDADOS.HISTSUSPCOBEP.FLGSTATUS'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryFLGFERIAS: TFloatField
      DisplayLabel = 'Férias'
      DisplayWidth = 3
      FieldName = 'FLGFERIAS'
      Origin = 'BASEDADOS.HISTSUSPCOBEP.FLGFERIAS'
      Visible = False
    end
    object qryIDCONTRATOEMPTMO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATOEMPTMO'
      Origin = 'BASEDADOS.HISTSUSPCOBEP.IDCONTRATOEMPTMO'
      Visible = False
    end
    object qryIDHISTSUSPCOBEP: TFloatField
      DisplayWidth = 10
      FieldName = 'IDHISTSUSPCOBEP'
      Origin = 'BASEDADOS.HISTSUSPCOBEP.IDHISTSUSPCOBEP'
      Visible = False
    end
    object qryIDTIPOSUSPEMPTMO: TFloatField
      DisplayLabel = 'Tipo de Suspensão'
      DisplayWidth = 21
      FieldName = 'IDTIPOSUSPEMPTMO'
      Origin = 'BASEDADOS.HISTSUSPCOBEP.IDTIPOSUSPEMPTMO'
      Visible = False
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.CONTRATOEMPTMO.IDPESSOA'
      Visible = False
    end
    object qryIDBENEF: TFloatField
      FieldName = 'IDBENEF'
      Origin = 'BASEDADOS.CONTRATOEMPTMO.IDBENEF'
      Visible = False
    end
    object qryIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'BASEDADOS.CONTRATOEMPTMO.IDPATRO'
      Visible = False
    end
    object qryIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDTIPOCONTREMPTMO'
      Visible = False
    end
    object qryFLGINTERNO: TStringField
      FieldName = 'FLGINTERNO'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object qryOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 500
    end
  end
  object qryContrato: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CON.IDPESSOA AS IDPESSOA,'
      '       CON.IDBENEF AS IDBENEF,'
      '       CON.IDPATRO,'
      '       SIT.FLGINTERNO,'
      '       CON.IDTIPOCONTREMPTMO,'
      '       ELG.IDPESSJURCEDIDO'
      'FROM CONTRATOEMPTMO CON'
      '     JOIN PARTPREVPLAN PPP ON PPP.IDPESSOA = CON.IDPESSOA'
      '     JOIN SITPART SIT ON SIT.IDSITPART = PPP.IDSITPART'
      '     JOIN ELEGPATRO ELG ON ELG.IDPESSOA = CON.IDPESSOA'
      'WHERE CON.IDCONTRATOEMPTMO = :PIDCONTRATOEMPTMO'
      'AND   ELG.IDPESSJUR = PPP.IDPESSJUR'
      '')
    ValidateWithMask = True
    Left = 400
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryContratoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.DEPENTIT.IDTITULAR'
    end
    object qryContratoIDBENEF: TFloatField
      FieldName = 'IDBENEF'
      Origin = 'BASEDADOS.CONTRATOEMPTMO.IDPESSOA'
    end
    object qryContratoIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'BASEDADOS.CONTRATOEMPTMO.IDPATRO'
    end
    object qryContratoFLGINTERNO: TStringField
      FieldName = 'FLGINTERNO'
      Origin = 'BASEDADOS.SITPART.FLGINTERNO'
      FixedChar = True
      Size = 2
    end
    object qryContratoIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
      Origin = 'BASEDADOS.CONTRATOEMPTMO.IDTIPOCONTREMPTMO'
    end
    object qryContratoIDPESSJURCEDIDO: TFloatField
      FieldName = 'IDPESSJURCEDIDO'
      Origin = 'BASEDADOS.ELEGPATRO.IDPESSJURCEDIDO'
    end
  end
  object Ms_Historico: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'TSE.TSEDESCRICAO'
      'CNT.NOME_MUTUARIO'
      'CNT.MATRICULA'
      'CNT.IDCONTRATOEMPTMO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Tipo de Suspensão'
      'Mutuário'
      'Matrícula'
      'Nº do Contrato')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'TIPOSUSPEMPTMO TSE'
      'HISTSUSPCOBEP HSC'
      'VWCONTRATOEP CNT')
    CamposChave.Strings = (
      'CNT.IDCONTRATOEMPTMO')
    Filtro.Strings = (
      'HSC.IDCONTRATOEMPTMO = CNT.IDCONTRATOEMPTMO'
      'TSE.IDTIPOSUSPEMPTMO   = HSC.IDTIPOSUSPEMPTMO')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '60'
      '15'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 472
    Top = 160
  end
  object qryParcelasEmAberto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   COUNT(HMEPARCELA) AS TOTAL'
      ''
      'FROM'
      '   HISTMOVEMPTMO HME'
      ''
      'WHERE'
      '       HME.IDCONTRATOEMPTMO      =:PIDCONTRATOEMPTMO'
      '   AND HME.FLGBAIXADO            = 0'
      '   AND HME.HMEDATAEFETIVA        IS NULL'
      '   AND HME.HMEVLREFETIVO         IS NULL'
      '   AND HME.HMEDATAPREVISTA      <=:PHMEDATAPREVISTA'
      '   AND ('
      '       HME.HMEANOCOMPETENCIA    <>:PHMEANOCOMPETENCIA OR'
      '       HME.HMEMESCOMPETENCIA    <>:PHMEMESCOMPETENCIA'
      '       )'
      '   AND HME.HMETIPOMOV            NOT IN (0, 5, 8)'
      '   AND HME.HMEVLRPREVISTO        > 0'
      '   AND (HME.HMECENTRALIZA        = 1 OR HME.HMEDESTACADO = 1)'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '   AND NVL(HME.FLGQUITADO, 0)    = 0'
      '   AND NVL(HME.FLGABONADO, 0)    = 0'
      '   AND NVL(HME.FLGSUSPENSAO, 0)  = 0'
      ''
      'GROUP BY'
      '   HME.IDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 224
    Top = 272
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end>
    object qryParcelasEmAbertoTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object qryParcelasPagas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   COUNT(HMEPARCELA) AS TOTAL'
      ''
      'FROM'
      '   HISTMOVEMPTMO HME'
      ''
      'WHERE'
      '       ( HME.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO )'
      '   AND ( HME.FLGBAIXADO       = 0 )'
      '   AND ( HME.HMEDATAEFETIVA   IS NOT NULL )'
      '   AND ( HME.HMEVLREFETIVO    IS NOT NULL )'
      '   AND ( HME.HMEDATAEFETIVA   > (SELECT MAX(HSCDATALIBER)'
      '                                 FROM   HISTSUSPCOBEP'
      
        '                                 WHERE  IDCONTRATOEMPTMO =:PIDCO' +
        'NTRATOEMPTMO'
      '                                 AND    FLGFERIAS = 1'
      
        '                                 AND    HSCDATALIBER IS NOT NULL' +
        '  ) )'
      '   AND ( HME.HMETIPOMOV       NOT IN (0, 5, 8) )'
      '   AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) )'
      
        '   AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL)' +
        ' )'
      
        '   AND ( (HME.FLGQUITADO      = 0) OR (HME.FLGQUITADO   IS NULL)' +
        ' )'
      
        '   AND ( (HME.FLGABONADO      = 0) OR (HME.FLGABONADO   IS NULL)' +
        ' )'
      ''
      'GROUP BY'
      '   HME.IDCONTRATOEMPTMO'
      ''
      '')
    ValidateWithMask = True
    Left = 228
    Top = 324
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryParcelasPagasTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object qryExistePrestacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HME.HMEDATAPREVISTA,'
      '   HME.HMEVLRPREVISTO'
      'FROM'
      '   HISTMOVEMPTMO HME'
      'WHERE'
      '       HME.IDCONTRATOEMPTMO      =:PIDCONTRATOEMPTMO'
      '   AND HME.HMETIPOMOV            = 1'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '   AND HME.HMEDATAPREVISTA       >:HMEDATAPREVISTA')
    ValidateWithMask = True
    Left = 128
    Top = 272
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'HMEDATAPREVISTA'
        ParamType = ptInput
      end>
    object qryExistePrestacaoHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryExistePrestacaoHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
  end
  object qryParcelasRestantes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PARCELAS_RESTANTES'
      'FROM'
      '   VW_MOVEP'
      'WHERE'
      '       IDCONTRATOEMPTMO     =:PIDCONTRATOEMPTMO'
      '   AND HMETIPOMOV          <> 5'
      '   AND (HMECENTRALIZA       = 1 OR HMEDESTACADO = 1)'
      '   AND NVL(FLGESTORNADO, 0) = 0'
      'ORDER BY'
      '   PARCELAS_RESTANTES ASC')
    ValidateWithMask = True
    Left = 493
    Top = 286
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryParcelasRestantesPARCELAS_RESTANTES: TFloatField
      FieldName = 'PARCELAS_RESTANTES'
      Origin = 'BASEDADOS.VW_MOVEP.PARCELAS_RESTANTES'
    end
  end
  object QryTipoSusp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT COUNT(1)  AS QTDE'
      '  FROM TIPOSUSPEMPTMO TSE'
      ' WHERE  TSE.IDTIPOSUSPEMPTMO  = :IDTIPOSUSPEMPTMO  '
      ' AND    TSE.FLGCOBRJUDICIAL   = 1')
    ValidateWithMask = True
    Left = 464
    Top = 227
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDTIPOSUSPEMPTMO'
        ParamType = ptUnknown
      end>
  end
  object qryUltimaSuspensaoEncerrada: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   MAX(HSCINICIOSUSP) AS HSCINICIOSUSP ,'
      '   MAX(HSCFINALSUSP)  AS HSCFINALSUSP'
      'FROM'
      '   HISTSUSPCOBEP HSC'
      'WHERE'
      ' HSC.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO'
      'AND FLGSTATUS <> '#39'C'#39
      ' ')
    ValidateWithMask = True
    Left = 384
    Top = 272
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryUltimaSuspensaoEncerradaHSCINICIOSUSP: TDateTimeField
      FieldName = 'HSCINICIOSUSP'
    end
    object qryUltimaSuspensaoEncerradaHSCFINALSUSP: TDateTimeField
      FieldName = 'HSCFINALSUSP'
    end
  end
  object qryCheca: TwwQuery
    DatabaseName = 'BASEDADOS'
    ValidateWithMask = True
    Left = 584
    Top = 299
  end
  object dsAux: TwwDataSource
    AutoEdit = False
    DataSet = qryAuxAlteracao
    Left = 312
    Top = 48
  end
  object qryAuxAlteracao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT L.DESCOPERACAO, '
      '       P.NOME, '
      '       L.DATA'
      '  FROM LOGTOTALPREV L, '
      '       PESSOA P'
      ' WHERE L.IDPESQUISA1 = :IDHISTSUSPCOBEP'
      '   AND P.IDPESSOA = L.IDUSUARIO'
      ' ORDER BY L.IDLOGTOTALPREV')
    ValidateWithMask = True
    Left = 432
    Top = 51
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDHISTSUSPCOBEP'
        ParamType = ptUnknown
      end>
  end
end
