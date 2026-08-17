inherited FrmCadCopiaTabela: TFrmCadCopiaTabela
  Left = 88
  Top = 108
  Caption = ''
  ClientHeight = 511
  ClientWidth = 802
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 802
    Height = 425
    inherited Bevel2: TBevel
      Width = 800
    end
    inherited pnlTitulo: TPanel
      Width = 800
      inherited lbNomItem: TfcLabel
        Width = 132
        Caption = 'Chupa Cabra'
      end
    end
    object pnlDetalhe: TPanel
      Left = 1
      Top = 45
      Width = 800
      Height = 76
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 1
      object Label1: TLabel
        Left = 11
        Top = 10
        Width = 105
        Height = 13
        Caption = 'Seleção de Dados'
      end
      object Label2: TLabel
        Left = 404
        Top = 10
        Width = 95
        Height = 13
        Caption = 'Tabela de Carga'
      end
      object SpeedButton1: TSpeedButton
        Left = 704
        Top = 16
        Width = 49
        Height = 33
        OnClick = SpeedButton1Click
      end
      object mmSelecao: TMemo
        Left = 11
        Top = 25
        Width = 300
        Height = 44
        TabOrder = 0
      end
      object btExecSelec: TButton
        Left = 320
        Top = 25
        Width = 75
        Height = 41
        Caption = 'Executar '
        TabOrder = 1
        OnClick = btExecSelecClick
      end
      object dblTabelaCarga: TwwDBLookupCombo
        Left = 406
        Top = 25
        Width = 289
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TABLE_NAME'#9'30'#9'TABLE_NAME'#9'F')
        LookupTable = qryTabelaCarga
        LookupField = 'TABLE_NAME'
        Options = [loRowLines]
        ParentFont = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
    object pnlGrid: TPanel
      Left = 1
      Top = 121
      Width = 800
      Height = 303
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 2
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 399
        Height = 301
        Align = alLeft
        BevelOuter = bvLowered
        Caption = 'Panel1'
        TabOrder = 0
        object dbgSelect: TDBGrid
          Left = 1
          Top = 1
          Width = 397
          Height = 299
          Align = alClient
          DataSource = dsTabela
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
        end
      end
      object Panel2: TPanel
        Left = 400
        Top = 1
        Width = 399
        Height = 301
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'Panel2'
        TabOrder = 1
        object dbgCarga: TDBGrid
          Left = 1
          Top = 1
          Width = 397
          Height = 299
          Align = alClient
          DataSource = ds
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 802
    inherited Toolbar971: TToolbar97
      Visible = False
    end
  end
  inherited Dock971: TDock97
    Top = 472
    Width = 802
    inherited tb97Fundo: TToolbar97
      Left = 630
      DockPos = 690
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 461
      DockPos = 521
    end
    inline fraMens: TfraMensagem
      Left = 2
      Width = 458
      Height = 37
      TabOrder = 2
      inherited pnlProgresso: TPanel
        Width = 458
        Height = 37
        inherited pnlProgressoMensagem: TPanel
          Height = 35
          inherited lblProgressoMensagem: TfcLabel
            Height = 33
          end
        end
        inherited pnlProgressoBarra: TPanel
          Width = 261
          Height = 35
          inherited pgbProcesso: TProgressBar
            Width = 259
            Height = 33
          end
        end
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      2
      (
        'TMemo'
        'Text'
        0)
      (
        ''
        'Cells'
        0))
  end
  inherited ds: TwwDataSource
    Left = 686
    Top = 6
  end
  inherited upd: TUpdateSQL
    Left = 714
    Top = 6
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT * FROM DUAL')
    UpdateObject = nil
    Left = 658
    Top = 6
  end
  object dbProducao: TDatabase
    Connected = True
    DatabaseName = 'BaseDadosProd'
    DriverName = 'ORACLE'
    LoginPrompt = False
    Params.Strings = (
      'SERVER NAME=FuncefTST'
      'USER NAME=cmselect'
      'NET PROTOCOL=TNS'
      'OPEN MODE=READ/WRITE'
      'SCHEMA CACHE SIZE=8'
      'LANGDRIVER='
      'SQLQRYMODE=SERVER'
      'SQLPASSTHRU MODE=SHARED AUTOCOMMIT'
      'SCHEMA CACHE TIME=-1'
      'MAX ROWS=-1'
      'BATCH COUNT=200'
      'ENABLE SCHEMA CACHE=FALSE'
      'SCHEMA CACHE DIR='
      'ENABLE BCD=FALSE'
      'ENABLE INTEGERS=FALSE'
      'LIST SYNONYMS=NONE'
      'ROWSET SIZE=20'
      'BLOBS TO CACHE=64'
      'BLOB SIZE=32'
      'OBJECT MODE=TRUE'
      'PASSWORD=tstgesis')
    SessionName = 'Default'
    Left = 593
    Top = 6
  end
  object seProducao: TSession
    SessionName = 'seProducao'
    Left = 624
    Top = 6
  end
  object dsTabela: TwwDataSource
    DataSet = qryTabela
    Left = 399
    Top = 6
  end
  object qryTabela: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDadosProd'
    SQL.Strings = (
      'SELECT * FROM DUAL')
    UpdateObject = upd
    ValidateWithMask = True
    Left = 371
    Top = 6
  end
  object QryCopiaTabela: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM DUAL')
    ValidateWithMask = True
    Left = 474
    Top = 6
  end
  object qryTabelaCarga: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'select table_name from all_tables where tablespace_name = '#39'DADOS' +
        #39)
    ValidateWithMask = True
    Left = 650
    Top = 110
  end
  object wwQuery1: TwwQuery
    DatabaseName = 'BaseDadosProd'
    SQL.Strings = (
      'SELECT A.SIGLAACAOBOLSA, E.SIGLAEMISSOR'
      'FROM ACOESXBOLSA A, INVESTIMENTO I, EMISSOR E'
      'WHERE A.IDBOLSAVALORES = 91009'
      '  AND A.IDACAO = I.IDINVESTIMENTO'
      '  AND I.IDEMISSOR = E.IDEMISSOR')
    ValidateWithMask = True
    Left = 705
    Top = 140
    object wwQuery1SIGLAACAOBOLSA: TStringField
      FieldName = 'SIGLAACAOBOLSA'
      Origin = 'BASEDADOSPROD.ACOESXBOLSA.SIGLAACAOBOLSA'
      Size = 10
    end
    object wwQuery1SIGLAEMISSOR: TStringField
      FieldName = 'SIGLAEMISSOR'
      Origin = 'BASEDADOSPROD.EMISSOR.SIGLAEMISSOR'
      Size = 15
    end
  end
  object wwQuery2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 745
    Top = 140
  end
end
