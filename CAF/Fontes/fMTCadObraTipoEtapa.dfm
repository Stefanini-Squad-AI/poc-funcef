inherited frmMTCadObraTipoEtapa: TfrmMTCadObraTipoEtapa
  Left = 140
  Top = 173
  Caption = 'Cadastro de Etapas de Obras'
  ClientHeight = 219
  ClientWidth = 412
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 412
    Height = 133
    object Label1: TLabel
      Left = 32
      Top = 40
      Width = 58
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object dbeDescTipSaiTmp: TwwDBEdit
      Left = 32
      Top = 56
      Width = 345
      Height = 21
      DataField = 'DESCOBRATIPOETAPA'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 412
  end
  inherited Dock971: TDock97
    Top = 180
    Width = 412
    inherited tb97Fundo: TToolbar97
      Left = 242
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 75
    end
  end
  inherited ds: TwwDataSource
    Left = 360
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 552
    Top = 455
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 256
    Top = 0
  end
  inherited Cds: TCMClientDataSet
    Left = 312
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CAFOBRATIPOETAPA.DESCOBRATIPOETAPA')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Tipo de Etapa')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'CAFOBRATIPOETAPA')
    CamposChave.Strings = (
      'CAFOBRATIPOETAPA.IDOBRATIPOETAPA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '50')
    Left = 360
    Top = 0
  end
end
