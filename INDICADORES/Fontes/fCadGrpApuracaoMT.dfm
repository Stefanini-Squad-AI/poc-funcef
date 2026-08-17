inherited frmCadGrpApuracaoMT: TfrmCadGrpApuracaoMT
  Left = 218
  Top = 170
  HelpContext = 4390021
  Caption = 'Cadastro de Grupo de Apuração'
  ClientHeight = 283
  ClientWidth = 480
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 480
    Height = 197
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbrgTipoGrupo: TDBRadioGroup
      Left = 87
      Top = 80
      Width = 305
      Height = 97
      Caption = 'Tipo de Grupo'
      Columns = 2
      DataField = 'TIPOGRUPO'
      DataSource = ds
      Items.Strings = (
        'Centro de Custo'
        'Função / Cargo'
        'Grupo de Abono'
        'Inadimplência'
        'Hotel'
        'Outros')
      TabOrder = 0
      Values.Strings = (
        'C'
        'F'
        'A'
        'I'
        'H'
        'O')
    end
    object dbedtDescricao: TwwDBEdit
      Left = 24
      Top = 40
      Width = 433
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 480
  end
  inherited Dock971: TDock97
    Top = 244
    Width = 480
    inherited tb97Fundo: TToolbar97
      Left = 310
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 143
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 18
    Top = 215
  end
  inherited ds: TwwDataSource
    Left = 350
  end
  inherited ImlPadrao: TImageList
    Left = 80
    Top = 215
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
    Left = 304
  end
  inherited Cds: TCMClientDataSet
    Left = 396
    object CdsIDGRPAPURACAO: TFloatField
      FieldName = 'IDGRPAPURACAO'
    end
    object CdsDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CdsTIPOGRUPO: TStringField
      FieldName = 'TIPOGRUPO'
      FixedChar = True
      Size = 1
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'GA.DESCRICAO'
      
        'DECODE(GA.TIPOGRUPO,'#39'C'#39','#39'CENTRO DE CUSTO'#39','#39'F'#39','#39'FUNCAO'#39','#39'A'#39','#39'GRUP' +
        'O DE ABONO'#39','#39'I'#39','#39'INADIMPLENCIA'#39','#39'H'#39','#39'HOTEL'#39','#39'OUTROS'#39')')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Descrição'
      'Tipo de Grupo')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'INDGRPAPURACAO GA')
    CamposChave.Strings = (
      'GA.IDGRPAPURACAO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '20')
    Left = 256
  end
end
