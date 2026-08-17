inherited frmHistoricoSuspensaoCob: TfrmHistoricoSuspensaoCob
  Left = 75
  Top = 96
  HelpContext = 150044
  Caption = 'Cadastro de Suspensão de Cobrança'
  ClientHeight = 447
  ClientWidth = 626
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 316
    Width = 626
    Height = 98
    Align = alBottom
    inherited pnlControles: TPanel
      Top = 15
      Width = 655
      Height = 194
      Align = alNone
    end
    inherited dbGrd: TwwDBGrid
      Width = 624
      Height = 96
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
        'HSCUSULIBER'#9'30'#9'Usuário Atual.')
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgWordWrap]
      ReadOnly = True
    end
  end
  inherited Dock972: TDock97
    Width = 626
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
  end
  inherited Dock971: TDock97
    Top = 414
    Width = 626
    inherited tb97Fundo: TToolbar97
      Left = 454
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150025
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 257
    end
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 35
    Width = 626
    Height = 281
    Align = alClient
    TabOrder = 3
    object Label2: TLabel
      Left = 24
      Top = 50
      Width = 110
      Height = 13
      Caption = 'Tipo de Suspensão'
    end
    object Label6: TLabel
      Left = 152
      Top = 130
      Width = 171
      Height = 13
      Caption = 'Início de Cobrança (mês/ano)'
    end
    object Label1: TLabel
      Left = 424
      Top = 50
      Width = 73
      Height = 13
      Caption = 'Nº de Meses'
    end
    object Label15: TLabel
      Left = 24
      Top = 90
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
      Left = 152
      Top = 90
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
      Left = 24
      Top = 130
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
    object Label4: TLabel
      Left = 4
      Top = 266
      Width = 51
      Height = 13
      Caption = 'Histórico'
    end
    inline molContratoEmptmo: TmolContratoEmptmo
      Left = 16
      Top = 8
      Width = 595
      inherited edtNome: TEdit
        Width = 345
      end
      inherited btnBuscaContrato: TBitBtn
        Left = 544
        OnClick = molContratoEmptmobtnBuscaContratoClick
      end
      inherited btnLimpaContrato: TBitBtn
        Left = 568
      end
    end
    object dbcboSuspensao: TwwDBLookupCombo
      Left = 24
      Top = 64
      Width = 385
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
    object rdgStatus: TDBRadioGroup
      Left = 512
      Top = 56
      Width = 97
      Height = 89
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
    object chkFerias: TDBCheckBox
      Left = 280
      Top = 106
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
      Left = 152
      Top = 144
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
      Left = 296
      Top = 144
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
      Top = 64
      Width = 73
      Height = 21
      Increment = 1
      MaxValue = 99
      MinValue = 1
      DataField = 'HSCMESES'
      DataSource = ds
      TabOrder = 2
      UnboundDataType = wwDefault
      OnEnter = DBspnMesesEnter
      OnExit = DBspnMesesExit
    end
    object edtDataInicio: TCMDateTimePicker
      Left = 24
      Top = 104
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
      Left = 152
      Top = 104
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
      Left = 24
      Top = 144
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
      Left = 24
      Top = 168
      Width = 585
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
        Width = 393
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
        Width = 393
        Height = 21
        Color = clInactiveBorder
        DataField = 'HSCUSULIBER'
        DataSource = ds
        ReadOnly = True
        TabOrder = 3
      end
    end
  end
  inherited ds: TwwDataSource
    Left = 456
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
      '  HSCMESCOBRANCA = :HSCMESCOBRANCA'
      'where'
      '  IDHISTSUSPCOBEP = :OLD_IDHISTSUSPCOBEP')
    InsertSQL.Strings = (
      'insert into HISTSUSPCOBEP'
      '  (IDHISTSUSPCOBEP, IDTIPOSUSPEMPTMO, IDCONTRATOEMPTMO, '
      'FLGSTATUS, FLGFERIAS, '
      '   HSCINICIOSUSP, HSCFINALSUSP, HSCMESES, HSCUSUATEND, '
      'HSCDATAATEND, HSCDATALIBER, '
      '   HSCUSULIBER, HSCDATAATU, HSCANOCOBRANCA, HSCMESCOBRANCA)'
      'values'
      '  (:IDHISTSUSPCOBEP, :IDTIPOSUSPEMPTMO, :IDCONTRATOEMPTMO, '
      ':FLGSTATUS, '
      '   :FLGFERIAS, :HSCINICIOSUSP, :HSCFINALSUSP, :HSCMESES, '
      ':HSCUSUATEND, '
      '   :HSCDATAATEND, :HSCDATALIBER, :HSCUSULIBER, :HSCDATAATU, '
      ':HSCANOCOBRANCA, '
      '   :HSCMESCOBRANCA)')
    DeleteSQL.Strings = (
      'delete from HISTSUSPCOBEP'
      'where'
      '  IDHISTSUSPCOBEP = :OLD_IDHISTSUSPCOBEP')
    Left = 392
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
      'CNT.IDCONTRATOEMPTMO')
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
    UsaDistinct = True
    Left = 504
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 769
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 576
    Top = 0
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
      '   HSC.HSCDATAATEND DESC')
    Left = 424
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
  end
  object qryContrato: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    *'
      'FROM'
      '    VWCONTRATOEP'
      'WHERE'
      '    IDCONTRATOEMPTMO = :PIDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 400
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryContratoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDCONTRATOEMPTMO'
    end
    object qryContratoIDINSCRICAOEMPTMO: TFloatField
      FieldName = 'IDINSCRICAOEMPTMO'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDINSCRICAOEMPTMO'
    end
    object qryContratoIDCONTRQUITACAO: TFloatField
      FieldName = 'IDCONTRQUITACAO'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDCONTRQUITACAO'
    end
    object qryContratoIDVERBA: TFloatField
      FieldName = 'IDVERBA'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDTIPOCONTREMPTMO'
    end
    object qryContratoFLGSITUACAO: TStringField
      FieldName = 'FLGSITUACAO'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDPATRO'
      FixedChar = True
      Size = 1
    end
    object qryContratoFLGFORMAREC: TStringField
      FieldName = 'FLGFORMAREC'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDPLANOPREV'
      FixedChar = True
      Size = 1
    end
    object qryContratoPORTFORMAREC: TFloatField
      FieldName = 'PORTFORMAREC'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDPESSOA'
    end
    object qryContratoFLGFORMAPAG: TStringField
      FieldName = 'FLGFORMAPAG'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDBENEF'
      FixedChar = True
      Size = 1
    end
    object qryContratoCODFORMAPAG: TFloatField
      FieldName = 'CODFORMAPAG'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDCBANCARIA'
    end
    object qryContratoPORTFORMAPAG: TFloatField
      FieldName = 'PORTFORMAPAG'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDVERBA'
    end
    object qryContratoDATAASSINATURA: TDateTimeField
      FieldName = 'DATAASSINATURA'
      Origin = 'BASEDADOS.VWCONTRATOEP.FLGSITUACAO'
    end
    object qryContratoDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
      Origin = 'BASEDADOS.VWCONTRATOEP.FLGFORMAREC'
    end
    object qryContratoDATAPRIMPARC: TDateTimeField
      FieldName = 'DATAPRIMPARC'
      Origin = 'BASEDADOS.VWCONTRATOEP.PORTFORMAREC'
    end
    object qryContratoDATACANC: TDateTimeField
      FieldName = 'DATACANC'
      Origin = 'BASEDADOS.VWCONTRATOEP.FLGFORMAPAG'
    end
    object qryContratoDATASITUACAO: TDateTimeField
      FieldName = 'DATASITUACAO'
      Origin = 'BASEDADOS.VWCONTRATOEP.CODFORMAPAG'
    end
    object qryContratoPRAZO: TFloatField
      FieldName = 'PRAZO'
      Origin = 'BASEDADOS.VWCONTRATOEP.PORTFORMAPAG'
    end
    object qryContratoVLRCONTRATO: TFloatField
      FieldName = 'VLRCONTRATO'
      Origin = 'BASEDADOS.VWCONTRATOEP.DATAASSINATURA'
    end
    object qryContratoVLRPARCELA: TFloatField
      FieldName = 'VLRPARCELA'
      Origin = 'BASEDADOS.VWCONTRATOEP.DATACREDITO'
    end
    object qryContratoTXJUROS: TFloatField
      FieldName = 'TXJUROS'
      Origin = 'BASEDADOS.VWCONTRATOEP.DATAPRIMPARC'
    end
    object qryContratoVLRPARCELAMES: TFloatField
      FieldName = 'VLRPARCELAMES'
      Origin = 'BASEDADOS.VWCONTRATOEP.DATACANC'
    end
    object qryContratoVLRPARCATRASO: TFloatField
      FieldName = 'VLRPARCATRASO'
      Origin = 'BASEDADOS.VWCONTRATOEP.DATASITUACAO'
    end
    object qryContratoVLRDEBITO: TFloatField
      FieldName = 'VLRDEBITO'
      Origin = 'BASEDADOS.VWCONTRATOEP.PRAZO'
    end
    object qryContratoVLRRESERVA: TFloatField
      FieldName = 'VLRRESERVA'
      Origin = 'BASEDADOS.VWCONTRATOEP.VLRCONTRATO'
    end
    object qryContratoVLRSALDODEV: TFloatField
      FieldName = 'VLRSALDODEV'
      Origin = 'BASEDADOS.VWCONTRATOEP.VLRPARCELA'
    end
    object qryContratoVLRPENDENCIA: TFloatField
      FieldName = 'VLRPENDENCIA'
      Origin = 'BASEDADOS.VWCONTRATOEP.TXJUROS'
    end
    object qryContratoVLRSALBASE: TFloatField
      FieldName = 'VLRSALBASE'
      Origin = 'BASEDADOS.VWCONTRATOEP.ANOSUSPENSAO'
    end
    object qryContratoVLRMARGEM: TFloatField
      FieldName = 'VLRMARGEM'
      Origin = 'BASEDADOS.VWCONTRATOEP.MESSUSPENSAO'
    end
    object qryContratoVLRMAXPERMIT: TFloatField
      FieldName = 'VLRMAXPERMIT'
      Origin = 'BASEDADOS.VWCONTRATOEP.TCEDESCRICAO'
    end
    object qryContratoDATASALDODEV: TDateTimeField
      FieldName = 'DATASALDODEV'
      Origin = 'BASEDADOS.VWCONTRATOEP.DESCTIPOEMPTMO'
    end
    object qryContratoDATAPENDENCIA: TDateTimeField
      FieldName = 'DATAPENDENCIA'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDEMPRESAPROP'
    end
    object qryContratoFLGSUSPENSAOAUTO: TFloatField
      FieldName = 'FLGSUSPENSAOAUTO'
      Origin = 'BASEDADOS.VWCONTRATOEP.MATRICULA'
    end
    object qryContratoIDTIPOSUSPEMPTMO: TFloatField
      FieldName = 'IDTIPOSUSPEMPTMO'
      Origin = 'BASEDADOS.VWCONTRATOEP.INSCRICAONUMERO'
    end
    object qryContratoDATAINICIOSUSP: TDateTimeField
      FieldName = 'DATAINICIOSUSP'
      Origin = 'BASEDADOS.VWCONTRATOEP.SALPARTICIPACAO'
    end
    object qryContratoDATAFIMSUSP: TDateTimeField
      FieldName = 'DATAFIMSUSP'
      Origin = 'BASEDADOS.VWCONTRATOEP.SALMANTIDO'
    end
    object qryContratoANOSUSPENSAO: TFloatField
      FieldName = 'ANOSUSPENSAO'
      Origin = 'BASEDADOS.VWCONTRATOEP.SALAUXDOENCA'
    end
    object qryContratoMESSUSPENSAO: TFloatField
      FieldName = 'MESSUSPENSAO'
      Origin = 'BASEDADOS.VWCONTRATOEP.SITDESCRICAO'
    end
    object qryContratoUSUARIOLIBSUSP: TStringField
      FieldName = 'USUARIOLIBSUSP'
      Origin = 'BASEDADOS.VWCONTRATOEP.FLGINTERNO'
      Size = 30
    end
    object qryContratoDATALIBSUSP: TDateTimeField
      FieldName = 'DATALIBSUSP'
      Origin = 'BASEDADOS.VWCONTRATOEP.NOME'
    end
    object qryContratoHORALIBSUSP: TStringField
      FieldName = 'HORALIBSUSP'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
      Size = 8
    end
    object qryContratoIDEMPRESAPROP: TFloatField
      FieldName = 'IDEMPRESAPROP'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
    end
    object qryContratoIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
    end
    object qryContratoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
    end
    object qryContratoIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
    end
    object qryContratoTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
      Size = 60
    end
    object qryContratoIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
    end
    object qryContratoDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
      Size = 60
    end
    object qryContratoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
    end
    object qryContratoIDBENEF: TFloatField
      FieldName = 'IDBENEF'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
    end
    object qryContratoIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
    end
    object qryContratoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
    end
    object qryContratoMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
      Size = 15
    end
    object qryContratoMATRICULA_TIT: TStringField
      FieldName = 'MATRICULA_TIT'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
      Size = 13
    end
    object qryContratoINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
    end
    object qryContratoSALPARTICIPACAO: TFloatField
      FieldName = 'SALPARTICIPACAO'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
    end
    object qryContratoSALMANTIDO: TFloatField
      FieldName = 'SALMANTIDO'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
    end
    object qryContratoSALAUXDOENCA: TFloatField
      FieldName = 'SALAUXDOENCA'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
    end
    object qryContratoIDREGRAMARGEM: TFloatField
      FieldName = 'IDREGRAMARGEM'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
    end
    object qryContratoIDREGRARESERVA: TFloatField
      FieldName = 'IDREGRARESERVA'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
    end
    object qryContratoIDREGRAELEG: TFloatField
      FieldName = 'IDREGRAELEG'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
    end
    object qryContratoIDREGRALIMITES: TFloatField
      FieldName = 'IDREGRALIMITES'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
    end
    object qryContratoTCEDIASVALIDINSC: TFloatField
      FieldName = 'TCEDIASVALIDINSC'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
    end
    object qryContratoTCEDIASTOLERAINSC: TFloatField
      FieldName = 'TCEDIASTOLERAINSC'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
    end
    object qryContratoTCEMAXCONTRATO: TFloatField
      FieldName = 'TCEMAXCONTRATO'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
    end
    object qryContratoTCEMAXINSCR: TFloatField
      FieldName = 'TCEMAXINSCR'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
    end
    object qryContratoTCEMAXPARC: TFloatField
      FieldName = 'TCEMAXPARC'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
    end
    object qryContratoTCEMINPARC: TFloatField
      FieldName = 'TCEMINPARC'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
    end
    object qryContratoTCEMINQUIT: TFloatField
      FieldName = 'TCEMINQUIT'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
    end
    object qryContratoTCEMINRENOVA: TFloatField
      FieldName = 'TCEMINRENOVA'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
    end
    object qryContratoFLGSEGURO: TStringField
      FieldName = 'FLGSEGURO'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
      Size = 1
    end
    object qryContratoIDSITPART: TFloatField
      FieldName = 'IDSITPART'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
    end
    object qryContratoFLGINTERNO: TStringField
      FieldName = 'FLGINTERNO'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
      FixedChar = True
      Size = 2
    end
    object qryContratoSIT_TITULAR: TStringField
      FieldName = 'SIT_TITULAR'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
      Size = 50
    end
    object qryContratoSITDESCRICAO: TStringField
      FieldName = 'SITDESCRICAO'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
      Size = 50
    end
    object qryContratoIDUSUARIO: TStringField
      FieldName = 'IDUSUARIO'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
      Size = 28
    end
    object qryContratoNOME_TITULAR: TStringField
      FieldName = 'NOME_TITULAR'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
      Size = 60
    end
    object qryContratoCPF_TITULAR: TStringField
      FieldName = 'CPF_TITULAR'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object qryContratoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
      Size = 60
    end
    object qryContratoNOME_MUTUARIO: TStringField
      FieldName = 'NOME_MUTUARIO'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
      Size = 60
    end
    object qryContratoNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object qryContratoCPF_MUTUARIO: TStringField
      FieldName = 'CPF_MUTUARIO'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
      FixedChar = True
      Size = 18
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
      '       ( HME.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO )'
      '   AND ( HME.FLGBAIXADO       = 0 )'
      '   AND ( HME.HMEDATAEFETIVA   IS NULL )'
      '   AND ( HME.HMEVLREFETIVO    IS NULL )'
      '   AND ( HME.HMEDATAPREVISTA  <=:PHMEDATAPREVISTA )'
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
      ' ')
    ValidateWithMask = True
    Left = 192
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAPREVISTA'
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
    Left = 304
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryParcelasPagasTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object qryUltimaSuspensaoEncerrada: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   MAX(HSCINICIOSUSP) AS HSCINICIOSUSP'
      ''
      'FROM'
      '   HISTSUSPCOBEP HSC'
      ''
      'WHERE'
      '    ( HSC.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO )'
      'AND ( HSC.HSCDATALIBER IS NOT NULL )'
      
        'AND ( HSC.HSCDATALIBER = (SELECT MAX(HSC.HSCDATALIBER) FROM HIST' +
        'SUSPCOBEP'
      
        '                          WHERE  IDCONTRATOEMPTMO =:PIDCONTRATOE' +
        'MPTMO) )'
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 456
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryUltimaSuspensaoEncerradaHSCINICIOSUSP: TDateTimeField
      FieldName = 'HSCINICIOSUSP'
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
    Left = 232
    Top = 296
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
end
