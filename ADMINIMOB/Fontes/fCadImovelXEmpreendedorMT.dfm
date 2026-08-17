inherited FrmCadImovelXEmpreendedorMT: TFrmCadImovelXEmpreendedorMT
  Left = 278
  Top = 101
  HelpContext = 640095
  Caption = 'Composição Societária'
  ClientHeight = 255
  ClientWidth = 399
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 100
    Width = 399
    Height = 116
    inherited dbGrd: TwwDBGrid [0]
      Width = 397
      Height = 114
      Selected.Strings = (
        'NOME'#9'39'#9'Nome'#9'F'
        'PERCENTUAL'#9'10'#9'Percentual')
    end
    inherited pnlControles: TPanel [1]
      Width = 397
      Height = 114
      object Label2: TLabel
        Left = 20
        Top = 10
        Width = 82
        Height = 13
        Caption = 'Empreendedor'
      end
      object Label4: TLabel
        Left = 20
        Top = 58
        Width = 62
        Height = 13
        Caption = 'Percentual'
      end
      object dbCboEmpreendedor: TwwDBLookupCombo
        Left = 20
        Top = 26
        Width = 345
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME'#9'F')
        DataField = 'IDPROPRIETARIOUH'
        DataSource = ds
        LookupTable = CdsEmpreendedor
        LookupField = 'IDPESSOA'
        DropDownWidth = 385
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object DBedtValor: TDBEdit
        Left = 20
        Top = 72
        Width = 105
        Height = 21
        DataField = 'PERCENTUAL'
        DataSource = ds
        TabOrder = 1
      end
    end
  end
  inherited Dock972: TDock97
    Width = 399
  end
  inherited Dock971: TDock97
    Top = 216
    Width = 399
    inherited tb97Fundo: TToolbar97
      Left = 227
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 58
    end
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 47
    Width = 399
    Height = 53
    Align = alTop
    TabOrder = 3
    inline molImovelMestre1: TmolImovelMestre
      Left = 16
      Top = 7
      inherited btnBuscaImovel: TBitBtn
        OnClick = molImovelMestre1btnBuscaImovelClick
      end
      inherited btnLimpaImovel: TBitBtn
        Left = 232
        Enabled = False
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 18
    Top = 207
  end
  inherited ds: TwwDataSource
    Left = 351
    Top = 4
  end
  inherited ImlPadrao: TImageList
    Left = 16
    Top = 191
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyEdit
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyEdit
    Left = 265
    Top = 3
  end
  inherited Cds: TCMClientDataSet
    Active = True
    FieldDefs = <
      item
        Name = 'IDIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'IDPROPRIETARIOUH'
        DataType = ftFloat
      end
      item
        Name = 'PERCENTUAL'
        DataType = ftFloat
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <
      item
        Name = 'IdxProprietarioUH'
        Fields = 'IDPROPRIETARIOUH'
        Options = [ixUnique]
      end>
    IndexName = 'IdxProprietarioUH'
    StoreDefs = True
    Left = 315
    Top = 3
    Data = {
      7D0000009619E0BD0100000018000000040000000000030000007D0008494449
      4D4F56454C080004000000000010494450524F50524945544152494F55480800
      0400000000000A50455243454E5455414C0800040000000000044E4F4D450100
      490000000100055749445448020002003C000100044C43494404000100090800
      00}
    object CdsNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 39
      FieldName = 'NOME'
      Size = 60
    end
    object CdsPERCENTUAL: TFloatField
      DisplayLabel = 'Percentual'
      DisplayWidth = 10
      FieldName = 'PERCENTUAL'
      DisplayFormat = '###,##0.00'
    end
    object CdsIDIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDIMOVEL'
      Visible = False
    end
    object CdsIDPROPRIETARIOUH: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPROPRIETARIOUH'
      Visible = False
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'I.IMONOME'
      'P.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Imóvel Mestre'
      'Empreendedor')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'IMOVELXPROP IM'
      'PESSOA P'
      'IMOVEL I')
    CamposChave.Strings = (
      'IM.IDIMOVEL'
      'IM.IDPROPRIETARIOUH'
      'IM.PERCENTUAL'
      'P.NOME'
      'I.IMONOME')
    Filtro.Strings = (
      'IM.IDPROPRIETARIOUH = P.IDPESSOA'
      'I.IDIMOVEL = IM.IDIMOVEL')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '30'
      '30')
    Left = 112
    Top = 31
  end
  object CdsEmpreendedor: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 248
    Top = 47
    object CdsEmpreendedorNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Size = 60
    end
    object CdsEmpreendedorIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      '/*SELECT * FROM IMOVELXPROP*/'
      ''
      'SELECT IM.IDIMOVEL, IM.IDPROPRIETARIOUH,'
      '       IM.PERCENTUAL, P.NOME'
      '  FROM IMOVELXPROP IM, PESSOA P'
      ' WHERE IM.IDPROPRIETARIOUH = P.IDPESSOA ')
    Left = 177
    Top = 47
  end
end
