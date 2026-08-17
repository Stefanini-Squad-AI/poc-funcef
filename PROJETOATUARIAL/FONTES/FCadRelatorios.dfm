inherited FrmCadRelatorios: TFrmCadRelatorios
  Tag = 180
  Left = 64
  Top = 80
  Width = 677
  Height = 498
  BorderStyle = bsSizeable
  Caption = 'Cadastro de Relatórios e Gráficos'
  FormStyle = fsNormal
  Position = poDesigned
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 669
    Height = 385
    Enabled = False
    object Label2: TLabel
      Left = 19
      Top = 13
      Width = 37
      Height = 13
      Caption = 'Nome:'
    end
    object Label3: TLabel
      Left = 19
      Top = 56
      Width = 116
      Height = 13
      Caption = 'Consulta Associada:'
    end
    object Label4: TLabel
      Left = 315
      Top = 57
      Width = 176
      Height = 13
      Caption = 'Sistema a Vincular o Relatório:'
    end
    object Label5: TLabel
      Left = 19
      Top = 100
      Width = 182
      Height = 13
      Caption = 'Grupo de Exibição do Relatório:'
    end
    object Bevel1: TBevel
      Left = 317
      Top = 107
      Width = 164
      Height = 33
      Shape = bsFrame
    end
    object Label1: TLabel
      Left = 20
      Top = 145
      Width = 137
      Height = 13
      Caption = 'Descrição Do Relatório:'
    end
    object BtnConsGrupo: TSpeedButton
      Left = 280
      Top = 116
      Width = 25
      Height = 25
      Hint = 'Procura Grupo'
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000014000000120000000100
        040000000000D800000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777BBBBBBBBB
        BBBBB777000077BBBBBBBBBBBBBBBB7700007BBB777777777777BBB700007BB8
        8000000000008BB700007BB77777777777777BB700007BBB878787870087BBB7
        000077BBBBBBB00BB0BBBB770000777BBBB003B338BBB77700007777770FFF33
        0777777700007787808FFFF308787877000077770378FFF07777777700007780
        37338FF078787877000077037333380777777777000070373333807878787877
        0000737333380777777777770000773333807878787878770000733338077777
        777777770000733380787878787878770000}
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnConsGrupoClick
    end
    object BtnConsSql: TSpeedButton
      Left = 280
      Top = 70
      Width = 25
      Height = 25
      Hint = 'Procura Consultas'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777770000000
        0000777770FF7FFF7FF0777770FF7FFF7FF0777770FF7FFF7FF0777770FF7FFF
        7FF0777770FF7FFF7FF000000088888888800FF7F0CCCCCCCCC00FF7F0000000
        00000FF7FFF7FF0777770FF7FFF7FF0777770FF7FFF7FF077777088888888807
        77770CCCCCCCCC07777700000000000777777777777777777777}
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnConsSqlClick
    end
    object CmbModulo: TwwDBLookupCombo
      Left = 315
      Top = 73
      Width = 289
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEMODULO'#9'50'#9'NOMEMODULO')
      DataField = 'IDMODULO'
      DataSource = ds
      LookupTable = QryModulo
      LookupField = 'IDMODULO'
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object EdtName: TwwDBEdit
      Left = 19
      Top = 29
      Width = 582
      Height = 21
      DataField = 'NAME'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object ChkFiltro: TDBCheckBox
      Left = 334
      Top = 116
      Width = 131
      Height = 17
      Caption = 'Exibe Tela de Filtro'
      DataField = 'FLGFILTROMANUAL'
      DataSource = ds
      TabOrder = 2
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object MemSql: TDBMemo
      Left = 18
      Top = 164
      Width = 586
      Height = 122
      DataField = 'DESCRIPTION'
      DataSource = ds
      ScrollBars = ssVertical
      TabOrder = 3
    end
    object BitBtn1: TBitBtn
      Left = 488
      Top = 101
      Width = 114
      Height = 46
      Caption = '&Desenho'
      TabOrder = 4
      OnClick = BitBtn1Click
      Glyph.Data = {
        1E040000424D1E04000000000000760000002800000030000000270000000100
        040000000000A803000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8777777777777777888888888888888888888880000000000000000000000007
        888888888888888888888880FBFBFBFBFBFBFBFBFBFBFB078888888888888888
        88888880B0BFBFB0BFBFB0BFBFB0BF07888888888888888888888880F0FB0BF0
        FB0BF0FB0BF0FB07888888888888888888888880000000000000000000000008
        88888888888888888888888880EEEEEEEEEEEEE0788888888888888888888888
        8888888880EEEEEEEEEEEE078888888888888888888888888888888880EE0000
        0EEEE07F8F8F8F8888888888888888888888888880EE0870EEEE07F8F8F8F8F8
        88888888888888888888888880EE080EEEE0077F8F8F8F888888888888888888
        8888888880EE00EEEE0770007788888888888888888888888888888880EE0EEE
        E07887F70077888888888888888888888888888880EEEEEE078887FF77077788
        88888888888888888888888880EEEEE08888887FF70088778888888888888888
        8888888880EEEE088888887FF033087778888888888888888888888880EEE088
        88888880F003307778888888888888888888888880EE0888888888880BB03307
        78778888888888888888888880E088888888888880BB03307888888888888888
        888888888008888888888888880BB03308777777787888888888888880888888
        888888888880BB0330F888888877888888888888888888888888888888880BB0
        3308877777777788888888888888888888888888888880BB0330888777777777
        8888888888888888888888888888880BB0330888877777777888888888888888
        8888888888888880BB0330888880000008888888888888888888888888888888
        0BB03308888880008888888888888888888888888888888880BB006088888888
        88888888888888888888888888888888880B0E00088888888888888888888888
        88888888888888888880E0870088888888888888888888888888888888888888
        88880F887088888888888888888888888888888888888888888880F808888888
        8888888888888888888888888888888888888800888888888888888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8888}
    end
    object DbTemplate: TDBMemo
      Left = 18
      Top = 164
      Width = 585
      Height = 157
      DataField = 'TEMPLATE'
      DataSource = ds
      ScrollBars = ssVertical
      TabOrder = 5
      Visible = False
    end
    object EdtSql: TEdit
      Left = 19
      Top = 73
      Width = 260
      Height = 21
      ReadOnly = True
      TabOrder = 6
    end
    object EdtGrupo: TEdit
      Left = 19
      Top = 118
      Width = 260
      Height = 21
      ReadOnly = True
      TabOrder = 7
    end
  end
  inherited Dock972: TDock97
    Width = 669
  end
  inherited Dock971: TDock97
    Top = 432
    Width = 669
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
      end
      inherited bbtnCancelar: TBitBtn
        ModalResult = 0
      end
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      
        '  NAME, IDREPORTS, ORIGEMCM, IDGRUPORELATORIO, IDDATAVIEW, IDMOD' +
        'ULO, DESCRIPTION, FLGFILTROMANUAL, TEMPLATE, ORIGEMCMGR, ORIGEMC' +
        'MDV'
      'FROM'
      '  CM.REPORTS'
      'WHERE'
      '   (IDREPORTS = :PIDREPORTS) AND'
      '   (ORIGEMCM  = :PORIGEMCM)')
    Left = 311
    Top = 5
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDREPORTS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PORIGEMCM'
        ParamType = ptUnknown
      end>
    object qryNAME: TStringField
      FieldName = 'NAME'
      Origin = 'REPORTS.NAME'
      Size = 100
    end
    object qryIDREPORTS: TFloatField
      FieldName = 'IDREPORTS'
      Origin = 'REPORTS.IDREPORTS'
    end
    object qryORIGEMCM: TFloatField
      FieldName = 'ORIGEMCM'
      Origin = 'REPORTS.ORIGEMCM'
    end
    object qryIDGRUPORELATORIO: TFloatField
      FieldName = 'IDGRUPORELATORIO'
      Origin = 'REPORTS.IDGRUPORELATORIO'
    end
    object qryIDDATAVIEW: TFloatField
      FieldName = 'IDDATAVIEW'
      Origin = 'REPORTS.IDDATAVIEW'
    end
    object qryIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Origin = 'REPORTS.IDMODULO'
    end
    object qryDESCRIPTION: TMemoField
      FieldName = 'DESCRIPTION'
      Origin = 'REPORTS.DESCRIPTION'
      BlobType = ftMemo
      Size = 500
    end
    object qryFLGFILTROMANUAL: TStringField
      FieldName = 'FLGFILTROMANUAL'
      Origin = 'REPORTS.FLGFILTROMANUAL'
      Size = 1
    end
    object qryTEMPLATE: TBlobField
      FieldName = 'TEMPLATE'
      Origin = 'REPORTS.TEMPLATE'
      BlobType = ftBlob
      Size = 1
    end
    object qryORIGEMCMGR: TFloatField
      FieldName = 'ORIGEMCMGR'
      Origin = 'REPORTS.ORIGEMCMGR'
    end
    object qryORIGEMCMDV: TFloatField
      FieldName = 'ORIGEMCMDV'
      Origin = 'REPORTS.ORIGEMCMDV'
    end
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.REPORTS'
      'set'
      '  NAME = :NAME,'
      '  IDREPORTS = :IDREPORTS,'
      '  ORIGEMCM = :ORIGEMCM,'
      '  IDGRUPORELATORIO = :IDGRUPORELATORIO,'
      '  IDDATAVIEW = :IDDATAVIEW,'
      '  IDMODULO = :IDMODULO,'
      '  FLGFILTROMANUAL = :FLGFILTROMANUAL,'
      '  ORIGEMCMGR = :ORIGEMCMGR,'
      '  ORIGEMCMDV = :ORIGEMCMDV'
      'where'
      '  IDREPORTS = :OLD_IDREPORTS and'
      '  ORIGEMCM = :OLD_ORIGEMCM')
    InsertSQL.Strings = (
      'insert into CM.REPORTS'
      
        '  (NAME, IDREPORTS, ORIGEMCM, IDGRUPORELATORIO, IDDATAVIEW, IDMO' +
        'DULO, FLGFILTROMANUAL, '
      '   ORIGEMCMGR, ORIGEMCMDV)'
      'values'
      
        '  (:NAME, :IDREPORTS, :ORIGEMCM, :IDGRUPORELATORIO, :IDDATAVIEW,' +
        ' :IDMODULO, '
      '   :FLGFILTROMANUAL, :ORIGEMCMGR, :ORIGEMCMDV)')
    DeleteSQL.Strings = (
      'delete from CM.REPORTS'
      'where'
      '  IDREPORTS = :OLD_IDREPORTS and'
      '  ORIGEMCM = :OLD_ORIGEMCM')
    Top = 5
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'REPORTS.NAME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome do Relatório')
    Tabelas.Strings = (
      'REPORTS'
      'DATAVIEW')
    CamposChave.Strings = (
      'REPORTS.IDREPORTS'
      'REPORTS.ORIGEMCM')
    Filtro.Strings = (
      'REPORTS.IDDATAVIEW = DATAVIEW.IDDATAVIEW'
      'REPORTS.ORIGEMCMDV = DATAVIEW.ORIGEMCMDV'
      'REPORTS.IDMODULO = 40'
      'REPORTS.IDGRUPORELATORIO = 72 '
      'DATAVIEW.CLASSDESCRIPTION = '#39'Atuarial'#39)
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '50')
    Left = 389
    Top = 5
  end
  inherited ds: TwwDataSource
    OnDataChange = dsDataChange
    Left = 350
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  object QryModulo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDMODULO, NOMEMODULO FROM MODULO'
      'WHERE IDMODULO = 40')
    ValidateWithMask = True
    Left = 486
    Top = 26
    object QryModuloIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Origin = 'MODULO.IDMODULO'
    end
    object QryModuloNOMEMODULO: TStringField
      FieldName = 'NOMEMODULO'
      Origin = 'MODULO.NOMEMODULO'
      Size = 50
    end
  end
  object DsgnCM: TppDesigner
    Caption = 'Gerdor de Relatórios e Gráficos'
    MergeMenu = MergeMenu
    Icon.Data = {
      0000010001002020100000000000E80200001600000028000000200000004000
      0000010004000000000080020000000000000000000000000000000000000000
      000000008000008000000080800080000000800080008080000080808000C0C0
      C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
      0000000000033333300003333330000000000000003BBBBBB3003BBBBBB30000
      00000000003BBBBBB3003BBBBBB30000000000000003BBBB3003BBBBBB300000
      000000000003BBBB3003BBBBB3000000000000000003BBBB3003BBBB30000000
      000000000003BBBBB33BBBBB30000000000000000003BBBBBBBBBBB300000000
      000000000003BBBBBBBBBBB300000000000000700003BBBB333BBBBB30000000
      000000800003BBBB3003BBBBB30000000000F8F00003BBBB3003BBBBB3000000
      008F8F800003BBBB3003BBBBB3000070F8F877F80003BBBB333BBBBBB300007F
      8F00F08F003BBBBBBBBBBBBB3000007800FFF048003BBBBBBBBBBBB300000000
      FFFFF08F8003333333333330000070FFFFCCF804F07000000000000000007FFF
      CCFFFF0F8F0000000000000000007FCCFFFCCF074807000000000000000078FF
      FCCFFFF08F80700000000000000007FCCFFFCCF044F8070000000000000007FF
      FFCCFFFF0F8F8000000000000000078FCCFFFCCF07F77000000000000000007F
      FFFCCFFFF07000000000000000000078FCCFFFCCFF0700000000000000000007
      FFFFCCFFFF80000000000000000000078FCCFFFF877000000000000000000000
      7FFFFF8770000000000000000000000007FF8770000000000000000000000000
      007770000000000000000000000000000000000000000000000000000000FFFE
      0781FFFC0300FFFC0300FFFE0601FFFE0603FFFE0607FFFE0007FFFE000FFFFE
      000FFFDE0007FF0E0603FC0E0603F00E0603C0060003C0040007C004000FC002
      001F0001FFFF0001FFFF0000FFFF00007FFF80003FFF80003FFF80007FFFC001
      FFFFC000FFFFE000FFFFE001FFFFF007FFFFF81FFFFFFC7FFFFFFFFFFFFF}
    Position = poScreenCenter
    ShowComponents = [scLabel, scMemo, scRichText, scCalc, scImage, scShape, scLine, scBarCode, scTeeChart, scDBText, scDBMemo, scDBRichText, scDBCalc, scDBImage, scDBBarCode, scDBTeeChart, scRegion]
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.SQLType = sqBDELocal
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 456
    Top = 231
  end
  object ppConsulta: TppBDEPipeline
    DataSource = DsConsulta
    CloseDataSource = True
    UserName = 'Consulta'
    Left = 336
    Top = 231
  end
  object ppRelatorio: TppBDEPipeline
    DataSource = ds
    UserName = 'Relatorio'
    Left = 402
    Top = 231
  end
  object DsConsulta: TwwDataSource
    DataSet = QrySql
    Left = 271
    Top = 231
  end
  object MergeMenu: TMainMenu
    Left = 539
    Top = 232
    object mniFile: TMenuItem
      Caption = '&Arquivo'
      GroupIndex = 10
      object mniFileSave: TMenuItem
        Caption = '&Salvar'
        ShortCut = 16467
        OnClick = mniFileSaveClick
      end
      object mniFileLine3: TMenuItem
        Caption = '-'
      end
      object mniFilePageSetup: TMenuItem
        Caption = 'Configurar &Página'
        OnClick = mniFilePageSetupClick
      end
      object mniFilePrintToFileSetup: TMenuItem
        Caption = 'Configuração da Impressão Para &Arquivo'
        OnClick = mniFilePrintToFileSetupClick
      end
      object mniFileLine4: TMenuItem
        Caption = '-'
      end
      object mniFilePrint: TMenuItem
        Caption = '&Imprimir'
        ShortCut = 16464
        OnClick = mniFilePrintClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Sair1: TMenuItem
        Caption = 'Sair'
        OnClick = Sair1Click
      end
    end
    object MnuRlatorio: TMenuItem
      Caption = '&Rlatório'
      GroupIndex = 60
      Visible = False
      object MnuTitulo: TMenuItem
        Caption = '&Título'
      end
      object MnuSumario: TMenuItem
        Caption = '&Sumário'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object MnuCabecalho: TMenuItem
        Caption = '&Cabeçalho'
      end
      object MnuRodape: TMenuItem
        Caption = '&Rodapé'
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object MnuGrupos: TMenuItem
        Caption = '&Grupos'
        ShortCut = 16455
      end
      object MnuLInha: TMenuItem
        Caption = '-'
        ShortCut = 189
      end
      object MnuRetrato: TMenuItem
        Caption = '&Retrato'
      end
      object MnuPaisagem: TMenuItem
        Caption = '&Paisagem'
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object MnuUnidades: TMenuItem
        Caption = '&Unidades'
        object MnuPixelsTela: TMenuItem
          Caption = 'Pixels de &Tela'
        end
        object MnuPixelsImpressora: TMenuItem
          Caption = 'Pixels de &Impressora'
        end
        object MnuPolegada: TMenuItem
          Caption = '&Polegada'
        end
        object MnuMilimetros: TMenuItem
          Caption = '&Milímetros'
        end
        object MnuMMilimetros: TMenuItem
          Caption = '&Milhares de Milímetros'
        end
      end
    end
  end
  object QrySql: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 212
    Top = 231
  end
  object MsConsulta: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'DATAVIEW.NAME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Consulta')
    Tabelas.Strings = (
      'DATAVIEW')
    CamposChave.Strings = (
      'DATAVIEW.IDDATAVIEW'
      'DATAVIEW.ORIGEMCMDV'
      'DATAVIEW.NAME')
    Filtro.Strings = (
      'UPPER(DATAVIEW.CLASSDESCRIPTION) = UPPER('#39'ATUARIAL'#39')')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '50')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 202
    Top = 98
  end
  object MsGrupo: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'GRUPORELATORIO.DESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Grupo')
    Tabelas.Strings = (
      'GRUPORELATORIO')
    CamposChave.Strings = (
      'GRUPORELATORIO.IDGRUPORELATORIO'
      'GRUPORELATORIO.ORIGEMCMGR'
      'GRUPORELATORIO.DESCRICAO')
    Filtro.Strings = (
      'GRUPORELATORIO.IDGRUPORELATORIO = 72')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 202
    Top = 154
  end
  object qryReports: TwwQuery
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT '
      '   REPORTS.NAME,'
      '   REPORTS.IDREPORTS,'
      '   REPORTS.ORIGEMCM,'
      '   REPORTS.IDGRUPORELATORIO,'
      '   REPORTS.IDMODULO,'
      '   REPORTS.ORIGEMCMGR,'
      '   REPORTS.DESCRIPTION,'
      '   REPORTS.TEMPLATE,'
      '   REPORTS.IDDATAVIEW,'
      '   REPORTS.ORIGEMCMDV,'
      '   REPORTS.FLGFILTROMANUAL,'
      '   REPORTS.FORMEVENTOS,'
      '   REPORTS.FORMPARAMREL,'
      '   REPORTS.PPREPORT'
      'FROM'
      '  CM.REPORTS'
      'WHERE'
      '   (REPORTS.IDREPORTS = :PIDREPORTS) AND'
      '   (REPORTS.ORIGEMCM  = :PORIGEMCM)')
    UpdateMode = upWhereKeyOnly
    ValidateWithMask = True
    Left = 133
    Top = 230
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDREPORTS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PORIGEMCM'
        ParamType = ptUnknown
      end>
  end
end
