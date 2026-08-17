inherited frmFiltroRelaProtocolo: TfrmFiltroRelaProtocolo
  Left = 196
  Top = 163
  HelpContext = 190058
  Caption = 'Filtro do Relatório de Protocolos'
  ClientHeight = 271
  ClientWidth = 529
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 529
    Height = 232
    object Label2: TLabel
      Left = 277
      Top = 24
      Width = 148
      Height = 13
      Caption = 'Grupo de Usuários/Seção'
    end
    object Label3: TLabel
      Left = 36
      Top = 85
      Width = 111
      Height = 13
      Caption = 'Grupo de Protocolo'
    end
    object Bevel1: TBevel
      Left = 8
      Top = 144
      Width = 512
      Height = 81
    end
    object Label4: TLabel
      Left = 36
      Top = 154
      Width = 130
      Height = 13
      Caption = 'Data de Incluão Inicial'
    end
    object Label5: TLabel
      Left = 375
      Top = 154
      Width = 123
      Height = 13
      Caption = 'Data de Incluão Final'
    end
    object Label1: TLabel
      Left = 40
      Top = 25
      Width = 114
      Height = 13
      Caption = 'Usuários/Atendente'
    end
    object DblkGrupoUsu: TwwDBLookupCombo
      Left = 278
      Top = 41
      Width = 217
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEGRUPO'#9'20'#9'NOMEGRUPO'#9'F')
      LookupTable = qryGrupoUsu
      LookupField = 'IDGRUPO'
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object DblkGrupoProtocolo: TwwDBLookupCombo
      Left = 36
      Top = 101
      Width = 217
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'100'#9'Descrição'#9'F')
      LookupTable = qryGrupoProtocolo
      LookupField = 'IDFIARASS'
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object DtpDataIni: TwwDBDateTimePicker
      Left = 36
      Top = 170
      Width = 121
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 2
    end
    object DtpDataFin: TwwDBDateTimePicker
      Left = 375
      Top = 170
      Width = 121
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 3
    end
    object DblkUsuario: TwwDBLookupCombo
      Left = 36
      Top = 41
      Width = 217
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'Nome'#9'F'
        'NOMEUSUARIO'#9'20'#9'Usuário'#9'F')
      LookupTable = qryUsuarios
      LookupField = 'IDUSUARIO'
      Options = [loColLines, loTitles]
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
  end
  inherited Dock971: TDock97
    Top = 232
    Width = 529
    inherited tb97Fundo: TToolbar97
      Left = 357
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 188
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 443
    Top = 91
  end
  object qryGrupoProtocolo: TwwQuery
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'select  IDFIARASS, DESCRICAO'
      'from FIARIOASSUNTO'
      '')
    ValidateWithMask = True
    Left = 168
    Top = 87
    object qryGrupoProtocoloDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 100
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.FIARIOASSUNTO.DESCRICAO'
      Size = 100
    end
    object qryGrupoProtocoloIDFIARASS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFIARASS'
      Origin = 'BASEDADOS.FIARIOASSUNTO.IDFIARASS'
      Visible = False
    end
  end
  object qryGrupoUsu: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  IDGRUPO,'
      '  NOMEGRUPO '
      'FROM GRUPOACESSO'
      'ORDER BY NOMEGRUPO')
    ValidateWithMask = True
    Left = 336
    Top = 47
    object qryGrupoUsuNOMEGRUPO: TStringField
      DisplayWidth = 20
      FieldName = 'NOMEGRUPO'
      Origin = 'BASEDADOS.GRUPOACESSO.NOMEGRUPO'
      FixedChar = True
    end
    object qryGrupoUsuIDGRUPO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPO'
      Origin = 'BASEDADOS.GRUPOACESSO.IDGRUPO'
      Visible = False
    end
  end
  object qryUsuarios: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT USUARIOSISTEMA.NOMEUSUARIO, PESSOA.NOME, USUARIOSISTEMA.I' +
        'DUSUARIO'
      'FROM USUARIOSISTEMA, PESSOA'
      'WHERE ( USUARIOSISTEMA.IDUSUARIO = PESSOA.IDPESSOA )'
      'ORDER BY PESSOA.NOME'
      ''
      '/*'
      'SELECT '
      '   USUARIOSISTEMA.NOMEUSUARIO,'
      '   PESSOA.NOME,'
      '   GRUPOACESSO.NOMEGRUPO,'
      '   USUARIOSISTEMA.IDUSUARIO,'
      '   USUARIOSISTEMA.NOMEUSUARIO,'
      '   GRUPOACESSO.IDGRUPO'
      'FROM'
      '   USUARIOSISTEMA,'
      '   PESSOA,'
      '   GRUPOACESSO,'
      '   GRUPOUSU'
      'WHERE '
      '   ( GRUPOUSU.IDGRUPO = GRUPOACESSO.IDGRUPO(+) ) AND'
      '   ( USUARIOSISTEMA.IDUSUARIO = GRUPOUSU.IDUSUARIO(+) ) AND'
      '   ( USUARIOSISTEMA.IDUSUARIO = PESSOA.IDPESSOA )'
      'ORDER BY PESSOA.NOME'
      '*/'
      ' ')
    ValidateWithMask = True
    Left = 184
    Top = 32
    object qryUsuariosNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'BASEDADOS."CM.PESSOA".NOME'
      Size = 60
    end
    object qryUsuariosNOMEUSUARIO: TStringField
      DisplayLabel = 'Usuário'
      DisplayWidth = 20
      FieldName = 'NOMEUSUARIO'
      Origin = 'BASEDADOS.USUARIOSISTEMA.NOMEUSUARIO'
      FixedChar = True
    end
    object qryUsuariosIDUSUARIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDUSUARIO'
      Origin = 'BASEDADOS.USUARIOSISTEMA.IDUSUARIO'
      Visible = False
    end
  end
end
