inherited frmCadCategoriaImovelMT: TfrmCadCategoriaImovelMT
  HelpContext = 640043
  Caption = 'Cadastro de Características de Imóveis'
  ClientHeight = 262
  ClientWidth = 434
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 434
    Height = 176
    inherited dbGrd: TwwDBGrid [0]
      Width = 424
      Height = 166
    end
    inherited pnlControles: TPanel [1]
      Width = 424
      Height = 166
      object Label1: TLabel
        Left = 16
        Top = 58
        Width = 140
        Height = 13
        Caption = 'Característica do Imóvel'
      end
      object dbedDescricao: TDBEdit
        Left = 16
        Top = 72
        Width = 361
        Height = 21
        DataField = 'CTIDESCRICAO'
        DataSource = ds
        TabOrder = 0
      end
    end
  end
  inherited Dock972: TDock97
    Width = 434
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 223
    Width = 434
    inherited tb97Fundo: TToolbar97
      Left = 264
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 97
    end
  end
  inherited CmeCadastro: TCmEventosCadastro
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
  end
  inherited Cds: TCMClientDataSet
    ProviderName = 'DataSetProvider1'
    object CdsIDCATEGORIAIMOVEL: TFloatField
      FieldName = 'IDCATEGORIAIMOVEL'
      Visible = False
    end
    object CdsCTIDESCRICAO: TStringField
      DisplayLabel = 'Característica'
      FieldName = 'CTIDESCRICAO'
      Size = 60
    end
  end
end
