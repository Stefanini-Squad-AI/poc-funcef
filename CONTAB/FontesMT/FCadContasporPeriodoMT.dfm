inherited frmCadContasporPeriodoMT: TfrmCadContasporPeriodoMT
  Left = 341
  Top = 159
  Caption = 'Agrupamento e Desmembramento de Contas'
  ClientHeight = 403
  ClientWidth = 405
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 405
    Height = 317
    object lblNome: TLabel
      Left = 16
      Top = 150
      Width = 88
      Height = 13
      Caption = 'Nome da Conta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblPeriodo: TLabel
      Left = 16
      Top = 58
      Width = 46
      Height = 13
      Caption = 'Período'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblExercicio: TLabel
      Left = 16
      Top = 16
      Width = 55
      Height = 13
      Caption = 'Exercício'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object gbAS: TGroupBox
      Left = 15
      Top = 193
      Width = 376
      Height = 105
      Caption = ' Desmembramento - Criação da conta analítica '
      TabOrder = 0
      object Label1: TLabel
        Left = 6
        Top = 59
        Width = 143
        Height = 13
        Caption = 'Nome da Conta Analítica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 6
        Top = 17
        Width = 247
        Height = 13
        Caption = 'Complemento do Código da Conta Analítica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edComplContaAnalitica: TEdit
        Left = 6
        Top = 33
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object edNomeContaAnalitica: TEdit
        Left = 6
        Top = 75
        Width = 352
        Height = 21
        TabOrder = 1
      end
    end
    object dbedNomeConta: TwwDBEdit
      Left = 16
      Top = 164
      Width = 367
      Height = 21
      DataField = 'PLANOME'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbrgTipo: TDBRadioGroup
      Left = 16
      Top = 101
      Width = 250
      Height = 43
      Caption = ' Tipo '
      Columns = 2
      DataField = 'PLATIPO'
      DataSource = ds
      Items.Strings = (
        '&Sintética'
        '&Analítica')
      TabOrder = 2
      Values.Strings = (
        'S'
        'A')
    end
    object dblkPeriodo: TwwDBLookupCombo
      Left = 16
      Top = 74
      Width = 137
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'PERNOME'#9'25'#9'Nome')
      DataField = 'PERNUMERO'
      DataSource = ds
      LookupTable = cdsPeriodo
      LookupField = 'PERNUMERO'
      Style = csDropDownList
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object dblkExercicio: TwwDBLookupCombo
      Left = 16
      Top = 32
      Width = 133
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'PEREXERCICIO'#9'10'#9'Exercício')
      DataField = 'PEREXERCICIO'
      DataSource = ds
      LookupTable = cdsExercicio
      LookupField = 'PEREXERCICIO'
      Style = csDropDownList
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnCloseUp = dblkExercicioCloseUp
    end
    object cmConta: TCMProcuraMaskContabil
      Left = 169
      Top = 15
      Width = 217
      Height = 85
      Caption = ' Conta Contábil '
      TabOrder = 5
      OnExit = cmContaExit
      MostraMensagens = True
      MostraDescricao = True
      DataSource = ds
      DataField = 'PLACONTA'
      Mensagens.EmBranco = 'Conta não pode estar em branco'
      Mensagens.NaoExiste = 'Conta não existe'
      Mensagens.Sintetica = 'Conta não pode ser sintética'
      Mensagens.Analitica = 'Conta não pode ser analítica'
      PermiteChaveInvalida = False
      PermiteChaveEmBranco = False
      AceitaTipoConta = Indiferente
      Plano = 0
      Status = scSoAtiva
    end
    object dbckInativa: TDBCheckBox
      Left = 283
      Top = 127
      Width = 97
      Height = 17
      Caption = 'Inativa?'
      DataField = 'PLAINATIVA'
      DataSource = ds
      TabOrder = 6
      ValueChecked = 'I'
      ValueUnchecked = 'A'
    end
  end
  inherited Dock972: TDock97
    Width = 405
  end
  inherited Dock971: TDock97
    Top = 364
    Width = 405
    inherited tb97Fundo: TToolbar97
      Left = 233
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 64
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 66
    Top = 415
  end
  inherited ds: TwwDataSource
    Left = 158
    Top = 15
  end
  inherited ImlPadrao: TImageList
    Left = 16
    Top = 415
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 328
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 212
    Top = 15
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PLANOCONTAPER.PLACONTA'
      'PLANOCONTAPER.PLATIPO'
      'PLANOCONTAPER.PLANOME'
      'PLANOCONTAPER.PEREXERCICIO'
      'PERIODO.PERNOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Conta Contábil'
      'A/S'
      'Nome'
      'Exercício'
      'Período')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PLANOCONTAPER'
      'PERIODO')
    CamposChave.Strings = (
      'PLANOCONTAPER.IDPLANOCONTAPER')
    Filtro.Strings = (
      'PLANOCONTAPER.IDPESSOA = PERIODO.IDPESSOA'
      'PLANOCONTAPER.PEREXERCICIO = PERIODO.PEREXERCICIO'
      'PLANOCONTAPER.PERNUMERO = PERIODO.PERNUMERO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '18'
      '1'
      '60'
      '10'
      '25')
    Left = 128
    Top = 76
  end
  object cdsExercicio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 192
    Top = 279
  end
  object cdsPeriodo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 271
    Top = 280
  end
  object cdsPlanoConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 344
    Top = 279
  end
end
