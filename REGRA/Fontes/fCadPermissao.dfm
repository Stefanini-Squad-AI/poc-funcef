inherited frmCadPermissao: TfrmCadPermissao
  Left = 8
  Top = 11
  HelpContext = 450001
  Caption = 'Cadastro de Permissão de Acesso'
  ClientHeight = 255
  ClientWidth = 425
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 425
    Height = 169
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 44
      Height = 13
      Caption = 'Usuário'
    end
    object Label2: TLabel
      Left = 16
      Top = 58
      Width = 91
      Height = 13
      Caption = 'Grupo de Regra'
    end
    object dedUsuario: TwwDBLookupCombo
      Left = 17
      Top = 32
      Width = 251
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEUSUARIO'#9'30'#9'Usuário')
      DataField = 'IDUSUARIO'
      DataSource = ds
      LookupTable = QryUsuario
      LookupField = 'IDUSUARIO'
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnChange = dedUsuarioChange
    end
    object dedGrupo: TwwDBLookupCombo
      Left = 17
      Top = 74
      Width = 389
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'60'#9'Grupo de Regra')
      DataField = 'IDGRUPOREGRA'
      DataSource = ds
      LookupTable = QryGrupoRegra
      LookupField = 'IDGRUPOREGRA'
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnChange = dedUsuarioChange
    end
    object GroupBox1: TGroupBox
      Left = 17
      Top = 102
      Width = 387
      Height = 53
      Caption = ' Permissões '
      TabOrder = 2
      object cklstPermissoes: TCMchklistbox
        Left = 6
        Top = 15
        Width = 375
        Height = 36
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
        Color = clBtnFace
        Columns = 3
        Ctl3D = False
        ItemHeight = 16
        ItemIndex = 0
        Items.Strings = (
          ' Inserção'
          ' Alteração'
          ' Exclusão'
          ' Procura')
        ParentCtl3D = False
        TabOrder = 0
      end
    end
  end
  inherited Dock972: TDock97
    Width = 425
  end
  inherited Dock971: TDock97
    Top = 216
    Width = 425
    inherited tb97Fundo: TToolbar97
      Left = 255
      DockPos = 257
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 88
      DockPos = 89
    end
  end
  inherited qry: TwwQuery
    Tag = 5
    SQL.Strings = (
      'SELECT'
      
        '      IDGRUPOREGRA, IDUSUARIO, FLGINSERIR, FLGALTERAR, FLGEXCLUI' +
        'R, FLGPROCURAR'
      'FROM'
      '    GRUPOREGRAUSUARIO'
      'WHERE'
      '     IDGRUPOREGRA = :GRP AND IDUSUARIO = :USU')
    Left = 306
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'GRP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'USU'
        ParamType = ptUnknown
      end>
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 248
    Top = 6
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update GRUPOREGRAUSUARIO'
      'set'
      '  IDGRUPOREGRA = :IDGRUPOREGRA,'
      '  IDUSUARIO = :IDUSUARIO,'
      '  FLGINSERIR = :FLGINSERIR,'
      '  FLGALTERAR = :FLGALTERAR,'
      '  FLGEXCLUIR = :FLGEXCLUIR,'
      '  FLGPROCURAR = :FLGPROCURAR'
      'where'
      '  IDGRUPOREGRA = :OLD_IDGRUPOREGRA and'
      '  IDUSUARIO = :OLD_IDUSUARIO')
    InsertSQL.Strings = (
      'insert into GRUPOREGRAUSUARIO'
      '  (IDGRUPOREGRA, IDUSUARIO, FLGINSERIR, FLGALTERAR, FLGEXCLUIR, '
      'FLGPROCURAR)'
      'values'
      
        '  (:IDGRUPOREGRA, :IDUSUARIO, :FLGINSERIR, :FLGALTERAR, :FLGEXCL' +
        'UIR, '
      ':FLGPROCURAR)')
    DeleteSQL.Strings = (
      'delete from GRUPOREGRAUSUARIO'
      'where'
      '  IDGRUPOREGRA = :OLD_IDGRUPOREGRA and'
      '  IDUSUARIO = :OLD_IDUSUARIO')
    Left = 371
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'USUARIOSISTEMA.NOMEUSUARIO'
      'GRUPOREGRA.DESCRICAO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Usuário'
      'Grupo de Regra')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'GRUPOREGRA'
      'USUARIOSISTEMA'
      'GRUPOREGRAUSUARIO')
    CamposChave.Strings = (
      'GRUPOREGRAUSUARIO.IDGRUPOREGRA'
      'GRUPOREGRAUSUARIO.IDUSUARIO')
    Filtro.Strings = (
      'USUARIOSISTEMA.IDUSUARIO = GRUPOREGRAUSUARIO.IDUSUARIO'
      'GRUPOREGRA.IDGRUPOREGRA = GRUPOREGRAUSUARIO.IDGRUPOREGRA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '20'
      '60')
  end
  inherited ds: TwwDataSource
    Left = 339
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 277
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 326
    Top = 47
  end
  object QryGrupoRegra: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDGRUPOREGRA, DESCRICAO'
      'FROM'
      '    GRUPOREGRA'
      'ORDER BY'
      '      DESCRICAO')
    ValidateWithMask = True
    Left = 296
    Top = 47
  end
  object QryUsuario: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDUSUARIO, NOMEUSUARIO'
      'FROM'
      '    USUARIOSISTEMA'
      'ORDER BY'
      '      NOMEUSUARIO')
    ValidateWithMask = True
    Left = 357
    Top = 47
  end
end
