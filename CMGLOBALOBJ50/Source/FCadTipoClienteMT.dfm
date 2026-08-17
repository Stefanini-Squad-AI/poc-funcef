inherited frmCadTipoCliente: TfrmCadTipoCliente
  HelpContext = 20019
  Caption = 'Tipo de Cliente'
  ClientHeight = 221
  ClientWidth = 341
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 341
    Height = 135
    object lblDescricao: TLabel
      Left = 19
      Top = 48
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbedDescricao: TwwDBEdit
      Left = 19
      Top = 63
      Width = 301
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 341
  end
  inherited Dock971: TDock97
    Top = 182
    Width = 341
    inherited tb97Fundo: TToolbar97
      Left = 171
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 4
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 98
    Top = 59
  end
  inherited ds: TwwDataSource
    Left = 238
    Top = 59
  end
  inherited ImlPadrao: TImageList
    Left = 156
    Top = 59
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 288
    Top = 11
  end
  inherited Cds: TCMClientDataSet
    Left = 200
    Top = 59
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOCLIENTE.DESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'TIPOCLIENTE')
    CamposChave.Strings = (
      'TIPOCLIENTE.IDTIPOCLIENTE')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '40')
    Left = 288
    Top = 59
  end
end
