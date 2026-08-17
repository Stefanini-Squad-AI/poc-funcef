inherited frmMTCadTipoArea: TfrmMTCadTipoArea
  Left = 274
  Top = 135
  Caption = 'Cadastro de Tipos de Áreas'
  ClientHeight = 250
  ClientWidth = 415
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 415
    Height = 164
    object Label1: TLabel
      Left = 48
      Top = 56
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbedDescricao: TwwDBEdit
      Left = 48
      Top = 72
      Width = 313
      Height = 21
      DataField = 'DESCTIPOAREA'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 415
  end
  inherited Dock971: TDock97
    Top = 211
    Width = 415
    inherited tb97Fundo: TToolbar97
      Left = 245
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 78
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 674
    Top = 447
  end
  inherited ds: TwwDataSource
    Left = 368
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 608
    Top = 447
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 272
    Top = 65535
  end
  inherited Cds: TCMClientDataSet
    Left = 328
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOAREA.DESCTIPOAREA')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'TIPOAREA')
    CamposChave.Strings = (
      'TIPOAREA.IDTIPOAREA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '30')
    Left = 272
    Top = 56
  end
end
