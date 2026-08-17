inherited frmCadServicoManut: TfrmCadServicoManut
  Left = 86
  Top = 191
  HelpContext = 4170033
  Caption = 'Tipo de Serviço ou Produto de Manutenção'
  ClientHeight = 220
  ClientWidth = 592
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 592
    Height = 134
    BorderWidth = 2
    object Label1: TLabel
      Left = 15
      Top = 11
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 16
      Top = 53
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbedCodigo: TDBEdit
      Left = 16
      Top = 25
      Width = 114
      Height = 21
      Color = clGray
      DataField = 'IDSERVICOMANUT'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 15
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object dbedDescr: TwwDBEdit
      Left = 16
      Top = 67
      Width = 560
      Height = 54
      AutoSize = False
      DataField = 'DESCSERVICO'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = True
    end
  end
  inherited Dock972: TDock97
    Width = 592
  end
  inherited Dock971: TDock97
    Top = 181
    Width = 592
    inherited tb97Fundo: TToolbar97
      Left = 420
      DockPos = 515
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 4170033
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 251
      DockPos = 346
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 527
    Top = 15
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 366
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 527
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 465
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    Left = 338
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'DESCSERVICO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'SERVICOMANUT')
    CamposChave.Strings = (
      'IDSERVICOMANUT')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '200')
    Left = 465
    Top = 1
  end
end
