inherited FrmControleAcessoMT: TFrmControleAcessoMT
  Left = 180
  Top = 157
  Caption = 'Controle de Acesso MT'
  ClientHeight = 348
  ClientWidth = 453
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 90
    Width = 453
    Height = 219
    Align = alBottom
    inherited dbGrd: TwwDBGrid [0]
      Width = 443
      Height = 209
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
    inherited pnlControles: TPanel [1]
      Width = 443
      Height = 209
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
  end
  inherited Dock972: TDock97
    Width = 453
  end
  inherited Dock971: TDock97
    Top = 309
    Width = 453
    inherited tb97Fundo: TToolbar97
      Left = 283
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 116
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
    TabOrder = 3
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
    Top = 7
  end
  inherited ds: TwwDataSource
    Left = 310
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 280
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 344
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 372
    Top = 7
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
    Left = 400
    Top = 7
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
end
