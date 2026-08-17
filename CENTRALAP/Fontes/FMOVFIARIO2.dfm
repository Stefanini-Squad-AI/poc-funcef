inherited FRMMOVFIARIO: TFRMMOVFIARIO
  Left = 111
  Top = 160
  Caption = 'Movimento no Protocolo'
  ClientHeight = 308
  ClientWidth = 610
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 610
    Height = 222
    Caption = ' '
    object Assunto: TLabel
      Left = 15
      Top = 102
      Width = 33
      Height = 13
      Caption = 'Texto'
    end
    object Label1: TLabel
      Left = 13
      Top = 12
      Width = 144
      Height = 13
      Caption = 'Participante/Dependente'
    end
    object Label2: TLabel
      Left = 13
      Top = 58
      Width = 111
      Height = 13
      Caption = 'Grupo de Protocolo'
    end
    object edparticipante: TEdit
      Left = 13
      Top = 28
      Width = 577
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object memoAssunto: TMemo
      Left = 13
      Top = 118
      Width = 577
      Height = 89
      MaxLength = 200
      TabOrder = 1
    end
    object dblkGrupo: TwwDBLookupCombo
      Left = 13
      Top = 73
      Width = 577
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'100'#9'Descrição'#9'F')
      LookupTable = qryassunto
      LookupField = 'IDFIARASS'
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock972: TDock97
    Width = 610
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        OnClick = sbtnInserirClick
      end
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 340
        Width = 35
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
      object sbtndependente: TToolbarButton97
        Left = 260
        Top = 0
        Width = 80
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Dependente'
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
        OnClick = sbtndependenteClick
      end
      object sbtnparticipante: TToolbarButton97
        Left = 180
        Top = 0
        Width = 80
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Par&ticipante'
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
        OnClick = sbtnparticipanteClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 269
    Width = 610
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 496
    Top = 14
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 552
    Top = 12
  end
  inherited ImlPadrao: TImageList
    Left = 584
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 448
    Top = 11
  end
  object MontaParticipante: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Matricula'
      'Nome')
    SensivelACaixa.Strings = (
      'S'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'ELEGPATRO')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA'
      'PESSOA.NOME')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA ')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '13'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 520
    Top = 7
  end
  object MontaDependente: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.NOME'
      'ELEGPATRO.MATRICULA'
      'DEPEN.DESCRICAO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome do Dependente'
      'Matricula'
      'Tipo de dependência')
    SensivelACaixa.Strings = (
      'N'
      'S'
      'N')
    Tabelas.Strings = (
      'DEPENTIT'
      'PESSOA'
      'ELEGPATRO'
      'DEPEN')
    CamposChave.Strings = (
      'DEPENTIT.IDTITULAR'
      'DEPENTIT.IDPESSOA'
      'PESSOA.NOME')
    Filtro.Strings = (
      'DEPENTIT.IDPESSOA = PESSOA.IDPESSOA '
      'DEPENTIT.IDTITULAR = ELEGPATRO.IDPESSOA'
      'NUMSEQUENCIA <> 1'
      'DEPEN.IDDEPENDENCIA  = DEPENTIT.IDDEPENDENCIA  ')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '13'
      '15')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 360
    Top = 7
  end
  object qryassunto: TwwQuery
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'select  IDFIARASS, DESCRICAO'
      'from FIARIOASSUNTO')
    ValidateWithMask = True
    Left = 512
    Top = 71
    object qryassuntoDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 100
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.FIARIOASSUNTO.DESCRICAO'
      Size = 100
    end
    object qryassuntoIDFIARASS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFIARASS'
      Origin = 'BASEDADOS.FIARIOASSUNTO.IDFIARASS'
      Visible = False
    end
  end
end
