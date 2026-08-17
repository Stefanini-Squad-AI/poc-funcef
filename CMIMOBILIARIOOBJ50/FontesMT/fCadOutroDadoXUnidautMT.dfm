inherited frmCadOutroDadoXUnidautMT: TfrmCadOutroDadoXUnidautMT
  Top = 173
  HelpContext = 640051
  Caption = 'Cadastro de Dados Complementares de Unidades Autônomas'
  ClientHeight = 297
  ClientWidth = 512
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 512
    Height = 211
    inherited dbGrd: TwwDBGrid [0]
      Top = 97
      Width = 502
      Height = 109
    end
    inherited pnlControles: TPanel [1]
      Top = 97
      Width = 502
      Height = 109
      object Label2: TLabel
        Left = 40
        Top = 10
        Width = 161
        Height = 13
        Caption = 'Tipo de Dado Complementar'
      end
      object Label4: TLabel
        Left = 40
        Top = 58
        Width = 107
        Height = 13
        Caption = 'Valor "outro dado"'
      end
      object dbCboOutroDado: TwwDBLookupCombo
        Left = 40
        Top = 26
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
        Top = 72
        Width = 385
        Height = 21
        DataField = 'ODUVALOR'
        DataSource = ds
        TabOrder = 1
      end
    end
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 502
      Height = 92
      Align = alTop
      TabOrder = 2
      inline molUnidAutonoma1: TmolUnidAutonoma
        Left = 32
        Top = 6
        Width = 409
        Height = 81
        inherited edtImovel: TEdit
          Width = 385
        end
        inherited btnBuscaUnidaut: TBitBtn
          Left = 368
          OnClick = molUnidAutonoma1btnBuscaUnidautClick
        end
        inherited btnLimpaUnidaut: TBitBtn
          Left = 360
          Top = 32
          Enabled = False
          Visible = False
        end
        inherited edtUnidaut: TEdit
          Width = 361
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 512
  end
  inherited Dock971: TDock97
    Top = 258
    Width = 512
    inherited tb97Fundo: TToolbar97
      Left = 342
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 175
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
    Left = 284
    object CdsODODESCRICAO: TStringField
      DisplayLabel = 'Outro Dado'
      FieldName = 'ODODESCRICAO'
      Size = 40
    end
    object CdsODUVALOR: TStringField
      DisplayLabel = 'Valor para "outro dado"'
      FieldName = 'ODUVALOR'
      Size = 60
    end
    object CdsIDOUTRODADO: TFloatField
      FieldName = 'IDOUTRODADO'
      Visible = False
    end
    object CdsIDUNIDAUT: TFloatField
      FieldName = 'IDUNIDAUT'
      Visible = False
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'IM.IMONOME'
      'I.IMONOME'
      'U.UNANOME'
      'O.ODODESCRICAO'
      'OU.ODUVALOR')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Imóvel Mestre'
      'Imóvel'
      'Unidade Autônoma'
      'Outro Dado'
      'Valor "outro dado"')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'IMOVEL I'
      'IMOVEL IM'
      'OUTRODADO O'
      'UNIDAUT U'
      'OUTRODADOXUNIDAUT OU')
    CamposChave.Strings = (
      'OU.IDUNIDAUT'
      'OU.IDOUTRODADO'
      'IM.IMONOME'
      'I.IMONOME'
      'U.UNANOME')
    Filtro.Strings = (
      'OU.IDOUTRODADO = O.IDOUTRODADO'
      'OU.IDUNIDAUT = U.IDUNIDAUT'
      'U.IDIMOVEL = I.IDIMOVEL'
      'I.IDIMOVELMESTRE = IM.IDIMOVEL')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '40'
      '60'
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
    Top = 151
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
