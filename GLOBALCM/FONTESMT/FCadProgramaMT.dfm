inherited frmCadPrograma: TfrmCadPrograma
  Left = 231
  Top = 187
  Caption = 'Programa Previdenciário'
  ClientHeight = 289
  ClientWidth = 520
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 520
    Height = 203
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 40
      Height = 13
      Caption = 'Código'
    end
    object Label2: TLabel
      Left = 16
      Top = 72
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object DbEdCodigo: TwwDBEdit
      Left = 16
      Top = 40
      Width = 121
      Height = 21
      DataField = 'CODPROGRAMA'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object DbEdDesc: TwwDBEdit
      Left = 16
      Top = 88
      Width = 481
      Height = 21
      DataField = 'DESCPROGRAMA'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object rdgTipo: TRadioGroup
      Left = 19
      Top = 117
      Width = 480
      Height = 73
      Caption = ' Tipo '
      Columns = 2
      Items.Strings = (
        'Previdencial'
        'Assistencial'
        'Investimentos'
        'Administrativo')
      TabOrder = 2
    end
  end
  inherited Dock972: TDock97
    Width = 520
  end
  inherited Dock971: TDock97
    Top = 250
    Width = 520
    inherited tb97Fundo: TToolbar97
      Left = 348
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 179
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 266
    Top = 79
  end
  inherited ds: TwwDataSource
    Left = 366
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 264
    Top = 31
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 448
    Top = 31
  end
  inherited Cds: TCMClientDataSet
    Left = 364
    Top = 55
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PROGRAMA.DESCPROGRAMA'
      'PROGRAMA.CODPROGRAMA')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Descrição'
      'Código')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PROGRAMA')
    CamposChave.Strings = (
      'PROGRAMA.IDPROGRAMA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '2')
    Left = 448
    Top = 79
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT IDPROGRAMA, DESCPROGRAMA, CODPROGRAMA, FLGTIPOPROGRAMA'
      'FROM PROGRAMA'
      'ORDER BY DESCPROGRAMA')
    ClientDataSet = Cds
    Left = 184
    Top = 95
  end
end
