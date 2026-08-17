inherited frmSincronizacao: TfrmSincronizacao
  Left = 24
  Top = 110
  HelpContext = 4650021
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Sincronização'
  ClientHeight = 436
  ClientWidth = 726
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 726
    Height = 397
    object pnlTop: TPanel
      Left = 1
      Top = 1
      Width = 724
      Height = 60
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object lblIdWebTransfDados: TLabel
        Left = 8
        Top = 8
        Width = 158
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Número da Importação:'
      end
      object lblDtTransf: TLabel
        Left = 8
        Top = 32
        Width = 159
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Data / Hora da Exportação:'
      end
      object lblNomeBase: TLabel
        Left = 377
        Top = 8
        Width = 91
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Base de Dados:'
      end
      object dbtxtWebTransfDados: TDBText
        Left = 171
        Top = 8
        Width = 193
        Height = 13
        DataField = 'IDWEBTRANSFDADOS'
        DataSource = dtsWebTransfDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbtxtData: TDBText
        Left = 171
        Top = 33
        Width = 193
        Height = 13
        DataField = 'DATA'
        DataSource = dtsWebTransfDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbtxtNomeBase: TDBText
        Left = 472
        Top = 9
        Width = 233
        Height = 13
        DataField = 'NOMEBASE'
        DataSource = dtsWebTransfDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    inline frameDadosExportados: TframeDadosExportados
      Left = 1
      Top = 61
      Width = 724
      Height = 335
      Align = alClient
      TabOrder = 1
      inherited pnlTabela: TPanel
        Width = 724
        Height = 335
        inherited dbgrdWebLogAlteracao: TDBGrid
          Width = 381
          Height = 310
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
          Top = 310
          Width = 724
          inherited pnlBottomTotal: TPanel
            Width = 177
            inherited lblTotalReg: TLabel
              Width = 121
              Caption = 'Total de Operações:'
            end
            inherited lblTotal: TLabel
              Left = 124
            end
          end
          inherited pnlBottomCenter: TPanel
            Left = 177
            Width = 213
            inherited pgrProgresso: TProgressBar
              Width = 203
            end
          end
          inherited pnlBottomMostraChave: TPanel
            Left = 390
          end
        end
        inherited pnlDetalhes: TPanel
          Left = 381
          Height = 310
          inherited strgrdDetalhes: TStringGrid
            Height = 287
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 397
    Width = 726
    inherited tb97Fundo: TToolbar97
      Left = 554
      DockPos = 583
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 385
      DockPos = 414
      inherited ToolbarSep971: TToolbarSep97
        Left = 162
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 81
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 0
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 643
    Top = 267
    TargetsData = (
      1
      2
      (
        ''
        'Cells'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  object cdsWebTransfDados: TCMClientDataSet
    Aggregates = <>
    Params = <>
    OnCalcFields = cdsWebTransfDadosCalcFields
    Left = 384
    Top = 130
    object cdsWebTransfDadosIDWEBTRANSFDADOS: TFloatField
      FieldName = 'IDWEBTRANSFDADOS'
    end
    object cdsWebTransfDadosDTTRANSF: TDateTimeField
      FieldName = 'DTTRANSF'
    end
    object cdsWebTransfDadosSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object cdsWebTransfDadosNOMEBASE: TStringField
      FieldName = 'NOMEBASE'
      Size = 10
    end
    object cdsWebTransfDadosDATA: TStringField
      FieldKind = fkCalculated
      FieldName = 'DATA'
      Size = 19
      Calculated = True
    end
  end
  object dtsWebTransfDados: TDataSource
    DataSet = cdsWebTransfDados
    Left = 413
    Top = 130
  end
end
