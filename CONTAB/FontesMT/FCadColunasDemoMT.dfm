inherited frmCadColunasDemoMT: TfrmCadColunasDemoMT
  Left = 195
  Top = 52
  Caption = 'Colunas do Demonstrativo de Resultados'
  ClientHeight = 424
  ClientWidth = 497
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 497
    Height = 338
    inherited pnlMestre: TPanel
      Width = 495
      object Label4: TLabel
        Left = 16
        Top = 8
        Width = 82
        Height = 13
        Caption = 'Demonstrativo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 384
        Top = 8
        Width = 64
        Height = 13
        Caption = 'No. Coluna'
      end
      object lblFormaRecPag: TLabel
        Left = 16
        Top = 48
        Width = 119
        Height = 13
        Caption = 'Descrição da Coluna'
      end
      object dblkDemo: TwwDBLookupCombo
        Left = 16
        Top = 24
        Width = 353
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DEMDESCDEMONSTRAT'#9'60'#9'Descrição')
        DataField = 'IDDEMONSTRATIVO'
        DataSource = ds
        LookupTable = CdsDemonstrativo
        LookupField = 'IDDEMONSTRATIVO'
        Style = csDropDownList
        DropDownWidth = 8
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblkDemoCloseUp
        OnExit = dblkDemoExit
      end
      object dbrColuna: TDBRealEdit
        Left = 384
        Top = 24
        Width = 81
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0')
        ReadOnly = True
        TabOrder = 1
        WordWrap = False
        IntDigits = 11
        DecDigits = 0
        NumberFormat = fFixed
        Signal = False
        DataField = 'NUMCOLUNA'
        DataSource = ds
      end
      object dbeDescColuna: TDBEdit
        Left = 16
        Top = 64
        Width = 449
        Height = 21
        DataField = 'NOMECOLUNA'
        DataSource = ds
        TabOrder = 2
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Width = 495
      Height = 238
      inherited pgctrlDetalhe: TPageControl
        Width = 397
        Height = 179
        inherited tbsDet: TTabSheet
          Caption = 'Linhas x Colunas'
          inherited pnlControlesDet: TPanel
            Width = 389
            Height = 151
            object Label1: TLabel
              Left = 16
              Top = 24
              Width = 156
              Height = 13
              Caption = 'Elemento do Demonstrativo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label2: TLabel
              Left = 16
              Top = 64
              Width = 32
              Height = 13
              Caption = 'Linha'
            end
            object dblkElemDet: TwwDBLookupCombo
              Left = 16
              Top = 40
              Width = 337
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'ELEDESCELEM'#9'60'#9'Descrição')
              DataField = 'IDELEMDEMONSTRAT'
              DataSource = dsDet
              LookupTable = CdsElemento
              LookupField = 'IDELEMDEMONSTRAT'
              Style = csDropDownList
              DropDownWidth = 8
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dblkLinha: TwwDBLookupCombo
              Left = 16
              Top = 80
              Width = 337
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMELINHA'#9'30'#9'NOMELINHA')
              DataField = 'IDLINHA'
              DataSource = dsDet
              LookupTable = CdsLinha
              LookupField = 'IDLINHA'
              Style = csDropDownList
              DropDownWidth = 8
              ParentFont = False
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 389
            Height = 151
            Selected.Strings = (
              'NOMELINHA'#9'25'#9'Descrição da Linha'#9'F'
              'ELEDESCELEM'#9'25'#9'Elemento do Demonstrativo'#9'F')
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          end
        end
      end
      inherited Dock973: TDock97
        Width = 487
      end
      inherited Dock974: TDock97
        Left = 401
        Height = 179
      end
    end
  end
  inherited Dock972: TDock97
    Width = 497
  end
  inherited Dock971: TDock97
    Top = 385
    Width = 497
    inherited tb97Fundo: TToolbar97
      Left = 325
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 156
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 82
    Top = 391
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 294
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 40
    Top = 383
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 344
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 260
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'DEMCOLUNAS.NUMCOLUNA'
      'DEMCOLUNAS.NOMECOLUNA'
      'DEMONSTRATIVO.DEMDESCDEMONSTRAT')
    TipodeDado.Strings = (
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'No.Coluna'
      'Nome da Coluna'
      'Demonstrativo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'DEMCOLUNAS'
      'DEMONSTRATIVO')
    CamposChave.Strings = (
      'DEMCOLUNAS.IDDEMONSTRATIVO'
      'DEMCOLUNAS.NUMCOLUNA')
    Filtro.Strings = (
      'DEMCOLUNAS.IDDEMONSTRATIVO = DEMONSTRATIVO.IDDEMONSTRATIVO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '30'
      '60')
    Left = 416
    Top = 7
  end
  inherited CmeDetalhe: TCmEventosCadastro
    OnAbortConfirma = CmeDetalheAbortConfirma
    Left = 252
    Top = 178
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    Left = 190
    Top = 226
  end
  object CdsDemonstrativo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 184
    Top = 63
  end
  object CdsElemento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 271
  end
  object CdsLinha: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 21
    Top = 325
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 317
    Top = 229
  end
end
