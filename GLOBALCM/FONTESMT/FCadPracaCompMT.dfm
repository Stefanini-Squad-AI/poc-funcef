inherited FrmCadPracaComp: TFrmCadPracaComp
  HelpContext = 20027
  Caption = 'Praça de Compensação'
  ClientHeight = 222
  ClientWidth = 343
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 343
    Height = 136
    object Label1: TLabel
      Left = 20
      Top = 74
      Width = 33
      Height = 13
      Caption = 'Nome'
    end
    object Label4: TLabel
      Left = 20
      Top = 25
      Width = 40
      Height = 13
      Caption = 'Código'
    end
    object DbEdNome: TwwDBEdit
      Left = 20
      Top = 89
      Width = 301
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object DbEdCodigo: TwwDBEdit
      Left = 20
      Top = 40
      Width = 136
      Height = 21
      DataField = 'CODIGO'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 343
  end
  inherited Dock971: TDock97
    Top = 183
    Width = 343
    inherited tb97Fundo: TToolbar97
      Left = 173
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 20027
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 6
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 178
    Top = 59
  end
  inherited ds: TwwDataSource
    Left = 230
    Top = 11
  end
  inherited ImlPadrao: TImageList
    Left = 176
    Top = 11
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 284
    Top = 11
  end
  inherited Cds: TCMClientDataSet
    Left = 228
    Top = 59
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PRACACOMP.DESCRICAO'
      'PRACACOMP.CODIGO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome'
      'Código')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PRACACOMP')
    CamposChave.Strings = (
      'PRACACOMP.IDPRACACOMP')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '30'
      '6')
    Left = 284
    Top = 59
  end
end
