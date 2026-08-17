inherited frmCadPrevisaoDiariaMT: TfrmCadPrevisaoDiariaMT
  Left = 140
  Top = 194
  HelpContext = 1350019
  Caption = 'Cadastro Previsão Diária'
  ClientHeight = 334
  ClientWidth = 522
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 522
    Height = 248
    object Label5: TLabel
      Left = 248
      Top = 138
      Width = 135
      Height = 13
      Caption = 'Competência (mês/ano)'
    end
    object Label1: TLabel
      Left = 19
      Top = 138
      Width = 97
      Height = 13
      Caption = 'Cód. Tipo Imóvel'
    end
    object Label3: TLabel
      Left = 16
      Top = 82
      Width = 108
      Height = 13
      Caption = 'Receita / Despesa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 18
      Top = 192
      Width = 74
      Height = 13
      Caption = 'Valor Mensal'
    end
    object cboMes: TwwDBComboBox
      Left = 248
      Top = 152
      Width = 169
      Height = 21
      ShowButton = True
      Style = csDropDown
      MapList = True
      AllowClearKey = False
      DataField = 'MESCOMPETENCIA'
      DataSource = ds
      DropDownCount = 8
      Enabled = False
      ItemHeight = 0
      Items.Strings = (
        'Janeiro'#9'1'
        'Fevereiro'#9'2'
        'Março'#9'3'
        'Abril'#9'4'
        'Maio'#9'5'
        'Junho'#9'6'
        'Julho'#9'7'
        'Agosto'#9'8'
        'Setembro'#9'9'
        'Outubro'#9'10'
        'Novembro'#9'11'
        'Dezembro'#9'12')
      Sorted = False
      TabOrder = 0
      UnboundDataType = wwDefault
    end
    object DBspnAno: TwwDBSpinEdit
      Left = 424
      Top = 152
      Width = 65
      Height = 21
      Increment = 1
      DataField = 'ANOCOMPETENCIA'
      DataSource = ds
      Enabled = False
      TabOrder = 1
      UnboundDataType = wwDefault
    end
    object wwDBEdit1: TwwDBEdit
      Left = 18
      Top = 152
      Width = 135
      Height = 21
      DataField = 'CODTIPIMOVEL'
      DataSource = ds
      Enabled = False
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    inline molImovelAtivo1: TmolImovelAtivo
      Left = 8
      Top = 24
      Width = 489
      TabOrder = 4
      inherited edtImovel: TEdit
        Width = 447
      end
      inherited btnBuscaImovel: TBitBtn
        Left = 454
      end
      inherited btnLimpaImovel: TBitBtn
        Left = 368
        Visible = False
      end
    end
    object DBcboTipoCustoRecImo: TwwDBLookupCombo
      Left = 16
      Top = 96
      Width = 473
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCCUSTORECIMO'#9'60'#9'Receita / Despesa'#9'F')
      DataField = 'IDTIPOCUSTORECIMO'
      DataSource = ds
      LookupTable = CdsTipoCustoRecImo
      LookupField = 'IDTIPOCUSTORECIMO'
      TabOrder = 3
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object dbEdtValor: TDBRealEdit
      Left = 18
      Top = 205
      Width = 135
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 5
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'VLRMES'
      DataSource = ds
    end
  end
  inherited Dock972: TDock97
    Width = 522
  end
  inherited Dock971: TDock97
    Top = 295
    Width = 522
    inherited tb97Fundo: TToolbar97
      Left = 352
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 185
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyEdit
  end
  inherited Cds: TCMClientDataSet
    ProviderName = 'DataSetProvider1'
    object CdsIDPREVIMOB: TFloatField
      FieldName = 'IDPREVIMOB'
    end
    object CdsCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object CdsIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object CdsIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
    end
    object CdsMESCOMPETENCIA: TFloatField
      FieldName = 'MESCOMPETENCIA'
    end
    object CdsANOCOMPETENCIA: TFloatField
      FieldName = 'ANOCOMPETENCIA'
    end
    object CdsDESCCUSTORECIMO: TStringField
      FieldName = 'DESCCUSTORECIMO'
      Size = 60
    end
    object CdsVLRMES: TFloatField
      FieldName = 'VLRMES'
    end
    object CdsVLRANO: TFloatField
      FieldName = 'VLRANO'
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'P.CODTIPIMOVEL'
      'IM.IMONOME'
      'I.IMONOME'
      'T.DESCCUSTORECIMO'
      'P.MESCOMPETENCIA'
      'P.ANOCOMPETENCIA'
      'P.VLRMES')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'N'
      'N'
      'N')
    Descricao.Strings = (
      'Cód Tipo Imóvel'
      'Imóvel Mestre'
      'Imóvel'
      'Receita / Despesa'
      'Mês Competência'
      'Ano Competência'
      '')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PREVIMOB P'
      'IMOVEL I'
      'IMOVEL IM'
      'TIPOCUSTORECIMOV T')
    CamposChave.Strings = (
      'P.IDPREVIMOB'
      'IM.IMONOME'
      'I.IMONOME'
      'P.IDIMOVEL'
      'P.CODTIPIMOVEL')
    Filtro.Strings = (
      'P.IDIMOVEL = I.IDIMOVEL'
      'I.IDIMOVELMESTRE = IM.IDIMOVEL'
      'P.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '5'
      '40'
      '40'
      '40'
      '10'
      '10'
      '10')
  end
  object wwQuery1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM previmob'
      ' ')
    ValidateWithMask = True
    Left = 440
    Top = 65535
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = wwQuery1
    Constraints = True
    Left = 480
    Top = 65535
  end
  object CdsTipoCustoRecImo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 368
    Top = 127
    object CdsTipoCustoRecImoDESCCUSTORECIMO: TStringField
      DisplayLabel = 'Receita / Despesa'
      DisplayWidth = 60
      FieldName = 'DESCCUSTORECIMO'
      Size = 60
    end
    object CdsTipoCustoRecImoIDTIPOCUSTORECIMO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOCUSTORECIMO'
      Visible = False
    end
    object CdsTipoCustoRecImoRECCUSTO: TStringField
      DisplayWidth = 1
      FieldName = 'RECCUSTO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsTipoCustoRecImoFLGDIARIO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGDIARIO'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
end
