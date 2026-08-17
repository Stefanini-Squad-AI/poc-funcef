inherited frmMTCadTipoSaidaTemp: TfrmMTCadTipoSaidaTemp
  Left = 203
  Top = 181
  Caption = 'Motivos para Sa'#237'das Tempor'#225'rias'
  ClientHeight = 230
  ClientWidth = 410
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 410
    Height = 144
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
      DataField = 'DESCTIPSAITEMP'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 410
  end
  inherited Dock971: TDock97
    Top = 191
    Width = 410
    inherited tb97Fundo: TToolbar97
      Left = 240
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 73
    end
  end
  inherited ds: TwwDataSource
    Left = 360
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 664
    Top = 471
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
    Left = 320
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOSAIDATEMP.DESCTIPSAITEMP')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descri'#231#227'o')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'TIPOSAIDATEMP')
    CamposChave.Strings = (
      'TIPOSAIDATEMP.IDTIPOSAIDATEMP')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 264
    Top = 48
  end
end
