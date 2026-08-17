inherited frmCadGrupos: TfrmCadGrupos
  Left = 12
  Top = 113
  HelpContext = 70016
  Caption = 'Cadastro de Grupos Contábeis'
  ClientHeight = 415
  ClientWidth = 773
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 34
    Width = 517
    Height = 347
    Align = alLeft
    object Label1: TLabel
      Left = 16
      Top = 12
      Width = 44
      Height = 13
      Caption = 'Código '
    end
    object Label2: TLabel
      Left = 128
      Top = 12
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object Label5: TLabel
      Left = 13
      Top = 117
      Width = 169
      Height = 13
      Caption = 'Centros de Custo Disponíveis'
    end
    object IncludeBtn: TSpeedButton
      Left = 248
      Top = 134
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
      Left = 248
      Top = 158
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
      Left = 248
      Top = 182
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
      Left = 248
      Top = 206
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
      Left = 271
      Top = 117
      Width = 230
      Height = 13
      Caption = 'Centros de Custo relacionados ao Grupo'
    end
    object dbedCod: TwwDBEdit
      Left = 16
      Top = 28
      Width = 110
      Height = 21
      DataField = 'CLASSE'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dbedCodExit
    end
    object dbeDescricao: TwwDBEdit
      Left = 128
      Top = 28
      Width = 373
      Height = 21
      DataField = 'NOME'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object pnlAnaSint: TPanel
      Left = 16
      Top = 59
      Width = 486
      Height = 52
      BevelInner = bvLowered
      TabOrder = 2
      object sbtnAnalitico: TSpeedButton
        Left = 285
        Top = 9
        Width = 130
        Height = 34
        GroupIndex = 1
        Caption = '&Analítico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
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
        Left = 70
        Top = 9
        Width = 130
        Height = 34
        GroupIndex = 1
        Caption = '&Sintético'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
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
    object qrpParametros: TGroupBox
      Left = 16
      Top = 236
      Width = 486
      Height = 100
      TabOrder = 5
      object Label3: TLabel
        Left = 73
        Top = 13
        Width = 73
        Height = 13
        Caption = 'Depreciação'
      end
      object Label7: TLabel
        Left = 145
        Top = 32
        Width = 29
        Height = 13
        Caption = '% a.a.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dbedaprec: TDBRealEdit
        Left = 73
        Top = 29
        Width = 70
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '     10,00')
        TabOrder = 0
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'DEPRECIACAO'
        DataSource = ds
      end
      object rdgrpstatus: TDBRadioGroup
        Left = 12
        Top = 52
        Width = 221
        Height = 40
        Caption = ' Status '
        Columns = 2
        DataField = 'STATUS'
        DataSource = ds
        Items.Strings = (
          '&Ativo'
          '&Inativo')
        TabOrder = 2
        Values.Strings = (
          'A'
          'I')
      end
      object rdgrpControle: TDBRadioGroup
        Left = 240
        Top = 8
        Width = 236
        Height = 40
        Caption = ' Grupo do Sistema '
        Columns = 2
        DataField = 'FLGIMOVEL'
        DataSource = ds
        Items.Strings = (
          'Ativo Fixo'
          'Imobiliário')
        TabOrder = 1
        Values.Strings = (
          '0'
          '1')
      end
      object GroupBox1: TGroupBox
        Left = 240
        Top = 52
        Width = 236
        Height = 40
        TabOrder = 3
        object dbckbSemPlaca: TDBCheckBox
          Left = 22
          Top = 16
          Width = 174
          Height = 17
          Caption = 'Placa Patrimonial Opcional'
          DataField = 'FLGSEMPLACA'
          DataSource = ds
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
    end
    object SrcList: TListBox
      Left = 13
      Top = 133
      Width = 235
      Height = 97
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ItemHeight = 14
      MultiSelect = True
      ParentFont = False
      Sorted = True
      TabOrder = 3
    end
    object DstList: TListBox
      Left = 271
      Top = 133
      Width = 235
      Height = 97
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ItemHeight = 14
      MultiSelect = True
      ParentFont = False
      Sorted = True
      TabOrder = 4
    end
  end
  inherited Dock972: TDock97
    Width = 773
    Height = 34
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Width = 85
        Height = 28
        Layout = blGlyphLeft
        Spacing = 4
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 85
        Width = 85
        Height = 28
        Layout = blGlyphLeft
        Spacing = 4
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 255
        Width = 85
        Height = 28
        Layout = blGlyphLeft
        Spacing = 4
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 170
        Width = 85
        Height = 28
        Layout = blGlyphLeft
        Spacing = 4
      end
    end
  end
  inherited Dock971: TDock97
    Top = 381
    Width = 773
    Height = 34
    inherited tb97Fundo: TToolbar97
      Left = 593
      DockPos = 593
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
        HelpContext = 70016
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 416
      DockPos = 416
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
    Left = 517
    Top = 34
    Width = 256
    Height = 347
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 3
    TabOrder = 3
    object pnlTitulo: TPanel
      Left = 5
      Top = 5
      Width = 246
      Height = 34
      Align = alTop
      BevelInner = bvLowered
      Caption = 'pnlTitulo'
      Color = clGray
      TabOrder = 0
      object Label4: TLabel
        Left = 36
        Top = 6
        Width = 176
        Height = 22
        Caption = 'Grupos Contábeis'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object treeGrupos: TCMTreeView
      Left = 5
      Top = 39
      Width = 246
      Height = 303
      PodeNavegar = True
      DataSource = dsGrupos
      CampoChave = qryGruposCLASSE
      CampoDescricao = qryGruposNOME
      CampoTipo = qryGruposTIPO
      OnClick = treeGruposClick
      OnChange = treeGruposChange
      Align = alClient
    end
  end
  inherited qry: TwwQuery
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      
        'SELECT IDGRUPO,CLASSE,NOME,TIPO,STATUS,DEPRECIACAO,DATAULTDEP,FL' +
        'GIMOVEL,FLGSEMPLACA'
      'FROM GRUPO')
    Left = 400
    Top = 0
    object qryIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'GRUPO.IDGRUPO'
    end
    object qryCLASSE: TStringField
      FieldName = 'CLASSE'
      Origin = 'GRUPO.CLASSE'
      Size = 15
    end
    object qryNOME: TStringField
      FieldName = 'NOME'
      Origin = 'GRUPO.NOME'
      Size = 60
    end
    object qryTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'GRUPO.TIPO'
      Size = 1
    end
    object qrySTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'GRUPO.STATUS'
      Size = 1
    end
    object qryDEPRECIACAO: TFloatField
      FieldName = 'DEPRECIACAO'
      Origin = 'GRUPO.DEPRECIACAO'
    end
    object qryDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
      Origin = 'GRUPO.DATAULTDEP'
    end
    object qryFLGIMOVEL: TFloatField
      FieldName = 'FLGIMOVEL'
      Origin = 'GRUPO.FLGIMOVEL'
    end
    object qryFLGSEMPLACA: TFloatField
      FieldName = 'FLGSEMPLACA'
      Origin = 'GRUPO.FLGSEMPLACA'
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 755
    Top = 467
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update GRUPO'
      'set'
      '  CLASSE = :CLASSE,'
      '  NOME = :NOME,'
      '  TIPO = :TIPO,'
      '  STATUS = :STATUS,'
      '  DEPRECIACAO = :DEPRECIACAO,'
      '  DATAULTDEP = :DATAULTDEP,'
      '  FLGIMOVEL = :FLGIMOVEL,'
      '  FLGSEMPLACA = :FLGSEMPLACA'
      'where'
      '  IDGRUPO = :OLD_IDGRUPO')
    InsertSQL.Strings = (
      'insert into GRUPO'
      
        '  (IDGRUPO, CLASSE, NOME, TIPO, STATUS, DEPRECIACAO, DATAULTDEP,' +
        ' FLGIMOVEL, '
      '   FLGSEMPLACA)'
      'values'
      
        '  (:IDGRUPO, :CLASSE, :NOME, :TIPO, :STATUS, :DEPRECIACAO, :DATA' +
        'ULTDEP, '
      '   :FLGIMOVEL, :FLGSEMPLACA)')
    DeleteSQL.Strings = (
      'delete from GRUPO'
      'where'
      '  IDGRUPO = :OLD_IDGRUPO')
    Left = 432
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'GRUPO.CLASSE'
      'GRUPO.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código de Grupo'
      'Nome do Grupo')
    Tabelas.Strings = (
      'GRUPO')
    CamposChave.Strings = (
      'GRUPO.IDGRUPO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '20'
      '30')
    Left = 565
    Top = 0
  end
  inherited ds: TwwDataSource
    Left = 464
    Top = 0
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  object updGrupoEmpresa: TUpdateSQL
    ModifySQL.Strings = (
      'update PLANOGRUPO'
      'set'
      '  IDGRUPO = :IDGRUPO,'
      '  IDPESSOA = :IDPESSOA'
      'where'
      '  IDGRUPO = :OLD_IDGRUPO and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PLANOGRUPO'
      '  (IDGRUPO, IDPESSOA)'
      'values'
      '  (:IDGRUPO, :IDPESSOA)')
    DeleteSQL.Strings = (
      'delete from PLANOGRUPO'
      'where'
      '  IDGRUPO = :OLD_IDGRUPO and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 40
    Top = 464
  end
  object qryGrupoEmpresa: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDGRUPO,IDPESSOA'
      'FROM   PLANOGRUPO'
      'WHERE  (IDPESSOA = :PIDPESSOA)'
      '  AND  (IDGRUPO  = :PIDGRUPO)'
      '')
    UpdateObject = updGrupoEmpresa
    ValidateWithMask = True
    Left = 40
    Top = 416
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDGRUPO'
        ParamType = ptUnknown
      end>
    object qryGrupoEmpresaIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = '"CM.PLANOGRUPO".IDGRUPO'
    end
    object qryGrupoEmpresaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = '"CM.PLANOGRUPO".IDPESSOA'
    end
  end
  object qryAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 128
    Top = 464
  end
  object qryMoeda: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MOECODIGO,MOEDESC'
      'FROM MOEDA'
      'ORDER BY MOECODIGO'
      '')
    ValidateWithMask = True
    Left = 200
    Top = 416
    object qryMoedaMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryMoedaMOEDESC: TStringField
      FieldName = 'MOEDESC'
    end
  end
  object qryGrupos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT G.IDGRUPO,G.CLASSE,G.NOME,G.TIPO,G.STATUS,G.DEPRECIACAO,'
      '       G.DATAULTDEP,G.FLGIMOVEL,PG.IDPESSOA'
      'FROM   GRUPO G,'
      '       PLANOGRUPO PG'
      'WHERE (PG.IDPESSOA = :IDPESSOA)'
      '  AND (G.IDGRUPO = PG.IDGRUPO)       '
      'ORDER BY G.CLASSE'
      '')
    ValidateWithMask = True
    Left = 625
    Top = 239
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryGruposIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'BASEDADOS.GRUPO.IDGRUPO'
    end
    object qryGruposCLASSE: TStringField
      FieldName = 'CLASSE'
      Origin = 'BASEDADOS.GRUPO.CLASSE'
      FixedChar = True
      Size = 15
    end
    object qryGruposNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.GRUPO.NOME'
      Size = 60
    end
    object qryGruposTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'BASEDADOS.GRUPO.TIPO'
      FixedChar = True
      Size = 1
    end
    object qryGruposSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'BASEDADOS.GRUPO.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryGruposDEPRECIACAO: TFloatField
      FieldName = 'DEPRECIACAO'
      Origin = 'BASEDADOS.GRUPO.DEPRECIACAO'
    end
    object qryGruposDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
      Origin = 'BASEDADOS.GRUPO.DATAULTDEP'
    end
    object qryGruposFLGIMOVEL: TFloatField
      FieldName = 'FLGIMOVEL'
      Origin = 'BASEDADOS.GRUPO.FLGIMOVEL'
    end
    object qryGruposIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PLANOGRUPO.IDPESSOA'
    end
  end
  object dsGrupos: TwwDataSource
    AutoEdit = False
    DataSet = qryGrupos
    Left = 689
    Top = 239
  end
  object qryGrupoBem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT COUNT(IDGRUPO) AS BENSNOGRUPO'
      'FROM BEM'
      'WHERE (IDGRUPO = :PIDGRUPO)')
    ValidateWithMask = True
    Left = 128
    Top = 416
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDGRUPO'
        ParamType = ptUnknown
      end>
    object qryGrupoBemBENSNOGRUPO: TFloatField
      FieldName = 'BENSNOGRUPO'
      Origin = '"CM.BEM".IDGRUPO'
    end
  end
  object qryCentroCusto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDEMPRESA, CODCENTROCUSTO, NOME, STATUSGRUPOCDC'
      'FROM CENTCUST'
      'WHERE (IDEMPRESA = :PIDEMPRESA)'
      '  AND (STATUSGRUPOCDC = '#39'A'#39')'
      '  AND (ATIVO = '#39'S'#39')'
      'ORDER BY CODCENTROCUSTO'
      '')
    ValidateWithMask = True
    Left = 40
    Top = 176
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDEMPRESA'
        ParamType = ptUnknown
      end>
    object qryCentroCustoCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'CENTCUST.CODCENTROCUSTO'
      Size = 10
    end
    object qryCentroCustoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'CENTCUST.NOME'
      Size = 30
    end
    object qryCentroCustoSTATUSGRUPOCDC: TStringField
      FieldName = 'STATUSGRUPOCDC'
      Origin = 'CENTCUST.STATUSGRUPOCDC'
      Size = 1
    end
    object qryCentroCustoIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'CENTCUST.IDEMPRESA'
    end
  end
  object qryGrupoxCC: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT GCC.IDGRUPO,'
      '       GCC.CODCENTROCUSTO,'
      '       GCC.IDEMPRESA,'
      '       G.NOME  AS DESCGRUPO,'
      '       CC.NOME AS DESCCCUSTO'
      'FROM   GRUPOBEMXCC GCC,'
      '       GRUPO G,'
      '       CENTCUST CC'
      'WHERE (GCC.IDGRUPO        = :PIDGRUPO)'
      '  AND (GCC.IDGRUPO        = G.IDGRUPO)'
      '  AND (GCC.CODCENTROCUSTO = CC.CODCENTROCUSTO)'
      '  AND (GCC.IDEMPRESA      = CC.IDEMPRESA)'
      'ORDER BY CC.NOME')
    ValidateWithMask = True
    Left = 184
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDGRUPO'
        ParamType = ptUnknown
      end>
    object qryGrupoxCCIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'GRUPOBEMXCC.IDGRUPO'
    end
    object qryGrupoxCCCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'GRUPOBEMXCC.CODCENTROCUSTO'
      Size = 10
    end
    object qryGrupoxCCIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'GRUPOBEMXCC.IDEMPRESA'
    end
    object qryGrupoxCCDESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
      Origin = 'GRUPO.NOME'
      Size = 60
    end
    object qryGrupoxCCDESCCCUSTO: TStringField
      FieldName = 'DESCCCUSTO'
      Origin = 'CENTCUST.NOME'
      Size = 30
    end
  end
  object qryInsGrupoxCC: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO GRUPOBEMXCC'
      '  (IDGRUPO, CODCENTROCUSTO, IDEMPRESA)'
      'VALUES'
      '  (:PIDGRUPO, :PCODCENTROCUSTO, :PIDEMPRESA)')
    ValidateWithMask = True
    Left = 309
    Top = 178
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCODCENTROCUSTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDEMPRESA'
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
  object qryRemGrupoxCC: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM GRUPOBEMXCC'
      'WHERE (IDGRUPO = :pIDGRUPO)')
    ValidateWithMask = True
    Left = 437
    Top = 178
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDGRUPO'
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
