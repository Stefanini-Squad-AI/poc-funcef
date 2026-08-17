inherited frmCadPeriodo: TfrmCadPeriodo
  Left = 131
  Top = 128
  HelpContext = 750004
  Caption = 'Cadastro das Periodicidade dos Exames Médicos'
  ClientHeight = 404
  ClientWidth = 536
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 536
    Height = 318
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 4
      Top = 4
      Width = 528
      Height = 51
      object Label1: TLabel
        Left = 12
        Top = 6
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Label2: TLabel
        Left = 133
        Top = 6
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object dbedCodOcorr: TDBEdit
        Left = 12
        Top = 21
        Width = 112
        Height = 21
        Color = clGray
        DataField = 'CODTIPOOCMED'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object dbedDescr: TDBEdit
        Left = 133
        Top = 21
        Width = 384
        Height = 21
        Color = clGray
        DataField = 'DESCRTIPOOCMED'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 4
      Top = 55
      Width = 528
      Height = 259
      Tabs.Strings = (
        'Periodicidades')
      inherited pgctrlDetalhe: TPageControl
        Width = 430
        Height = 200
        inherited tbsDet: TTabSheet
          Caption = 'Periodicidades'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 422
            Height = 172
            Selected.Strings = (
              'DESCRICAO'#9'29'#9'Cargo'
              'TIPO'#9'10'#9'Medido Por'
              'LIMINFERIOR'#9'10'#9'Lim. Inferior'
              'LIMSUPERIOR'#9'10'#9'Lim. Superior'
              'PERIODO'#9'12'#9'Período')
            Font.Style = []
            ParentFont = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 422
            Height = 172
            object Label3: TLabel
              Left = 53
              Top = 17
              Width = 156
              Height = 13
              Caption = 'Cargo (ou nada para todos)'
            end
            object Label4: TLabel
              Left = 53
              Top = 77
              Width = 78
              Height = 13
              Caption = 'Limite Inferior'
            end
            object Label5: TLabel
              Left = 270
              Top = 77
              Width = 85
              Height = 13
              Caption = 'Limite Superior'
            end
            object Label6: TLabel
              Left = 53
              Top = 128
              Width = 65
              Height = 13
              Caption = 'Medido Por'
            end
            object Label7: TLabel
              Left = 270
              Top = 129
              Width = 93
              Height = 13
              Caption = 'Período (meses)'
            end
            object dblckCargo: TwwDBLookupCombo
              Left = 53
              Top = 32
              Width = 311
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'TITULO'#9'30'#9'TITULO')
              DataField = 'IDCARGO'
              DataSource = dsDet
              LookupTable = CdsCargo
              LookupField = 'IDCARGO'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnChange = dblckCargoChange
            end
            object DBEdit2: TDBEdit
              Left = 53
              Top = 92
              Width = 93
              Height = 21
              DataField = 'LIMINFERIOR'
              DataSource = dsDet
              MaxLength = 2
              TabOrder = 1
            end
            object DBEdit3: TDBEdit
              Left = 270
              Top = 92
              Width = 93
              Height = 21
              DataField = 'LIMSUPERIOR'
              DataSource = dsDet
              MaxLength = 2
              TabOrder = 2
            end
            object dbcbIndTempo: TwwDBComboBox
              Left = 53
              Top = 143
              Width = 93
              Height = 21
              ShowButton = True
              Style = csDropDownList
              MapList = True
              AllowClearKey = False
              DataField = 'INDTEMPO'
              DataSource = dsDet
              DropDownCount = 8
              ItemHeight = 0
              Items.Strings = (
                'Idade'#9'1'
                'Exposição'#9'2')
              Sorted = False
              TabOrder = 3
              UnboundDataType = wwDefault
              OnChange = dbcbIndTempoChange
            end
            object DBEdit4: TDBEdit
              Left = 270
              Top = 144
              Width = 93
              Height = 21
              DataField = 'PERIODO'
              DataSource = dsDet
              MaxLength = 3
              TabOrder = 4
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 520
      end
      inherited Dock974: TDock97
        Left = 434
        Height = 200
      end
    end
  end
  inherited Dock972: TDock97
    Width = 536
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
    Top = 365
    Width = 536
    inherited tb97Fundo: TToolbar97
      Left = 366
      DockPos = 422
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 199
      DockPos = 255
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 501
    Top = 27
  end
  inherited ds: TwwDataSource
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 501
    Top = 14
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyEdit
    Left = 438
    Top = 13
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona de Periodicidade de Exame Médico'
    Colunas.Strings = (
      'CODTIPOOCMED'
      'DESCRTIPOOCMED')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'S'
      'N')
    Tabelas.Strings = (
      'TIPOCMED')
    CamposChave.Strings = (
      'CODTIPOOCMED')
    Filtro.Strings = (
      'FLGTIPOCOR = 0')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '17'
      '45')
    ExibePergunta = False
    Left = 501
    Top = 1
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 438
    Top = 1
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    OnStateChange = dsDetStateChange
    Left = 339
    Top = 1
  end
  object CdsCargo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 381
    Top = 1
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 306
    Top = 1
  end
end
