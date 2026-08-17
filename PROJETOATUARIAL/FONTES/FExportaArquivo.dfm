inherited frmExportaArquivo: TfrmExportaArquivo
  Left = 130
  Top = 68
  HelpContext = 40154
  Caption = 'Exportar Arquivo'
  ClientHeight = 441
  ClientWidth = 606
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 606
    Height = 402
    object GroupBox1: TGroupBox
      Left = 305
      Top = 156
      Width = 291
      Height = 175
      Caption = 'Local de geração do arquivo (.TXT)'
      TabOrder = 2
      object Label7: TLabel
        Left = 8
        Top = 132
        Width = 189
        Height = 13
        Caption = 'Nome do arquivo sem a extensão'
      end
      object LblDiretorio: TLabel
        Left = 203
        Top = 131
        Width = 227
        Height = 13
        Caption = 'C:\ProjetosCM5\Projeto Atuarial\Fontes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object DrveCmbBxDrive: TDriveComboBox
        Left = 8
        Top = 16
        Width = 273
        Height = 20
        DirList = DrctryLstBxDiret
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object DrctryLstBxDiret: TDirectoryListBox
        Left = 8
        Top = 40
        Width = 273
        Height = 89
        DirLabel = LblDiretorio
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ItemHeight = 16
        ParentFont = False
        TabOrder = 1
      end
      object EdtNomeArquivo: TEdit
        Left = 8
        Top = 147
        Width = 272
        Height = 21
        TabOrder = 2
      end
    end
    object GrpBxLayoutArquivo: TGroupBox
      Left = 305
      Top = 113
      Width = 291
      Height = 42
      Caption = 'Lay-out do arquivo'
      TabOrder = 1
      object DBLkpCmbBxLayout: TDBLookupComboBox
        Left = 10
        Top = 16
        Width = 271
        Height = 21
        KeyField = 'CD_ARQUIVO'
        ListField = 'NO_ARQUIVO'
        ListSource = dsLayout
        TabOrder = 0
      end
    end
    object GroupBox3: TGroupBox
      Left = 305
      Top = 5
      Width = 291
      Height = 107
      Caption = 'Grupos de Participantes'
      TabOrder = 0
      object ChckLstBxGrupoPartic: TCheckListBox
        Left = 10
        Top = 15
        Width = 271
        Height = 86
        ItemHeight = 13
        TabOrder = 0
      end
    end
    object GroupBox4: TGroupBox
      Left = 10
      Top = 5
      Width = 291
      Height = 386
      Caption = 'Versão da Base para exportação'
      Enabled = False
      TabOrder = 3
      object Label1: TLabel
        Left = 10
        Top = 200
        Width = 51
        Height = 13
        Caption = 'Entidade'
      end
      object Label2: TLabel
        Left = 11
        Top = 245
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object Label3: TLabel
        Left = 10
        Top = 290
        Width = 33
        Height = 13
        Caption = 'Plano'
      end
      object Label11: TLabel
        Left = 10
        Top = 110
        Width = 145
        Height = 13
        Caption = 'Data de geração da base'
      end
      object Label9: TLabel
        Left = 11
        Top = 65
        Width = 107
        Height = 13
        Caption = 'Data de referência'
      end
      object Label10: TLabel
        Left = 10
        Top = 20
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label4: TLabel
        Left = 12
        Top = 155
        Width = 44
        Height = 13
        Caption = 'Usuário'
      end
      object DBEdit1: TDBEdit
        Left = 10
        Top = 80
        Width = 136
        Height = 21
        DataField = 'DT_REFER_BASE'
        DataSource = dsVersaoBase
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 10
        Top = 125
        Width = 271
        Height = 21
        DataField = 'DT_GERACAO'
        DataSource = dsVersaoBase
        TabOrder = 2
      end
      object DBEdit3: TDBEdit
        Left = 10
        Top = 170
        Width = 271
        Height = 21
        DataField = 'LOGIN'
        DataSource = dsVersaoBase
        TabOrder = 3
      end
      object DBEdit4: TDBEdit
        Left = 10
        Top = 215
        Width = 271
        Height = 21
        DataField = 'NO_PESSOA_ENTID'
        DataSource = dsVersaoBase
        TabOrder = 4
      end
      object DBEdit5: TDBEdit
        Left = 10
        Top = 260
        Width = 271
        Height = 21
        DataField = 'NO_PESSOA_PATROC'
        DataSource = dsVersaoBase
        TabOrder = 5
      end
      object DBEdit6: TDBEdit
        Left = 10
        Top = 305
        Width = 271
        Height = 21
        DataField = 'NO_PLANO'
        DataSource = dsVersaoBase
        TabOrder = 6
      end
      object DBEdit7: TDBEdit
        Left = 10
        Top = 35
        Width = 271
        Height = 21
        DataField = 'DS_VERSAO'
        DataSource = dsVersaoBase
        TabOrder = 0
      end
    end
    object BitBtn1: TBitBtn
      Left = 20
      Top = 345
      Width = 216
      Height = 31
      Caption = 'Selecionar outra versão de base >>'
      TabOrder = 4
      OnClick = BitBtn1Click
    end
    object GroupBox2: TGroupBox
      Left = 305
      Top = 333
      Width = 291
      Height = 58
      TabOrder = 5
      object BitBtn6: TBitBtn
        Left = 25
        Top = 17
        Width = 216
        Height = 31
        Caption = 'Ordernar campos do arquivo  >>'
        TabOrder = 0
        OnClick = BitBtn6Click
      end
    end
    object PnlOrdem: TPanel
      Left = 35
      Top = 75
      Width = 536
      Height = 216
      TabOrder = 6
      Visible = False
      object BitBtn2: TBitBtn
        Left = 30
        Top = 167
        Width = 80
        Height = 33
        Caption = '&OK'
        Default = True
        ModalResult = 1
        TabOrder = 0
        OnClick = BitBtn2Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
      object BitBtn3: TBitBtn
        Left = 113
        Top = 167
        Width = 80
        Height = 33
        Cancel = True
        Caption = '&Cancelar'
        ModalResult = 2
        TabOrder = 1
        Visible = False
        OnClick = BitBtn2Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888009191900
          88888887788888778F88887991919191088888788888888878F8879919191919
          108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
          19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
          19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
          190878F877787778887887917F919F71908887F88788878887F8879919191919
          1088878F88888888878888799191919108888878FF88888F7888888779999977
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
      object DBLkpListBxGrupoAtributo: TDBLookupListBox
        Left = 10
        Top = 12
        Width = 206
        Height = 134
        KeyField = 'CHAVE'
        ListField = 'DS_ATRIBUTO_TABELA'
        ListSource = dsGrupoAtributo
        TabOrder = 2
        OnDblClick = DBLkpListBxGrupoAtributoDblClick
      end
      object BtnAdicionar: TBitBtn
        Left = 223
        Top = 33
        Width = 31
        Height = 25
        TabOrder = 3
        OnClick = BtnAdicionarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333FF3333333333333447333333333333377FFF33333333333744473333333
          333337773FF3333333333444447333333333373F773FF3333333334444447333
          33333373F3773FF3333333744444447333333337F333773FF333333444444444
          733333373F3333773FF333334444444444733FFF7FFFFFFF77FF999999999999
          999977777777777733773333CCCCCCCCCC3333337333333F7733333CCCCCCCCC
          33333337F3333F773333333CCCCCCC3333333337333F7733333333CCCCCC3333
          333333733F77333333333CCCCC333333333337FF7733333333333CCC33333333
          33333777333333333333CC333333333333337733333333333333}
        NumGlyphs = 2
      end
      object BtnRetirar: TBitBtn
        Left = 223
        Top = 74
        Width = 31
        Height = 25
        TabOrder = 4
        OnClick = BtnRetirarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333FF3333333333333744333333333333F773333333333337
          44473333333333F777F3333333333744444333333333F7733733333333374444
          4433333333F77333733333333744444447333333F7733337F333333744444444
          433333F77333333733333744444444443333377FFFFFFF7FFFFF999999999999
          9999733777777777777333CCCCCCCCCC33333773FF333373F3333333CCCCCCCC
          C333333773FF3337F333333333CCCCCCC33333333773FF373F3333333333CCCC
          CC333333333773FF73F33333333333CCCCC3333333333773F7F3333333333333
          CCC333333333333777FF33333333333333CC3333333333333773}
        NumGlyphs = 2
      end
      object LstBxOrdemCampos: TListBox
        Left = 260
        Top = 12
        Width = 206
        Height = 134
        ItemHeight = 13
        TabOrder = 5
      end
      object BitBtn7: TBitBtn
        Left = 475
        Top = 39
        Width = 31
        Height = 25
        TabOrder = 6
        OnClick = BitBtn7Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003C3333339333
          337437FFF3337F3333F73CCC33339333344437773F337F33377733CCC3339337
          4447337F73FF7F3F337F33CCCCC3934444433373F7737F773373333CCCCC9444
          44733337F337773337F3333CCCCC9444443333373F337F3337333333CCCC9444
          473333337F337F337F333333CCCC94444333333373F37F33733333333CCC9444
          7333333337F37F37F33333333CCC944433333333373F7F373333333333CC9447
          33333333337F7F7F3333333333CC94433333333333737F7333333333333C9473
          33333333333737F333333333333C943333333333333737333333333333339733
          3333333333337F33333333333333933333333333333373333333}
        NumGlyphs = 2
      end
      object BitBtn8: TBitBtn
        Left = 475
        Top = 74
        Width = 31
        Height = 25
        TabOrder = 7
        OnClick = BitBtn8Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333393333
          333333333337F3333333333333397333333333333337FF333333333333C94333
          3333333333737F333333333333C9473333333333337373F3333333333CC94433
          3333333337F7F7F3333333333CC94473333333333737F73F33333333CCC94443
          333333337F37F37F33333333CCC94447333333337337F373F333333CCCC94444
          33333337F337F337F333333CCCC94444733333373337F3373F3333CCCCC94444
          4333337F3337FF337F3333CCCCC94444473333733F7773FF73F33CCCCC393444
          443337F37737F773F7F33CCC33393374447337F73337F33737FFCCC333393333
          444377733337F333777FC3333339333337437333333733333373}
        NumGlyphs = 2
      end
    end
  end
  inherited Dock971: TDock97
    Top = 402
    Width = 606
    inherited tb97Fundo: TToolbar97
      Left = 308
      DockPos = 308
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 140
      DockPos = 140
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 508
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryVersaoBase: TwwQuery
    BeforeOpen = qryVersaoBaseBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT A.CD_VERSAO,'
      '       A.DS_VERSAO,'
      '       A.LOGIN,'
      '       A.DT_GERACAO,'
      '       A.DT_REFER_BASE,'
      '       B.CD_PESSOA_PATROC,'
      '       C.NO_PESSOA NO_PESSOA_PATROC,'
      '       B.CD_PESSOA_ENTID,'
      '       D.NO_PESSOA NO_PESSOA_ENTID,'
      '       B.CD_PLANO,'
      '       E.NO_PLANO'
      'FROM   FI_VERSAO_BASE A,'
      '       FI_BASE_PLANO_PATRONAL B,'
      '       FI_PESSOA_JURIDICA C,'
      '       FI_PESSOA_JURIDICA D,'
      '       FI_PLANO_PATRONAL E'
      'WHERE  A.CD_VERSAO = B.CD_VERSAO'
      '  AND  B.CD_PESSOA_PATROC = C.CD_PESSOA'
      '  AND  B.CD_PESSOA_ENTID  = D.CD_PESSOA'
      '  AND  B.CD_PESSOA_PATROC = E.CD_PESSOA_PATROC'
      '  AND  B.CD_PESSOA_ENTID  = E.CD_PESSOA_ENTID'
      '  AND  B.CD_PLANO         = E.CD_PLANO'
      '  AND  A.CD_VERSAO        = :CD_VERSAO')
    ValidateWithMask = True
    Left = 205
    Top = 10
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
    object qryVersaoBaseCD_VERSAO: TFloatField
      FieldName = 'CD_VERSAO'
      Origin = '"CM.FI_VERSAO_BASE".CD_VERSAO'
    end
    object qryVersaoBaseDS_VERSAO: TStringField
      FieldName = 'DS_VERSAO'
      Origin = '"CM.FI_VERSAO_BASE".DS_VERSAO'
      Size = 60
    end
    object qryVersaoBaseLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = '"CM.FI_VERSAO_BASE".LOGIN'
    end
    object qryVersaoBaseDT_REFER_BASE: TDateTimeField
      FieldName = 'DT_REFER_BASE'
      Origin = '"CM.FI_VERSAO_BASE".DT_REFER_BASE'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object qryVersaoBaseDT_GERACAO: TDateTimeField
      FieldName = 'DT_GERACAO'
      Origin = '"CM.FI_VERSAO_BASE".DT_GERACAO'
      DisplayFormat = 'dd/mm/yyyy hh:mm:ss'
      EditMask = '!99/99/0000;1;_'
    end
    object qryVersaoBaseCD_PESSOA_PATROC: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
      Origin = '"CM.FI_BASE_PLANO_PATRONAL".CD_PESSOA_PATROC'
    end
    object qryVersaoBaseNO_PESSOA_PATROC: TStringField
      FieldName = 'NO_PESSOA_PATROC'
      Origin = '"CM.FI_PESSOA_JURIDICA".NO_PESSOA'
      Size = 60
    end
    object qryVersaoBaseCD_PESSOA_ENTID: TFloatField
      FieldName = 'CD_PESSOA_ENTID'
      Origin = '"CM.FI_BASE_PLANO_PATRONAL".CD_PESSOA_ENTID'
    end
    object qryVersaoBaseNO_PESSOA_ENTID: TStringField
      FieldName = 'NO_PESSOA_ENTID'
      Origin = '"CM.FI_PESSOA_JURIDICA".NO_PESSOA'
      Size = 60
    end
    object qryVersaoBaseCD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
      Origin = '"CM.FI_BASE_PLANO_PATRONAL".CD_PLANO'
    end
    object qryVersaoBaseNO_PLANO: TStringField
      FieldName = 'NO_PLANO'
      Origin = '"CM.FI_PLANO_PATRONAL".NO_PLANO'
      Size = 60
    end
  end
  object dsVersaoBase: TwwDataSource
    DataSet = qryVersaoBase
    Left = 235
    Top = 10
  end
  object qryLayout: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select CD_ARQUIVO,NO_ARQUIVO from FI_ARQUIVO'
      'where ir_para_exportacao = '#39'S'#39)
    ValidateWithMask = True
    Left = 417
    Top = 325
    object qryLayoutCD_ARQUIVO: TFloatField
      FieldName = 'CD_ARQUIVO'
      Origin = 'FI_ARQUIVO.CD_ARQUIVO'
    end
    object qryLayoutNO_ARQUIVO: TStringField
      FieldName = 'NO_ARQUIVO'
      Origin = 'FI_ARQUIVO.NO_ARQUIVO'
      Size = 60
    end
  end
  object dsLayout: TwwDataSource
    DataSet = qryLayout
    Left = 445
    Top = 325
  end
  object qryGrupoPartic: TwwQuery
    AfterOpen = qryGrupoParticAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT A.CD_GRUPO_PARTIC,'
      '       A.NO_GRUPO_PARTIC'
      '  FROM FI_GRUPO_PARTICIPANTE A, FI_GRUPO_EXPORTACAO B'
      ' WHERE A.CD_GRUPO_PARTIC  = B.CD_GRUPO_PARTIC'
      'ORDER BY 2')
    ValidateWithMask = True
    Left = 434
    Top = 60
    object qryGrupoParticCD_GRUPO_PARTIC: TFloatField
      FieldName = 'CD_GRUPO_PARTIC'
      Origin = '"CM.FI_GRUPO_PARTICIPANTE".CD_GRUPO_PARTIC'
    end
    object qryGrupoParticNO_GRUPO_PARTIC: TStringField
      FieldName = 'NO_GRUPO_PARTIC'
      Origin = '"CM.FI_GRUPO_PARTICIPANTE".NO_GRUPO_PARTIC'
      Size = 60
    end
  end
  object wwDataSource1: TwwDataSource
    DataSet = qryGrupoPartic
    Left = 464
    Top = 60
  end
  object qryGrupoLogico: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM FI_GRUPO_LOGICO'
      'WHERE UPPER(NO_GRUPO) = '#39'PARTICIPANTE'#39
      'ORDER BY NR_ORDEM')
    ValidateWithMask = True
    Left = 275
    Top = 287
    object qryGrupoLogicoCD_GRUPO: TFloatField
      FieldName = 'CD_GRUPO'
      Origin = 'FI_GRUPO_LOGICO.CD_GRUPO'
    end
    object qryGrupoLogicoNO_GRUPO: TStringField
      FieldName = 'NO_GRUPO'
      Origin = 'FI_GRUPO_LOGICO.NO_GRUPO'
      Size = 60
    end
    object qryGrupoLogicoNR_ORDEM: TFloatField
      FieldName = 'NR_ORDEM'
      Origin = 'FI_GRUPO_LOGICO.NR_ORDEM'
    end
  end
  object dsGrupoLogico: TwwDataSource
    DataSet = qryGrupoLogico
    Left = 305
    Top = 287
  end
  object dsGrupoAtributo: TwwDataSource
    DataSet = qryGrupoAtributo
    Left = 375
    Top = 287
  end
  object qryGrupoAtributo: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsGrupoLogico
    SQL.Strings = (
      'SELECT '
      'NO_TABELA || NO_ATRIBUTO_TABELA CHAVE,'
      'NO_TABELA,'
      'NO_ATRIBUTO_TABELA,'
      'DS_ATRIBUTO_TABELA '
      'FROM FI_ATRIBUTO_TABELA'
      'WHERE CD_GRUPO = :CD_GRUPO'
      'ORDER BY NR_ORDEM')
    ValidateWithMask = True
    Left = 345
    Top = 287
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end>
    object qryGrupoAtributoCHAVE: TStringField
      FieldName = 'CHAVE'
      Origin = '"CM.FI_ATRIBUTO_TABELA".NO_TABELA'
      Size = 120
    end
    object qryGrupoAtributoNO_TABELA: TStringField
      FieldName = 'NO_TABELA'
      Origin = '"CM.FI_ATRIBUTO_TABELA".NO_TABELA'
      Size = 60
    end
    object qryGrupoAtributoNO_ATRIBUTO_TABELA: TStringField
      FieldName = 'NO_ATRIBUTO_TABELA'
      Origin = '"CM.FI_ATRIBUTO_TABELA".NO_ATRIBUTO_TABELA'
      Size = 60
    end
    object qryGrupoAtributoDS_ATRIBUTO_TABELA: TStringField
      FieldName = 'DS_ATRIBUTO_TABELA'
      Origin = '"CM.FI_ATRIBUTO_TABELA".DS_ATRIBUTO_TABELA'
      Size = 60
    end
  end
end
