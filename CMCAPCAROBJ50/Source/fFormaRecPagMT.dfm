inherited frmFormaRecPagMT: TfrmFormaRecPagMT
  Left = 311
  Top = 179
  Caption = 'Forma de Pagamento'
  ClientHeight = 254
  ClientWidth = 595
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 595
    Height = 168
    object lblFormaRecPag: TLabel
      Left = 21
      Top = 11
      Width = 58
      Height = 13
      Caption = 'Descrição'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 394
      Top = 11
      Width = 179
      Height = 13
      Caption = 'Cod. Forma de Pag. (no Banco)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTipoForma: TLabel
      Left = 19
      Top = 122
      Width = 265
      Height = 13
      Caption = 'Tipo de Pagamento (Para Remessa Eletrônica)'
    end
    object dbedFormaRecPag: TDBEdit
      Left = 19
      Top = 27
      Width = 351
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
    end
    object DBCheckBox1: TDBCheckBox
      Left = 19
      Top = 58
      Width = 238
      Height = 17
      Caption = 'Forma Vinculada a Dados Bancários'
      DataField = 'FLGDADOSBANCARIOS'
      DataSource = ds
      TabOrder = 2
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object wwDBEdit1: TwwDBEdit
      Left = 394
      Top = 27
      Width = 179
      Height = 21
      DataField = 'CODFORMABANCO'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object chkPgtoAutonomoPF: TCheckBox
      Left = 19
      Top = 79
      Width = 242
      Height = 17
      Caption = 'Pagamento a autônomo - PF'
      TabOrder = 3
      OnClick = chkPgtoAutonomoPFClick
    end
    object chkFlgArquivo: TCheckBox
      Left = 19
      Top = 100
      Width = 250
      Height = 17
      Caption = 'Pode ser usado em Remessa Eletrônica'
      TabOrder = 4
      OnClick = chkFlgArquivoClick
    end
    object chkListaTitulos: TCheckBox
      Left = 294
      Top = 79
      Width = 276
      Height = 17
      Caption = 'Forma vinculada a pagamento de títulos'
      TabOrder = 6
      OnClick = chkListaTitulosClick
    end
    object chkListaFavorecido: TCheckBox
      Left = 294
      Top = 58
      Width = 281
      Height = 17
      Caption = 'Forma vinculada a pagamento de favorecidos'
      TabOrder = 5
      OnClick = chkListaFavorecidoClick
    end
    object cmbTipoForma: TwwDBLookupCombo
      Left = 19
      Top = 138
      Width = 350
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'30'#9'Descrição da Forma de Pagamento'#9'F')
      DataField = 'TIPOFORMA'
      DataSource = ds
      LookupTable = cdsTipoFormaRecPag
      LookupField = 'IDTIPOFORMARECPAG'
      TabOrder = 7
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
    end
  end
  inherited Dock972: TDock97
    Width = 595
  end
  inherited Dock971: TDock97
    Top = 215
    Width = 595
    inherited tb97Fundo: TToolbar97
      Left = 417
      DockPos = 417
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 244
      DockPos = 244
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 258
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Top = 31
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
  end
  inherited Cds: TCMClientDataSet
    Left = 308
    Top = 23
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'FORMARECPAG.DESCRICAO'
      'FORMARECPAG.RECPAG'
      'FORMARECPAG.CODFORMABANCO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Descrição'
      'Rec\Pag'
      'Forma de Pagamento (no banco)')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'FORMARECPAG')
    CamposChave.Strings = (
      'FORMARECPAG.CODFORMA'
      'FORMARECPAG.RECPAG'
      'FORMARECPAG.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '1'
      '5')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    Left = 413
    Top = 16
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 344
    Top = 23
  end
  object cdsTipoFormaRecPag: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 400
    Top = 160
  end
end
