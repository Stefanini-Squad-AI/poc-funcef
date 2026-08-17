inherited frmCadPerfil: TfrmCadPerfil
  Caption = 'Cadasrtro de Perfil'
  ClientHeight = 284
  ClientWidth = 435
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 435
    Height = 198
    inherited dbGrd: TwwDBGrid [0]
      Width = 433
      Height = 196
      Selected.Strings = (
        'DESCRICAO'#9'55'#9'Descrição')
    end
    inherited pnlControles: TPanel [1]
      Width = 433
      Height = 196
      object Label1: TLabel
        Left = 16
        Top = 58
        Width = 77
        Height = 13
        Caption = 'Tipo de Perfil'
      end
      object DBEdDescricao: TwwDBEdit
        Left = 16
        Top = 72
        Width = 361
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
  end
  inherited Dock972: TDock97
    Width = 435
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 245
    Width = 435
    inherited tb97Fundo: TToolbar97
      Left = 263
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 94
    end
  end
  inherited CmeCadastro: TCmEventosCadastro
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
  end
  inherited Cds: TCMClientDataSet
    ProviderName = 'Dsp'
    object CdsDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 55
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object CdsIDCOTAPERFIL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCOTAPERFIL'
      Visible = False
    end
  end
end
