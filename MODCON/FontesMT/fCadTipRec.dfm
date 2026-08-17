inherited frmCadTipRec: TfrmCadTipRec
  Left = 216
  Top = 159
  Caption = 'Cadastro de Tipos de Etapa (Andamento)'
  ClientHeight = 397
  ClientWidth = 381
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 381
    Height = 311
    BorderWidth = 2
    object Label1: TLabel
      Left = 17
      Top = 13
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 17
      Top = 56
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = dbedDescr
    end
    object Label3: TLabel
      Left = 261
      Top = 14
      Width = 100
      Height = 13
      Caption = 'Honorário Padrão'
    end
    object dbedCodigo: TDBEdit
      Left = 17
      Top = 28
      Width = 114
      Height = 21
      DataField = 'CODTIPORECURSO'
      DataSource = ds
      MaxLength = 15
      TabOrder = 0
    end
    object dbedDescr: TDBEdit
      Left = 17
      Top = 71
      Width = 344
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
    end
    object dbredHorarioPad: TDBRealEdit
      Left = 261
      Top = 29
      Width = 100
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
      DataField = 'VALORHONOR'
      DataSource = ds
    end
    object rgPenhora: TDBRadioGroup
      Left = 17
      Top = 102
      Width = 119
      Height = 46
      Caption = 'Envolve Penhora'
      Columns = 2
      DataField = 'FLGPENHORA'
      DataSource = ds
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 3
      Values.Strings = (
        '1'
        '0')
    end
    object rgEncerramento: TDBRadioGroup
      Left = 144
      Top = 101
      Width = 217
      Height = 46
      Caption = 'Implica Encerramento do Processo'
      Columns = 2
      DataField = 'FLGENCERRAMENTO'
      DataSource = ds
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 4
      Values.Strings = (
        '1'
        '0')
    end
    object gbxRecursos: TGroupBox
      Left = 17
      Top = 210
      Width = 344
      Height = 86
      Caption = 'Indice e Juros para Atualização Monet. de Recursos'
      TabOrder = 5
      Visible = False
      object Label4: TLabel
        Left = 80
        Top = 56
        Width = 28
        Height = 13
        Caption = '% ao'
      end
      object dblckIndRecursos: TwwDBLookupCombo
        Left = 12
        Top = 18
        Width = 320
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'MOEDESC'#9'20'#9'Descrição'
          'MOESIGLA'#9'10'#9'Sigla')
        DataField = 'MOECODIGO'
        DataSource = ds
        LookupTable = CdsMoeda
        LookupField = 'MOECODIGO'
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
      end
      object dbredJurosRecursos1: TDBRealEdit
        Left = 12
        Top = 53
        Width = 65
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'TAXAJUROS'
        DataSource = ds
      end
      object dbrgIndJuros: TDBRadioGroup
        Left = 112
        Top = 40
        Width = 219
        Height = 39
        Columns = 4
        DataField = 'INDJUROS'
        DataSource = ds
        Items.Strings = (
          'Mês'
          'Trim.'
          'Sem.'
          'Ano')
        TabOrder = 2
        Values.Strings = (
          '0'
          '1'
          '2'
          '3')
      end
    end
    object dbrgFlgExec: TDBRadioGroup
      Left = 17
      Top = 157
      Width = 343
      Height = 46
      Caption = 'Coloca o Processo em Fase de Execução'
      Columns = 2
      DataField = 'FLGEXECUCAO'
      DataSource = ds
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 6
      Values.Strings = (
        '1'
        '0')
    end
  end
  inherited Dock972: TDock97
    Width = 381
  end
  inherited Dock971: TDock97
    Top = 358
    Width = 381
    inherited tb97Fundo: TToolbar97
      Left = 209
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 40
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 200
    Top = 65
    TargetsData = (
      1
      2
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 302
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 200
    Top = 51
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 139
    Top = 65
  end
  inherited Cds: TCMClientDataSet
    Left = 274
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Tipo de Etapa'
    Colunas.Strings = (
      'TIPORECTRAB.CODTIPORECURSO'
      'TIPORECTRAB.DESCRICAO')
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
      'TIPORECTRAB')
    CamposChave.Strings = (
      'TIPORECTRAB.CODTIPORECURSO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '17'
      '45')
    ExibePergunta = False
    Left = 139
    Top = 51
  end
  object CdsMoeda: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsMoedaIndex'
        CaseInsFields = 'MOEDESC'
        Fields = 'MOEDESC'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsMoedaIndex'
    Params = <>
    ProviderName = 'Dsp'
    StoreDefs = True
    Left = 210
    Top = 217
  end
end
