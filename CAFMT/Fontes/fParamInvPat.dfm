inherited frmParamInvPat: TfrmParamInvPat
  Left = 216
  Top = 114
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Relação de Bens para Inventário Patrimonial'
  ClientHeight = 382
  ClientWidth = 370
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 370
    Height = 343
    object grpSelecao: TGroupBox
      Left = 8
      Top = 6
      Width = 353
      Height = 273
      Caption = 'Seleção por'
      TabOrder = 0
      object Label5: TLabel
        Left = 16
        Top = 64
        Width = 74
        Height = 13
        Caption = 'Responsável'
      end
      object Label6: TLabel
        Left = 16
        Top = 144
        Width = 35
        Height = 13
        Caption = 'Grupo'
      end
      object Label8: TLabel
        Left = 16
        Top = 24
        Width = 69
        Height = 13
        Caption = 'Localização'
      end
      object Label3: TLabel
        Left = 16
        Top = 224
        Width = 48
        Height = 13
        Caption = 'Controle'
      end
      object Label1: TLabel
        Left = 16
        Top = 184
        Width = 51
        Height = 13
        Caption = 'Conjunto'
      end
      object Label7: TLabel
        Left = 16
        Top = 104
        Width = 38
        Height = 13
        Caption = 'Classe'
      end
      object cmbGrupo: TwwDBLookupCombo
        Left = 16
        Top = 160
        Width = 321
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Descrição'
          'CLASSE'#9'15'#9'Cód.Hierarquia')
        LookupTable = qryGrupo
        LookupField = 'IDGRUPO'
        Options = [loTitles]
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object cmbResponsavel: TwwDBLookupCombo
        Left = 16
        Top = 80
        Width = 321
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Nome')
        LookupTable = qryResponsavel
        LookupField = 'IDRESPONSAVEL'
        Options = [loTitles]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object cmbLocalizacao: TwwDBLookupCombo
        Left = 16
        Top = 40
        Width = 321
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'45'#9'Descrição')
        LookupTable = qryLocalizacao
        LookupField = 'IDLOCALIZACAO'
        Options = [loTitles]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object cmbControle: TComboBox
        Left = 16
        Top = 240
        Width = 321
        Height = 21
        ItemHeight = 13
        TabOrder = 5
        Items.Strings = (
          'Total'
          'Físico')
      end
      object cmbConjunto: TwwDBLookupCombo
        Left = 16
        Top = 200
        Width = 321
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCONJUNTO'#9'200'#9'Descrição'
          'IDCONJUNTO'#9'10'#9'IDCONJUNTO')
        LookupTable = qryConjunto
        LookupField = 'IDCONJUNTO'
        Options = [loTitles]
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object cmbClasse: TwwDBLookupCombo
        Left = 16
        Top = 120
        Width = 321
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Descrição'
          'CLASSE'#9'15'#9'Cód.Hierarquia')
        LookupTable = qryGrupo
        LookupField = 'IDGRUPO'
        Options = [loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
    end
    object RdGrpOrdem: TRadioGroup
      Left = 8
      Top = 280
      Width = 353
      Height = 55
      Caption = 'Ordenado por'
      Columns = 2
      Items.Strings = (
        'Nome'
        'Placa')
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 343
    Width = 370
    inherited tb97Fundo: TToolbar97
      Left = 177
      DockPos = 177
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 9
      DockPos = 9
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 739
    Top = 507
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryClasse: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DESCRICAO, CODHIERARQ, IDCLASSEBEM'
      'FROM CLASSEDEBEM'
      'WHERE (ANASINT = '#39'A'#39')'
      'ORDER BY CODHIERARQ')
    ValidateWithMask = True
    Left = 236
    Top = 103
    object qryClasseDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = '"CM.CLASSEDEBEM".DESCRICAO'
      Size = 60
    end
    object qryClasseCODHIERARQ: TStringField
      FieldName = 'CODHIERARQ'
      Origin = '"CM.CLASSEDEBEM".CODHIERARQ'
      Size = 15
    end
    object qryClasseIDCLASSEBEM: TFloatField
      FieldName = 'IDCLASSEBEM'
      Origin = '"CM.CLASSEDEBEM".IDCLASSEBEM'
    end
  end
  object qryGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOME, CLASSE, IDGRUPO'
      'FROM GRUPO'
      'WHERE (TIPO = '#39'A'#39')'
      'ORDER BY CLASSE')
    ValidateWithMask = True
    Left = 184
    Top = 143
    object qryGrupoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'GRUPO.NOME'
      Size = 60
    end
    object qryGrupoCLASSE: TStringField
      FieldName = 'CLASSE'
      Origin = 'GRUPO.CLASSE'
      Size = 15
    end
    object qryGrupoIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'GRUPO.IDGRUPO'
    end
  end
  object qryLocalizacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOME, IDLOCALIZACAO'
      'FROM LOCALIZACAO'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 120
    Top = 23
    object qryLocalizacaoNOME: TStringField
      FieldName = 'NOME'
      Origin = '"CM.LOCALIZACAO".NOME'
      Size = 60
    end
    object qryLocalizacaoIDLOCALIZACAO: TFloatField
      FieldName = 'IDLOCALIZACAO'
      Origin = '"CM.LOCALIZACAO".IDLOCALIZACAO'
    end
  end
  object qryResponsavel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME, R.IDRESPONSAVEL'
      'FROM PESSOA P,'
      '     RESPONSAVEL R'
      'WHERE (R.IDRESPONSAVEL = P.IDPESSOA)'
      'ORDER BY P.NOME')
    ValidateWithMask = True
    Left = 176
    Top = 63
    object qryResponsavelNOME: TStringField
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryResponsavelIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
      Origin = '"CM.RESPONSAVEL".IDRESPONSAVEL'
    end
  end
  object qryConjunto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DESCCONJUNTO, IDCONJUNTO'
      'FROM CONJUNTO'
      'ORDER BY DESCCONJUNTO'
      '')
    ValidateWithMask = True
    Left = 125
    Top = 183
    object qryConjuntoDESCCONJUNTO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 200
      FieldName = 'DESCCONJUNTO'
      Origin = 'CONJUNTO.DESCCONJUNTO'
      Size = 200
    end
    object qryConjuntoIDCONJUNTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONJUNTO'
      Origin = 'CONJUNTO.IDCONJUNTO'
    end
  end
end
