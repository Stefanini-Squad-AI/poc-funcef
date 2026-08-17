inherited frmCadWebTpReports: TfrmCadWebTpReports
  Left = 380
  Top = 251
  HelpContext = 360015
  Caption = 'Cadastro de Tipos de Relatório'
  ClientHeight = 178
  ClientWidth = 512
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 512
    Height = 92
    object Label1: TLabel
      Left = 78
      Top = 24
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = edDesc
    end
    object lblFlgTipo: TLabel
      Left = 16
      Top = 72
      Width = 91
      Height = 13
      Caption = 'NÃO EDITÁVEL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label2: TLabel
      Left = 6
      Top = 24
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = edDesc
    end
    object edDesc: TDBEdit
      Left = 80
      Top = 40
      Width = 418
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 0
    end
    object edId: TDBEdit
      Left = 8
      Top = 40
      Width = 65
      Height = 21
      DataField = 'IDWEBREPORTS'
      DataSource = ds
      ReadOnly = True
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 512
  end
  inherited Dock971: TDock97
    Top = 139
    Width = 512
    inherited tb97Fundo: TToolbar97
      Left = 340
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 360015
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 171
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
    Left = 223
    Top = 18
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'WEBTPREPORTS.DESCRICAO'
      'DECODE(WEBTPREPORTS.FLGTIPO, 0, '#39'SISTEMA'#39','#39'USUÁRIO'#39')'
      'WEBTPREPORTS.IDWEBREPORTS')
    TipodeDado.Strings = (
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Descrição'
      'Definido por'
      'Código')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'WEBTPREPORTS')
    CamposChave.Strings = (
      'WEBTPREPORTS.IDWEBREPORTS')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '40'
      '40'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    ExibePergunta = False
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 388
    Top = 30
  end
end
