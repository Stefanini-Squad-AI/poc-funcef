inherited frmCadEventoMkgMT: TfrmCadEventoMkgMT
  Left = 257
  Top = 156
  HelpContext = 4390025
  Caption = 'Cadastro de Eventos de Marketing'
  ClientWidth = 475
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 475
    inherited dbGrd: TwwDBGrid [0]
      Width = 473
      Selected.Strings = (
        'DESCRICAO'#9'61'#9'Descrição')
    end
    inherited pnlControles: TPanel [1]
      Width = 473
      object Label1: TLabel
        Left = 20
        Top = 67
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object dbedtDescricao: TwwDBEdit
        Left = 20
        Top = 85
        Width = 421
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
    Width = 475
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Width = 475
    inherited tb97Fundo: TToolbar97
      Left = 303
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 134
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 18
    Top = 247
  end
  inherited ds: TwwDataSource
    Left = 398
  end
  inherited ImlPadrao: TImageList
    Left = 88
    Top = 247
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
    Left = 304
  end
  inherited Cds: TCMClientDataSet
    Left = 348
    object CdsDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 61
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CdsIDEVENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEVENTO'
      Visible = False
    end
  end
  inherited MontaSelect: TMontaSelect
    Left = 256
  end
end
