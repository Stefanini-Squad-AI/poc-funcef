inherited FrmFiltroRelaDocs: TFrmFiltroRelaDocs
  Left = 240
  Top = 131
  HelpContext = 190062
  Caption = 'Relatório de Recebimento de Documentos'
  ClientHeight = 404
  ClientWidth = 446
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel [0]
    Left = 24
    Top = 286
    Width = 59
    Height = 13
    Caption = 'Atendente'
  end
  inherited pnlFundo: TPanel
    Width = 446
    Height = 365
    object Label1: TLabel
      Left = 30
      Top = 38
      Width = 156
      Height = 13
      Caption = 'Seção ou Grupo de Acesso'
    end
    object Label2: TLabel
      Left = 30
      Top = 90
      Width = 129
      Height = 13
      Caption = 'Data de Receb. Inicial'
    end
    object Label3: TLabel
      Left = 273
      Top = 90
      Width = 122
      Height = 13
      Caption = 'Data de Receb. Final'
    end
    object Label4: TLabel
      Left = 24
      Top = 182
      Width = 55
      Height = 13
      Caption = 'Matrícula'
    end
    object Label5: TLabel
      Left = 134
      Top = 182
      Width = 33
      Height = 13
      Caption = 'Nome'
    end
    object Label2a: TLabel
      Left = 24
      Top = 230
      Width = 59
      Height = 13
      Caption = 'Atendente'
    end
    object Label7: TLabel
      Left = 25
      Top = 282
      Width = 105
      Height = 13
      Caption = 'Benefício/Serviço'
    end
    object Bevel1: TBevel
      Left = 12
      Top = 167
      Width = 422
      Height = 172
    end
    object DblkGrupo: TwwDBLookupCombo
      Left = 30
      Top = 54
      Width = 379
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEGRUPO'#9'20'#9'NOMEGRUPO'#9'F')
      LookupTable = qrySecao
      LookupField = 'IDGRUPO'
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object DTPDataInicial: TwwDBDateTimePicker
      Left = 30
      Top = 109
      Width = 121
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 1
    end
    object DTPDataFinal: TwwDBDateTimePicker
      Left = 273
      Top = 109
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
    object EdtMatricula: TEdit
      Left = 24
      Top = 196
      Width = 105
      Height = 21
      Color = clBtnFace
      TabOrder = 3
    end
    object EdtNome: TEdit
      Left = 134
      Top = 196
      Width = 265
      Height = 21
      Color = clBtnFace
      TabOrder = 4
    end
    object BitBtn1: TBitBtn
      Left = 400
      Top = 195
      Width = 25
      Height = 22
      Caption = '...'
      TabOrder = 5
      OnClick = BitBtn1Click
    end
    object cmbatend: TwwDBLookupCombo
      Left = 24
      Top = 244
      Width = 379
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEUSUARIO'#9'20'#9'NOMEUSUARIO')
      LookupTable = qryatend
      LookupField = 'IDUSUARIO'
      TabOrder = 6
      AutoDropDown = True
      ShowButton = True
      OrderByDisplay = False
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock971: TDock97
    Top = 365
    Width = 446
    inherited tb97Fundo: TToolbar97
      Left = 276
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 109
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  object dblkBenefServ: TwwDBLookupCombo [3]
    Left = 24
    Top = 296
    Width = 379
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'NOME'#9'60'#9'NOME'#9'F')
    LookupTable = qryBenefServ
    LookupField = 'IDBENEFSERV'
    TabOrder = 2
    AutoDropDown = True
    ShowButton = True
    OrderByDisplay = False
    AllowClearKey = True
    ShowMatchText = True
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 451
    Top = 11
  end
  object qrySecao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   GRUPOACESSO.IDGRUPO,'
      '   GRUPOACESSO.NOMEGRUPO'
      'FROM'
      '   GRUPOACESSO')
    ValidateWithMask = True
    Left = 272
    Top = 8
  end
  object MsParticipDepen: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Participante/Dependente'
    Colunas.Strings = (
      'VWPARTICIPDEPEN.MATRICULA'
      'VWPARTICIPDEPEN.MATRICULADEP'
      'VWPARTICIPDEPEN.NOME'
      'VWPARTICIPDEPEN.PLANO'
      
        'DECODE (VWPARTICIPDEPEN.FLGDESATIVADO, NULL, '#39' '#39',  1, '#39'NÃO'#39', 0, ' +
        #39'SIM'#39')'
      'VWPARTICIPDEPEN.INSCRICAONUMERO'
      'VWPARTICIPDEPEN.PATRO'
      'VWPARTICIPDEPEN.NUMDOCUMENTO'
      'VWPARTICIPDEPEN.DESCRICAO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matr. Titular'
      'Matr. Depen.'
      'Nome'
      'Plano'
      'Ativo no Plano'
      'Inscrição'
      'Patrocinadora'
      'CPF'
      'Situação do Participante')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'VWPARTICIPDEPEN')
    CamposChave.Strings = (
      'VWPARTICIPDEPEN.NOME'
      'VWPARTICIPDEPEN.NUMDOCUMENTO'
      'VWPARTICIPDEPEN.MATRICULA'
      'VWPARTICIPDEPEN.INSCRICAONUMERO'
      'VWPARTICIPDEPEN.PLANO'
      'VWPARTICIPDEPEN.PATRO'
      'VWPARTICIPDEPEN.IDPESSJUR'
      'VWPARTICIPDEPEN.IDTITULAR'
      'VWPARTICIPDEPEN.DESCRICAO'
      'VWPARTICIPDEPEN.IDPESSOA'
      'VWPARTICIPDEPEN.IDPLANOPREV'
      'VWPARTICIPDEPEN.SEQPROPOSTA'
      'VWPARTICIPDEPEN.EMAIL'
      'VWPARTICIPDEPEN.SITFUND'
      'VWPARTICIPDEPEN.IDSITPART'
      'VWPARTICIPDEPEN.MATRICULADEP')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '15'
      '35'
      '35'
      '6'
      '10'
      '30'
      '18'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 339
    Top = 132
  end
  object qryatend: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDUSUARIO,'
      '  NOMEUSUARIO'
      'FROM'
      '  USUARIOSISTEMA'
      'ORDER BY'
      '  NOMEUSUARIO')
    ValidateWithMask = True
    Left = 282
    Top = 241
    object qryatendIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
      Origin = 'USUARIOSISTEMA.IDUSUARIO'
    end
    object qryatendNOMEUSUARIO: TStringField
      FieldName = 'NOMEUSUARIO'
      Origin = 'USUARIOSISTEMA.NOMEUSUARIO'
    end
  end
  object qryBenefServ: TwwQuery
    Active = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM ('
      
        '                SELECT                                          ' +
        '          '
      
        '                  SE.NOME, se.idservicos as idbenefserv         ' +
        '          '
      
        '                FROM SERVICO SE                                 ' +
        '             '
      
        '                UNION                                           ' +
        '          '
      
        '                SELECT                                          ' +
        '          '
      
        '                  BE.NOME, be.idbeneficio as idbenefserv        ' +
        '          '
      
        '                FROM BENEFICIO BE                               ' +
        '               '
      '              ) BS'
      'ORDER BY BS.NOME ASC')
    ValidateWithMask = True
    Left = 344
    Top = 296
    object qryBenefServNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Size = 60
    end
    object qryBenefServIDBENEFSERV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBENEFSERV'
      Visible = False
    end
  end
end
