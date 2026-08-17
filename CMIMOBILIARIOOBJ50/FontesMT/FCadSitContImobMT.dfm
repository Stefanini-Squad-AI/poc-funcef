inherited frmCadSitContImobMT: TfrmCadSitContImobMT
  Left = 242
  Top = 186
  HelpContext = 640094
  Caption = 'Cadastro de Situações Contratuais'
  ClientWidth = 427
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 427
    inherited dbGrd: TwwDBGrid [0]
      Width = 425
      Selected.Strings = (
        'DESCRICAO'#9'60'#9'Descrição')
    end
    inherited pnlControles: TPanel [1]
      Width = 425
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
    Width = 427
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Width = 427
    inherited tb97Fundo: TToolbar97
      Left = 255
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 86
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 66
    Top = 247
  end
  inherited ds: TwwDataSource
    Left = 382
  end
  inherited ImlPadrao: TImageList
    Left = 16
    Top = 247
  end
  inherited CmeCadastro: TCmEventosCadastro
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyDelete
    Left = 288
  end
  inherited Cds: TCMClientDataSet
    Left = 340
    object CdsDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CdsIDSITCONTIMOB: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSITCONTIMOB'
      Visible = False
    end
  end
  inherited MontaSelect: TMontaSelect
    Left = 248
  end
end
