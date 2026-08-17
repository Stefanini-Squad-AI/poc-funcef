inherited frmGeraExportacao: TfrmGeraExportacao
  Left = 16
  Top = 105
  HelpContext = 4650016
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Geração de Exportação de Dados'
  ClientHeight = 390
  ClientWidth = 771
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 771
    Height = 351
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 769
      Height = 20
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = ' Alterações a serem exportadas:'
      TabOrder = 0
    end
    inline frameDadosExportados: TframeDadosExportados
      Left = 1
      Top = 21
      Width = 769
      Height = 329
      Align = alClient
      TabOrder = 1
      inherited pnlTabela: TPanel
        Width = 769
        Height = 329
        inherited dbgrdWebLogAlteracao: TDBGrid
          Width = 426
          Height = 304
        end
        inherited pnlBotoes: TPanel
          Top = 304
          Width = 769
          inherited pnlBottomTotal: TPanel
            Width = 169
            inherited lblTotalReg: TLabel
              Width = 111
            end
            inherited lblTotal: TLabel
              Left = 122
            end
          end
          inherited pnlBottomCenter: TPanel
            Left = 169
            Width = 266
            inherited pgrProgresso: TProgressBar
              Width = 256
            end
          end
          inherited pnlBottomMostraChave: TPanel
            Left = 435
            inherited Label1: TLabel
              Left = 6
            end
            inherited cbMostraChaves: TCheckBox
              Left = 233
            end
          end
        end
        inherited pnlDetalhes: TPanel
          Left = 426
          Height = 304
          inherited strgrdDetalhes: TStringGrid
            Height = 281
            Font.Height = -9
            Font.Style = [fsBold]
            ParentFont = False
          end
          inherited pnlTopDetalhes: TPanel
            Font.Height = -8
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 351
    Width = 771
    inherited tb97Fundo: TToolbar97
      Left = 572
      DockPos = 572
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 238
      DockPos = 238
      Visible = False
      inherited ToolbarSep971: TToolbarSep97
        Left = 162
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 81
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Left = 0
        Visible = False
      end
    end
    object Toolbar971: TToolbar97
      Left = 469
      Top = 0
      Caption = 'TB97oKCancelar'
      DockPos = 469
      TabOrder = 2
      object ToolbarSep972: TToolbarSep97
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 3
      end
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
    Top = 35
    TargetsData = (
      1
      1
      (
        ''
        'Cells'
        0))
  end
  object cdsWebTransfDados_Local: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDWEBTRANSFDADOS'
        DataType = ftFloat
      end
      item
        Name = 'DTTRANSF'
        DataType = ftDateTime
      end
      item
        Name = 'SITUACAO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NOMEBASE'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 40
    Top = 354
    object cdsWebTransfDados_LocalIDWEBTRANSFDADOS: TFloatField
      FieldName = 'IDWEBTRANSFDADOS'
    end
    object cdsWebTransfDados_LocalDTTRANSF: TDateTimeField
      FieldName = 'DTTRANSF'
    end
    object cdsWebTransfDados_LocalSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object cdsWebTransfDados_LocalNOMEBASE: TStringField
      FieldName = 'NOMEBASE'
      Size = 10
    end
  end
  object cdsWebConfiguracao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 8
    Top = 352
  end
end
