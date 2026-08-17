inherited frmCadSegAcid: TfrmCadSegAcid
  Left = 118
  Top = 260
  HelpContext = 210039
  Caption = 'Cadastro dos Seguros de Acidentes do Trabalho'
  ClientHeight = 195
  ClientWidth = 560
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 560
    Height = 109
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
      Left = 136
      Top = 13
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object Label3: TLabel
      Left = 17
      Top = 58
      Width = 109
      Height = 13
      Caption = '% de Recolhimento'
    end
    object dbedCodigo: TDBEdit
      Left = 17
      Top = 28
      Width = 84
      Height = 21
      DataField = 'IDSEGACIDTRAB'
      DataSource = ds
      TabOrder = 0
    end
    object dbedDescr: TwwDBEdit
      Left = 136
      Top = 28
      Width = 408
      Height = 69
      AutoSize = False
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      UsePictureMask = False
      WantReturns = False
      WordWrap = True
    end
    object dbredPerc: TDBRealEdit
      Left = 17
      Top = 73
      Width = 109
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
      DataField = 'PERCSEGACIDTRAB'
      DataSource = ds
    end
  end
  inherited Dock972: TDock97
    Width = 560
  end
  inherited Dock971: TDock97
    Top = 156
    Width = 560
    inherited tb97Fundo: TToolbar97
      Left = 390
      DockPos = 451
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 223
      DockPos = 284
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 433
    Top = 15
    TargetsData = (
      1
      3
      (
        'TMemo'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 302
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 433
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 502
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    Left = 274
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Seguro de Acidentes do Trabalho'
    Colunas.Strings = (
      'SEGACIDTRAB.IDSEGACIDTRAB'
      'SEGACIDTRAB.DESCRICAO')
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
      'SEGACIDTRAB')
    CamposChave.Strings = (
      'SEGACIDTRAB.IDSEGACIDTRAB')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '17'
      '125')
    ExibePergunta = False
    Left = 502
    Top = 1
  end
end
