inherited frmCadOutroDadoMT: TfrmCadOutroDadoMT
  Left = 126
  Top = 237
  HelpContext = 640047
  Caption = 'Dados Complementares'
  ClientHeight = 262
  ClientWidth = 434
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 434
    Height = 176
    inherited dbGrd: TwwDBGrid [0]
      Width = 432
      Height = 174
    end
    inherited pnlControles: TPanel [1]
      Width = 432
      Height = 174
      object Label1: TLabel
        Left = 16
        Top = 58
        Width = 161
        Height = 13
        Caption = 'Tipo de Dado Complementar'
      end
      object DBEdDescricao: TwwDBEdit
        Left = 16
        Top = 72
        Width = 361
        Height = 21
        DataField = 'ODODESCRICAO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
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
      Left = 262
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 93
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 65511
  end
  inherited ds: TwwDataSource
    Left = 406
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Top = 65511
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
    Left = 256
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 364
    Top = 7
    object CdsIDOUTRODADO: TFloatField
      FieldName = 'IDOUTRODADO'
      Visible = False
    end
    object CdsODODESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'ODODESCRICAO'
      Size = 40
    end
  end
  inherited MontaSelect: TMontaSelect
    Left = 312
    Top = 7
  end
end
