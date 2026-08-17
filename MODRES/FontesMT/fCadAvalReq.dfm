inherited frmCadAvalReq: TfrmCadAvalReq
  Left = 137
  Top = 177
  HelpContext = 730008
  Caption = 'Cadastro de Avaliações Requeridas por Cargo'
  ClientHeight = 329
  ClientWidth = 526
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 526
    Height = 243
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 4
      Top = 4
      Width = 518
      Height = 49
      object Label1: TLabel
        Left = 11
        Top = 6
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Label10: TLabel
        Left = 106
        Top = 6
        Width = 35
        Height = 13
        Caption = 'Título'
      end
      object dbedMat: TwwDBEdit
        Left = 11
        Top = 20
        Width = 84
        Height = 21
        Color = clGray
        DataField = 'IDCARGO'
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
        Left = 106
        Top = 20
        Width = 401
        Height = 21
        Color = clGray
        DataField = 'TITULO'
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
      Top = 53
      Width = 518
      Height = 186
      Tabs.Strings = (
        'Avaliações')
      inherited pgctrlDetalhe: TPageControl
        Width = 420
        Height = 127
        inherited tbsDet: TTabSheet
          Caption = 'tbsDet'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 412
            Height = 99
            ControlType.Strings = (
              'FLGIMPRESCIND;CheckBox;1;0')
            Selected.Strings = (
              'CODTIPOAVAL'#9'10'#9'Código'
              'DESCRTIPOAVAL'#9'35'#9'Tipo'#9'F'
              'AVALIACAO'#9'18'#9'Avaliação Mínima')
            Font.Style = []
            ParentFont = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 412
            Height = 99
            object Label3: TLabel
              Left = 15
              Top = 16
              Width = 26
              Height = 13
              Caption = 'Tipo'
            end
            object Label2: TLabel
              Left = 15
              Top = 65
              Width = 102
              Height = 13
              Caption = 'Avaliação Mínima'
            end
            object dblcTipoAval: TwwDBLookupCombo
              Left = 15
              Top = 31
              Width = 381
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRTIPOAVAL'#9'30'#9'DESCRTIPOAVAL'#9'F')
              DataField = 'CODTIPOAVAL'
              DataSource = dsDet
              LookupTable = CdsTipoAval
              LookupField = 'CODTIPOAVAL'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
              OnChange = dblcTipoAvalChange
            end
            object dbedNotaMin: TwwDBEdit
              Left = 15
              Top = 80
              Width = 101
              Height = 21
              DataField = 'AVALIACAO'
              DataSource = dsDet
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 510
      end
      inherited Dock974: TDock97
        Left = 424
        Height = 127
      end
    end
  end
  inherited Dock972: TDock97
    Width = 526
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
    Top = 290
    Width = 526
    inherited tb97Fundo: TToolbar97
      Left = 356
      DockPos = 538
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 189
      DockPos = 371
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 349
    Top = 108
  end
  inherited ds: TwwDataSource
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 349
    Top = 95
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyEdit
    Left = 280
    Top = 94
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Cargo'
    Colunas.Strings = (
      'CARGO.IDCARGO'
      'CARGO.TITULO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Título')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'CARGO')
    CamposChave.Strings = (
      'CARGO.IDCARGO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '17'
      '45')
    Left = 349
    Top = 81
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 280
    Top = 81
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    OnStateChange = dsDetStateChange
    Left = 354
    Top = 1
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDCARGO'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPOAVAL'
        DataType = ftFloat
      end
      item
        Name = 'AVALIACAO'
        DataType = ftFloat
      end
      item
        Name = 'DESCRTIPOAVAL'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <
      item
        Name = 'CdsDetIndexIDCARGO'
        Fields = 'IDCARGO'
      end>
    IndexName = 'CdsDetIndexIDCARGO'
    Params = <>
    StoreDefs = True
    Left = 319
    Top = 1
  end
  object CdsTipoAval: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CODTIPOAVAL'
        DataType = ftFloat
      end
      item
        Name = 'DESCRTIPOAVAL'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <
      item
        Name = 'CdsTipoAvalIndexDESCRICAO'
        Fields = 'DESCRTIPOAVAL'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsTipoAvalIndexDESCRICAO'
    Params = <>
    StoreDefs = True
    Left = 410
    Top = 1
  end
end
