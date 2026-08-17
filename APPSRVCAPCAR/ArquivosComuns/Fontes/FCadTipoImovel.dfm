inherited frmCadTipoImovel: TfrmCadTipoImovel
  Left = 70
  Top = 81
  HelpContext = 640045
  Caption = 'Cadastro de Tipos de Imóvel'
  ClientHeight = 436
  ClientWidth = 708
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 708
    Height = 368
    inherited dbGrd: TwwDBGrid [0]
      Width = 704
      Height = 364
      Selected.Strings = (
        'CODTIPIMOVEL'#9'15'#9'Código'
        'DESCTIPOIMOVEL'#9'80'#9'Tipo do Imóvel')
    end
    inherited pnlControles: TPanel [1]
      Width = 704
      Height = 364
      object Label2: TLabel
        Left = 200
        Top = 16
        Width = 62
        Height = 13
        Caption = 'Descrição:'
      end
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 44
        Height = 13
        Caption = 'Código:'
      end
      object Bevel3: TBevel
        Left = 8
        Top = 44
        Width = 689
        Height = 3
        Shape = bsTopLine
      end
      object Label4: TLabel
        Left = 16
        Top = 58
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'Multa: '
      end
      object Label5: TLabel
        Left = 368
        Top = 58
        Width = 92
        Height = 13
        Alignment = taRightJustify
        Caption = 'Corr.Monetária: '
      end
      object Label10: TLabel
        Left = 368
        Top = 98
        Width = 62
        Height = 13
        Alignment = taRightJustify
        Caption = 'Comissão: '
      end
      object Label3: TLabel
        Left = 16
        Top = 98
        Width = 39
        Height = 13
        Alignment = taRightJustify
        Caption = 'Juros: '
      end
      object Bevel1: TBevel
        Left = 352
        Top = 64
        Width = 3
        Height = 75
        Shape = bsLeftLine
      end
      object Label7: TLabel
        Left = 16
        Top = 158
        Width = 94
        Height = 13
        Caption = 'Ar-Condicionado'
      end
      object Label8: TLabel
        Left = 16
        Top = 278
        Width = 114
        Height = 13
        Caption = 'Instalações (Gerais)'
      end
      object Label9: TLabel
        Left = 16
        Top = 238
        Width = 119
        Height = 13
        Caption = 'Instalações Elétricas'
      end
      object Label11: TLabel
        Left = 16
        Top = 318
        Width = 149
        Height = 13
        Caption = 'Máquinas e Equipamentos'
      end
      object Label12: TLabel
        Left = 368
        Top = 198
        Width = 45
        Height = 13
        Caption = 'Terreno'
      end
      object Label13: TLabel
        Left = 368
        Top = 238
        Width = 54
        Height = 13
        Caption = 'Utilitários'
      end
      object Label14: TLabel
        Left = 368
        Top = 278
        Width = 51
        Height = 13
        Caption = 'Veículos'
      end
      object Label6: TLabel
        Left = 16
        Top = 198
        Width = 61
        Height = 13
        Caption = 'Edificação'
      end
      object Bevel2: TBevel
        Left = 352
        Top = 156
        Width = 3
        Height = 201
        Shape = bsLeftLine
      end
      object Label15: TLabel
        Left = 15
        Top = 38
        Width = 73
        Height = 13
        Alignment = taRightJustify
        Caption = ' Alteradores '
        Enabled = False
      end
      object Bevel4: TBevel
        Left = 8
        Top = 144
        Width = 689
        Height = 3
        Shape = bsTopLine
      end
      object Label16: TLabel
        Left = 16
        Top = 138
        Width = 160
        Height = 13
        Caption = ' Grupos para Transferência '
        Enabled = False
      end
      object Label17: TLabel
        Left = 368
        Top = 158
        Width = 113
        Height = 13
        Caption = 'Móveis e Utensílios'
      end
      object dbedDescricao: TwwDBEdit
        Left = 266
        Top = 12
        Width = 423
        Height = 21
        DataField = 'DESCTIPOIMOVEL'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object DBedtCodigo: TwwDBEdit
        Left = 64
        Top = 12
        Width = 105
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CODTIPIMOVEL'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object GroupBox1: TGroupBox
        Left = 808
        Top = 44
        Width = 97
        Height = 21
        Caption = ' Alteradores '
        Enabled = False
        TabOrder = 2
      end
      object GroupBox2: TGroupBox
        Left = 808
        Top = 72
        Width = 177
        Height = 17
        Caption = ' Grupos para Transferência '
        TabOrder = 3
      end
      object DBcboAltMulta: TwwDBLookupCombo
        Left = 16
        Top = 72
        Width = 321
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'DESCRICAO')
        DataField = 'CODALTMULTA'
        DataSource = ds
        LookupTable = dtmLookImobiliario.qryLookAlteradorXTipoImo
        LookupField = 'CODALTERADOR'
        Style = csDropDownList
        DropDownWidth = 8
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
      end
      object DBcboAltCorrMon: TwwDBLookupCombo
        Left = 368
        Top = 72
        Width = 321
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'DESCRICAO')
        DataField = 'CODALTCORRMON'
        DataSource = ds
        LookupTable = dtmLookImobiliario.qryLookAlteradorXTipoImo
        LookupField = 'CODALTERADOR'
        Style = csDropDownList
        DropDownWidth = 8
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
      end
      object DBcboAlteradorComissao: TwwDBLookupCombo
        Left = 368
        Top = 112
        Width = 321
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'DESCRICAO')
        DataField = 'CODALTCOMISSAO'
        DataSource = ds
        LookupTable = dtmLookImobiliario.qryLookAlteradorXTipoImo
        LookupField = 'CODALTERADOR'
        Style = csDropDownList
        DropDownWidth = 8
        TabOrder = 6
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
      end
      object DBcboAltJuros: TwwDBLookupCombo
        Left = 16
        Top = 112
        Width = 321
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'DESCRICAO')
        DataField = 'CODALTJUROS'
        DataSource = ds
        LookupTable = dtmLookImobiliario.qryLookAlteradorXTipoImo
        LookupField = 'CODALTERADOR'
        Style = csDropDownList
        DropDownWidth = 8
        TabOrder = 7
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
      end
      object DBcboGrupoEdif: TwwDBLookupCombo
        Left = 16
        Top = 212
        Width = 321
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'NOME'
          'CLASSE'#9'7'#9'CLASSE')
        DataField = 'IDGRUPOEDIFICACAO'
        DataSource = ds
        LookupTable = dtmLookImobiliario.qryLookGrupo
        LookupField = 'IDGRUPO'
        Style = csDropDownList
        DropDownWidth = 8
        TabOrder = 8
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
      end
      object DBcboGrupoTerr: TwwDBLookupCombo
        Left = 368
        Top = 212
        Width = 321
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'NOME'
          'CLASSE'#9'7'#9'CLASSE')
        DataField = 'IDGRUPOTERRENO'
        DataSource = ds
        LookupTable = dtmLookImobiliario.qryLookGrupo
        LookupField = 'IDGRUPO'
        Style = csDropDownList
        DropDownWidth = 8
        TabOrder = 9
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
      end
      object DBcboGrupoInst: TwwDBLookupCombo
        Left = 16
        Top = 252
        Width = 321
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'NOME'
          'CLASSE'#9'7'#9'CLASSE')
        DataField = 'IDGRUPOELET'
        DataSource = ds
        LookupTable = dtmLookImobiliario.qryLookGrupo
        LookupField = 'IDGRUPO'
        Style = csDropDownList
        DropDownWidth = 8
        TabOrder = 10
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
      end
      object DBcboGrupoElet: TwwDBLookupCombo
        Left = 16
        Top = 292
        Width = 321
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'NOME'
          'CLASSE'#9'7'#9'CLASSE')
        DataField = 'IDGRUPOINST'
        DataSource = ds
        LookupTable = dtmLookImobiliario.qryLookGrupo
        LookupField = 'IDGRUPO'
        Style = csDropDownList
        DropDownCount = 5
        DropDownWidth = 8
        TabOrder = 11
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
      end
      object DBcboGrupoVeiculo: TwwDBLookupCombo
        Left = 368
        Top = 292
        Width = 321
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'NOME'
          'CLASSE'#9'7'#9'CLASSE')
        DataField = 'IDGRUPOVEICULO'
        DataSource = ds
        LookupTable = dtmLookImobiliario.qryLookGrupo
        LookupField = 'IDGRUPO'
        Style = csDropDownList
        DropDownWidth = 8
        TabOrder = 12
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
      end
      object DBcboGrupoUtilitario: TwwDBLookupCombo
        Left = 368
        Top = 252
        Width = 321
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'NOME'
          'CLASSE'#9'7'#9'CLASSE')
        DataField = 'IDGRUPOUTILITARIO'
        DataSource = ds
        LookupTable = dtmLookImobiliario.qryLookGrupo
        LookupField = 'IDGRUPO'
        Style = csDropDownList
        DropDownWidth = 8
        TabOrder = 13
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
      end
      object DBcboGrupoMaquina: TwwDBLookupCombo
        Left = 16
        Top = 332
        Width = 321
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'NOME'
          'CLASSE'#9'7'#9'CLASSE')
        DataField = 'IDGRUPOMAQUINA'
        DataSource = ds
        LookupTable = dtmLookImobiliario.qryLookGrupo
        LookupField = 'IDGRUPO'
        Style = csDropDownList
        DropDownWidth = 8
        TabOrder = 14
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
      end
      object DBcboGrupoAr: TwwDBLookupCombo
        Left = 16
        Top = 172
        Width = 321
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'NOME'
          'CLASSE'#9'7'#9'CLASSE')
        DataField = 'IDGRUPOAR'
        DataSource = ds
        LookupTable = dtmLookImobiliario.qryLookGrupo
        LookupField = 'IDGRUPO'
        Style = csDropDownList
        DropDownCount = 5
        DropDownWidth = 8
        TabOrder = 15
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
      end
      object wwDBLookupCombo1: TwwDBLookupCombo
        Left = 368
        Top = 172
        Width = 321
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'NOME'
          'CLASSE'#9'7'#9'CLASSE')
        DataField = 'IDGRUPOMOVEL'
        DataSource = ds
        LookupTable = dtmLookImobiliario.qryLookGrupo
        LookupField = 'IDGRUPO'
        Style = csDropDownList
        DropDownWidth = 8
        TabOrder = 16
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
      end
    end
  end
  inherited Dock972: TDock97
    Width = 708
    object ToolbarButton971: TToolbarButton97 [0]
      Left = 180
      Top = 0
      Width = 60
      Height = 41
      AllowAllUp = True
      GroupIndex = 1
      Caption = '&Procurar'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
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
      Layout = blGlyphTop
      NumGlyphs = 2
      Opaque = False
      Spacing = 0
      Visible = False
      OnClick = sbtnProcurarClick
    end
  end
  inherited Dock971: TDock97
    Top = 403
    Width = 708
    inherited tb97Fundo: TToolbar97
      Left = 536
      DockPos = 581
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 364
      DockPos = 409
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   CODTIPIMOVEL, DESCTIPOIMOVEL,'
      ''
      '   CODALTMULTA, CODALTJUROS, CODALTCORRMON, CODALTCOMISSAO,'
      ''
      '   IDGRUPOTERRENO, IDGRUPOEDIFICACAO,'
      '   IDGRUPOINST, IDGRUPOELET, IDGRUPOAR,'
      '   IDGRUPOVEICULO, IDGRUPOUTILITARIO,'
      '   IDGRUPOMAQUINA, IDGRUPOMOVEL'
      ''
      'FROM'
      '   TIPOIMOVEL'
      ''
      'ORDER BY'
      '   DESCTIPOIMOVEL')
    Left = 488
    Top = 5
    object qryCODTIPIMOVEL: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 15
      FieldName = 'CODTIPIMOVEL'
      Origin = 'TIPOIMOVEL.CODTIPIMOVEL'
      Size = 5
    end
    object qryDESCTIPOIMOVEL: TStringField
      DisplayLabel = 'Tipo do Imóvel'
      DisplayWidth = 80
      FieldName = 'DESCTIPOIMOVEL'
      Origin = 'TIPOIMOVEL.DESCTIPOIMOVEL'
      Size = 25
    end
    object qryIDGRUPOTERRENO: TFloatField
      FieldName = 'IDGRUPOTERRENO'
      Origin = 'TIPOIMOVEL.IDGRUPOTERRENO'
      Visible = False
    end
    object qryIDGRUPOEDIFICACAO: TFloatField
      FieldName = 'IDGRUPOEDIFICACAO'
      Origin = 'TIPOIMOVEL.IDGRUPOEDIFICACAO'
      Visible = False
    end
    object qryIDGRUPOINST: TFloatField
      FieldName = 'IDGRUPOINST'
      Origin = 'TIPOIMOVEL.IDGRUPOINST'
      Visible = False
    end
    object qryIDGRUPOELET: TFloatField
      FieldName = 'IDGRUPOELET'
      Origin = 'TIPOIMOVEL.IDGRUPOELET'
      Visible = False
    end
    object qryIDGRUPOAR: TFloatField
      FieldName = 'IDGRUPOAR'
      Origin = 'BASEDADOS.TIPOIMOVEL.IDGRUPOAR'
      Visible = False
    end
    object qryIDGRUPOVEICULO: TFloatField
      FieldName = 'IDGRUPOVEICULO'
    end
    object qryIDGRUPOUTILITARIO: TFloatField
      FieldName = 'IDGRUPOUTILITARIO'
      Origin = 'BASEDADOS.TIPOIMOVEL.IDGRUPOUTILITARIO'
      Visible = False
    end
    object qryIDGRUPOMAQUINA: TFloatField
      FieldName = 'IDGRUPOMAQUINA'
      Origin = 'BASEDADOS.TIPOIMOVEL.IDGRUPOMAQUINA'
      Visible = False
    end
    object qryCODALTCORRMON: TFloatField
      FieldName = 'CODALTCORRMON'
      Origin = 'TIPOIMOVEL.CODALTCORRMON'
      Visible = False
    end
    object qryCODALTJUROS: TFloatField
      FieldName = 'CODALTJUROS'
      Origin = 'TIPOIMOVEL.CODALTJUROS'
      Visible = False
    end
    object qryCODALTMULTA: TFloatField
      FieldName = 'CODALTMULTA'
      Origin = 'TIPOIMOVEL.CODALTMULTA'
      Visible = False
    end
    object qryCODALTCOMISSAO: TFloatField
      FieldName = 'CODALTCOMISSAO'
      Visible = False
    end
    object qryIDGRUPOMOVEL: TFloatField
      FieldName = 'IDGRUPOMOVEL'
      Origin = 'BASEDADOS.TIPOIMOVEL.IDGRUPOMOVEL'
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65504
    Top = 65496
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOIMOVEL'
      'set'
      '  DESCTIPOIMOVEL = :DESCTIPOIMOVEL,'
      '  CODALTMULTA = :CODALTMULTA,'
      '  CODALTJUROS = :CODALTJUROS,'
      '  CODALTCORRMON = :CODALTCORRMON,'
      '  CODALTCOMISSAO = :CODALTCOMISSAO,'
      '  IDGRUPOTERRENO = :IDGRUPOTERRENO,'
      '  IDGRUPOEDIFICACAO = :IDGRUPOEDIFICACAO,'
      '  IDGRUPOINST = :IDGRUPOINST,'
      '  IDGRUPOELET = :IDGRUPOELET,'
      '  IDGRUPOAR = :IDGRUPOAR,'
      '  IDGRUPOVEICULO = :IDGRUPOVEICULO,'
      '  IDGRUPOUTILITARIO = :IDGRUPOUTILITARIO,'
      '  IDGRUPOMAQUINA = :IDGRUPOMAQUINA,'
      '  IDGRUPOMOVEL = :IDGRUPOMOVEL'
      'where'
      '  CODTIPIMOVEL = :OLD_CODTIPIMOVEL')
    InsertSQL.Strings = (
      'insert into TIPOIMOVEL'
      
        '  (CODTIPIMOVEL, DESCTIPOIMOVEL, CODALTMULTA, CODALTJUROS, CODAL' +
        'TCORRMON, '
      
        '   CODALTCOMISSAO, IDGRUPOTERRENO, IDGRUPOEDIFICACAO, IDGRUPOINS' +
        'T, IDGRUPOELET, '
      
        '   IDGRUPOAR, IDGRUPOVEICULO, IDGRUPOUTILITARIO, IDGRUPOMAQUINA,' +
        ' IDGRUPOMOVEL)'
      'values'
      
        '  (:CODTIPIMOVEL, :DESCTIPOIMOVEL, :CODALTMULTA, :CODALTJUROS, :' +
        'CODALTCORRMON, '
      
        '   :CODALTCOMISSAO, :IDGRUPOTERRENO, :IDGRUPOEDIFICACAO, :IDGRUP' +
        'OINST, '
      
        '   :IDGRUPOELET, :IDGRUPOAR, :IDGRUPOVEICULO, :IDGRUPOUTILITARIO' +
        ', :IDGRUPOMAQUINA, '
      '   :IDGRUPOMOVEL)')
    DeleteSQL.Strings = (
      'delete from TIPOIMOVEL'
      'where'
      '  CODTIPIMOVEL = :OLD_CODTIPIMOVEL')
    Left = 456
    Top = 5
  end
  inherited MontaSelect: TMontaSelect
    Left = 976
    Top = 53
  end
  inherited ds: TwwDataSource
    OnDataChange = dsDataChange
    Left = 520
    Top = 5
  end
  inherited ImlPadrao: TImageList
    Left = 977
    Top = 5
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 774
    Top = 144
  end
  object updTipoTitulo: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOTITULO'
      'set'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  CODTIPTITULO = :CODTIPTITULO'
      'where'
      '  CODTIPTITULO = :OLD_CODTIPTITULO')
    InsertSQL.Strings = (
      'insert into TIPOTITULO'
      '  (IDTIPOINVEST, CODTIPTITULO)'
      'values'
      '  (:IDTIPOINVEST, :CODTIPTITULO)')
    DeleteSQL.Strings = (
      'delete from TIPOTITULO'
      'where'
      '  CODTIPTITULO = :OLD_CODTIPTITULO')
    Left = 928
    Top = 188
  end
  object qryTipoTitulo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPOINVEST, CODTIPTITULO'
      'FROM '
      '   TIPOTITULO'
      'WHERE'
      '   IDTIPOINVEST = 0')
    UpdateObject = updTipoTitulo
    ValidateWithMask = True
    Left = 928
    Top = 176
    object qryTipoTituloIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'TIPOTITULO.IDTIPOINVEST'
    end
    object qryTipoTituloCODTIPTITULO: TStringField
      FieldName = 'CODTIPTITULO'
      Origin = 'TIPOTITULO.CODTIPTITULO'
      Size = 5
    end
  end
  object qryVerificaOcorrencia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODTIPIMOVEL, DESCTIPOIMOVEL'
      'FROM '
      '   TIPOIMOVEL'
      'WHERE'
      '  ( LOWER(DESCTIPOIMOVEL ) =:DESCRICAO )')
    ValidateWithMask = True
    Left = 832
    Top = 180
    ParamData = <
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptUnknown
      end>
    object qryVerificaOcorrenciaCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Origin = 'TIPOIMOVEL.CODTIPIMOVEL'
      Size = 5
    end
    object qryVerificaOcorrenciaDESCTIPOIMOVEL: TStringField
      FieldName = 'DESCTIPOIMOVEL'
      Origin = 'TIPOIMOVEL.DESCTIPOIMOVEL'
      Size = 25
    end
  end
  object qryDeleteTitulo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM '
      '   TIPOTITULO'
      'WHERE'
      '   ( LOWER(CODTIPTITULO) =:DESCRICAO )')
    ValidateWithMask = True
    Left = 832
    Top = 168
    ParamData = <
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptUnknown
      end>
  end
end
