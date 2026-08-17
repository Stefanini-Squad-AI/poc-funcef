inherited frmMTCadTipoDespAV: TfrmMTCadTipoDespAV
  Left = 183
  Top = 183
  Caption = 'Cadastro de Tipos de Despesa para Acréscimo de Valor'
  ClientHeight = 235
  ClientWidth = 428
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 428
    Height = 149
    object Label1: TLabel
      Left = 32
      Top = 48
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbedDescricao: TwwDBEdit
      Left = 32
      Top = 64
      Width = 361
      Height = 21
      DataField = 'DESTIPODESPESA'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 428
  end
  inherited Dock971: TDock97
    Top = 196
    Width = 428
    inherited tb97Fundo: TToolbar97
      Left = 258
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 91
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 682
    Top = 463
  end
  inherited ds: TwwDataSource
    Left = 368
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 736
    Top = 463
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 264
    Top = 0
  end
  inherited Cds: TCMClientDataSet
    Left = 324
    Top = 65535
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPODESPESAAV.DESTIPODESPESA')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição ')
    Tabelas.Strings = (
      'TIPODESPESAAV')
    CamposChave.Strings = (
      'TIPODESPESAAV.IDTIPODESPESA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '50')
    Left = 264
    Top = 56
  end
end
