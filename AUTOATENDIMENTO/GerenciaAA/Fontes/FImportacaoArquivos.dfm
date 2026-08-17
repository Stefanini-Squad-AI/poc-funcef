inherited frmImportacaoArquivos: TfrmImportacaoArquivos
  Left = 66
  Top = 110
  HelpContext = 4650019
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Importação de Dados'
  ClientHeight = 428
  ClientWidth = 725
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 725
    Height = 389
    object pnlTop: TPanel
      Left = 1
      Top = 1
      Width = 723
      Height = 84
      Align = alTop
      TabOrder = 0
      object btnOpenDir: TSpeedButton
        Left = 624
        Top = 24
        Width = 23
        Height = 22
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555555555555555555555555555555555555555555555555555555555
          555555555555555555555555555555555555555FFFFFFFFFF555550000000000
          55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
          B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
          000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
          555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
          55555575FFF75555555555700007555555555557777555555555555555555555
          5555555555555555555555555555555555555555555555555555}
        NumGlyphs = 2
        OnClick = btnOpenDirClick
      end
      object lblDir: TLabel
        Left = 6
        Top = 8
        Width = 241
        Height = 13
        AutoSize = False
        Caption = 'Diretório de onde serão lidos os arquivos:'
      end
      object lblDadosImportados: TLabel
        Left = 5
        Top = 67
        Width = 121
        Height = 13
        AutoSize = False
        Caption = 'Dados Importados:'
      end
      object edtDir: TEdit
        Left = 7
        Top = 24
        Width = 618
        Height = 21
        TabOrder = 0
      end
      object btnOk: TBitBtn
        Left = 651
        Top = 22
        Width = 53
        Height = 25
        TabOrder = 1
        OnClick = btnOkClick
        Kind = bkOK
      end
    end
    object pnlDadosImportados: TPanel
      Left = 1
      Top = 85
      Width = 723
      Height = 48
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object lblTxtDtTransf: TLabel
        Left = 3
        Top = 27
        Width = 130
        Height = 13
        AutoSize = False
        Caption = 'Data/Hora da Exportação:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblDtTransf: TLabel
        Left = 133
        Top = 27
        Width = 235
        Height = 13
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblTxtNomeBase: TLabel
        Left = 4
        Top = 8
        Width = 130
        Height = 13
        AutoSize = False
        Caption = 'Base de dados origem:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblNomeBase: TLabel
        Left = 134
        Top = 8
        Width = 235
        Height = 13
        AutoSize = False
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
      Top = 133
      Width = 723
      Height = 255
      Align = alClient
      TabOrder = 2
      inherited pnlTabela: TPanel
        Width = 723
        Height = 255
        inherited dbgrdWebLogAlteracao: TDBGrid
          Width = 380
          Height = 230
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
          Top = 230
          Width = 723
          inherited pnlBottomTotal: TPanel
            Width = 169
            inherited lblTotalReg: TLabel
              Width = 113
            end
            inherited lblTotal: TLabel
              Left = 117
              Top = 8
            end
          end
          inherited pnlBottomCenter: TPanel
            Left = 169
            Width = 220
            inherited pgrProgresso: TProgressBar
              Width = 210
            end
          end
          inherited pnlBottomMostraChave: TPanel
            Left = 389
          end
        end
        inherited pnlDetalhes: TPanel
          Left = 380
          Height = 230
          inherited strgrdDetalhes: TStringGrid
            Height = 207
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 389
    Width = 725
    inherited tb97Fundo: TToolbar97
      Left = 553
      DockPos = 591
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 384
      DockPos = 422
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 651
    Top = 59
    TargetsData = (
      1
      1
      (
        ''
        'Cells'
        0))
  end
  object dlgDir: TProcuraDirDlg
    Caption = 'Salvar arquivos no diretório...'
    Options = [bfStatusText]
    ShowPath = True
    Title = 
      'Indique o diretório onde serão gravados os arquivos exportados..' +
      '.'
    OnSelectionChanged = dlgDirSelectionChanged
    Left = 617
    Top = 58
  end
  object cdsWebLogAlteracao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 552
    Top = 56
  end
  object cdsWebTransfDados: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 584
    Top = 58
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
  end
end
