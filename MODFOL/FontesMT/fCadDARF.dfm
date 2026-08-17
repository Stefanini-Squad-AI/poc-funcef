inherited frmCadDARF: TfrmCadDARF
  Left = 69
  Top = 172
  HelpContext = 210037
  Caption = 'Cadastro de Tipos de Contribuição no DARF'
  ClientHeight = 339
  ClientWidth = 645
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 645
    Height = 253
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 4
      Top = 4
      Width = 637
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
        DataField = 'IDCONTRIBDARF'
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
      Left = 4
      Top = 56
      Width = 637
      Height = 193
      Tabs.Strings = (
        'Item DARF')
      inherited pgctrlDetalhe: TPageControl
        Width = 539
        Height = 134
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 531
            Height = 106
            Selected.Strings = (
              'IDITEMDARF'#9'10'#9'Código'
              'DESCRICAO'#9'180'#9'Descrição')
            Font.Height = -11
            Font.Style = []
            ParentFont = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 531
            Height = 106
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
              DataField = 'IDITEMDARF'
              DataSource = dsDet
              MaxLength = 10
              TabOrder = 0
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 629
      end
      inherited Dock974: TDock97
        Left = 543
        Height = 134
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
      Left = 475
      DockPos = 483
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 308
      DockPos = 316
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 522
    Top = 14
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 522
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 462
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Tipo de Contribuição no DARF'
    Colunas.Strings = (
      'CONTRIBDARF.IDCONTRIBDARF'
      'CONTRIBDARF.DESCRICAO')
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
      'CONTRIBDARF')
    CamposChave.Strings = (
      'CONTRIBDARF.IDCONTRIBDARF')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '17'
      '85')
    ExibePergunta = False
    Left = 392
    Top = 1
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 462
    Top = 1
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    OnStateChange = dsDetStateChange
    Left = 341
    Top = 1
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 306
    Top = 1
  end
end
