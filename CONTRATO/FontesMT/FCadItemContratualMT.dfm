inherited frmCadItemContratualMT: TfrmCadItemContratualMT
  Left = 135
  Top = 159
  HelpContext = 120006
  Caption = 'Cadastro de Itens Contratuais'
  ClientWidth = 689
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 689
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 79
      Height = 13
      Caption = 'Nome do Item'
    end
    object dbmemItem: TDBMemo
      Left = 16
      Top = 32
      Width = 329
      Height = 153
      DataField = 'NOME_ITEM'
      DataSource = ds
      MaxLength = 200
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object dbrgTipoCobranca: TDBRadioGroup
      Left = 352
      Top = 16
      Width = 321
      Height = 169
      Caption = ' Tipo de Cobrança '
      DataField = 'TIPOCOBRANCA'
      DataSource = ds
      Items.Strings = (
        'Periódica sem medição'
        'Periódica com medição de quantidade'
        'Periódica com medição de valor'
        'Eventual por apontamento de quantidade'
        'Eventual por apontamento de valor')
      TabOrder = 1
      Values.Strings = (
        'PS'
        'PQ'
        'PV'
        'EQ'
        'EV')
    end
  end
  inherited Dock972: TDock97
    Width = 689
  end
  inherited Dock971: TDock97
    Width = 689
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 466
    Top = 65535
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 302
    Top = 65535
  end
  inherited ImlPadrao: TImageList
    Left = 416
    Top = 65535
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 352
    Top = 65535
  end
  inherited Cds: TCMClientDataSet
    Left = 264
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'ITEMCONTRATUAL.IDITEM'
      'ITEMCONTRATUAL.NOME_ITEM')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'ITEMCONTRATUAL')
    CamposChave.Strings = (
      'ITEMCONTRATUAL.IDITEM')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '200')
    Left = 528
    Top = 65535
  end
end
