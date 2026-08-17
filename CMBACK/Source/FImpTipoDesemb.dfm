inherited FrmImpTipoDesemb: TFrmImpTipoDesemb
  Left = 247
  Top = 111
  BorderStyle = bsSingle
  Caption = 'Tipos de Desembolso'
  ClientHeight = 436
  ClientWidth = 437
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 437
    Height = 397
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 427
      Height = 44
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 11
        Top = 16
        Width = 59
        Height = 13
        Caption = 'Copiar de:'
      end
      object CmbTipoDesemb: TwwDBLookupCombo
        Left = 75
        Top = 11
        Width = 337
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEEMPRESA'#9'60'#9'NOMEEMPRESA')
        LookupTable = QryEmpresa
        LookupField = 'IDPESSOA'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = CmbTipoDesembCloseUp
      end
    end
    object Panel2: TPanel
      Left = 5
      Top = 49
      Width = 427
      Height = 343
      Align = alClient
      BevelInner = bvLowered
      BorderWidth = 3
      Caption = 'Panel2'
      Enabled = False
      TabOrder = 1
      object treeDesemb: TCMTreeView
        Left = 5
        Top = 39
        Width = 417
        Height = 299
        PodeNavegar = True
        DataSource = ds
        CampoChave = qryTipoDesembCODTIPRECDES
        CampoDescricao = qryTipoDesembDESCRICAO
        CampoTipo = qryTipoDesembANASINT
        Align = alClient
      end
      object Panel3: TPanel
        Left = 5
        Top = 5
        Width = 417
        Height = 34
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Tipos de Desembolso'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 397
    Width = 437
    inherited tb97Fundo: TToolbar97
      Left = 168
      DockPos = 168
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  object qryTipoDesemb: TwwQuery
    DatabaseName = 'BaseDados'
    RequestLive = True
    ValidateWithMask = True
    Left = 53
    Top = 214
    object qryTipoDesembCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'TIPORECEBDESEMB.CODTIPRECDES'
      EditMask = '9.99.999;0; '
      Size = 15
    end
    object qryTipoDesembRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'TIPORECEBDESEMB.RECPAG'
      Size = 1
    end
    object qryTipoDesembPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'TIPORECEBDESEMB.PLANO'
    end
    object qryTipoDesembPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'TIPORECEBDESEMB.PLACONTA'
      Size = 18
    end
    object qryTipoDesembIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'TIPORECEBDESEMB.IDPESSOA'
    end
    object qryTipoDesembDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TIPORECEBDESEMB.DESCRICAO'
      Size = 35
    end
    object qryTipoDesembANASINT: TStringField
      FieldName = 'ANASINT'
      Origin = 'TIPORECEBDESEMB.CODTIPRECDES'
      Size = 1
    end
    object qryTipoDesembIDUSUARIOINCLUSAO: TFloatField
      FieldName = 'IDUSUARIOINCLUSAO'
      Origin = 'TIPORECEBDESEMB.CODTIPRECDES'
    end
    object qryTipoDesembPLACONTACREDITO: TStringField
      FieldName = 'PLACONTACREDITO'
      Origin = 'TIPORECEBDESEMB.PLACONTACREDITO'
      Size = 18
    end
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = qryTipoDesemb
    Left = 53
    Top = 263
  end
  object QryEmpresa: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 53
    Top = 165
  end
  object QryImporta: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 53
    Top = 113
  end
end
