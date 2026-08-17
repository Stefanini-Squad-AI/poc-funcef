inherited frmCadClasse: TfrmCadClasse
  Left = 13
  Top = 99
  HelpContext = 70017
  Caption = 'Cadastro de Classes de Bens'
  ClientHeight = 408
  ClientWidth = 772
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 34
    Width = 503
    Height = 340
    Align = alLeft
    object Label2: TLabel
      Left = 16
      Top = 8
      Width = 40
      Height = 13
      Caption = 'Código'
    end
    object Label4: TLabel
      Left = 139
      Top = 136
      Width = 212
      Height = 13
      Caption = 'Máscara para Identificação Adicional'
    end
    object Bevel2: TBevel
      Left = 360
      Top = 160
      Width = 122
      Height = 2
      Style = bsRaised
    end
    object Bevel3: TBevel
      Left = 16
      Top = 160
      Width = 116
      Height = 2
      Style = bsRaised
    end
    object Label5: TLabel
      Left = 7
      Top = 184
      Width = 101
      Height = 13
      Caption = 'Grupos Contábeis'
    end
    object IncludeBtn: TSpeedButton
      Left = 240
      Top = 220
      Width = 24
      Height = 24
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888006666600
        88888887788888778F88887666666666088888788888888878F887E666666666
        608887F8888F888887F887E666F66666608887888878F888878F7E6666FF6666
        66087F8888778F88887F7E6666FFF66666087F88887778F8887F7E6666FFFF66
        66087F8888777788887F7E6666FFF66666087F8888777888887F7E6666FF6666
        660878F888778888887887E666F66666608887F88878888887F887E666666666
        6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
        8888888778FFFF77888888888777778888888888877777888888}
      NumGlyphs = 2
      OnClick = IncludeBtnClick
    end
    object IncAllBtn: TSpeedButton
      Left = 240
      Top = 244
      Width = 24
      Height = 24
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888006666600
        88888887788888778F88887666666666088888788888888878F887E666666666
        608887F88F888F8887F887E6F666F6666088878878F878F8878F7E66FF66FF66
        66087F88778F778F887F7E66FFF6FFF666087F8877787778F87F7E66FFFFFFFF
        66087F8877777777887F7E66FFF6FFF666087F8877787778887F7E66FF66FF66
        660878F877887788887887E6F666F666608887F87888788887F887E666666666
        6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
        8888888778FFFF77888888888777778888888888877777888888}
      NumGlyphs = 2
      OnClick = IncAllBtnClick
    end
    object ExcludeBtn: TSpeedButton
      Left = 240
      Top = 268
      Width = 24
      Height = 24
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888006666600
        88888887788888778F88887666666666088888788888888878F887E666666666
        608887F888888F8887F887E66666F6666088878888887F88878F7E66666FF666
        66087F8888877F88887F7E6666FFF66666087F8888777F88887F7E666FFFF666
        66087F8887777F88887F7E6666FFF66666087F8888777F88887F7E66666FF666
        660878F888877F88887887E66666F666608887F88888788887F887E666666666
        6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
        8888888778FFFF77888888888777778888888888877777888888}
      NumGlyphs = 2
      OnClick = ExcludeBtnClick
    end
    object ExAllBtn: TSpeedButton
      Left = 240
      Top = 292
      Width = 24
      Height = 24
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888006666600
        88888887788888778F88887666666666088888788888888878F887E666666666
        608887F8888F888F87F887E666F666F660888788887F887F878F7E666FF66FF6
        66087F88877F877F887F7E66FFF6FFF666087F88777F777F887F7E6FFFFFFFF6
        66087F877777777F887F7E66FFF6FFF666087F88777F777F887F7E666FF66FF6
        660878F8877F877F887887E666F666F6608887F88878887887F887E666666666
        6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
        8888888778FFFF77888888888777778888888888877777888888}
      NumGlyphs = 2
      OnClick = ExAllBtnClick
    end
    object Label6: TLabel
      Left = 264
      Top = 184
      Width = 229
      Height = 13
      Caption = 'Grupos Contábeis relacionados a Classe'
    end
    object Label3: TLabel
      Left = 128
      Top = 8
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbeCodigo: TwwDBEdit
      Left = 16
      Top = 24
      Width = 113
      Height = 21
      DataField = 'CODHIERARQ'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dbeCodigoExit
    end
    object pnlAnaSint: TPanel
      Left = 16
      Top = 64
      Width = 470
      Height = 57
      BevelInner = bvLowered
      TabOrder = 2
      object sbtnAnalitico: TSpeedButton
        Left = 288
        Top = 8
        Width = 105
        Height = 41
        GroupIndex = 1
        Caption = '&Analítico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555555555555555555555555555555555555555555555555555555555
          555555555555555555555555555555555555555FFFFFFFFFF555550000000000
          55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
          B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
          000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
          555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
          55555575FFF75555555555700007555555555557777555555555555555555555
          5555555555555555555555555555555555555555555555555555}
        NumGlyphs = 2
        ParentFont = False
      end
      object sbtnSintetico: TSpeedButton
        Left = 64
        Top = 8
        Width = 113
        Height = 41
        GroupIndex = 1
        Caption = '&Sintético'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555555555555555555555555555555555555555555555555555555555
          55555555FFFFFFFFFF5555500000000005555557777777777F55550BFBFBFBFB
          0555557F555555557F55550FBFBFBFBF0555557F555555557F55550BFBFBFBFB
          0555557F555555557F55550FBFBFBFBF0555557F555555557F55550BFBFBFBFB
          0555557F555555557F55550FBFBFBFBF0555557FFFFFFFFF7555550000000000
          555555777777777755555550FBFB0555555555575FFF75555555555700007555
          5555555577775555555555555555555555555555555555555555555555555555
          5555555555555555555555555555555555555555555555555555}
        NumGlyphs = 2
        ParentFont = False
      end
    end
    object dbeDescricao: TwwDBEdit
      Left = 128
      Top = 24
      Width = 358
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeMaskIdOpc: TwwDBEdit
      Left = 139
      Top = 152
      Width = 213
      Height = 21
      DataField = 'MASCARAIDOPCIONAL'
      DataSource = ds
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object SrcList: TListBox
      Left = 5
      Top = 200
      Width = 235
      Height = 135
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ItemHeight = 14
      MultiSelect = True
      ParentFont = False
      Sorted = True
      TabOrder = 4
    end
    object DstList: TListBox
      Left = 263
      Top = 200
      Width = 235
      Height = 135
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ItemHeight = 14
      MultiSelect = True
      ParentFont = False
      Sorted = True
      TabOrder = 5
    end
  end
  inherited Dock972: TDock97
    Width = 772
    Height = 34
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Width = 85
        Height = 28
        Layout = blGlyphLeft
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 85
        Width = 85
        Height = 28
        Layout = blGlyphLeft
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 255
        Width = 85
        Height = 28
        Layout = blGlyphLeft
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 170
        Width = 85
        Height = 28
        Layout = blGlyphLeft
      end
    end
  end
  inherited Dock971: TDock97
    Top = 374
    Width = 772
    Height = 34
    inherited tb97Fundo: TToolbar97
      Left = 586
      DockPos = 586
      inherited sep1: TToolbarSep97
        Left = 85
      end
      inherited sep3: TToolbarSep97
        Left = 173
      end
      inherited bbtnSair: TBitBtn
        Width = 85
        Height = 28
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 88
        Width = 85
        Height = 28
        HelpContext = 70017
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 409
      DockPos = 409
      inherited ToolbarSep971: TToolbarSep97
        Left = 85
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 85
        Height = 28
      end
      inherited bbtnCancelar: TBitBtn
        Left = 88
        Width = 85
        Height = 28
      end
    end
  end
  object pnlArvore: TPanel [3]
    Left = 503
    Top = 34
    Width = 269
    Height = 340
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 3
    Caption = 'pnlArvore'
    TabOrder = 3
    object pnlTitulo: TPanel
      Left = 5
      Top = 5
      Width = 259
      Height = 41
      Align = alTop
      BevelInner = bvLowered
      Caption = 'pnlTitulo'
      Color = clGray
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 231
        Height = 22
        Caption = 'Classes do Ativo Fixo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object treeClasse: TCMTreeView
      Left = 5
      Top = 46
      Width = 259
      Height = 289
      PodeNavegar = True
      DataSource = dsClasse
      CampoChave = qryClasseCODHIERARQ
      CampoDescricao = qryClasseDESCRICAO
      CampoTipo = qryClasseANASINT
      OnClick = treeClasseClick
      OnChange = treeClasseChange
      Align = alClient
    end
  end
  inherited qry: TwwQuery
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      'SELECT IDCLASSEBEM, CODHIERARQ, ANASINT,'
      '       DESCRICAO, MASCARAIDOPCIONAL'
      'FROM CLASSEDEBEM'
      'ORDER BY CODHIERARQ'
      '')
    Left = 536
    Top = 104
    object qryIDCLASSEBEM: TFloatField
      FieldName = 'IDCLASSEBEM'
      Origin = 'CLASSEDEBEM.IDCLASSEBEM'
    end
    object qryCODHIERARQ: TStringField
      FieldName = 'CODHIERARQ'
      Origin = 'CLASSEDEBEM.CODHIERARQ'
      Size = 15
    end
    object qryANASINT: TStringField
      FieldName = 'ANASINT'
      Origin = 'CLASSEDEBEM.ANASINT'
      Size = 1
    end
    object qryDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'CLASSEDEBEM.DESCRICAO'
      Size = 60
    end
    object qryMASCARAIDOPCIONAL: TStringField
      FieldName = 'MASCARAIDOPCIONAL'
      Origin = 'CLASSEDEBEM.MASCARAIDOPCIONAL'
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 187
    Top = 411
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CLASSEDEBEM'
      'set'
      '  CODHIERARQ = :CODHIERARQ,'
      '  ANASINT = :ANASINT,'
      '  DESCRICAO = :DESCRICAO,'
      '  MASCARAIDOPCIONAL = :MASCARAIDOPCIONAL'
      'where'
      '  IDCLASSEBEM = :OLD_IDCLASSEBEM')
    InsertSQL.Strings = (
      'insert into CLASSEDEBEM'
      
        '  (IDCLASSEBEM, CODHIERARQ, ANASINT, DESCRICAO, MASCARAIDOPCIONA' +
        'L)'
      'values'
      '  (:IDCLASSEBEM, :CODHIERARQ, :ANASINT, :DESCRICAO, '
      ':MASCARAIDOPCIONAL)')
    DeleteSQL.Strings = (
      'delete from CLASSEDEBEM'
      'where'
      '  IDCLASSEBEM = :OLD_IDCLASSEBEM')
    Left = 600
    Top = 104
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CLASSEDEBEM.CODHIERARQ'
      'CLASSEDEBEM.DESCRICAO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'CLASSEDEBEM')
    CamposChave.Strings = (
      'CLASSEDEBEM.IDCLASSEBEM')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '15'
      '60')
    Left = 653
    Top = 104
  end
  inherited ds: TwwDataSource
    Left = 568
    Top = 104
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  object qryClasse: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCLASSEBEM,CODHIERARQ,ANASINT,DESCRICAO,IDGRUPO'
      'FROM CLASSEDEBEM'
      'ORDER BY CODHIERARQ'
      '')
    ValidateWithMask = True
    Left = 600
    Top = 217
    object qryClasseIDCLASSEBEM: TFloatField
      FieldName = 'IDCLASSEBEM'
      Origin = '"CM.CLASSEDEBEM".IDCLASSEBEM'
    end
    object qryClasseCODHIERARQ: TStringField
      FieldName = 'CODHIERARQ'
      Origin = '"CM.CLASSEDEBEM".CODHIERARQ'
      Size = 15
    end
    object qryClasseANASINT: TStringField
      FieldName = 'ANASINT'
      Origin = '"CM.CLASSEDEBEM".ANASINT'
      Size = 1
    end
    object qryClasseDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = '"CM.CLASSEDEBEM".DESCRICAO'
      Size = 60
    end
    object qryClasseIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = '"CM.CLASSEDEBEM".IDGRUPO'
    end
  end
  object dsClasse: TwwDataSource
    DataSet = qryClasse
    Left = 656
    Top = 217
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 704
    Top = 103
  end
  object qryGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT G.IDGRUPO, G.CLASSE, G.NOME, G.TIPO'
      'FROM GRUPO G,'
      '     PLANOGRUPO PG'
      'WHERE (G.TIPO = '#39'A'#39')'
      '  AND (PG.IDPESSOA = :IDPESSOA)'
      '  AND (G.IDGRUPO = PG.IDGRUPO)'
      'ORDER BY G.CLASSE'
      '')
    ValidateWithMask = True
    Left = 160
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryGrupoIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'GRUPO.IDGRUPO'
    end
    object qryGrupoCLASSE: TStringField
      FieldName = 'CLASSE'
      Origin = 'GRUPO.CLASSE'
      Size = 15
    end
    object qryGrupoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'GRUPO.NOME'
      Size = 60
    end
    object qryGrupoTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'GRUPO.TIPO'
      Size = 1
    end
  end
  object qryClassexGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CXG.IDCLASSEBEM,'
      '       CXG.IDGRUPO,'
      '       G.NOME AS DESCGRUPO'
      'FROM   CLASSEXGRUPO CXG,'
      '       GRUPO G'
      'WHERE (CXG.IDCLASSEBEM = :PIDCLASSEBEM)'
      '  AND (CXG.IDGRUPO     = G.IDGRUPO)'
      'ORDER BY G.NOME')
    ValidateWithMask = True
    Left = 48
    Top = 256
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCLASSEBEM'
        ParamType = ptUnknown
      end>
    object qryClassexGrupoIDCLASSEBEM: TFloatField
      FieldName = 'IDCLASSEBEM'
      Origin = '"CM.CLASSEXGRUPO".IDCLASSEBEM'
    end
    object qryClassexGrupoIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = '"CM.CLASSEXGRUPO".IDGRUPO'
    end
    object qryClassexGrupoDESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
      Origin = 'GRUPO.NOME'
      Size = 60
    end
  end
  object qryInsClassexGrupo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO CLASSEXGRUPO'
      '  (IDCLASSEBEM, IDGRUPO)'
      'VALUES'
      '  (:PIDCLASSEBEM,:PIDGRUPO)')
    ValidateWithMask = True
    Left = 312
    Top = 256
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCLASSEBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDGRUPO'
        ParamType = ptUnknown
      end>
    object FloatField3: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'GRUPOBEMXCC.IDGRUPO'
    end
    object StringField4: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'GRUPOBEMXCC.CODCENTROCUSTO'
      Size = 10
    end
    object FloatField4: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'GRUPOBEMXCC.IDEMPRESA'
    end
    object StringField5: TStringField
      FieldName = 'DESCGRUPO'
      Origin = 'GRUPO.NOME'
      Size = 60
    end
    object StringField6: TStringField
      FieldName = 'DESCCCUSTO'
      Origin = 'CENTCUST.NOME'
      Size = 30
    end
  end
  object qryRemClassexGrupo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM CLASSEXGRUPO'
      'WHERE (IDCLASSEBEM = :pIDCLASSEBEM)')
    ValidateWithMask = True
    Left = 424
    Top = 256
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIDCLASSEBEM'
        ParamType = ptUnknown
      end>
    object FloatField1: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'GRUPOBEMXCC.IDGRUPO'
    end
    object StringField1: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'GRUPOBEMXCC.CODCENTROCUSTO'
      Size = 10
    end
    object FloatField2: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'GRUPOBEMXCC.IDEMPRESA'
    end
    object StringField2: TStringField
      FieldName = 'DESCGRUPO'
      Origin = 'GRUPO.NOME'
      Size = 60
    end
    object StringField3: TStringField
      FieldName = 'DESCCCUSTO'
      Origin = 'CENTCUST.NOME'
      Size = 30
    end
  end
end
