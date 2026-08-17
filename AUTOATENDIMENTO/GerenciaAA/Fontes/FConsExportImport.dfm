inherited frmConsExportImport: TfrmConsExportImport
  Left = 6
  Top = 108
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Exportações de Dados'
  ClientHeight = 407
  ClientWidth = 726
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 726
    Height = 368
    object pnlTop: TPanel
      Left = 1
      Top = 1
      Width = 724
      Height = 100
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      TabOrder = 0
      object lblAlteracoeExportadas: TLabel
        Left = 4
        Top = 82
        Width = 137
        Height = 13
        AutoSize = False
        Caption = 'Alterações exportadas:'
      end
      object grpLookup: TGroupBox
        Left = 4
        Top = 4
        Width = 369
        Height = 64
        Caption = 'Exportação'
        TabOrder = 0
        object dblkpTransf: TDBLookupComboBox
          Left = 5
          Top = 35
          Width = 358
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          KeyField = 'IDWEBTRANSFDADOS'
          ListField = 'Lookup'
          ListSource = dtsTransf
          ParentFont = False
          TabOrder = 0
          OnClick = dblkpTransfClick
        end
        object pnlIdWebTransfDados: TPanel
          Left = 6
          Top = 20
          Width = 62
          Height = 16
          Alignment = taRightJustify
          Caption = 'Número     '
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object pnlDtTransf: TPanel
          Left = 68
          Top = 20
          Width = 169
          Height = 16
          Alignment = taLeftJustify
          Caption = '      Data / Hora da Exportação'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object pnlBaseDados: TPanel
          Left = 237
          Top = 20
          Width = 124
          Height = 16
          Alignment = taLeftJustify
          Caption = '     Base de Dados'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
      end
    end
    inline frameDadosExportados: TframeDadosExportados
      Left = 1
      Top = 101
      Width = 724
      Height = 266
      Align = alClient
      TabOrder = 1
      inherited pnlTabela: TPanel
        Width = 724
        Height = 266
        inherited dbgrdWebLogAlteracao: TDBGrid
          Width = 381
          Height = 241
          Columns = <
            item
              Expanded = False
              FieldName = 'DATAHORA'
              PickList.Strings = ()
              Title.Caption = 'Data/Hora'
              Width = 114
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TpOperacao'
              PickList.Strings = ()
              Title.Caption = 'Operação'
              Width = 68
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TABELA'
              PickList.Strings = ()
              Title.Caption = 'Tabela'
              Width = 167
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CHAVEPRIMARIA'
              PickList.Strings = ()
              Title.Caption = 'Chave Primária Atual'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'CHAVENOVA'
              PickList.Strings = ()
              Title.Caption = 'Nova Chave Primária'
              Visible = False
            end>
        end
        inherited pnlBotoes: TPanel
          Top = 241
          Width = 724
          inherited pnlBottomTotal: TPanel
            Width = 169
            inherited lblTotalReg: TLabel
              Width = 113
            end
            inherited lblTotal: TLabel
              Left = 120
            end
          end
          inherited pnlBottomCenter: TPanel
            Left = 169
            Width = 221
            inherited pgrProgresso: TProgressBar
              Width = 211
            end
          end
          inherited pnlBottomMostraChave: TPanel
            Left = 390
          end
        end
        inherited pnlDetalhes: TPanel
          Left = 381
          Height = 241
          inherited strgrdDetalhes: TStringGrid
            Height = 218
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 368
    Width = 726
    inherited tb97Fundo: TToolbar97
      Left = 554
      DockPos = 567
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 206
      Caption = #39
      DockPos = 206
      Visible = False
    end
    object ToolbarExportar: TToolbar97
      Left = 470
      Top = 0
      Caption = 'TB97oKCancelar'
      DockPos = 483
      TabOrder = 2
      object btnSalvar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = 'E&xportar'
        ModalResult = 1
        TabOrder = 0
        OnClick = btnSalvarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 691
    Top = 11
    TargetsData = (
      1
      1
      (
        ''
        'Cells'
        0))
  end
  object cdsTransf: TCMClientDataSet
    Aggregates = <>
    Params = <>
    OnCalcFields = cdsTransfCalcFields
    Left = 437
    Top = 157
    object cdsTransfIDWEBTRANSFDADOS: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = 'Número'
      DisplayWidth = 10
      FieldName = 'IDWEBTRANSFDADOS'
    end
    object cdsTransfDTTRANSF: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DTTRANSF'
      Visible = False
    end
    object cdsTransfSITUACAO: TStringField
      DisplayWidth = 1
      FieldName = 'SITUACAO'
      Visible = False
      Size = 1
    end
    object cdsTransfNOMEBASE: TStringField
      DisplayWidth = 10
      FieldName = 'NOMEBASE'
      Visible = False
      Size = 10
    end
    object cdsTransfLookup: TStringField
      FieldKind = fkCalculated
      FieldName = 'Lookup'
      Size = 51
      Calculated = True
    end
  end
  object dtsTransf: TDataSource
    DataSet = cdsTransf
    Left = 469
    Top = 157
  end
end
