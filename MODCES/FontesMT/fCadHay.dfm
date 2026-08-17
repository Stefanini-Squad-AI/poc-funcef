inherited frmCadHay: TfrmCadHay
  Left = 216
  Top = 183
  HelpContext = 740013
  Caption = 'Tabela Hay'
  ClientHeight = 207
  ClientWidth = 337
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 337
    Height = 121
    BorderWidth = 2
    object Label1: TLabel
      Left = 18
      Top = 21
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 17
      Top = 66
      Width = 85
      Height = 13
      Caption = 'Limite (Pontos)'
    end
    object Label3: TLabel
      Left = 216
      Top = 21
      Width = 106
      Height = 13
      Caption = 'Fator Multiplicador'
      FocusControl = dbredMultiplicador
    end
    object Label4: TLabel
      Left = 216
      Top = 66
      Width = 89
      Height = 13
      Caption = 'Parcela (+ ou -)'
      FocusControl = dbredMultiplicador
    end
    object dbedCodigo: TDBEdit
      Left = 17
      Top = 35
      Width = 85
      Height = 21
      TabStop = False
      Color = clGray
      DataField = 'IDTABELAHAY'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 15
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object dbredMultiplicador: TDBRealEdit
      Left = 216
      Top = 35
      Width = 106
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 2
      WordWrap = False
      IntDigits = 10
      DecDigits = 4
      NumberFormat = fNumber
      Signal = False
      DataField = 'MULTIPLICADOR'
      DataSource = ds
    end
    object dbredLimite: TDBRealEdit
      Left = 16
      Top = 79
      Width = 85
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 1
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = fNumber
      Signal = False
      DataField = 'LIMITE'
      DataSource = ds
    end
    object dbredParcela: TDBRealEdit
      Left = 216
      Top = 79
      Width = 106
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 3
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = True
      DataField = 'PARCELA'
      DataSource = ds
    end
  end
  inherited Dock972: TDock97
    Width = 337
  end
  inherited Dock971: TDock97
    Top = 168
    Width = 337
    inherited tb97Fundo: TToolbar97
      Left = 167
      DockPos = 247
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 79
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 295
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
    Left = 166
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 295
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 221
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    Left = 138
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Tabela Hay'
    Colunas.Strings = (
      'IDTABELAHAY'
      'LIMITE'
      'MULTIPLICADOR'
      'PARCELA')
    TipodeDado.Strings = (
      'N'
      'N'
      'N'
      'N')
    Descricao.Strings = (
      'Código'
      'Limite de Pontos'
      'Fator Multiplicador'
      'Parcela (+ ou -)')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'TABELAHAY')
    CamposChave.Strings = (
      'IDTABELAHAY')
    Larguras.Strings = (
      '20'
      '20'
      '20'
      '20')
    ExibePergunta = False
    Left = 221
    Top = 1
  end
end
