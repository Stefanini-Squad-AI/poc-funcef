inherited frmMTCadCaixaPeq: TfrmMTCadCaixaPeq
  Left = 129
  Top = 152
  HelpContext = 1130016
  Caption = 'Cadastro de Caixa Pequeno'
  ClientHeight = 329
  ClientWidth = 578
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 578
    Height = 243
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = edDesc
    end
    object Label4: TLabel
      Left = 24
      Top = 128
      Width = 112
      Height = 13
      Caption = 'Tipo de Documento'
      FocusControl = edDesc
    end
    object Label6: TLabel
      Left = 24
      Top = 176
      Width = 119
      Height = 13
      Caption = 'Forma de pagamento'
      FocusControl = edDesc
    end
    object Label2: TLabel
      Left = 288
      Top = 128
      Width = 83
      Height = 13
      Caption = 'Valor do Caixa'
      FocusControl = edDesc
    end
    object Label3: TLabel
      Left = 433
      Top = 128
      Width = 107
      Height = 13
      Caption = 'Valor Lançamento '
      FocusControl = edDesc
    end
    object Label5: TLabel
      Left = 288
      Top = 176
      Width = 99
      Height = 13
      Caption = 'Nº de Dias Venc.'
      FocusControl = edDesc
    end
    object edDesc: TDBEdit
      Left = 24
      Top = 32
      Width = 537
      Height = 21
      DataField = 'DESCCAIXAPEQ'
      DataSource = ds
      TabOrder = 0
    end
    object cmpFavo: TCMProcuraForCli
      Left = 24
      Top = 64
      Width = 537
      Height = 50
      Caption = ' Favorecido '
      TabOrder = 1
      CampoEdit = ceRazaoSocial
      MostraMensagens = True
      DataSource = ds
      DataField = 'IDFORCLI'
      Mensagens.EmBranco = 'Favorecido não pode estar em branco'
      Mensagens.NaoExiste = 'Favorecido não existe'
      PermiteChaveInvalida = False
      PermiteChaveEmBranco = False
      ForCli = fcFornecedor
      MostraEndereco = False
      StatusForCli = fcAll
      MostraStatusCredito = False
    end
    object dblcTipoDoc: TCMDBLookupCombo
      Left = 24
      Top = 144
      Width = 241
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'35'#9'Descrição')
      DataField = 'CODTIPDOC'
      DataSource = ds
      LookupTable = cdsTipoDoc
      LookupField = 'CODTIPDOC'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcForma: TCMDBLookupCombo
      Left = 24
      Top = 192
      Width = 241
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'35'#9'Descrição')
      DataField = 'CODFORMA'
      DataSource = ds
      LookupTable = cdsFormaPgto
      LookupField = 'CODFORMA'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object edValTot: TDBRealEdit
      Left = 288
      Top = 144
      Width = 129
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 3
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'VLRTOTCAIXAPEQ'
      DataSource = ds
    end
    object edValLanc: TDBRealEdit
      Left = 433
      Top = 144
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 4
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'VLRMAXLANC'
      DataSource = ds
    end
    object edNumDiasVenc: TDBRealEdit
      Left = 288
      Top = 192
      Width = 129
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0')
      TabOrder = 6
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = iNumber
      Signal = False
      DataField = 'NUMDIASVENC'
      DataSource = ds
    end
  end
  inherited Dock972: TDock97
    Width = 578
  end
  inherited Dock971: TDock97
    Top = 290
    Width = 578
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 1130016
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 77
    Top = 18
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 174
    Top = 18
  end
  inherited ImlPadrao: TImageList
    Left = 15
    Top = 15
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 310
    Top = 24
  end
  inherited Cds: TCMClientDataSet
    Left = 490
    Top = 54
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CAIXAPEQUENO.DESCCAIXAPEQ')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'CAIXAPEQUENO')
    CamposChave.Strings = (
      'CAIXAPEQUENO.IDCAIXAPEQUENO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    ExibePergunta = False
    Left = 466
    Top = 120
  end
  object cdsTipoDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 178
    Top = 184
  end
  object cdsFormaPgto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 182
    Top = 237
  end
end
