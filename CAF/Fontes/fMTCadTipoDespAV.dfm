inherited frmMTCadTipoDespAV: TfrmMTCadTipoDespAV
  Left = 324
  Top = 182
  Caption = 
    'Cadastro de Tipos Específicos de Movimentações para Acréscimos/D' +
    'ecréscimos de Valor'
  ClientHeight = 235
  ClientWidth = 590
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 590
    Height = 149
    object Label1: TLabel
      Left = 32
      Top = 48
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object lblTipoMov: TLabel
      Left = 32
      Top = 8
      Width = 83
      Height = 13
      Caption = 'Movimentação'
    end
    object dbedDescricao: TwwDBEdit
      Left = 32
      Top = 64
      Width = 335
      Height = 21
      DataField = 'DESTIPODESPESA'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcTipoMovimento: TwwDBLookupCombo
      Left = 32
      Top = 24
      Width = 335
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCTIPOMOVIMENTACAO'#9'40'#9'Descrição')
      DataField = 'idtipomovimentacao'
      DataSource = ds
      LookupTable = cdsMovimento
      LookupField = 'IDTIPOMOVIMENTACAO'
      Options = [loTitles]
      DropDownCount = 12
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
  end
  inherited Dock972: TDock97
    Width = 590
  end
  inherited Dock971: TDock97
    Top = 196
    Width = 590
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 506
    Top = 439
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
    BeforeDelete = CdsBeforeDelete
    Left = 324
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPODESPESAAV.DESTIPODESPESA'
      'TIPOMOVIMENTACAO.DESCTIPOMOVIMENTACAO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Descrição '
      'Tipo Movimentação')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'TIPODESPESAAV'
      'TIPOMOVIMENTACAO')
    CamposChave.Strings = (
      'TIPODESPESAAV.IDTIPODESPESA'
      'TIPOMOVIMENTACAO.IDTIPOMOVIMENTACAO')
    Filtro.Strings = (
      
        'TIPODESPESAAV.IDTIPOMOVIMENTACAO = TIPOMOVIMENTACAO.IDTIPOMOVIME' +
        'NTACAO (+)')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '50'
      '50')
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
    Left = 184
    Top = 104
  end
  object cdsMovimento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 400
    Top = 56
  end
end
