inherited frmCadLojaMT: TfrmCadLojaMT
  Left = 221
  Top = 187
  HelpContext = 4390010
  Caption = 'Cadastro de Lojas'
  ClientHeight = 265
  ClientWidth = 459
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 459
    Height = 179
    object Label2: TLabel
      Left = 24
      Top = 69
      Width = 25
      Height = 13
      Caption = 'Piso'
    end
    object Label3: TLabel
      Left = 172
      Top = 69
      Width = 46
      Height = 13
      Caption = 'Nr. Loja'
    end
    object Label4: TLabel
      Left = 317
      Top = 69
      Width = 24
      Height = 13
      Caption = 'ABL'
    end
    object wwDBEdit2: TwwDBEdit
      Left = 24
      Top = 85
      Width = 105
      Height = 21
      DataField = 'PISO'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedtNumLoja: TwwDBEdit
      Left = 172
      Top = 85
      Width = 105
      Height = 21
      DataField = 'NUMLOJA'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbrbSituacao: TDBRadioGroup
      Left = 24
      Top = 118
      Width = 253
      Height = 44
      Caption = 'Situação'
      Columns = 2
      DataField = 'FLGSITUACAO'
      DataSource = ds
      Items.Strings = (
        'Ativa'
        'Inativa')
      TabOrder = 3
      Values.Strings = (
        'A'
        'I')
    end
    object dbedtAbl: TDBRealEdit
      Left = 317
      Top = 85
      Width = 105
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 2
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'QTDEABL'
      DataSource = ds
    end
    inline molImovelouMestre1: TmolImovelouMestre
      Left = 16
      Top = 16
      Width = 425
      TabOrder = 4
      inherited edtImovel: TEdit
        Width = 375
      end
      inherited btnBuscaImovel: TBitBtn
        Left = 382
      end
      inherited btnLimpaImovel: TBitBtn
        Left = 280
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock972: TDock97
    Width = 459
  end
  inherited Dock971: TDock97
    Top = 226
    Width = 459
    inherited tb97Fundo: TToolbar97
      Left = 289
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 122
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 18
    Top = 223
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 414
  end
  inherited ImlPadrao: TImageList
    Left = 72
    Top = 223
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyDelete
    Left = 312
  end
  inherited Cds: TCMClientDataSet
    Left = 372
    object CdsIDLOJA: TFloatField
      FieldName = 'IDLOJA'
    end
    object CdsIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object CdsNUMLOJA: TStringField
      FieldName = 'NUMLOJA'
      FixedChar = True
      Size = 5
    end
    object CdsQTDEABL: TFloatField
      FieldName = 'QTDEABL'
    end
    object CdsPISO: TStringField
      FieldName = 'PISO'
      FixedChar = True
      Size = 5
    end
    object CdsFLGSITUACAO: TStringField
      FieldName = 'FLGSITUACAO'
      FixedChar = True
      Size = 1
    end
    object CdsIMONOME: TStringField
      FieldName = 'IMONOME'
      Size = 60
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'IM.IMONOME'
      'I.IMONOME'
      'L.PISO'
      'L.NUMLOJA'
      'DECODE(L.FLGSITUACAO, '#39'A'#39', '#39'ATIVA'#39', '#39'INATIVA'#39')')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome do Mestre'
      'Nome do Imóvel'
      'Piso da Loja'
      'Nr. da Loja'
      'Situação')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'INDLOJA L'
      'IMOVEL I'
      'IMOVEL IM')
    CamposChave.Strings = (
      'L.IDLOJA')
    Filtro.Strings = (
      'L.IDIMOVEL = I.IDIMOVEL'
      'I.IDIMOVELMESTRE = IM.IDIMOVEL(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '30'
      '5'
      '5'
      '1')
    Left = 248
  end
end
