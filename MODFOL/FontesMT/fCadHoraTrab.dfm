inherited frmCadHoraTrab: TfrmCadHoraTrab
  Left = 372
  Top = 207
  HelpContext = 210027
  Caption = 'Cadastro de Horários de Trabalho'
  ClientHeight = 354
  ClientWidth = 523
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 523
    Height = 268
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
      Left = 141
      Top = 13
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = dbedDescr
    end
    object Label3: TLabel
      Left = 17
      Top = 119
      Width = 133
      Height = 13
      Caption = 'Jornada Mensal (horas)'
      FocusControl = dbedJornada
    end
    object lblJornDiaria: TLabel
      Left = 17
      Top = 167
      Width = 138
      Height = 13
      Caption = 'Jornada Diária (minutos)'
      FocusControl = dbedJornada
    end
    object dbedCodigo: TDBEdit
      Left = 17
      Top = 28
      Width = 114
      Height = 21
      DataField = 'IDHORARIO'
      DataSource = ds
      MaxLength = 15
      TabOrder = 0
    end
    object dbedDescr: TDBEdit
      Left = 141
      Top = 28
      Width = 290
      Height = 21
      DataField = 'NOMEHORARIO'
      DataSource = ds
      TabOrder = 1
    end
    object dbrgTipoHorario: TDBRadioGroup
      Left = 17
      Top = 55
      Width = 176
      Height = 58
      Caption = 'Tipo de Horário'
      DataField = 'FLGTIPOHORARIO'
      DataSource = ds
      Items.Strings = (
        'Fixo na Semana'
        'Escala Rotativa')
      TabOrder = 2
      Values.Strings = (
        '0'
        '1')
      OnChange = dbrgTipoHorarioChange
    end
    object dbedJornada: TDBEdit
      Left = 17
      Top = 133
      Width = 91
      Height = 21
      DataField = 'JORNADAMENSAL'
      DataSource = ds
      MaxLength = 3
      TabOrder = 3
    end
    object gbxEscala: TGroupBox
      Left = 206
      Top = 55
      Width = 225
      Height = 99
      Caption = 'Qtde. de Horas da Escala'
      TabOrder = 5
      object Label4: TLabel
        Left = 53
        Top = 20
        Width = 43
        Height = 13
        Caption = 'Folga 1'
        FocusControl = dbedJornada
      end
      object Label5: TLabel
        Left = 53
        Top = 46
        Width = 44
        Height = 13
        Caption = 'Serviço'
        FocusControl = dbedJornada
      end
      object Label6: TLabel
        Left = 53
        Top = 72
        Width = 43
        Height = 13
        Caption = 'Folga 2'
        FocusControl = dbedJornada
      end
      object dbreFolga1: TDBRealEdit
        Left = 134
        Top = 16
        Width = 60
        Height = 21
        Hint = 
          'Entre Zero Hora da Data Ref. (Início do 1.o Ciclo) e Início do S' +
          'erviço'
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'HORASFOLGA1'
        DataSource = ds
      end
      object dbreServico: TDBRealEdit
        Left = 134
        Top = 42
        Width = 60
        Height = 21
        Hint = 'Horas de Trabalho na Escala'
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'HORASSERVICO'
        DataSource = ds
      end
      object dbreFolga2: TDBRealEdit
        Left = 134
        Top = 68
        Width = 60
        Height = 21
        Hint = 'Entre Final do Serviço e Início do Próximo Ciclo'
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'HORASFOLGA2'
        DataSource = ds
      end
    end
    object dbedJornadaDiaria: TDBEdit
      Left = 17
      Top = 181
      Width = 91
      Height = 21
      DataField = 'JORNADADIARIA'
      DataSource = ds
      MaxLength = 4
      TabOrder = 4
    end
  end
  inherited Dock972: TDock97
    Width = 523
  end
  inherited Dock971: TDock97
    Top = 315
    Width = 523
    inherited tb97Fundo: TToolbar97
      Left = 329
      DockPos = 329
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 160
      DockPos = 160
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 322
    Top = 14
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 322
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 390
    Top = 13
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Horário de Trabalho'
    Colunas.Strings = (
      'HORATRAB.IDHORARIO'
      'HORATRAB.NOMEHORARIO')
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
      'HORATRAB')
    CamposChave.Strings = (
      'HORATRAB.IDHORARIO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '17'
      '45')
    ExibePergunta = False
    Left = 390
    Top = 1
  end
end
