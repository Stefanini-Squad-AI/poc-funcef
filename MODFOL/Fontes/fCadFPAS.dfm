inherited frmCadFPAS: TfrmCadFPAS
  Left = 376
  Top = 157
  HelpContext = 210038
  Caption = 'Cadastro de Fundo Previdenciário e de Assistência Social (FPAS)'
  ClientHeight = 416
  ClientWidth = 664
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 664
    Height = 330
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 2
      Top = 2
      Width = 660
      Height = 90
      object Label2: TLabel
        Left = 105
        Top = 4
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label1: TLabel
        Left = 12
        Top = 4
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = dbedCodigo
      end
      object dbedCodigo: TDBEdit
        Left = 12
        Top = 18
        Width = 84
        Height = 21
        DataField = 'IDFPAS'
        DataSource = ds
        MaxLength = 15
        TabOrder = 0
      end
      object dbedDescr: TwwDBEdit
        Left = 105
        Top = 18
        Width = 548
        Height = 67
        AutoSize = False
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = True
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 2
      Top = 92
      Width = 660
      Height = 236
      Tabs.Strings = (
        'Convênios Previdenciários'
        'Percentuais')
      detdbGrids.Strings = (
        'dbgrdDet'
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 562
        Height = 177
        inherited tbsDet: TTabSheet
          Caption = 'tbsDet'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 554
            Height = 149
            Selected.Strings = (
              'IDCONVPREVID'#9'10'#9'Código'
              'CODTERCESOCIAL'#9'12'#9'Cód. Terceiros'
              'DESCRICAO'#9'22'#9'Descrição'
              'DESCTERCESOCIAL'#9'22'#9'Terceiros'
              'PERCCONVPREVID'#9'149'#9'Percentual'
              'BASECALCESOCIA'#9'12'#9'Base de Cálculo')
            Font.Height = -11
            Font.Style = []
            ParentFont = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 554
            Height = 149
            object Label3: TLabel
              Left = 12
              Top = 52
              Width = 58
              Height = 13
              Caption = 'Descrição'
            end
            object Label4: TLabel
              Left = 12
              Top = 8
              Width = 40
              Height = 13
              Caption = 'Código'
              FocusControl = dbedCodigoDet
            end
            object Label10: TLabel
              Left = 12
              Top = 96
              Width = 62
              Height = 13
              Caption = 'Percentual'
            end
            object dbedDescrDet: TDBEdit
              Left = 12
              Top = 67
              Width = 245
              Height = 21
              DataField = 'DESCRICAO'
              DataSource = dsDet
              TabOrder = 1
            end
            object dbedCodigoDet: TDBEdit
              Left = 12
              Top = 23
              Width = 114
              Height = 21
              DataField = 'IDCONVPREVID'
              DataSource = dsDet
              MaxLength = 15
              TabOrder = 0
            end
            object DBRealEdit1: TDBRealEdit
              Left = 12
              Top = 110
              Width = 84
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
              DataField = 'PERCCONVPREVID'
              DataSource = dsDet
            end
            object GroupBox1: TGroupBox
              Left = 133
              Top = 0
              Width = 137
              Height = 58
              Caption = 'eSocial'
              TabOrder = 3
              object Label11: TLabel
                Left = 10
                Top = 16
                Width = 97
                Height = 13
                Caption = 'Código Terceiros'
                FocusControl = dbedCodigoDet
              end
              object edtCodTerceiros: TDBEdit
                Left = 8
                Top = 32
                Width = 121
                Height = 21
                DataField = 'CODTERCESOCIAL'
                DataSource = dsDet
                MaxLength = 3
                TabOrder = 0
                OnKeyPress = edtCodTerceirosKeyPress
              end
            end
          end
        end
        object tbshPercent: TTabSheet
          Caption = 'tbshPercent'
          object Label5: TLabel
            Left = 139
            Top = 7
            Width = 141
            Height = 13
            Caption = 'Contribuição Empresarial'
          end
          object Label6: TLabel
            Left = 139
            Top = 35
            Width = 102
            Height = 13
            Caption = 'Previdência Rural'
          end
          object Label7: TLabel
            Left = 139
            Top = 63
            Width = 137
            Height = 13
            Caption = 'Décimo Terceiro Salário'
          end
          object Label8: TLabel
            Left = 139
            Top = 91
            Width = 85
            Height = 13
            Caption = 'Salário Família'
          end
          object Label9: TLabel
            Left = 139
            Top = 120
            Width = 114
            Height = 13
            Caption = 'Salário Maternidade'
          end
          object DBRealEdit2: TDBRealEdit
            Left = 298
            Top = 3
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'PERCCONTRIBEMPRES'
            DataSource = ds
          end
          object DBRealEdit4: TDBRealEdit
            Left = 298
            Top = 31
            Width = 121
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
            DataField = 'PERCDECTERC'
            DataSource = ds
          end
          object DBRealEdit6: TDBRealEdit
            Left = 298
            Top = 59
            Width = 121
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
            DataField = 'PERCPREVRURAL'
            DataSource = ds
          end
          object DBRealEdit5: TDBRealEdit
            Left = 298
            Top = 87
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 3
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'PERCSALFAM'
            DataSource = ds
          end
          object DBRealEdit3: TDBRealEdit
            Left = 298
            Top = 116
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 4
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'PERCSALMATERN'
            DataSource = ds
          end
        end
      end
      inherited Dock973: TDock97
        Width = 652
      end
      inherited Dock974: TDock97
        Left = 566
        Height = 177
      end
    end
  end
  inherited Dock972: TDock97
    Width = 664
  end
  inherited Dock971: TDock97
    Top = 377
    Width = 664
    inherited tb97Fundo: TToolbar97
      Left = 492
      DockPos = 514
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 323
      DockPos = 345
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 549
    Top = 15
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
    Left = 549
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 478
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona FPAS'
    Colunas.Strings = (
      'FPAS.IDFPAS'
      'SUBSTR(FPAS.DESCRICAO,1,200) AS PARTE')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição (parte)')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'FPAS')
    CamposChave.Strings = (
      'FPAS.IDFPAS')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '17'
      '200')
    ExibePergunta = False
    Left = 397
    Top = 1
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 478
    Top = 1
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    OnStateChange = dsDetStateChange
    Left = 343
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
