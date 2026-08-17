inherited frmEndereco: TfrmEndereco
  Left = 246
  Top = 116
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Endereço'
  ClientHeight = 388
  ClientWidth = 476
  FormStyle = fsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 476
    Height = 349
    object Label1: TLabel
      Left = 20
      Top = 10
      Width = 33
      Height = 13
      Caption = 'Nome'
      FocusControl = DBEdit6
    end
    object Label6: TLabel
      Left = 20
      Top = 50
      Width = 55
      Height = 13
      Caption = 'Endereço'
      FocusControl = DBEdit1
    end
    object Label3: TLabel
      Left = 20
      Top = 169
      Width = 57
      Height = 13
      Caption = 'Município'
      FocusControl = DBEdit2
    end
    object Label4: TLabel
      Left = 382
      Top = 169
      Width = 17
      Height = 13
      Caption = 'UF'
    end
    object Label5: TLabel
      Left = 20
      Top = 129
      Width = 34
      Height = 13
      Caption = 'Bairro'
      FocusControl = DBEdit7
    end
    object Label8: TLabel
      Left = 309
      Top = 129
      Width = 25
      Height = 13
      Caption = 'CEP'
      FocusControl = DBEdit9
    end
    object Label9: TLabel
      Left = 20
      Top = 250
      Width = 34
      Height = 13
      Caption = 'e-mail'
      FocusControl = DBEdit10
    end
    object Label12: TLabel
      Left = 20
      Top = 210
      Width = 121
      Height = 13
      Caption = 'Telefone Comercial 1'
      FocusControl = DBEdit12
    end
    object Label14: TLabel
      Left = 21
      Top = 290
      Width = 70
      Height = 13
      Caption = 'Página Web'
      FocusControl = DBEdit14
    end
    object Label2: TLabel
      Left = 20
      Top = 90
      Width = 44
      Height = 13
      Caption = 'Número'
      FocusControl = DBEdit3
    end
    object Label7: TLabel
      Left = 110
      Top = 90
      Width = 76
      Height = 13
      Caption = 'Complemento'
      FocusControl = DBEdit4
    end
    object Label10: TLabel
      Left = 168
      Top = 210
      Width = 121
      Height = 13
      Caption = 'Telefone Comercial 2'
      FocusControl = DBEdit5
    end
    object DBEdit6: TDBEdit
      Left = 20
      Top = 25
      Width = 410
      Height = 21
      AutoSelect = False
      Color = clSilver
      DataField = 'NO_PESSOA'
      DataSource = ds
      ReadOnly = True
      TabOrder = 11
    end
    object DBEdit1: TDBEdit
      Left = 20
      Top = 65
      Width = 410
      Height = 21
      AutoSelect = False
      DataField = 'DS_ENDERECO'
      DataSource = ds
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 20
      Top = 184
      Width = 345
      Height = 21
      AutoSelect = False
      DataField = 'NO_MUNICIPIO'
      DataSource = ds
      TabOrder = 5
    end
    object DBEdit7: TDBEdit
      Left = 20
      Top = 144
      Width = 272
      Height = 21
      AutoSelect = False
      DataField = 'NO_BAIRRO'
      DataSource = ds
      TabOrder = 3
    end
    object DBEdit9: TDBEdit
      Left = 309
      Top = 144
      Width = 122
      Height = 21
      AutoSelect = False
      DataField = 'NR_CEP'
      DataSource = ds
      TabOrder = 4
    end
    object DBEdit10: TDBEdit
      Left = 20
      Top = 265
      Width = 279
      Height = 21
      AutoSelect = False
      DataField = 'NO_CORREIO_ELETRONICO'
      DataSource = ds
      TabOrder = 9
    end
    object DBEdit12: TDBEdit
      Left = 20
      Top = 225
      Width = 131
      Height = 21
      AutoSelect = False
      DataField = 'NR_FONE_1'
      DataSource = ds
      TabOrder = 7
    end
    object DBEdit14: TDBEdit
      Left = 20
      Top = 305
      Width = 410
      Height = 21
      AutoSelect = False
      DataField = 'NO_PAGINA_WEB'
      DataSource = ds
      TabOrder = 10
    end
    object DBEdit3: TDBEdit
      Left = 20
      Top = 105
      Width = 74
      Height = 21
      AutoSelect = False
      DataField = 'NR_ENDERECO'
      DataSource = ds
      TabOrder = 1
    end
    object DBEdit4: TDBEdit
      Left = 110
      Top = 105
      Width = 321
      Height = 21
      AutoSelect = False
      DataField = 'DS_COMPLEMENTO'
      DataSource = ds
      TabOrder = 2
    end
    object DBEdit5: TDBEdit
      Left = 168
      Top = 225
      Width = 131
      Height = 21
      AutoSelect = False
      DataField = 'NR_FONE_2'
      DataSource = ds
      TabOrder = 8
    end
    object LkcTbUF: TwwDBLookupCombo
      Left = 382
      Top = 184
      Width = 49
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CD_UF'#9'2'#9'UF')
      DataField = 'CD_UF'
      DataSource = ds
      LookupTable = qryUF
      LookupField = 'CD_UF'
      Options = [loColLines, loRowLines]
      TabOrder = 6
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
  end
  inherited Dock971: TDock97
    Top = 349
    Width = 476
    inherited tb97Fundo: TToolbar97
      Left = 287
      DockPos = 287
      inherited bbtnSair: TBitBtn
        Visible = False
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 119
      DockPos = 119
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = QryPrincipal
    Left = 326
    Top = 21
  end
  object QryPrincipal: TwwQuery
    CachedUpdates = True
    BeforePost = QryPrincipalBeforePost
    AfterPost = QryPrincipalAfterPost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select CD_PESSOA, NO_PESSOA, DS_ENDERECO, NR_ENDERECO,'
      '           DS_COMPLEMENTO, NO_BAIRRO, NO_MUNICIPIO, CD_UF, '
      '           NR_CEP, NR_FONE_1, NR_FONE_2, NO_CORREIO_ELETRONICO,'
      '           NO_PAGINA_WEB'
      'from FI_PESSOA_JURIDICA '
      'where CD_PESSOA = :CD'
      '')
    Params.Data = {0100010002434400030400000000000000}
    UpdateObject = UpdtSQLPrincipal
    ValidateWithMask = True
    Left = 293
    Top = 21
    object QryPrincipalCD_PESSOA: TFloatField
      FieldName = 'CD_PESSOA'
      Origin = '"CM.FI_PESSOA_JURIDICA".CD_PESSOA'
    end
    object QryPrincipalNO_PESSOA: TStringField
      FieldName = 'NO_PESSOA'
      Origin = '"CM.FI_PESSOA_JURIDICA".NO_PESSOA'
      Size = 60
    end
    object QryPrincipalDS_ENDERECO: TStringField
      FieldName = 'DS_ENDERECO'
      Origin = '"CM.FI_PESSOA_JURIDICA".DS_ENDERECO'
      Size = 60
    end
    object QryPrincipalNR_ENDERECO: TFloatField
      FieldName = 'NR_ENDERECO'
      Origin = '"CM.FI_PESSOA_JURIDICA".NR_ENDERECO'
    end
    object QryPrincipalDS_COMPLEMENTO: TStringField
      FieldName = 'DS_COMPLEMENTO'
      Origin = '"CM.FI_PESSOA_JURIDICA".DS_COMPLEMENTO'
      Size = 60
    end
    object QryPrincipalNO_BAIRRO: TStringField
      FieldName = 'NO_BAIRRO'
      Origin = '"CM.FI_PESSOA_JURIDICA".NO_BAIRRO'
      Size = 60
    end
    object QryPrincipalNO_MUNICIPIO: TStringField
      FieldName = 'NO_MUNICIPIO'
      Origin = '"CM.FI_PESSOA_JURIDICA".NO_MUNICIPIO'
      Size = 60
    end
    object QryPrincipalCD_UF: TStringField
      FieldName = 'CD_UF'
      Origin = '"CM.FI_PESSOA_JURIDICA".CD_UF'
      Size = 2
    end
    object QryPrincipalNR_CEP: TStringField
      FieldName = 'NR_CEP'
      Origin = '"CM.FI_PESSOA_JURIDICA".NR_CEP'
      Size = 8
    end
    object QryPrincipalNR_FONE_1: TStringField
      FieldName = 'NR_FONE_1'
      Origin = '"CM.FI_PESSOA_JURIDICA".NR_FONE_1'
      Size = 14
    end
    object QryPrincipalNR_FONE_2: TStringField
      FieldName = 'NR_FONE_2'
      Origin = '"CM.FI_PESSOA_JURIDICA".NR_FONE_2'
      Size = 14
    end
    object QryPrincipalNO_CORREIO_ELETRONICO: TStringField
      FieldName = 'NO_CORREIO_ELETRONICO'
      Origin = '"CM.FI_PESSOA_JURIDICA".NO_CORREIO_ELETRONICO'
      Size = 60
    end
    object QryPrincipalNO_PAGINA_WEB: TStringField
      FieldName = 'NO_PAGINA_WEB'
      Origin = '"CM.FI_PESSOA_JURIDICA".NO_PAGINA_WEB'
      Size = 60
    end
  end
  object UpdtSQLPrincipal: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_PESSOA_JURIDICA'
      'set'
      '  DS_ENDERECO = :DS_ENDERECO,'
      '  NR_ENDERECO = :NR_ENDERECO,'
      '  DS_COMPLEMENTO = :DS_COMPLEMENTO,'
      '  NO_BAIRRO = :NO_BAIRRO,'
      '  NO_MUNICIPIO = :NO_MUNICIPIO,'
      '  CD_UF = :CD_UF,'
      '  NR_CEP = :NR_CEP,'
      '  NR_FONE_1 = :NR_FONE_1,'
      '  NR_FONE_2 = :NR_FONE_2,'
      '  NO_CORREIO_ELETRONICO = :NO_CORREIO_ELETRONICO,'
      '  NO_PAGINA_WEB = :NO_PAGINA_WEB'
      'where'
      '  CD_PESSOA = :OLD_CD_PESSOA')
    InsertSQL.Strings = (
      'insert into FI_PESSOA_JURIDICA'
      '  (CD_PESSOA, DS_ENDERECO, NR_ENDERECO, DS_COMPLEMENTO, '
      
        '   NO_BAIRRO, NO_MUNICIPIO, CD_UF, NR_CEP, NR_FONE_1, NR_FONE_2,' +
        '    '
      '   NO_CORREIO_ELETRONICO, NO_PAGINA_WEB)'
      'values'
      '  (:CD_PESSOA, :DS_ENDERECO, :NR_ENDERECO, :DS_COMPLEMENTO, '
      
        '   :NO_BAIRRO, :NO_MUNICIPIO, :CD_UF, :NR_CEP, :NR_FONE_1, :NR_F' +
        'ONE_2, '
      '   :NO_CORREIO_ELETRONICO, :NO_PAGINA_WEB)')
    DeleteSQL.Strings = (
      'delete from FI_PESSOA_JURIDICA'
      'where'
      '  CD_PESSOA = :OLD_CD_PESSOA')
    Left = 360
    Top = 22
  end
  object qryUF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select CD_UF'
      'from FI_UF'
      'order by CD_UF')
    ValidateWithMask = True
    Left = 388
    Top = 189
    object qryUFCD_UF: TStringField
      DisplayLabel = 'UF'
      DisplayWidth = 2
      FieldName = 'CD_UF'
      Origin = '"CM.FI_UF".CD_UF'
      Size = 2
    end
  end
end
