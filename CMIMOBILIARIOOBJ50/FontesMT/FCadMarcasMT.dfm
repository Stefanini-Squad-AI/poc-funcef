inherited frmCadMarcasMT: TfrmCadMarcasMT
  Left = 225
  Top = 177
  HelpContext = 640044
  Caption = 'Cadastro de Marcas e Franquias'
  ClientWidth = 427
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 427
    inherited dbGrd: TwwDBGrid [0]
      Width = 425
      Selected.Strings = (
        'MRCNOME'#9'54'#9'Descrição')
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
        DataField = 'MRCNOME'
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
    Left = 58
    Top = 247
  end
  inherited ds: TwwDataSource
    Left = 398
  end
  inherited ImlPadrao: TImageList
    Left = 16
    Top = 247
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
    Left = 312
  end
  inherited Cds: TCMClientDataSet
    Left = 356
    object CdsMRCNOME: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 54
      FieldName = 'MRCNOME'
      Size = 40
    end
    object CdsIDMARCA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMARCA'
      Visible = False
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'M.MRCNOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'MARCAS M')
    CamposChave.Strings = (
      'M.IDMARCA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '40')
    Left = 264
  end
end
