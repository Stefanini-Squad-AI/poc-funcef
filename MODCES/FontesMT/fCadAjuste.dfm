inherited frmCadAjuste: TfrmCadAjuste
  Left = 108
  Top = 167
  HelpContext = 740011
  Caption = 'Cadastro de Fatores de Ajuste da Pesquisa por Empresa'
  ClientHeight = 331
  ClientWidth = 552
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 552
    Height = 245
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 4
      Top = 4
      Width = 544
      Height = 54
      object Label1: TLabel
        Left = 14
        Top = 8
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Label2: TLabel
        Left = 88
        Top = 8
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label3: TLabel
        Left = 434
        Top = 8
        Width = 28
        Height = 13
        Caption = 'Data'
      end
      object dbedCodPesqui: TDBEdit
        Left = 14
        Top = 22
        Width = 55
        Height = 21
        Color = clGray
        DataField = 'IDPESQSALAR'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object dbedDescricao: TDBEdit
        Left = 88
        Top = 22
        Width = 328
        Height = 21
        Color = clGray
        DataField = 'NOMEPESQSALAR'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object dbedData: TDBEdit
        Left = 434
        Top = 22
        Width = 97
        Height = 21
        Color = clGray
        DataField = 'DATAREFPESQ'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 4
      Top = 58
      Width = 544
      Height = 183
      Tabs.Strings = (
        'Fatores de Ajuste')
      inherited pgctrlDetalhe: TPageControl
        Width = 446
        Height = 124
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 438
            Height = 96
            Selected.Strings = (
              'NOME'#9'60'#9'Empresa ou Entidade'#9'F'
              'FATOR'#9'10'#9'Fator de Ajuste')
            Font.Style = []
            ParentFont = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 438
            Height = 96
            object Label4: TLabel
              Left = 41
              Top = 12
              Width = 121
              Height = 13
              Caption = 'Empresa ou Entidade'
              FocusControl = dbedFator
            end
            object Label5: TLabel
              Left = 41
              Top = 57
              Width = 87
              Height = 13
              Caption = 'Fator de Ajuste'
              FocusControl = dbedFator
            end
            object dblcEntidade: TwwDBLookupCombo
              Left = 41
              Top = 26
              Width = 368
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'NOME')
              DataField = 'IdEmpresaPartic'
              DataSource = dsDet
              LookupTable = CdsEntidade
              LookupField = 'IdPessoa'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              OnChange = dblcEntidadeChange
            end
            object dbedFator: TDBEdit
              Left = 41
              Top = 72
              Width = 85
              Height = 21
              DataField = 'FATOR'
              DataSource = dsDet
              TabOrder = 1
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 536
      end
      inherited Dock974: TDock97
        Left = 450
        Height = 124
      end
    end
  end
  inherited Dock972: TDock97
    Width = 552
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 292
    Width = 552
    inherited tb97Fundo: TToolbar97
      Left = 382
      DockPos = 438
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 215
      DockPos = 271
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 505
    Top = 1
  end
  inherited ds: TwwDataSource
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 505
    Top = 14
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyEdit
    Left = 446
    Top = 1
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Pesquisa Salarial'
    Colunas.Strings = (
      'IDPESQSALAR'
      'NOMEPESQSALAR')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Nome')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PESQISAL')
    CamposChave.Strings = (
      'IDPESQSALAR')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '40')
    ExibePergunta = False
    Left = 505
    Top = 27
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 446
    Top = 14
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    OnStateChange = dsDetStateChange
    Left = 330
    Top = 1
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 298
    Top = 1
  end
  object CdsEntidade: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 378
    Top = 1
  end
end
