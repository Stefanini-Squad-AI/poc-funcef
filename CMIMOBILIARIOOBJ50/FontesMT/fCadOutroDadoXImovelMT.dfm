inherited frmCadOutroDadoXImovelMT: TfrmCadOutroDadoXImovelMT
  HelpContext = 640049
  Caption = 'Cadastro de Dados Complementares de Imóveis'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnlControles: TPanel
      Top = 65
      Height = 131
      object Label2: TLabel
        Left = 40
        Top = 16
        Width = 161
        Height = 13
        Caption = 'Tipo de Dado Complementar'
      end
      object Label4: TLabel
        Left = 40
        Top = 82
        Width = 107
        Height = 13
        Caption = 'Valor "outro dado"'
      end
      object dbCboOutroDado: TwwDBLookupCombo
        Left = 40
        Top = 32
        Width = 385
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'ODODESCRICAO'#9'40'#9'Dado Complementar'#9'F')
        DataField = 'IDOUTRODADO'
        DataSource = ds
        LookupTable = CdsOutroDado
        LookupField = 'IDOUTRODADO'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object DBedtValor: TDBEdit
        Left = 40
        Top = 96
        Width = 385
        Height = 21
        DataField = 'ODIVALOR'
        DataSource = ds
        TabOrder = 1
      end
    end
    inherited dbGrd: TwwDBGrid
      Top = 65
      Height = 131
      OnTitleButtonClick = dbGrdTitleButtonClick
    end
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 497
      Height = 60
      Align = alTop
      TabOrder = 2
      inline molImovel1: TmolImovel
        Left = 43
        Top = 9
        Width = 422
        inherited edtImovel: TEdit
          Width = 345
        end
        inherited btnBuscaImovel: TBitBtn
          Left = 352
          OnClick = molImovel1btnBuscaImovelClick
        end
        inherited btnLimpaImovel: TBitBtn
          Left = 376
          Enabled = False
          Visible = False
        end
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 50
    Top = 65511
  end
  inherited ImlPadrao: TImageList
    Left = 8
    Top = 65511
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyEdit
    Left = 320
  end
  inherited Cds: TCMClientDataSet
    IndexDefs = <
      item
        Name = 'CdsIndex1'
        Fields = 'ODODESCRICAO'
      end
      item
        Name = 'CdsIndex2'
        Fields = 'ODIVALOR'
      end>
    IndexFieldNames = 'ODODESCRICAO'
    StoreDefs = True
    Left = 284
    object CdsODODESCRICAO: TStringField
      DisplayLabel = 'Outro Dado'
      FieldName = 'ODODESCRICAO'
      Size = 40
    end
    object CdsODIVALOR: TStringField
      DisplayLabel = 'Valor'
      FieldName = 'ODIVALOR'
      Size = 60
    end
    object CdsIDOUTRODADO: TFloatField
      FieldName = 'IDOUTRODADO'
      Visible = False
    end
    object CdsIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Visible = False
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'IM.IMONOME'
      'I.IMONOME'
      'O.ODODESCRICAO'
      'OI.ODIVALOR')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Imóvel Mestre'
      'Imóvel'
      'Outro Dado'
      'Valor')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'IMOVEL I'
      'IMOVEL IM'
      'OUTRODADOXIMOVEL OI'
      'OUTRODADO O')
    CamposChave.Strings = (
      'OI.IDIMOVEL'
      'OI.IDOUTRODADO'
      'IM.IMONOME'
      'I.IMONOME'
      'I.CODTIPIMOVEL')
    Filtro.Strings = (
      'I.IDIMOVEL = OI.IDIMOVEL'
      'OI.IDOUTRODADO = O.IDOUTRODADO'
      'IM.IDIMOVEL = I.IDIMOVELMESTRE')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '40'
      '60'
      '60'
      '60')
    Left = 376
  end
  object CdsOutroDado: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 336
    Top = 119
    object CdsOutroDadoODODESCRICAO: TStringField
      DisplayLabel = 'Dado Complementar'
      DisplayWidth = 40
      FieldName = 'ODODESCRICAO'
      Size = 40
    end
    object CdsOutroDadoIDOUTRODADO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOUTRODADO'
      Visible = False
    end
  end
end
