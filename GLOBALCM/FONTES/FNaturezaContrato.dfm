inherited frmNaturezaContrato: TfrmNaturezaContrato
  Left = 348
  Top = 159
  Caption = 'Tipo de Natureza do Contrato'
  ClientHeight = 183
  ClientWidth = 525
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 525
    Height = 97
    object Label1: TLabel
      Left = 15
      Top = 18
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbedDescricao: TwwDBEdit
      Left = 15
      Top = 33
      Width = 498
      Height = 21
      DataField = 'DESCRICAO'
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
    object cbkFlgAtivo: TDBCheckBox
      Left = 15
      Top = 61
      Width = 97
      Height = 17
      Caption = 'Ativo'
      DataField = 'FLGATIVO'
      DataSource = ds
      TabOrder = 1
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
  end
  inherited Dock972: TDock97
    Width = 525
  end
  inherited Dock971: TDock97
    Top = 144
    Width = 525
    inherited tb97Fundo: TToolbar97
      Left = 353
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 184
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 386
    Top = 87
  end
  inherited ds: TwwDataSource
    Left = 286
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 464
    Top = 55
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 344
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    Left = 436
    Top = 15
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'NATUREZACONTR.DESCRICAO'
      'NATUREZACONTR.FLGATIVO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Descrição'
      'Ativo')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'NATUREZACONTR')
    CamposChave.Strings = (
      'NATUREZACONTR.IDNATUREZA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '80'
      '1')
    OperComparador.Strings = (
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 392
    Top = 39
  end
end
