inherited Frmconsultafiario: TFrmconsultafiario
  Left = 170
  Top = 112
  HelpContext = 190040
  Caption = 'Consulta Protocolo'
  ClientHeight = 420
  ClientWidth = 501
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 501
    Height = 334
    object Label1: TLabel
      Left = 8
      Top = 9
      Width = 144
      Height = 13
      Caption = 'Participante/Dependente'
    end
    object LBassunto: TLabel
      Left = 9
      Top = 234
      Width = 125
      Height = 13
      Caption = 'Descrição do Assunto'
    end
    object Label2: TLabel
      Left = 8
      Top = 53
      Width = 111
      Height = 13
      Caption = 'Grupo de Protocolo'
    end
    object dbgfiario: TwwDBGrid
      Left = 7
      Top = 108
      Width = 485
      Height = 118
      Selected.Strings = (
        'NUMERORUBS'#9'10'#9'Numero de Rubs'#9'F'
        'DATAINCLUSAO'#9'18'#9'Data de Inclusão'#9'F'
        'NOMEUSUARIO'#9'20'#9'Usuário'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsfiario
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
    end
    object edparticipante: TEdit
      Left = 7
      Top = 25
      Width = 485
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object DBMemoDescricaoAsuunto: TDBMemo
      Left = 7
      Top = 250
      Width = 485
      Height = 74
      DataField = 'DESCRICAO'
      DataSource = dsfiario
      MaxLength = 2000
      TabOrder = 2
    end
    object DBEGRUPO: TDBEdit
      Left = 8
      Top = 69
      Width = 485
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 3
    end
  end
  inherited Dock972: TDock97
    Width = 501
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Width = 78
        Enabled = False
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 78
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 258
        Width = 63
        Caption = '&Rubs'
        OnClick = sbtnrubsClick
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 138
        Visible = False
      end
      object ToolbarButton971: TToolbarButton97
        Left = 198
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Procurar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
          33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
          8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
          F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
          F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
          0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
          B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
          B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
          333333333777733333333333FBFBFB3333333333333333333333}
        ImageIndex = 3
        Images = ImlPadrao
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        OnClick = sbtnParticipanteClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 381
    Width = 501
    inherited tb97Fundo: TToolbar97
      Left = 329
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 160
      inherited bbtnConfirmar: TBitBtn
        Visible = False
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 448
    Top = 294
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    DataSet = qryFiarioGrupo
    Left = 448
    Top = 12
  end
  inherited ImlPadrao: TImageList
    Left = 440
    Top = 111
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 536
    Top = 67
  end
  object Montarubs: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.NOME'
      'RUBS.IDRUBS')
    TipodeDado.Strings = (
      'C'
      'N')
    Descricao.Strings = (
      'Nome'
      'Numero da Rub')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'RUBS'
      'RUBXBENEFICIO'
      'PESSOA')
    CamposChave.Strings = (
      'RUBS.IDRUBS'
      'RUBXBENEFICIO.IDPESSOA'
      'PESSOA.NOME'
      'RUBXBENEFICIO.IDPESSOA')
    Filtro.Strings = (
      'RUBS.IDRUBS = RUBXBENEFICIO.IDRUBS  '
      'PESSOA.IDPESSOA = RUBXBENEFICIO.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 520
    Top = 191
  end
  object qryfiario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'Select fia.idgrupo, pe.nome,fia.descricao,nvl(fia.idrubs,0)  as ' +
        'NUMERORUBS,fia.datainclusao,usu.NOMEUSUARIO '
      'from'
      '   pessoa pe,'
      '   fiario fia,'
      '   usuariosistema usu'
      'where'
      '  fia.idpessoa = :idpessoa and'
      '  pe.idpessoa = fia.idpessoa and'
      ' usu.IDUSUARIO = fia.IDUSUARIO '
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 440
    Top = 159
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idpessoa'
        ParamType = ptUnknown
      end>
    object qryfiarioNUMERORUBS: TFloatField
      DisplayLabel = 'Numero de Rubs'
      DisplayWidth = 10
      FieldName = 'NUMERORUBS'
    end
    object qryfiarioDATAINCLUSAO: TDateTimeField
      DisplayLabel = 'Data de Inclusão'
      DisplayWidth = 18
      FieldName = 'DATAINCLUSAO'
    end
    object qryfiarioNOMEUSUARIO: TStringField
      DisplayLabel = 'Usuário'
      DisplayWidth = 20
      FieldName = 'NOMEUSUARIO'
      FixedChar = True
    end
    object qryfiarioNOME: TStringField
      FieldName = 'NOME'
      Visible = False
      Size = 60
    end
    object qryfiarioIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Visible = False
    end
    object qryfiarioDESCRICAO: TMemoField
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 2000
    end
  end
  object dsfiario: TwwDataSource
    DataSet = qryfiario
    Left = 464
    Top = 239
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Protocolo'
    Colunas.Strings = (
      'VWPARTICIPDEPEN.MATRICULA'
      'VWPARTICIPDEPEN.NOME'
      'SUBSTR(FIARIO.DESCRICAO,1,40)'
      'FIARIO.DATAINCLUSAO'
      'FIARIOASSUNTO.DESCRICAO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'D'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Nome'
      'Assunto'
      'Data de Inclusão'
      'Grupo de Protocolo')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'VWPARTICIPDEPEN'
      'FIARIO'
      'FIARIOASSUNTO')
    CamposChave.Strings = (
      'VWPARTICIPDEPEN.MATRICULA'
      'VWPARTICIPDEPEN.IDTITULAR'
      'VWPARTICIPDEPEN.IDPESSOA'
      'VWPARTICIPDEPEN.NOME'
      'VWPARTICIPDEPEN.IDDEPENDENCIA'
      'VWPARTICIPDEPEN.IDDEPENDENCIA'
      'VWPARTICIPDEPEN.NUMDOCUMENTO'
      'FIARIO.IDTITULAR'
      'FIARIO.IDFIARIOA'
      'FIARIO.IDPESSOA'
      'FIARIO.IDUSUARIO'
      'FIARIO.IDMODULO'
      'FIARIO.IDRUBS'
      'FIARIO.DESCRICAO'
      'FIARIO.DATAINCLUSAO'
      'FIARIO.IDGRUPO'
      'FIARIOASSUNTO.DESCRICAO')
    Filtro.Strings = (
      'FIARIO.IDGRUPO = FIARIOASSUNTO.IDFIARASS'
      'FIARIO.IDPESSOA = VWPARTICIPDEPEN.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '30'
      '40'
      '10'
      '100')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 445
    Top = 62
  end
  object qryFiarioGrupo: TQuery
    DatabaseName = 'BaseDados'
    DataSource = dsfiario
    SQL.Strings = (
      'select IDFIARASS, DESCRICAO  from FiarioAssunto'
      'where IDFIARASS = :idgrupo')
    Left = 392
    Top = 9
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDGRUPO'
        ParamType = ptInput
      end>
    object qryFiarioGrupoIDFIARASS: TFloatField
      FieldName = 'IDFIARASS'
      Origin = 'BASEDADOS.FIARIOASSUNTO.IDFIARASS'
    end
    object qryFiarioGrupoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.FIARIOASSUNTO.DESCRICAO'
      Size = 100
    end
  end
end
