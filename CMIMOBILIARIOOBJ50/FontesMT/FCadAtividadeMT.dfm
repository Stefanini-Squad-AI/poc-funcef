inherited frmCadAtividadeMT: TfrmCadAtividadeMT
  Left = 297
  Top = 193
  HelpContext = 640042
  Caption = 'Cadastro de Atividades e Segmentos'
  ClientWidth = 427
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 427
    inherited dbGrd: TwwDBGrid [0]
      Width = 417
    end
    inherited pnlControles: TPanel [1]
      Width = 417
      object Label1: TLabel
        Left = 36
        Top = 67
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object dbedtDesc: TwwDBEdit
        Left = 36
        Top = 85
        Width = 345
        Height = 21
        DataField = 'ATVDESCRICAO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
  end
  inherited Dock972: TDock97
    Width = 427
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Width = 21
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Width = 427
    inherited tb97Fundo: TToolbar97
      Left = 257
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 90
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 18
    Top = 247
  end
  inherited ds: TwwDataSource
    Left = 390
  end
  inherited ImlPadrao: TImageList
    Left = 72
    Top = 247
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
    Left = 304
  end
  inherited Cds: TCMClientDataSet
    Left = 356
    object CdsATVDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'ATVDESCRICAO'
      Size = 60
    end
    object CdsIDATIVIDADE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDATIVIDADE'
      Visible = False
    end
  end
  inherited MontaSelect: TMontaSelect
    Left = 256
  end
end
