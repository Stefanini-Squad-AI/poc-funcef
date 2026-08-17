inherited frmCadRamoFor: TfrmCadRamoFor
  HelpContext = 20017
  Caption = 'Ramo de Fornecedor'
  ClientHeight = 218
  ClientWidth = 340
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 340
    Height = 132
    object Label1: TLabel
      Left = 20
      Top = 42
      Width = 119
      Height = 13
      Caption = 'Ramo de Fornecedor'
    end
    object dbedRamoFor: TwwDBEdit
      Left = 19
      Top = 57
      Width = 301
      Height = 21
      DataField = 'DESCRAMOFORNECEDOR'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 340
  end
  inherited Dock971: TDock97
    Top = 179
    Width = 340
    inherited tb97Fundo: TToolbar97
      Left = 170
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 3
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 146
    Top = 59
  end
  inherited ds: TwwDataSource
    Left = 198
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 144
    Top = 11
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 260
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 196
    Top = 55
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'RAMOFORNECEDOR.DESCRAMOFORNECEDOR')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'RAMOFORNECEDOR')
    CamposChave.Strings = (
      'RAMOFORNECEDOR.IDRAMOFORNECEDOR')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '30')
    Left = 260
    Top = 55
  end
end
