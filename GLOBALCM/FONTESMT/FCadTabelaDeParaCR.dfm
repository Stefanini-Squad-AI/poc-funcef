inherited frmCadTabelaDeParaCR: TfrmCadTabelaDeParaCR
  Left = 201
  Top = 217
  Caption = 'Cadastro de Campos para De/Para de Centros de Responsabilidade'
  ClientHeight = 402
  ClientWidth = 517
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 517
    Height = 316
    inherited pnlMestre: TPanel
      Width = 507
      Height = 95
      object Label1: TLabel
        Left = 16
        Top = 10
        Width = 94
        Height = 13
        Caption = 'Nome da Tabela'
      end
      object Label2: TLabel
        Left = 256
        Top = 10
        Width = 226
        Height = 13
        Caption = 'Campo referente à Empresa Proprietária'
      end
      object Label3: TLabel
        Left = 256
        Top = 50
        Width = 211
        Height = 13
        Caption = 'Campo referente à Data a Considerar'
      end
      object cboTabela: TwwDBLookupCombo
        Left = 16
        Top = 24
        Width = 225
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TABLE_NAME'#9'30'#9'Nome da Tabela'#9'F')
        DataField = 'NOMETABELA'
        DataSource = ds
        LookupTable = cdsTabela
        LookupField = 'TABLE_NAME'
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = cboTabelaCloseUp
      end
      object cboCampoEmpresa: TComboBox
        Left = 256
        Top = 24
        Width = 225
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
      end
      object cboCampoData: TComboBox
        Left = 256
        Top = 64
        Width = 225
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 2
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 100
      Width = 507
      Height = 211
      inherited pgctrlDetalhe: TPageControl
        Width = 409
        Height = 152
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel
            Width = 401
            Height = 124
            object Label5: TLabel
              Left = 16
              Top = 18
              Width = 275
              Height = 13
              Caption = 'Campo referente ao Centro de Responsabilidade'
            end
            object cboCampoDet: TComboBox
              Left = 16
              Top = 32
              Width = 274
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 401
            Height = 124
            Selected.Strings = (
              'NOMECAMPO'#9'52'#9'Nome do Campo'#9'F')
          end
        end
      end
      inherited Dock973: TDock97
        Width = 499
      end
      inherited Dock974: TDock97
        Left = 413
        Height = 152
      end
    end
  end
  inherited Dock972: TDock97
    Width = 517
  end
  inherited Dock971: TDock97
    Top = 363
    Width = 517
    inherited tb97Fundo: TToolbar97
      Left = 347
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 180
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 976
    Top = 8
  end
  inherited ds: TwwDataSource
    Left = 288
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 928
    Top = 8
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 336
    Top = 0
  end
  inherited Cds: TCMClientDataSet
    Left = 256
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'NOMETABELA')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Tabela')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'TABELADEPARACR')
    CamposChave.Strings = (
      'IDTABELADEPARACR')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '20')
    Left = 408
    Top = 0
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 336
    Top = 256
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsDet
    Left = 328
    Top = 208
  end
  object cdsTabela: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 141
    Top = 100
  end
  object dsTabela: TDataSource
    DataSet = cdsTabela
    Left = 205
    Top = 96
  end
  object cdsCampo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 221
    Top = 156
  end
  object dsCampo: TDataSource
    Left = 269
    Top = 152
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 328
    Top = 304
  end
end
