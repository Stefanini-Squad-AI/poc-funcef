inherited frmCadCNAE: TfrmCadCNAE
  Left = 319
  Top = 191
  HelpContext = 210036
  Caption = 
    'Cadastro de Classificação Nacional de Atividades Econômicas (CNA' +
    'E)'
  ClientHeight = 339
  ClientWidth = 645
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 645
    Height = 253
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 2
      Top = 2
      Width = 641
      Height = 52
      object Label2: TLabel
        Left = 112
        Top = 7
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label1: TLabel
        Left = 12
        Top = 7
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = dbedCodigo
      end
      object dbedCodigo: TDBEdit
        Left = 12
        Top = 22
        Width = 89
        Height = 21
        DataField = 'IDCATCNAE'
        DataSource = ds
        MaxLength = 10
        TabOrder = 0
      end
      object dbedDescr: TDBEdit
        Left = 112
        Top = 22
        Width = 513
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 2
      Top = 54
      Width = 641
      Height = 197
      Tabs.Strings = (
        'Item CNAE')
      inherited pgctrlDetalhe: TPageControl
        Width = 543
        Height = 138
        inherited tbsDet: TTabSheet
          Caption = 'tbsDet'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 535
            Height = 110
            Selected.Strings = (
              'IDITEMCNAE'#9'10'#9'Código'
              'DESCRICAO'#9'180'#9'Descrição')
            Font.Height = -11
            Font.Style = []
            ParentFont = False
            UseTFields = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 535
            Height = 110
            object Label3: TLabel
              Left = 8
              Top = 68
              Width = 58
              Height = 13
              Caption = 'Descrição'
            end
            object Label4: TLabel
              Left = 8
              Top = 15
              Width = 40
              Height = 13
              Caption = 'Código'
              FocusControl = dbedCodigoDet
            end
            object lblAliquota: TLabel
              Left = 133
              Top = 15
              Width = 49
              Height = 13
              Caption = 'Alíquota'
              FocusControl = dbeAliquota
            end
            object dbedDescrDet: TDBEdit
              Left = 8
              Top = 83
              Width = 515
              Height = 21
              DataField = 'DESCRICAO'
              DataSource = dsDet
              TabOrder = 1
            end
            object dbedCodigoDet: TDBEdit
              Left = 8
              Top = 31
              Width = 89
              Height = 21
              DataField = 'IDITEMCNAE'
              DataSource = dsDet
              MaxLength = 10
              TabOrder = 0
              OnKeyPress = ValidaKeyDecimal
            end
            object dbeAliquota: TDBEdit
              Left = 133
              Top = 31
              Width = 89
              Height = 21
              DataField = 'ALIQUOTA'
              DataSource = dsDet
              MaxLength = 10
              TabOrder = 2
              OnKeyPress = ValidaKeyDecimal
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 633
      end
      inherited Dock974: TDock97
        Left = 547
        Height = 138
      end
    end
  end
  inherited Dock972: TDock97
    Width = 645
  end
  inherited Dock971: TDock97
    Top = 300
    Width = 645
    inherited tb97Fundo: TToolbar97
      Left = 473
      DockPos = 583
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 304
      DockPos = 414
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 530
    Top = 15
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 530
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 469
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona CNAE'
    Colunas.Strings = (
      'CATCNAE.IDCATCNAE'
      'CATCNAE.DESCRICAO')
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
      'CATCNAE')
    CamposChave.Strings = (
      'CATCNAE.IDCATCNAE')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '17'
      '185')
    ExibePergunta = False
    Left = 402
    Top = 1
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 469
    Top = 1
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    OnStateChange = dsDetStateChange
    Left = 344
    Top = 2
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 306
    Top = 1
  end
end
