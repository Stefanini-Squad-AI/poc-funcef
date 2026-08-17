inherited FrmControleAcessoGrpRegraMT: TFrmControleAcessoGrpRegraMT
  Left = 155
  Top = 159
  Caption = 'Controle de Acesso aos Grupos de Regra MT'
  ClientHeight = 348
  ClientWidth = 453
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 90
    Width = 453
    Height = 219
    Align = alBottom
    TabOrder = 1
    inherited pnlControles: TPanel
      Width = 451
      Height = 217
      object Label1: TLabel
        Left = 24
        Top = 21
        Width = 195
        Height = 13
        Caption = 'Grupos de Regras não associados'
      end
      object DbLkcGrupoRegra: TwwDBLookupCombo
        Left = 24
        Top = 37
        Width = 395
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'60'#9'Descrição')
        DataField = 'IDGRUPOREGRA'
        DataSource = ds
        LookupTable = CdsGrpRegra
        LookupField = 'IDGRUPOREGRA'
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object GroupBox1: TGroupBox
        Left = 24
        Top = 81
        Width = 393
        Height = 74
        Caption = ' Permissões '
        Color = clBtnFace
        ParentColor = False
        TabOrder = 1
        object cklstPermissoes: TCMchklistbox
          Left = 12
          Top = 22
          Width = 369
          Height = 48
          GlyphChecked.Data = {
            E6000000424DE60000000000000076000000280000000E0000000E0000000100
            0400000000007000000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FF00F000000000000F00F0FFFFFFFFFF0F00F0FFF0FFFFFF0F00F0FF000FFFFF
            0F00F0F00000FFFF0F00F0F00F000FFF0F00F0F0FFF000FF0F00F0FFFFFF000F
            0F00F0FFFFFFF00F0F00F0FFFFFFFFFF0F00F0FFFFFFFFFF0F00F00000000000
            0F00FFFFFFFFFFFFFF00}
          GlyphUnchecked.Data = {
            E6000000424DE60000000000000076000000280000000E0000000E0000000100
            0400000000007000000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FF00F000000000000F00F0FFFFFFFFFF0F00F0FFFFFFFFFF0F00F0FFFFFFFFFF
            0F00F0FFFFFFFFFF0F00F0FFFFFFFFFF0F00F0FFFFFFFFFF0F00F0FFFFFFFFFF
            0F00F0FFFFFFFFFF0F00F0FFFFFFFFFF0F00F0FFFFFFFFFF0F00F00000000000
            0F00FFFFFFFFFFFFFF00}
          GlyphTopMargin = 0
          GlyphLeftMargin = 0
          TextLeftMargin = 0
          ReadOnly = False
          BorderStyle = bsNone
          Columns = 2
          Ctl3D = False
          ItemHeight = 23
          ItemIndex = 0
          Items.Strings = (
            ' Inserção'
            ' Alteração'
            ' Exclusão'
            ' Procura')
          ParentColor = True
          ParentCtl3D = False
          TabOrder = 0
        end
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 451
      Height = 217
      ControlType.Strings = (
        'FLGINSERIR;CheckBox;1;0'
        'FLGALTERAR;CheckBox;1;0'
        'FLGEXCLUIR;CheckBox;1;0'
        'FLGPROCURAR;CheckBox;1;0')
      Selected.Strings = (
        'DESCRICAO'#9'30'#9'Grupo de Regras'
        'FLGINSERIR'#9'6'#9'Inserir'
        'FLGALTERAR'#9'6'#9'Alterar'
        'FLGEXCLUIR'#9'6'#9'Excluir'
        'FLGPROCURAR'#9'6'#9'Procurar')
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
    end
  end
  inherited Dock972: TDock97
    Width = 453
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
      OnClick = sbtnProcurarClick
    end
    object BtAtualizaAcesso: TSpeedButton [1]
      Left = 248
      Top = 6
      Width = 201
      Height = 33
      Caption = 'Atualiza Acessos'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000C40E0000C40E00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888888888FF8888888888888778888888888888F77F8888888888800F0888
        88888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF088
        888887788888F7F8888887FFFFFCF088888887F88888878F888887FFFF00FF08
        8888878F88888F7F8888880F0030FF088888887F88888878F8888800330FCCF0
        88888878F88778F78F88880B030FCFFF08888887F87F878878F8803BB0CCFFCF
        F08888878F7F8878F78803BB0FFFFCFFF088888878F7F7F77F883BB080FCCFFF
        78888888878F7F8878F8BB08880FFF7788888888887777F8878FB08888877788
        888888888888887F887808888888888888888888888888888888}
      NumGlyphs = 2
      Visible = False
    end
  end
  inherited Dock971: TDock97
    Top = 309
    Width = 453
    inherited tb97Fundo: TToolbar97
      Left = 281
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 112
    end
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 47
    Width = 453
    Height = 43
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 0
    object Label4: TLabel
      Left = 11
      Top = 3
      Width = 44
      Height = 13
      Caption = 'Usuário'
    end
    object DbLkcUsuario: TwwDBLookupCombo
      Left = 11
      Top = 17
      Width = 432
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEUSUARIO'#9'40'#9'Usuário'#9'F')
      LookupTable = CdsUsuario
      LookupField = 'IDUSUARIO'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnCloseUp = DbLkcUsuarioCloseUp
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 250
    Top = 47
  end
  inherited ds: TwwDataSource
    Left = 310
    Top = 47
  end
  inherited ImlPadrao: TImageList
    Left = 280
    Top = 47
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 344
    Top = 47
  end
  inherited Cds: TCMClientDataSet
    ProviderName = 'Provider'
    Left = 380
    Top = 47
    object CdsDESCRICAO: TStringField
      DisplayLabel = 'Grupo de Regras'
      DisplayWidth = 30
      FieldName = 'DESCRICAO'
      ReadOnly = True
      Size = 60
    end
    object CdsFLGINSERIR: TFloatField
      DisplayLabel = 'Inserir'
      DisplayWidth = 6
      FieldName = 'FLGINSERIR'
    end
    object CdsFLGALTERAR: TFloatField
      DisplayLabel = 'Alterar'
      DisplayWidth = 6
      FieldName = 'FLGALTERAR'
    end
    object CdsFLGEXCLUIR: TFloatField
      DisplayLabel = 'Excluir'
      DisplayWidth = 6
      FieldName = 'FLGEXCLUIR'
    end
    object CdsFLGPROCURAR: TFloatField
      DisplayLabel = 'Procurar'
      DisplayWidth = 6
      FieldName = 'FLGPROCURAR'
    end
    object CdsIDGRUPOREGRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPOREGRA'
      Visible = False
    end
    object CdsIDUSUARIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDUSUARIO'
      Visible = False
    end
    object CdsNOMEUSUARIO: TStringField
      DisplayWidth = 20
      FieldName = 'NOMEUSUARIO'
      Visible = False
      FixedChar = True
    end
    object CdsIDGRUPOREGRAUSU: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPOREGRAUSU'
      Visible = False
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'USUARIOSISTEMA.NOMEUSUARIO'
      'GRUPOREGRA.DESCRICAO'
      'GRUPOREGRAUSUARIO.FLGINSERIR'
      'GRUPOREGRAUSUARIO.FLGALTERAR'
      'GRUPOREGRAUSUARIO.FLGEXCLUIR'
      'GRUPOREGRAUSUARIO.FLGPROCURAR')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'N'
      'N'
      'N')
    Descricao.Strings = (
      'Usuário'
      'Descrição'
      'Inserir'
      'Alterar'
      'Excluir'
      'Procurar')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'GRUPOREGRAUSUARIO'
      'USUARIOSISTEMA'
      'GRUPOREGRA')
    CamposChave.Strings = (
      'GRUPOREGRAUSUARIO.IDUSUARIO')
    Filtro.Strings = (
      'GRUPOREGRAUSUARIO.IDUSUARIO=USUARIOSISTEMA.IDUSUARIO'
      'GRUPOREGRAUSUARIO.IDGRUPOREGRA=GRUPOREGRA.IDGRUPOREGRA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '20'
      '40'
      '10'
      '10'
      '10'
      '10')
    ExibePergunta = False
    Left = 416
    Top = 47
  end
  object DsUsuario: TwwDataSource
    AutoEdit = False
    DataSet = CdsUsuario
    Left = 323
    Top = 99
  end
  object CdsUsuario: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 353
    Top = 99
    object CdsUsuarioNOMEUSUARIO: TStringField
      DisplayLabel = 'Usuário'
      DisplayWidth = 40
      FieldName = 'NOMEUSUARIO'
      FixedChar = True
    end
    object CdsUsuarioIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
      Visible = False
    end
  end
  object DsGrupoRegra: TwwDataSource
    AutoEdit = False
    DataSet = CdsGrpRegra
    Left = 387
    Top = 99
  end
  object CdsGrpRegra: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 417
    Top = 99
    object CdsGrpRegraDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CdsGrpRegraIDGRUPOREGRA: TFloatField
      FieldName = 'IDGRUPOREGRA'
      Visible = False
    end
  end
  object Query: TQuery
    Active = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  GRU.IDGRUPOREGRAUSU,'
      
        '  GRU.IDGRUPOREGRA, GRU.IDUSUARIO,                     GRU.FLGIN' +
        'SERIR,   GRU.FLGALTERAR, GRU.FLGEXCLUIR,'
      
        '  GRU.FLGPROCURAR,  US.NOMEUSUARIO,                   GR.DESCRIC' +
        'AO,'
      '  GR.IDGRUPOREGRA'
      'FROM'
      '  GRUPOREGRAUSUARIO GRU, USUARIOSISTEMA US, GRUPOREGRA GR'
      'WHERE'
      '  ( GRU.IDUSUARIO   = 54791 ) AND'
      '  ( GRU.IDUSUARIO   = US.IDUSUARIO )  '
      'ORDER BY'
      '  GR.DESCRICAO')
    Left = 341
    Top = 255
  end
  object Provider: TDataSetProvider
    DataSet = Query
    Constraints = True
    Left = 373
    Top = 255
  end
end
