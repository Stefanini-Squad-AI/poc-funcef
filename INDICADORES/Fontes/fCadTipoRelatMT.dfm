inherited frmCadTipoRelatMT: TfrmCadTipoRelatMT
  Left = 225
  Top = 184
  HelpContext = 4390019
  Caption = 'Cadastro de Tipos de Relatórios'
  ClientWidth = 482
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 482
    inherited dbGrd: TwwDBGrid [0]
      Width = 472
      Selected.Strings = (
        'DESCRICAO'#9'62'#9'Descrição')
    end
    inherited pnlControles: TPanel [1]
      Width = 472
      object Label1: TLabel
        Left = 20
        Top = 64
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object dbedtDescricao: TwwDBEdit
        Left = 20
        Top = 85
        Width = 433
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
    Width = 482
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Width = 482
    inherited tb97Fundo: TToolbar97
      Left = 312
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 145
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 18
    Top = 247
  end
  inherited ds: TwwDataSource
    Left = 358
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
    Left = 404
    object CdsDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 62
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CdsIDTIPO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPO'
      Visible = False
    end
  end
  inherited MontaSelect: TMontaSelect
    Left = 256
  end
end
