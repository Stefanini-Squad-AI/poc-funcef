inherited frmResciContr: TfrmResciContr
  Left = 26
  Top = 127
  HelpContext = 4170024
  Caption = 'Rescisão de Contrato de Trabalho'
  ClientHeight = 414
  ClientWidth = 745
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 745
    Height = 328
    BorderWidth = 2
    object Label12: TLabel
      Left = 50
      Top = 13
      Width = 119
      Height = 14
      AutoSize = False
      Caption = 'Nome da Pessoa'
    end
    object Label8: TLabel
      Left = 51
      Top = 38
      Width = 119
      Height = 13
      AutoSize = False
      Caption = 'Último Cargo'
    end
    object Label9: TLabel
      Left = 51
      Top = 61
      Width = 119
      Height = 13
      AutoSize = False
      Caption = 'Último Salário'
    end
    object Label10: TLabel
      Left = 51
      Top = 98
      Width = 119
      Height = 13
      AutoSize = False
      Caption = 'Data Admissão'
    end
    object Label1: TLabel
      Left = 354
      Top = 98
      Width = 55
      Height = 13
      Caption = 'Matrícula'
    end
    object Bevel1: TBevel
      Left = 4
      Top = 4
      Width = 737
      Height = 157
      Shape = bsFrame
      Style = bsRaised
    end
    object Label23: TLabel
      Left = 19
      Top = 196
      Width = 108
      Height = 13
      Caption = 'Data Desligamento'
    end
    object Label3: TLabel
      Left = 294
      Top = 196
      Width = 85
      Height = 13
      Caption = 'Nova Situação'
    end
    object Label2: TLabel
      Left = 294
      Top = 246
      Width = 119
      Height = 13
      Caption = 'Motivo Desligamento'
    end
    object Label7: TLabel
      Left = 19
      Top = 246
      Width = 121
      Height = 13
      Caption = 'Data do Aviso Prévio'
    end
    object dbrgTipoSalar: TDBRadioGroup
      Left = 285
      Top = 54
      Width = 161
      Height = 36
      Columns = 3
      DataField = 'TIPOPAGAMENTO'
      DataSource = ds
      Items.Strings = (
        'Hora'
        'Dia'
        'Mês')
      ReadOnly = True
      TabOrder = 6
      Values.Strings = (
        'H'
        'D'
        'M')
    end
    object dblcSitFunc: TwwDBLookupCombo
      Left = 425
      Top = 191
      Width = 300
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'50'#9'DESCRICAO')
      DataField = 'IDSITFUNC'
      DataSource = ds
      LookupTable = qrySitFunc
      LookupField = 'IDSITFUNC'
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
    end
    object dblcMotivo1: TwwDBLookupCombo
      Left = 425
      Top = 241
      Width = 300
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'50'#9'DESCRICAO')
      DataField = 'IDMOTIVODESLIGRAIS'
      DataSource = ds
      LookupTable = qryMotivo
      LookupField = 'IDMOTIVO'
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
    end
    object dbedDatSaida: TCMDateTimePicker
      Left = 142
      Top = 191
      Width = 100
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'DATADESLIGAMENTO'
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
    object dbedDatAviso: TCMDateTimePicker
      Left = 142
      Top = 241
      Width = 100
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'DATAAVISO'
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
      TabOrder = 1
    end
    object dbrgTipContra: TDBRadioGroup
      Left = 558
      Top = 12
      Width = 131
      Height = 135
      Caption = 'Tipo de Contrato'
      DataField = 'TIPOCONTRATO'
      DataSource = ds
      Items.Strings = (
        'Efetivo'
        'Efetivo Especial'
        'Temporário'
        'Estagiário'
        'Terceiro'
        'Prop/Dir s/ Vinc'
        'Autônomo')
      ReadOnly = True
      TabOrder = 4
      Values.Strings = (
        'E'
        'S'
        'T'
        'G'
        '3'
        'P'
        'A')
    end
    object gbxContrato: TGroupBox
      Left = 30
      Top = 115
      Width = 520
      Height = 38
      TabOrder = 5
      object Label11: TLabel
        Left = 21
        Top = 14
        Width = 98
        Height = 13
        Caption = 'Final do Contrato'
      end
      object Label13: TLabel
        Left = 268
        Top = 14
        Width = 87
        Height = 13
        Caption = 'Dias Restantes'
      end
      object dbedFimContr: TDBEdit
        Left = 143
        Top = 11
        Width = 101
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'DATAFIMCONTRATO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object redDiasRest: TRealEdit
        Left = 390
        Top = 11
        Width = 105
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '0')
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 0
        NumberFormat = iNumber
        Signal = False
      end
    end
    object dbedCargo: TwwDBEdit
      Left = 173
      Top = 35
      Width = 361
      Height = 21
      Color = clGray
      DataField = 'TITULO'
      DataSource = dsCar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedNome: TwwDBEdit
      Left = 173
      Top = 11
      Width = 361
      Height = 21
      Color = clGray
      DataField = 'NOME'
      DataSource = dsPes
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedSalAtual: TwwDBEdit
      Left = 173
      Top = 59
      Width = 103
      Height = 21
      Color = clGray
      DataField = 'SALARIOATUAL'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedDtAdmiss: TwwDBEdit
      Left = 173
      Top = 96
      Width = 103
      Height = 21
      Color = clGray
      DataField = 'DATAADMISSAO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 10
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedMat: TwwDBEdit
      Left = 421
      Top = 96
      Width = 103
      Height = 21
      Color = clGray
      DataField = 'MATRICULA'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 11
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbrgAvisoTrab: TDBRadioGroup
      Left = 263
      Top = 273
      Width = 220
      Height = 41
      Caption = 'Aviso Trabalhado'
      Columns = 2
      DataField = 'SALARIOTIPO'
      DataSource = ds
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 12
      Values.Strings = (
        'S'
        'N')
    end
  end
  inherited Dock972: TDock97
    Width = 745
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Left = 60
        Enabled = False
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 0
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 375
    Width = 745
    object sbtnImprimirCarta: TSpeedButton [0]
      Left = 238
      Top = 0
      Width = 33
      Height = 33
      Hint = 'Imprimir Carta / Comunicado Correspondente'
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888880008
        8888888888888F7778FF8888000088888800877008888888888F7787F778FF88
        0000888800880007700888888F778F7778F778FF000088008800877007700888
        778F7787F778F778000080880088877770077087FF778887F88778F700008700
        888887777770008777888887FF888777000080888888F77777777087F8888F77
        78FF88870000878888FF888777777087F88F77888778FF8700008788FF888888
        87777087FF778888888778F7000087FF88899888888770877788888888888777
        000087888AA88888808880878FF8888888FFF8F700008877F888888FF0877888
        778FF88FF77787780000888877F87FFFFF08888888778F77788878F800008888
        88777FFFFFF088888888777FF888878F00008888888877FFFFFF008888888877
        8F888F77000088888888887FFF7788888888888878FF77880000888888888887
        7788888888888888877788880000888888888888888888888888888888888888
        0000}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnImprimirCartaClick
    end
    inherited tb97Fundo: TToolbar97
      Left = 575
      DockPos = 575
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 407
      DockPos = 407
    end
    inherited dbnav: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited ds: TwwDataSource
    DataSet = tblFuncio
    Left = 261
    Top = 8
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 513
    Top = 355
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 543
    Top = 360
  end
  object tblFuncio: TwwTable
    BeforePost = tblFuncioBeforePost
    AfterScroll = tblFuncioAfterScroll
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPESSOA'
    MasterFields = 'IDPESSOA'
    TableName = 'CM.FUNCIONARIO'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 297
    Top = 9
  end
  object dsPes: TwwDataSource
    DataSet = tblPessoal
    Left = 18
    Top = 258
  end
  object dsCar: TwwDataSource
    DataSet = tblCargo
    Left = 252
    Top = 249
  end
  object tblCargo: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDCARGO'
    MasterFields = 'IDCARGO'
    MasterSource = ds
    TableName = 'CM.CARGO'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 306
    Top = 249
  end
  object qryMotivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from MOTIVO '
      'where GRUPOMOTIVO = '#39'D'#39' '
      'order by upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 27
    Top = 331
  end
  object qrySitFunc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  SITFUNC'
      'WHERE'
      '  (FLGUSO IN ('#39'R'#39','#39'G'#39'))'
      'ORDER BY'
      '  UPPER(DESCRICAO)')
    ValidateWithMask = True
    Left = 534
    Top = 254
  end
  object tblPessoal: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPESSOA'
    MasterFields = 'IDPESSOA'
    MasterSource = ds
    TableName = 'CM.PESSOA'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 20
    Top = 122
  end
  object tblSitFunc: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDSITFUNC'
    MasterFields = 'IDSITFUNC'
    MasterSource = ds
    TableName = 'CM.SITFUNC'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 402
    Top = 13
  end
  object tblRubSit: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPROVENTO;IDSITFUNC'
    TableName = 'CM.RUBXSIT'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 240
    Top = 322
  end
  object qryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 183
    Top = 321
  end
  object tblPesFis: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPESSOA'
    MasterFields = 'IDPESSOA'
    MasterSource = ds
    TableName = 'CM.PESSOAFISICA'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 18
    Top = 410
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 138
    Top = 315
  end
  object tblRubPes: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPESSOA;IDRUBRICA'
    TableName = 'CM.RUBRICAXPESS'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 351
    Top = 306
  end
  object qryHst: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 88
    Top = 321
  end
  object tblParam: TwwTable
    DatabaseName = 'BaseDados'
    TableName = 'CM.PARAMRH'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 693
    Top = 8
  end
  object qryRubEsp: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    UpdateObject = updRubEsp
    ValidateWithMask = True
    Left = 474
    Top = 332
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.NOME'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO'
      'EMPRESAPROP.NOMEEMPRESA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'Matrícula'
      'CPF (ou equivalente)'
      'Cargo'
      'Empresa')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'FUNCIONARIO'
      'CARGO'
      'EMPRESAPROP')
    CamposChave.Strings = (
      'PESSOA.NOME'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO'
      'EMPRESAPROP.NOMEEMPRESA'
      'EMPRESAPROP.IDPESSOA'
      'FUNCIONARIO.IDPESSOA')
    Filtro.Strings = (
      'EMPRESAPROP.IDPESSOA = FUNCIONARIO.IDEMPRESA'
      'CARGO.IDCARGO        = FUNCIONARIO.IDCARGO'
      'FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22'
      '22'
      '40'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 345
    Top = 15
  end
  object qryFuncio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from FUNCIONARIO F, SITFUNC S '
      'where S.TIPOSIT = '#39'D'#39' '
      'and    F.IDSITFUNC = S.IDSITFUNC'
      'and    F.DATADESLIGAMENTO BETWEEN :DTINI AND :DTFIM'
      'order by F.MATRICULA')
    ValidateWithMask = True
    Left = 699
    Top = 156
    ParamData = <
      item
        DataType = ftDate
        Name = 'DTINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DTFIM'
        ParamType = ptUnknown
      end>
  end
  object qryIn: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 702
    Top = 71
  end
  object Regra: TRegra
    QueryIn = qryIn
    DatabaseName = 'BaseDados'
    IdCalculo = 0
    IdEmpresa = -1
    Left = 702
    Top = 58
  end
  object qryBaseCompl: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NVL(VALORPROVENTO,0) AS VALORPROVENTO'
      'FROM HISTRUBSAL'
      'WHERE  IDMODULO = 21'
      'AND        IDPESSOA = :IDPESSOA'
      'AND        MES           = :MES'
      'AND        IDMOTIVO = :IDMOTIVO'
      'AND        IDRUBRICA = :IDRUBRICA')
    ValidateWithMask = True
    Left = 608
    Top = 9
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDMOTIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDRUBRICA'
        ParamType = ptUnknown
      end>
  end
  object qryPortadorForma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'select pfr.codportforma,pfr.codportador,pfr.descricao,pfr.codarq' +
        'uivoremessa,'
      '       pfr.controleremessa,pfr.codformapagto,PFR.FLGEMITEAVISO,'
      '       pfr.CODTIPOPAGTO,pfr.NUMEMPRESABANCO,'
      '       pct.IDBANCO,pct.NOCONTACORR'
      'from PORTADORFORMA pfr,PORTADORCONTA pct'
      'where  pct.codportador=pfr.codportador')
    ValidateWithMask = True
    Left = 168
    Top = 47
  end
  object updDocTxt: TUpdateSQL
    Left = 669
    Top = 57
  end
  object qryDocTxt: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      ' '#39'123456789012345678'#39' CONTALIQUIDO,'
      ' 0 IDPESSOA,'
      ' '#39'123456789012345678901234567890'#39' NOME,'
      ' '#39'123456789012345678901234567890'#39' RAZAOSOCIAL,'
      ' '#39'123456789012345678'#39' NUMDOCUMENTO,'
      ' '#39'123456789012345'#39' CONTACORRENTE,'
      ' '#39'1234567890'#39' CODBANCOFAVORECIDO,'
      ' '#39'123456789012345'#39' NUMAGENCIA,'
      ' '#39'1234567890123456789012345678901234567890'#39' LOGRADOURO,'
      ' '#39'12345678'#39' NUMERO,'
      ' '#39'12345678901234567890'#39' COMPLEMENTO,'
      ' '#39'12345678901234567890'#39' BAIRRO,'
      ' '#39'12345678901234567890'#39' CIDADE,'
      ' '#39'123'#39' CODESTADO,'
      ' '#39'12345678'#39' CEP,'
      ' 0 IDFORCLI,'
      ' 0 CODDOCUMENTO,'
      ' '#39'1234567890123'#39' LIVRE,'
      ' 0 VALOR,'
      ' 0 VALORDESCONTO,'
      ' 0 VALORJUROS,'
      ' '#39'01/01/1990'#39' DATAVENCTO,'
      ' '#39'01/01/1990'#39' DATAPROGRAMADA,'
      ' 0 TIPOMOEDA,'
      ' 0 NUMLOTE,'
      ' 0 CODPORTFORMA,'
      ' 0 CODFORMAPAGTO,'
      ' 0 CODTIPOPAGTO,'
      ' '#39'0'#39' FLGEMITEAVISO,'
      ' 0 CODARQUIVOREMESSA,'
      ' 0 CODPORTADOR,'
      ' 0 IDBANCO,'
      ' '#39'123456789012345'#39' NOCONTACORR,'
      ' '#39'1234567890'#39' CODBARRA,'
      ' '#39'1234567890'#39' CODBARRAVALOR,'
      ' 0 NODOCUMENTO,'
      ' '#39'123'#39' COMPLDOCUMENTO,'
      ' '#39'1'#39' TIPO,'
      ' '#39'12345678901234567890'#39' NUMEMPRESABANCO,'
      ' '#39'1'#39' DEBCRE, '#39'1'#39' TIPOCONTA'
      'FROM DUAL'
      'WHERE 1 = 2')
    UpdateObject = updDocTxt
    ValidateWithMask = True
    Left = 669
    Top = 69
  end
  object qryBanco: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  AGB.IDBANCO, BPF.CODPORTFORMA,'
      
        '  F.NUMCONTASALARIO AS CONTACORRENTE, AGB.NUMAGENCIA, BAN.NUMBAN' +
        'CO'
      'FROM'
      
        '  FUNCIONARIO F, AGENCIABANCARIA AGB, BANCO BAN, BANCOPORTFORMA ' +
        'BPF'
      'WHERE'
      '  (F.IDPESSOA         = :IDRESPONSAVEL)  AND'
      '  (F.IDAGENCIASALARIO = AGB.IDPESSOA(+)) AND'
      '  (AGB.IDBANCO        = BAN.IDPESSOA(+)) AND'
      '  (AGB.IDBANCO        = BPF.IDBANCO(+))')
    ValidateWithMask = True
    Left = 126
    Top = 27
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDRESPONSAVEL'
        ParamType = ptUnknown
      end>
  end
  object qryEndereco: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select end.logradouro,end.numero,end.complemento,'
      '       end.bairro,cidades.nome as cidade,end.codestado,end.cep,'
      '       doc.numdocumento'
      'from   ENDPESS end,DOCPESSOA doc, CIDADES'
      'where end.idpessoa=:IdResponsavel'
      'and   doc.idpessoa=:IdResponsavel'
      'and   CIDADES.IDCIDADES(+) = end.IDCIDADES')
    ValidateWithMask = True
    Left = 62
    Top = 1
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdResponsavel'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdResponsavel'
        ParamType = ptUnknown
      end>
  end
  object updRubEsp: TUpdateSQL
    Left = 477
    Top = 301
  end
  object qryRubRub: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from RUBXRUB'
      'order by IDRUBPRINC, IDRUBSECUND')
    ValidateWithMask = True
    Left = 94
    Top = 23
  end
  object qryAuxRubInd: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE RUBRICAINDIV'
      'SET  NumOcorrencias = NumOcorrencias + 1'
      'WHERE IDPESSOA      = :IDPESSOA'
      'AND IDEMPRESA       = :IDEMPRESA'
      'AND IDRUBRICA       = :IDRUBRICA'
      'AND SEQRUBRICAINDIV = :SEQRUBRICAINDIV'
      'AND FLGTPRUBMANUT   = '#39'2'#39)
    ValidateWithMask = True
    Left = 157
    Top = 121
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDRUBRICA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQRUBRICAINDIV'
        ParamType = ptUnknown
      end>
  end
  object qryRubInd: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM RUBRICAINDIV'
      'WHERE FLGTPRUBMANUT = '#39'2'#39
      'ORDER BY'
      'IDPESSOA, IDEMPRESA, IDRUBRICA, SEQRUBRICAINDIV')
    ValidateWithMask = True
    Left = 85
    Top = 121
  end
  object tblDocumentos: TTable
    Left = 504
    Top = 87
  end
  object qryAuxCarta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  F.IDMOTIVODESLIGRAIS, C.NUMCARTA'
      'FROM'
      '  FUNCIONARIO F, CARTA C'
      'WHERE'
      '  (F.IDPESSOA = :IDPESSOA)    AND'
      '  (F.IDMOTIVODESLIGRAIS   = C.IDMOTIVO)')
    ValidateWithMask = True
    Left = 276
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
end
