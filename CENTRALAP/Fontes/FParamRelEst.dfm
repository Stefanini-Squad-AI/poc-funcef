inherited FrmParamRelEst: TFrmParamRelEst
  Top = 166
  HelpContext = 190051
  Caption = 'Parâmetro do Relatório Estatístico de Atendimento'
  ClientHeight = 465
  ClientWidth = 574
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label14: TLabel [0]
    Left = 14
    Top = 176
    Width = 102
    Height = 13
    Caption = 'Grupo do Assunto'
  end
  inherited pnlFundo: TPanel
    Width = 574
    Height = 426
    TabOrder = 9
    object Label12: TLabel
      Left = 14
      Top = 138
      Width = 129
      Height = 13
      Caption = 'Situação na Fundação'
    end
    object Label2: TLabel
      Left = 203
      Top = 138
      Width = 59
      Height = 13
      Caption = 'Atendente'
    end
    object Label9: TLabel
      Left = 14
      Top = 176
      Width = 102
      Height = 13
      Caption = 'Grupo do Assunto'
    end
    object Label3: TLabel
      Left = 203
      Top = 96
      Width = 46
      Height = 13
      Caption = 'Assunto'
    end
    object Label29: TLabel
      Left = 14
      Top = 96
      Width = 33
      Height = 13
      Caption = 'Plano'
    end
    object Label11: TLabel
      Left = 14
      Top = 55
      Width = 124
      Height = 13
      Caption = 'Local de Atendimento'
    end
    object Label6: TLabel
      Left = 203
      Top = 55
      Width = 37
      Height = 13
      Caption = 'Status'
    end
    object Label4: TLabel
      Left = 203
      Top = 15
      Width = 127
      Height = 13
      Caption = 'Forma de Atendimento'
    end
    object Label1: TLabel
      Left = 14
      Top = 15
      Width = 84
      Height = 13
      Caption = 'Patrocinadora '
    end
    object Label26: TLabel
      Left = 15
      Top = 324
      Width = 40
      Height = 13
      Caption = 'Cidade'
    end
    object GroupBox1: TGroupBox
      Left = 396
      Top = 18
      Width = 160
      Height = 99
      Caption = ' Período '
      TabOrder = 0
      object Label7: TLabel
        Left = 19
        Top = 14
        Width = 65
        Height = 13
        Caption = 'Data inicial'
      end
      object Label8: TLabel
        Left = 19
        Top = 53
        Width = 59
        Height = 13
        Caption = 'Data Final'
      end
      object dataini: TCMDateTimePicker
        Left = 19
        Top = 28
        Width = 124
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
      object datafin: TCMDateTimePicker
        Left = 19
        Top = 68
        Width = 127
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
      end
    end
    object dblkCidade: TwwDBLookupCombo
      Left = 14
      Top = 339
      Width = 370
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'50'#9'NOME'#9'F')
      DataField = 'CIDADESOLIC'
      LookupTable = qryCidades
      LookupField = 'IDCIDADES'
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object rgrpExibir: TRadioGroup
      Left = 14
      Top = 368
      Width = 544
      Height = 41
      Caption = 'Exibir tempo...'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        '...em segundos.'
        '...em horas, minutos e segundos.')
      TabOrder = 2
    end
  end
  inherited Dock971: TDock97
    Top = 426
    Width = 574
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  object RgOrdena: TRadioGroup [3]
    Left = 397
    Top = 128
    Width = 161
    Height = 232
    Caption = ' Ordena Por '
    ItemIndex = 0
    Items.Strings = (
      'Atendente'
      'Status'
      'Forma de Atendimento'
      'Situação na fundação'
      'Local de Atendimento'
      'Plano Previdenciário'
      'Grupo de Assunto'
      'Cidade'
      'Matricula'
      'Cod. Atendimento')
    TabOrder = 12
  end
  object GroupBox4: TGroupBox [4]
    Left = 14
    Top = 216
    Width = 369
    Height = 101
    Caption = 'Participante'
    TabOrder = 10
    object Label15: TLabel
      Left = 7
      Top = 14
      Width = 55
      Height = 13
      Caption = 'Matrícula'
    end
    object Label13: TLabel
      Left = 7
      Top = 54
      Width = 33
      Height = 13
      Caption = 'Nome'
    end
    object Label5: TLabel
      Left = 116
      Top = 14
      Width = 24
      Height = 13
      Caption = 'CPF'
    end
    object Label10: TLabel
      Left = 238
      Top = 14
      Width = 115
      Height = 13
      Caption = 'Insc em Plano Prev.'
    end
    object edmatricula: TEdit
      Left = 7
      Top = 28
      Width = 104
      Height = 21
      TabOrder = 0
    end
    object edcpf: TEdit
      Left = 116
      Top = 28
      Width = 115
      Height = 21
      TabOrder = 1
    end
    object ednome: TEdit
      Left = 7
      Top = 69
      Width = 356
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 3
    end
    object edinsc: TEdit
      Left = 238
      Top = 28
      Width = 122
      Height = 21
      TabOrder = 2
    end
  end
  object CmbGrupoAssunto: TwwDBLookupCombo [5]
    Left = 15
    Top = 192
    Width = 367
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'DESCGRUPOASSUNTO'#9'60'#9'Descrição')
    LookupTable = QryGrupoAssunto
    LookupField = 'IDGRUPOASSUNTO'
    TabOrder = 8
    AutoDropDown = True
    ShowButton = True
    AllowClearKey = True
    ShowMatchText = True
  end
  object CmSituacaoPart: TCMDBLookupCombo [6]
    Left = 14
    Top = 153
    Width = 180
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'DESCRICAO'#9'50'#9'DESCRICAO')
    LookupTable = QrySituCad
    LookupField = 'IDSITPART'
    Options = [loTitles]
    Style = csDropDownList
    TabOrder = 6
    AutoDropDown = True
    ShowButton = True
    AllowClearKey = True
    ShowMatchText = True
  end
  object cmbatend: TwwDBLookupCombo [7]
    Left = 203
    Top = 153
    Width = 180
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'NOMEUSUARIO'#9'20'#9'NOMEUSUARIO')
    LookupTable = qryAtendente
    LookupField = 'IDUSUARIO'
    TabOrder = 7
    AutoDropDown = True
    ShowButton = True
    AllowClearKey = False
    ShowMatchText = True
  end
  object cmbassunto: TwwDBLookupCombo [8]
    Left = 203
    Top = 111
    Width = 180
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'NOME'#9'60'#9'NOME')
    LookupTable = QryAssunto
    LookupField = 'IDASSUNTO'
    TabOrder = 5
    AutoDropDown = True
    ShowButton = True
    AllowClearKey = False
    ShowMatchText = True
  end
  object cmbPlano: TwwDBLookupCombo [9]
    Left = 14
    Top = 111
    Width = 180
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'NOME'#9'50'#9'NOME')
    LookupTable = qryPlano
    LookupField = 'IDPLANOPREV'
    TabOrder = 4
    AutoDropDown = True
    ShowButton = True
    AllowClearKey = False
    ShowMatchText = True
  end
  object CmbLocal: TCMDBLookupCombo [10]
    Left = 14
    Top = 70
    Width = 180
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'DESCLOCALATEND'#9'60'#9'DESCLOCALATEND')
    LookupTable = qryLocalAtend
    LookupField = 'IDLOCALATEND'
    Options = [loTitles]
    Style = csDropDownList
    TabOrder = 2
    AutoDropDown = True
    ShowButton = True
    AllowClearKey = True
    ShowMatchText = True
  end
  object cmbstatus: TComboBox [11]
    Left = 203
    Top = 70
    Width = 180
    Height = 21
    ItemHeight = 13
    TabOrder = 3
    Items.Strings = (
      'Cancelado'
      'Concluído'
      'Pendente')
  end
  object cmbforma: TwwDBLookupCombo [12]
    Left = 203
    Top = 30
    Width = 180
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'NOME'#9'60'#9'NOME')
    LookupTable = qryFormaAtendimento
    LookupField = 'IDTIPOATEND'
    TabOrder = 1
    AutoDropDown = True
    ShowButton = True
    AllowClearKey = False
    ShowMatchText = True
  end
  object cmbpatro: TwwDBLookupCombo [13]
    Left = 14
    Top = 30
    Width = 180
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'NOME'#9'60'#9'NOME')
    LookupTable = qryPatro
    LookupField = 'IDPESSOA'
    TabOrder = 0
    AutoDropDown = True
    ShowButton = True
    AllowClearKey = False
    ShowMatchText = True
  end
  object QryAssunto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  NOME, IDASSUNTO'
      'FROM'
      '  ASSUNTO'
      'ORDER BY'
      '  NOME')
    ValidateWithMask = True
    Left = 260
    Top = 127
    object QryAssuntoNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'ASSUNTO.NOME'
      Size = 60
    end
    object QryAssuntoIDASSUNTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDASSUNTO'
      Origin = 'ASSUNTO.IDASSUNTO'
      Visible = False
    end
  end
  object qryAtendente: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    U.IDUSUARIO, U.NOMEUSUARIO'
      
        'FROM USUARIOSISTEMA  U,  (SELECT DISTINCT CODATENDENTE FROM  ATE' +
        'ND) AT'
      'WHERE U.IDUSUARIO = TO_NUMBER(AT.CODATENDENTE)'
      'ORDER BY NOMEUSUARIO ')
    ValidateWithMask = True
    Left = 318
    Top = 145
    object qryAtendenteNOMEUSUARIO: TStringField
      DisplayWidth = 20
      FieldName = 'NOMEUSUARIO'
      Origin = 'USUARIOSISTEMA.NOMEUSUARIO'
    end
    object qryAtendenteIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
      Origin = 'USUARIOSISTEMA.IDUSUARIO'
      Visible = False
    end
  end
  object QrySituCad: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDSITPART, DESCRICAO'
      'FROM'
      '  SITPART'
      'ORDER BY'
      '  DESCRICAO')
    ValidateWithMask = True
    Left = 488
    Top = 154
    object QrySituCadDESCRICAO: TStringField
      DisplayWidth = 50
      FieldName = 'DESCRICAO'
      Origin = '"CM.SITPART".DESCRICAO'
      Size = 50
    end
    object QrySituCadIDSITPART: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSITPART'
      Origin = '"CM.SITPART".IDSITPART'
      Visible = False
    end
  end
  object qryLocalAtend: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT LA.IDLOCALATEND,'
      '       LA.DESCLOCALATEND'
      'FROM   LOCALATEND LA'
      'ORDER BY LA.DESCLOCALATEND')
    ValidateWithMask = True
    Left = 464
    Top = 133
    object qryLocalAtendIDLOCALATEND: TFloatField
      FieldName = 'IDLOCALATEND'
      Origin = 'LOCALATEND.IDLOCALATEND'
    end
    object qryLocalAtendDESCLOCALATEND: TStringField
      FieldName = 'DESCLOCALATEND'
      Origin = 'LOCALATEND.DESCLOCALATEND'
      Size = 60
    end
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOME,IDPLANOPREV '
      'FROM PLANPREV '
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 464
    Top = 87
    object qryPlanoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'PLANPREV.NOME'
      Size = 50
    end
    object qryPlanoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'PLANPREV.IDPLANOPREV'
    end
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   P.IDPESSOA , P.NOME'
      'FROM'
      '   PESSOA P, PATRO PA'
      'WHERE'
      '   P.IDPESSOA = PA.IDPESSOA'
      'ORDER BY'
      '   NOME'
      ''
      '')
    ValidateWithMask = True
    Left = 464
    Top = 45
    object qryPatroIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryPatroNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object QryGrupoAssunto: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  IDGRUPOASSUNTO, DESCGRUPOASSUNTO '
      'FROM '
      '  GRUPOASSUNTO '
      'ORDER BY '
      '  DESCGRUPOASSUNTO')
    ValidateWithMask = True
    Left = 285
    Top = 52
    object QryGrupoAssuntoDESCGRUPOASSUNTO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCGRUPOASSUNTO'
      Origin = 'GRUPOASSUNTO.DESCGRUPOASSUNTO'
      Size = 60
    end
    object QryGrupoAssuntoIDGRUPOASSUNTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPOASSUNTO'
      Origin = 'GRUPOASSUNTO.IDGRUPOASSUNTO'
      Visible = False
    end
  end
  object qryFormaAtendimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOATEND, NOME'
      'FROM TIPOATEND'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 283
    Top = 10
  end
  object qryCidades: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  IDCIDADES, '
      '  CODESTADO, '
      '  NOME, '
      '  IDESTADO,'
      '  IDPAIS,'
      '  UF'
      'FROM CIDADES'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 304
    Top = 325
    object qryCidadesNOME: TStringField
      DisplayWidth = 50
      FieldName = 'NOME'
      Origin = 'BASEDADOS.CIDADES.NOME'
      Size = 50
    end
    object qryCidadesIDCIDADES: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCIDADES'
      Origin = 'BASEDADOS.CIDADES.IDCIDADES'
      Visible = False
    end
    object qryCidadesCODESTADO: TStringField
      DisplayWidth = 3
      FieldName = 'CODESTADO'
      Origin = 'BASEDADOS.CIDADES.CODESTADO'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object qryCidadesIDESTADO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDESTADO'
      Origin = 'BASEDADOS.CIDADES.IDESTADO'
      Visible = False
    end
    object qryCidadesIDPAIS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPAIS'
      Origin = 'BASEDADOS.CIDADES.IDPAIS'
      Visible = False
    end
    object qryCidadesUF: TStringField
      FieldName = 'UF'
      Origin = 'BASEDADOS.CIDADES.UF'
      FixedChar = True
      Size = 3
    end
  end
end
