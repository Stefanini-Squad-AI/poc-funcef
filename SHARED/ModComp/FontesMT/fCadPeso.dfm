inherited frmCadPeso: TfrmCadPeso
  Left = 167
  Top = 161
  Caption = 'Cadastro dos Pesos Grupos x Fatores de Avaliação'
  ClientHeight = 342
  ClientWidth = 435
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 435
    Height = 256
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 4
      Top = 4
      Width = 427
      Height = 52
      object Label1: TLabel
        Left = 10
        Top = 8
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Label10: TLabel
        Left = 91
        Top = 8
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object dbedMat: TwwDBEdit
        Left = 10
        Top = 23
        Width = 71
        Height = 21
        Color = clGray
        DataField = 'CODGRPFUNC'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedNome: TwwDBEdit
        Left = 91
        Top = 23
        Width = 326
        Height = 21
        Color = clGray
        DataField = 'DESCGRPFUNC'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 4
      Top = 56
      Width = 427
      Height = 196
      Tabs.Strings = (
        'Pesos x Fatores')
      inherited pgctrlDetalhe: TPageControl
        Width = 329
        Height = 137
        inherited tbsDet: TTabSheet
          Caption = 'tbsDet'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 321
            Height = 109
            Selected.Strings = (
              'IDFATORAVAL'#9'10'#9'Código'
              'DESCRFATORAVAL'#9'30'#9'Fator de Avaliação'
              'PESO'#9'10'#9'Peso')
            Font.Style = []
            ParentFont = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 321
            Height = 109
            object Label2: TLabel
              Left = 7
              Top = 23
              Width = 108
              Height = 13
              Caption = 'Fator de Avaliação'
            end
            object Label4: TLabel
              Left = 7
              Top = 71
              Width = 29
              Height = 13
              Caption = 'Peso'
              FocusControl = dbedPeso
            end
            object dblcFatorAval: TwwDBLookupCombo
              Left = 7
              Top = 37
              Width = 305
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRFATORAVAL'#9'30'#9'DESCRFATORAVAL')
              DataField = 'IDFATORAVAL'
              DataSource = dsDet
              LookupTable = CdsAval
              LookupField = 'IDFATORAVAL'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnChange = dblcFatorAvalChange
            end
            object dbedPeso: TDBEdit
              Left = 7
              Top = 85
              Width = 52
              Height = 21
              DataField = 'PESO'
              DataSource = dsDet
              MaxLength = 3
              TabOrder = 1
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 419
      end
      inherited Dock974: TDock97
        Left = 333
        Height = 137
      end
    end
  end
  inherited Dock972: TDock97
    Width = 435
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 303
    Width = 435
    inherited tb97Fundo: TToolbar97
      Left = 265
      DockPos = 406
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 98
      DockPos = 238
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 384
    Top = 112
  end
  inherited ds: TwwDataSource
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 384
    Top = 98
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyEdit
    Left = 370
    Top = 252
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Grupo Funcional'
    Colunas.Strings = (
      'CODGRPFUNC'
      'DESCGRPFUNC')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'S'
      'N')
    Tabelas.Strings = (
      'GRUPFUNC')
    CamposChave.Strings = (
      'CODGRPFUNC')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '40')
    ExibePergunta = False
    Left = 384
    Top = 84
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 370
    Top = 239
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
  object CdsAval: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 380
    Top = 1
  end
end
