inherited frmCadOutroDadoXPropMT: TfrmCadOutroDadoXPropMT
  HelpContext = 640050
  Caption = 'Cadastro de Dados Complementares para Proposta de Novos Negócios'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited dbGrd: TwwDBGrid [0]
      Top = 65
      Height = 131
    end
    inherited pnlControles: TPanel [1]
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
        DataField = 'ODPVALOR'
        DataSource = ds
        TabOrder = 1
      end
    end
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 497
      Height = 60
      Align = alTop
      TabOrder = 2
      inline molPropostaNegocio1: TmolPropostaNegocio
        Left = 32
        Top = 8
        Width = 417
        inherited edtProposta: TEdit
          Width = 337
        end
        inherited btnBuscaProposta: TBitBtn
          Left = 344
          OnClick = molPropostaNegocio1btnBuscaPropostaClick
        end
        inherited btnLimpaProposta: TBitBtn
          Left = 368
        end
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 50
    Top = 65511
  end
  inherited ds: TwwDataSource
    Left = 254
    Top = 7
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
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 252
    Top = 23
    object CdsODODESCRICAO: TStringField
      DisplayLabel = 'Outro Dado'
      FieldName = 'ODODESCRICAO'
      Size = 40
    end
    object CdsODPVALOR: TStringField
      DisplayLabel = 'valor para "outro dado"'
      FieldName = 'ODPVALOR'
      Size = 60
    end
    object CdsIDPROPOSTA: TFloatField
      FieldName = 'IDPROPOSTA'
      Visible = False
    end
    object CdsIDOUTRODADO: TFloatField
      FieldName = 'IDOUTRODADO'
      Visible = False
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'P.PRONUMERO'
      'P.PRONOME'
      'O.ODODESCRICAO'
      'OP.ODPVALOR')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Número Proposta'
      'Descrição Proposta'
      'Outro Dado'
      'Valor para "outro dado"')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'OUTRODADOXPROP OP'
      'OUTRODADO O'
      'PROPOSTANOVONEGOC P')
    CamposChave.Strings = (
      'OP.IDPROPOSTA'
      'P.PRONUMERO'
      'P.PRONOME')
    Filtro.Strings = (
      'OP.IDOUTRODADO = O.IDOUTRODADO'
      'OP.IDPROPOSTA = P.IDPROPOSTA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '60'
      '20'
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
