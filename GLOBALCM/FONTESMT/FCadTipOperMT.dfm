inherited frmCadTipOper: TfrmCadTipOper
  HelpContext = 20014
  Caption = 'Tipo de Operação'
  ClientWidth = 342
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 342
    object Label1: TLabel
      Left = 70
      Top = 47
      Width = 40
      Height = 13
      Caption = 'Código'
    end
    object Label2: TLabel
      Left = 70
      Top = 101
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbedCodigo: TwwDBEdit
      Left = 71
      Top = 62
      Width = 39
      Height = 21
      DataField = 'tipcodigo'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedDesc: TwwDBEdit
      Left = 70
      Top = 116
      Width = 211
      Height = 21
      DataField = 'tipdescricao'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 342
  end
  inherited Dock971: TDock97
    Width = 342
    inherited tb97Fundo: TToolbar97
      Left = 170
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 1
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 202
    Top = 63
  end
  inherited ds: TwwDataSource
    Left = 150
    Top = 19
  end
  inherited ImlPadrao: TImageList
    Left = 200
    Top = 15
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 264
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    Left = 148
    Top = 67
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOPER.TIPCODIGO'
      'TIPOPER.TIPDESCRICAO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'TIPOPER')
    CamposChave.Strings = (
      'TIPOPER.TIPCODIGO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '2'
      '25')
    Left = 264
    Top = 63
  end
end
