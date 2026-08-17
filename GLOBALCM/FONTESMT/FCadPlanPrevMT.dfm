inherited FrmCadPlanPrev: TFrmCadPlanPrev
  Left = 420
  Top = 156
  Caption = 'Cadastro de plano previdenciário'
  ClientHeight = 192
  ClientWidth = 514
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 514
    Height = 106
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 33
      Height = 13
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 8
      Top = 56
      Width = 86
      Height = 13
      Caption = 'Código de SPC'
    end
    object Label3: TLabel
      Left = 144
      Top = 60
      Width = 85
      Height = 13
      Caption = 'Título Contábil'
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 27
      Width = 489
      Height = 21
      DataField = 'Nome'
      DataSource = ds
      TabOrder = 0
    end
    object dbeSPC: TDBEdit
      Left = 9
      Top = 73
      Width = 121
      Height = 21
      DataField = 'CodigoSPC'
      DataSource = ds
      TabOrder = 1
    end
    object DBEdit2: TDBEdit
      Left = 144
      Top = 75
      Width = 353
      Height = 21
      DataField = 'TITULOCONTAB'
      DataSource = ds
      TabOrder = 2
    end
  end
  inherited Dock972: TDock97
    Width = 514
  end
  inherited Dock971: TDock97
    Top = 153
    Width = 514
    inherited tb97Fundo: TToolbar97
      Left = 342
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 173
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 442
    Top = 65535
  end
  inherited ds: TwwDataSource
    Left = 406
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 360
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 296
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    Left = 252
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PLANPREV.IDPLANOPREV'
      'PLANPREV.NOME')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código do Plano'
      'Nome do Plano')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PLANPREV')
    CamposChave.Strings = (
      'PLANPREV.IDPLANOPREV')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '50')
    OperComparador.Strings = (
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 464
    Top = 39
  end
end
