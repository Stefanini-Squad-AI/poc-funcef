inherited FrmCadParam: TFrmCadParam
  Left = 358
  Top = 147
  Caption = 'Parâmetros do Sistema'
  ClientHeight = 362
  ClientWidth = 521
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 521
    Height = 276
    object PgParam: TPageControl
      Left = 5
      Top = 5
      Width = 511
      Height = 266
      ActivePage = TbsGeral
      Align = alClient
      TabOrder = 0
      object TbsGeral: TTabSheet
        Caption = 'Geral'
        object LblDirArq: TLabel
          Left = 7
          Top = 1
          Width = 169
          Height = 13
          Caption = 'Diretório Arquivo de Interface'
        end
        object LblDirLog: TLabel
          Left = 7
          Top = 45
          Width = 195
          Height = 13
          Caption = 'Diretório Arquivo de Log\Histórico'
        end
        object LblIntOper: TLabel
          Left = 7
          Top = 90
          Width = 225
          Height = 13
          Caption = 'Intervalo entre Operações ( Segundos )'
        end
        object LblTipoDocP: TLabel
          Left = 7
          Top = 139
          Width = 160
          Height = 13
          Caption = 'Tipo de Documento a Pagar'
        end
        object LblTipoDocR: TLabel
          Left = 7
          Top = 187
          Width = 175
          Height = 13
          Caption = 'Tipo de Documento a Receber'
        end
        object BtnDirArqLog: TSpeedButton
          Tag = 1
          Left = 468
          Top = 60
          Width = 25
          Height = 25
          Hint = 'Seleciona Diretório do Arquivo de Log e Histórico'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            55555555FFFFFFFFFF55555000000000055555577777777775F55500B8B8B8B8
            B05555775F555555575F550F0B8B8B8B8B05557F75F555555575550BF0B8B8B8
            B8B0557F575FFFFFFFF7550FBF0000000000557F557777777777500BFBFBFBFB
            0555577F555555557F550B0FBFBFBFBF05557F7F555555FF75550F0BFBFBF000
            55557F75F555577755550BF0BFBF0B0555557F575FFF757F55550FB700007F05
            55557F557777557F55550BFBFBFBFB0555557F555555557F55550FBFBFBFBF05
            55557FFFFFFFFF7555550000000000555555777777777755555550FBFB055555
            5555575FFF755555555557000075555555555577775555555555}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = BtnDirArqIntClick
        end
        object BtnDirArqInt: TSpeedButton
          Left = 468
          Top = 14
          Width = 25
          Height = 25
          Hint = 'Seleciona Diretório do Arquivo de Integração'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            55555555FFFFFFFFFF55555000000000055555577777777775F55500B8B8B8B8
            B05555775F555555575F550F0B8B8B8B8B05557F75F555555575550BF0B8B8B8
            B8B0557F575FFFFFFFF7550FBF0000000000557F557777777777500BFBFBFBFB
            0555577F555555557F550B0FBFBFBFBF05557F7F555555FF75550F0BFBFBF000
            55557F75F555577755550BF0BFBF0B0555557F575FFF757F55550FB700007F05
            55557F557777557F55550BFBFBFBFB0555557F555555557F55550FBFBFBFBF05
            55557FFFFFFFFF7555550000000000555555777777777755555550FBFB055555
            5555575FFF755555555557000075555555555577775555555555}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = BtnDirArqIntClick
        end
        object LblNumDoc: TLabel
          Left = 247
          Top = 90
          Width = 210
          Height = 13
          Caption = 'Complemento Para Nº de Documento'
        end
        object Label1: TLabel
          Left = 254
          Top = 139
          Width = 87
          Height = 13
          Caption = 'Tipo de Cliente'
        end
        object Label2: TLabel
          Left = 254
          Top = 187
          Width = 119
          Height = 13
          Caption = 'Ramo de Fornecedor'
        end
        object CMDBLookupCombo1: TCMDBLookupCombo
          Left = 7
          Top = 158
          Width = 241
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'Descrição'
            'DEBCRE'#9'1'#9'D/C')
          DataField = 'CODTIPDOCP'
          DataSource = ds
          LookupTable = DtmIntegraSaf.QryTipoDocP
          LookupField = 'CODTIPDOC'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          OrderByDisplay = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object CMDBLookupCombo2: TCMDBLookupCombo
          Left = 7
          Top = 206
          Width = 241
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'Descrição'
            'DEBCRE'#9'1'#9'D/C')
          DataField = 'CODTIPDOCR'
          DataSource = ds
          LookupTable = DtmIntegraSaf.QryTipoDocR
          LookupField = 'CODTIPDOC'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          OrderByDisplay = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object wwDBSpinEdit1: TwwDBSpinEdit
          Left = 7
          Top = 106
          Width = 81
          Height = 21
          Increment = 1
          MaxValue = 999
          MinValue = 1
          Value = 1
          DataField = 'INTOPER'
          DataSource = ds
          TabOrder = 2
          UnboundDataType = wwDefault
        end
        object wwDBEdit1: TwwDBEdit
          Left = 7
          Top = 17
          Width = 457
          Height = 21
          Color = clSilver
          DataField = 'DIRARQUIVO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit2: TwwDBEdit
          Left = 7
          Top = 61
          Width = 457
          Height = 21
          Color = clSilver
          DataField = 'DIRLOG'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit3: TwwDBEdit
          Left = 249
          Top = 106
          Width = 76
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COMPLDOCUMENTO'
          DataSource = ds
          TabOrder = 5
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object CMDBLookupCombo3: TCMDBLookupCombo
          Left = 254
          Top = 158
          Width = 241
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'Descrição')
          DataField = 'IDTIPOCLIENTE'
          DataSource = ds
          LookupTable = DtmIntegraSaf.QryTipoCLiente
          LookupField = 'IDTIPOCLIENTE'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 6
          AutoDropDown = True
          ShowButton = True
          OrderByDisplay = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object CMDBLookupCombo4: TCMDBLookupCombo
          Left = 254
          Top = 206
          Width = 241
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRAMOFORNECEDOR'#9'30'#9'Descrição')
          DataField = 'IDRAMOFORNECEDOR'
          DataSource = ds
          LookupTable = DtmIntegraSaf.QryRamoForn
          LookupField = 'IDRAMOFORNECEDOR'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 7
          AutoDropDown = True
          ShowButton = True
          OrderByDisplay = False
          AllowClearKey = True
          ShowMatchText = True
        end
      end
      object TbsPlanoPatro: TTabSheet
        Caption = 'Plano \ Patrocinadora'
        object wwDBGrid1: TwwDBGrid
          Left = 0
          Top = 0
          Width = 503
          Height = 238
          Selected.Strings = (
            'NUMEMPRESA'#9'10'#9'Emrpesa SAF'
            'PATROCINADORA'#9'23'#9'Patrociadora'
            'PLANO'#9'27'#9'Plano')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = DsDet
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
        object CmbPlano: TCMDBLookupCombo
          Left = 32
          Top = 128
          Width = 193
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'50'#9'Plano')
          LookupTable = QryPlano
          LookupField = 'NOME'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          OrderByDisplay = False
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = CmbPlanoCloseUp
        end
        object CmbPatro: TCMDBLookupCombo
          Left = 32
          Top = 168
          Width = 193
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'Patrocinadora')
          LookupTable = QryPatro
          LookupField = 'NOME'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          OrderByDisplay = False
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = CmbPatroCloseUp
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 521
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Glyph.Data = {
          6E020000424D6E02000000000000760000002800000036000000120000000100
          040000000000F801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777FFFFFF777777777777777777777770077777770000007777777
          777FF888888F7777777777777777777777007777700111111077017777F88777
          77787F8777777700000077777700777701111111110011777F877FFFFF7788F8
          7777004444440770470077701119999911111177F877F88888F777F877704444
          4444400447007701119777779111117F877F8777778F77F8770444CCCCC44444
          47007701197777777111117F87F87777777877F870444C77777C444447007700
          0977777711111177888877777F8FFFF87044C777777744444700777777777779
          99999977FFFFF777788888887000C77777744444470070000007777777777778
          888887777777FFF77777777777CCCCCCC7007044444C777777000C787777F877
          7777888800000077777777777700704444C7777777044C7877778777777F87F8
          011111C77777700097007044440077777044C778777788FFFFF8778701111C77
          7777701197007044444400000444C7787FF7778888877F870111100777770119
          7700704CC4444444444C7778F88FF777777FF8770111111000001119770077C7
          7CC444444CC7777787788FFFFFF88777019911111111119777007777777CCCCC
          C777777777777888888777777977991111119977770077777777777777777777
          777777777777777777777799999977777700}
      end
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 323
    Width = 521
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT '
      
        '  IDPESSOA, DIRARQUIVO, DIRLOG, INTOPER, CODTIPDOCP,  CODTIPDOCR' +
        ', COMPLDOCUMENTO,'
      '  IDTIPOCLIENTE, IDRAMOFORNECEDOR'
      'FROM '
      '  PARAMINTEGRASAF WHERE IDPESSOA = :IDPESSOA')
    Top = 86
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PARAMINTEGRASAF.IDPESSOA'
    end
    object qryDIRARQUIVO: TStringField
      FieldName = 'DIRARQUIVO'
      Origin = 'PARAMINTEGRASAF.DIRARQUIVO'
      Size = 255
    end
    object qryDIRLOG: TStringField
      FieldName = 'DIRLOG'
      Origin = 'PARAMINTEGRASAF.DIRLOG'
      Size = 255
    end
    object qryINTOPER: TFloatField
      FieldName = 'INTOPER'
      Origin = 'PARAMINTEGRASAF.INTOPER'
    end
    object qryCODTIPDOCP: TFloatField
      FieldName = 'CODTIPDOCP'
    end
    object qryCODTIPDOCR: TFloatField
      FieldName = 'CODTIPDOCR'
    end
    object qryCOMPLDOCUMENTO: TStringField
      FieldName = 'COMPLDOCUMENTO'
      Size = 3
    end
    object qryIDTIPOCLIENTE: TFloatField
      FieldName = 'IDTIPOCLIENTE'
      Origin = 'PARAMINTEGRASAF.IDTIPOCLIENTE'
    end
    object qryIDRAMOFORNECEDOR: TFloatField
      FieldName = 'IDRAMOFORNECEDOR'
      Origin = 'PARAMINTEGRASAF.IDRAMOFORNECEDOR'
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 78
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PARAMINTEGRASAF'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  DIRARQUIVO = :DIRARQUIVO,'
      '  DIRLOG = :DIRLOG,'
      '  INTOPER = :INTOPER,'
      '  CODTIPDOCP = :CODTIPDOCP,'
      '  CODTIPDOCR = :CODTIPDOCR,'
      '  COMPLDOCUMENTO = :COMPLDOCUMENTO,'
      '  IDTIPOCLIENTE = :IDTIPOCLIENTE,'
      '  IDRAMOFORNECEDOR = :IDRAMOFORNECEDOR'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PARAMINTEGRASAF'
      
        '  (IDPESSOA, DIRARQUIVO, DIRLOG, INTOPER, CODTIPDOCP, CODTIPDOCR' +
        ', COMPLDOCUMENTO, '
      '   IDTIPOCLIENTE, IDRAMOFORNECEDOR)'
      'values'
      
        '  (:IDPESSOA, :DIRARQUIVO, :DIRLOG, :INTOPER, :CODTIPDOCP, :CODT' +
        'IPDOCR, '
      '   :COMPLDOCUMENTO, :IDTIPOCLIENTE, :IDRAMOFORNECEDOR)')
    DeleteSQL.Strings = (
      'delete from PARAMINTEGRASAF'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 179
    Top = 86
  end
  inherited ds: TwwDataSource
    Left = 139
    Top = 86
  end
  inherited ImlPadrao: TImageList
    Top = 86
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 358
    Top = 58
  end
  object DlgDir: TProcuraDirDlg
    Caption = 'Busca Diretório'
    Directory = 
      '6'#19#0'@ä°„'#4#0#0#0#0'l¿'#15'R|¿'#15'RSÁ'#15'R •‰'#4' •‰'#4'À'#15#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
      #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0' '#1#0#0'“'#0#0#0'Ü'#27#0'S'#0#0#0#0#0#0#0#0 +
      #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
      #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0'°'#1#0#0 +
      '“'#0#0#0
    Folder = foCustom
    Options = [bfStatusText]
    ShowPath = True
    Title = 'Teste Titulo'
    Left = 416
    Top = 16
  end
  object QryDet: TwwQuery
    CachedUpdates = True
    AfterInsert = QryDetAfterInsert
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  PXP.IDPLANPATROXSAF, PXP.NUMEMPRESA, PXP.IDPLANOPREV, PXP.IDPA' +
        'TRO, PXP.IDPESSOA,'
      '  P.NOME AS PATROCINADORA, PL.NOME PLANO'
      'FROM'
      '  PESSOA P, PLANPATROXSAF PXP, PATRO PA, PLANPREV PL'
      'WHERE'
      '  PXP.IDPATRO = PA.IDPESSOA AND'
      '  PA.IDPESSOA = P.IDPESSOA AND'
      '  PXP.IDPLANOPREV = PL.IDPLANOPREV AND'
      '  PXP.IDPESSOA = :IDPESSOA')
    UpdateObject = UpdDet
    ControlType.Strings = (
      'IDPLANOPREV;CustomEdit;CmbPlano'
      'IDPATRO;CustomEdit;CmbPatro'
      'PATROCINADORA;CustomEdit;CmbPatro'
      'PLANO;CustomEdit;CmbPlano')
    ValidateWithMask = True
    Left = 337
    Top = 116
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object QryDetNUMEMPRESA: TFloatField
      DisplayLabel = 'Emrpesa SAF'
      DisplayWidth = 10
      FieldName = 'NUMEMPRESA'
      Origin = 'PLANPATROXSAF.NUMEMPRESA'
      Required = True
    end
    object QryDetPATROCINADORA: TStringField
      DisplayLabel = 'Patrociadora'
      DisplayWidth = 23
      FieldName = 'PATROCINADORA'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object QryDetPLANO: TStringField
      DisplayLabel = 'Plano'
      DisplayWidth = 27
      FieldName = 'PLANO'
      Origin = 'PLANPREV.NOME'
      Size = 50
    end
    object QryDetIDPLANOPREV: TFloatField
      DisplayLabel = 'Plano'
      DisplayWidth = 25
      FieldName = 'IDPLANOPREV'
      Origin = 'PLANPATROXSAF.IDPLANOPREV'
      Required = True
      Visible = False
    end
    object QryDetIDPATRO: TFloatField
      DisplayLabel = 'Patrocinadora'
      DisplayWidth = 25
      FieldName = 'IDPATRO'
      Origin = 'PLANPATROXSAF.IDPATRO'
      Required = True
      Visible = False
    end
    object QryDetIDPESSOA: TFloatField
      DisplayLabel = 'Empresa Proprietária'
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'PLANPATROXSAF.IDPESSOA'
      Required = True
      Visible = False
    end
    object QryDetIDPLANPATROXSAF: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'IDPLANPATROXSAF'
      Origin = 'PLANPATROXSAF.IDPLANPATROXSAF'
      Required = True
      Visible = False
    end
  end
  object UpdDet: TUpdateSQL
    ModifySQL.Strings = (
      'update PLANPATROXSAF'
      'set'
      '  IDPLANPATROXSAF = :IDPLANPATROXSAF,'
      '  NUMEMPRESA = :NUMEMPRESA,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDPATRO = :IDPATRO,'
      '  IDPESSOA = :IDPESSOA'
      'where'
      '  IDPLANPATROXSAF = :OLD_IDPLANPATROXSAF')
    InsertSQL.Strings = (
      'insert into PLANPATROXSAF'
      '  (IDPLANPATROXSAF, NUMEMPRESA, IDPLANOPREV, IDPATRO, IDPESSOA)'
      'values'
      
        '  (:IDPLANPATROXSAF, :NUMEMPRESA, :IDPLANOPREV, :IDPATRO, :IDPES' +
        'SOA)')
    DeleteSQL.Strings = (
      'delete from PLANPATROXSAF'
      'where'
      '  IDPLANPATROXSAF = :OLD_IDPLANPATROXSAF')
    Left = 337
    Top = 164
  end
  object DsDet: TwwDataSource
    DataSet = QryDet
    Left = 337
    Top = 212
  end
  object QryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, NOME FROM PLANPREV'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 241
    Top = 196
    object QryPlanoNOME: TStringField
      DisplayLabel = 'Plano'
      DisplayWidth = 50
      FieldName = 'NOME'
      Origin = 'PLANPREV.NOME'
      Size = 50
    end
    object QryPlanoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'PLANPREV.IDPLANOPREV'
      Visible = False
    end
  end
  object QryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  P.NOME, P.IDPESSOA'
      'FROM'
      '  PATRO PA, PESSOA P'
      'WHERE'
      '  P.IDPESSOA = PA.IDPESSOA'
      'ORDER BY'
      '  P.NOME')
    ValidateWithMask = True
    Left = 241
    Top = 252
    object QryPatroNOME: TStringField
      DisplayLabel = 'Patrocinadora'
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object QryPatroIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PESSOA.IDPESSOA'
      Visible = False
    end
  end
end
