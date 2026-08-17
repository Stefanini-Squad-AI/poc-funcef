inherited frmCadServProdXItem: TfrmCadServProdXItem
  Left = 309
  Top = 261
  Caption = 'Cadastro de Produtos/Serviços X Item Contratual'
  ClientHeight = 280
  ClientWidth = 633
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 633
    Height = 194
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 94
      Height = 13
      Caption = 'Serviço/Produto'
    end
    object Label2: TLabel
      Left = 320
      Top = 16
      Width = 25
      Height = 13
      Caption = 'Item'
    end
    object Label3: TLabel
      Left = 320
      Top = 65
      Width = 196
      Height = 13
      Caption = 'Tipo de Recebimento/Desembolso'
    end
    object lblSubConta: TLabel
      Left = 320
      Top = 116
      Width = 55
      Height = 13
      Caption = 'Subconta'
    end
    object dbedtContaContabil: TCMProcuraMaskContabil
      Left = 16
      Top = 106
      Width = 289
      Height = 71
      Caption = ' Conta Contábil '
      TabOrder = 4
      MostraMensagens = True
      MostraDescricao = True
      DataSource = ds
      DataField = 'PLACONTA'
      Mensagens.EmBranco = 'Conta não pode estar em branco'
      Mensagens.NaoExiste = 'Conta não existe'
      Mensagens.Sintetica = 'Conta não pode ser sintética'
      Mensagens.Analitica = 'Conta não pode ser analítica'
      PermiteChaveInvalida = False
      PermiteChaveEmBranco = True
      AceitaTipoConta = SoAnalitica
      Plano = 0
      Status = scSoAtiva
    end
    object dblc: TwwDBLookupCombo
      Left = 16
      Top = 32
      Width = 289
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEOBJETO'#9'200'#9'Serviço/Produto'#9'F')
      DataField = 'IDOBJETO'
      DataSource = ds
      LookupField = 'IDOBJETO'
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object rgpRegimePagamento: TDBRadioGroup
      Left = 16
      Top = 55
      Width = 289
      Height = 45
      Caption = 'Regime de Pagamento'
      Columns = 2
      DataField = 'RECPAG'
      DataSource = ds
      Items.Strings = (
        'Contas a Pagar'
        'Contas a Receber')
      TabOrder = 2
      Values.Strings = (
        'P'
        'R')
    end
    object dblcItem: TwwDBLookupCombo
      Left = 320
      Top = 32
      Width = 289
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME_ITEM'#9'200'#9'Item'#9'F')
      DataField = 'IDITEM'
      DataSource = ds
      LookupField = 'IDITEM'
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcTipoRecebimento: TwwDBLookupCombo
      Left = 320
      Top = 81
      Width = 289
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'35'#9'Tipo de Rec/Des'#9'F'
        'CODTIPRECDES'#9'15'#9'Código'#9'F'
        'RECPAG'#9'1'#9'Tipo'#9'F'
        'PLACONTA'#9'18'#9#9'F')
      DataField = 'CODTIPRECDES'
      DataSource = ds
      LookupField = 'CODTIPRECDES'
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcSubConta: TwwDBLookupCombo
      Left = 320
      Top = 132
      Width = 289
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMESUBCONTA'#9'60'#9'NOMESUBCONTA'#9'No'
        'CODSUBCONTA'#9'10'#9'CODSUBCONTA'#9'No')
      DataField = 'CODSUBCONTA'
      DataSource = ds
      LookupField = 'CODSUBCONTA'
      Enabled = False
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock972: TDock97
    Width = 633
  end
  inherited Dock971: TDock97
    Top = 241
    Width = 633
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 578
    Top = 7
  end
  inherited ds: TwwDataSource
    Left = 374
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 448
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 264
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 332
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Left = 512
    Top = 7
  end
end
