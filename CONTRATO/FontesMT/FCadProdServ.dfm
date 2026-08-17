inherited frmCadProdServ: TfrmCadProdServ
  Left = 310
  Top = 275
  Caption = 'Cadastro de Produtos e Serviços do Contrato'
  ClientHeight = 262
  ClientWidth = 651
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 651
    Height = 176
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 148
      Height = 13
      Caption = 'Nome do Serviço/Produto'
    end
    object Label2: TLabel
      Left = 384
      Top = 120
      Width = 34
      Height = 13
      Caption = 'Artigo'
    end
    object dbmemNomeServ: TDBMemo
      Left = 16
      Top = 32
      Width = 353
      Height = 129
      DataField = 'NOMEOBJETO'
      DataSource = ds
      MaxLength = 200
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object dbrgTipoObjeto: TDBRadioGroup
      Left = 384
      Top = 24
      Width = 249
      Height = 86
      Caption = ' Tipo do Objeto '
      DataField = 'TIPOOBJETO'
      DataSource = ds
      Items.Strings = (
        '&Serviço'
        '&Produto')
      TabOrder = 1
      Values.Strings = (
        'S'
        'M')
      OnChange = dbrgTipoObjetoChange
    end
    object dblcArtigo: TwwDBLookupCombo
      Left = 384
      Top = 136
      Width = 249
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CODARTIGO'#9'14'#9'Código'#9'F'
        'DESCPROD'#9'40'#9'Descrição'#9'F')
      DataField = 'CODARTIGO'
      DataSource = ds
      LookupTable = cdsArtigo
      LookupField = 'CODARTIGO'
      Enabled = False
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = False
    end
  end
  inherited Dock972: TDock97
    Width = 651
  end
  inherited Dock971: TDock97
    Top = 223
    Width = 651
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 546
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
    Left = 294
    Top = 65535
  end
  inherited ImlPadrao: TImageList
    Left = 488
    Top = 65535
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 352
    Top = 65535
  end
  inherited Cds: TCMClientDataSet
    Left = 252
    Top = 65535
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'OBJETOCONTRATUAL.NOMEOBJETO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Produto/Serviço')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'OBJETOCONTRATUAL')
    CamposChave.Strings = (
      'OBJETOCONTRATUAL.IDOBJETO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '200')
    Left = 424
    Top = 65535
  end
  object cdsArtigo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 548
    Top = 159
  end
  object spTeste: TCMSqlParams
    SQL.Strings = (
      'SELECT A.CODARTIGO, P.DESCPROD'
      'FROM ARTIGO A, PRODUTO P'
      'WHERE A.CODPRODUTO=P.CODPRODUTO'
      'ORDER BY P.DESCPROD')
    ClientDataSet = cdsArtigo
    Left = 544
    Top = 87
  end
end
