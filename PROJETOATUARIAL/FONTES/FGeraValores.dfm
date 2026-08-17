inherited frmGeraValores: TfrmGeraValores
  Left = 109
  Top = 136
  Caption = 'Gerar Valores para as tabelas'
  ClientHeight = 350
  ClientWidth = 627
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 627
    Height = 311
    object GroupBox1: TGroupBox
      Left = 353
      Top = 5
      Width = 269
      Height = 301
      Align = alClient
      Caption = ' Mensagens do Processo '
      TabOrder = 0
      object MemoMensagens: TMemo
        Left = 4
        Top = 15
        Width = 261
        Height = 282
        TabStop = False
        Lines.Strings = (
          '')
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
    object GroupBox2: TGroupBox
      Left = 5
      Top = 5
      Width = 348
      Height = 301
      Align = alLeft
      Caption = ' Informações necessárias '
      TabOrder = 1
      object lblStatus: TLabel
        Left = 11
        Top = 264
        Width = 37
        Height = 13
        Caption = 'Status'
      end
      object Label1: TLabel
        Left = 12
        Top = 30
        Width = 108
        Height = 13
        Caption = 'Tabelas Existentes'
      end
      object PrgBar1: TProgressBar
        Left = 11
        Top = 278
        Width = 325
        Height = 16
        Min = 0
        Max = 100
        Step = 1
        TabOrder = 1
      end
      object dblTabelas: TwwDBLookupCombo
        Left = 10
        Top = 48
        Width = 327
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'Descrição'#9'No')
        LookupTable = qryTabelas
        LookupField = 'DESCRICAO'
        Options = [loTitles]
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        UseTFields = False
        AllowClearKey = False
        OnChange = dblTabelasChange
      end
      object Panel1: TPanel
        Left = 10
        Top = 80
        Width = 327
        Height = 177
        BevelOuter = bvLowered
        Enabled = False
        TabOrder = 2
        object Label2: TLabel
          Left = 7
          Top = 10
          Width = 102
          Height = 13
          Caption = 'Grupo de Tabelas'
        end
        object Label3: TLabel
          Left = 7
          Top = 58
          Width = 91
          Height = 13
          Caption = 'Massa do Plano'
        end
        object Label4: TLabel
          Left = 7
          Top = 106
          Width = 88
          Height = 13
          Caption = 'Data Avaliação'
        end
        object Label5: TLabel
          Left = 219
          Top = 106
          Width = 93
          Height = 13
          Caption = 'Data de Criação'
        end
        object dbeGrupo: TwwDBEdit
          Left = 7
          Top = 26
          Width = 306
          Height = 21
          DataField = 'DESCGRUPOARQUIVO'
          DataSource = dsDadosTabela
          Enabled = False
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeMassaPlano: TwwDBEdit
          Left = 7
          Top = 74
          Width = 306
          Height = 21
          DataField = 'massaplano'
          DataSource = dsDadosTabela
          Enabled = False
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeAvaliacao: TwwDBEdit
          Left = 7
          Top = 122
          Width = 72
          Height = 21
          DataField = 'avaliacao'
          DataSource = dsDadosTabela
          Enabled = False
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeDataCriacao: TwwDBEdit
          Left = 225
          Top = 122
          Width = 87
          Height = 21
          DataField = 'datacriacao'
          DataSource = dsDadosTabela
          Enabled = False
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object ckbGerados: TCheckBox
          Left = 7
          Top = 152
          Width = 129
          Height = 17
          Caption = 'Valores gerados'
          TabOrder = 4
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 311
    Width = 627
    inherited tb97Fundo: TToolbar97
      Left = 429
      DockPos = 429
    end
    object Toolbar971: TToolbar97
      Left = 80
      Top = 0
      Caption = 'tb97Fundo'
      Color = clNone
      CloseButton = False
      DefaultDock = Dock971
      DockPos = 80
      TabOrder = 1
      object ToolbarSep971: TToolbarSep97
        Left = 130
        Top = 0
        Blank = True
        SizeHorz = 10
      end
      object bbtnGera: TBitBtn
        Left = 0
        Top = 0
        Width = 130
        Height = 33
        Caption = '&Gerar Valores'
        TabOrder = 0
        OnClick = bbtnGeraClick
        Glyph.Data = {
          F2010000424DF201000000000000760000002800000024000000130000000100
          0400000000007C01000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
          3333333333388F3333333333000033334224333333333333338338F333333333
          0000333422224333333333333833338F33333333000033422222243333333333
          83333338F3333333000034222A22224333333338F33F33338F33333300003222
          A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
          38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
          2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
          0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
          333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
          33333A2224A2233333333338F338F83300003333333333A2224A333333333333
          8F338F33000033333333333A222433333333333338F338F30000333333333333
          A224333333333333338F38F300003333333333333A223333333333333338F8F3
          000033333333333333A3333333333333333383330000}
        NumGlyphs = 2
        Spacing = 2
      end
      object bbtnApaga: TBitBtn
        Left = 140
        Top = 0
        Width = 130
        Height = 33
        Caption = 'Apagar &Valores'
        TabOrder = 1
        OnClick = bbtnApagaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
          33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
          993337777F777F3377F3393999707333993337F77737333337FF993399933333
          399377F3777FF333377F993339903333399377F33737FF33377F993333707333
          399377F333377FF3377F993333101933399377F333777FFF377F993333000993
          399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
          99333773FF777F777733339993707339933333773FF7FFF77333333999999999
          3333333777333777333333333999993333333333377777333333}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 163
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryTabelas: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT   IDTABELA, DESCRICAO, MASSAPLANO, '
      '                DATACRIACAO, AVALIACAO '
      ''
      'FROM     TBPARTICIP'
      ''
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 285
    Top = 38
  end
  object qryDadosTabela: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT P.IDTABELA, P.MASSAPLANO, '
      '              P.AVALIACAO, P.DATACRIACAO, G.DESCGRUPOARQUIVO '
      ''
      'FROM TBPARTICIP P, GRPARQUIVO G'
      'WHERE (IDTABELA = :pIdTabela) AND'
      '               (P.MASSAPLANO = G.CODGRUPOARQUIVO)')
    Params.Data = {0100010009704964546162656C6100030400000000000000}
    ValidateWithMask = True
    Left = 284
    Top = 108
  end
  object dsDadosTabela: TwwDataSource
    DataSet = qryDadosTabela
    Left = 299
    Top = 97
  end
  object QryPartprevplan: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'select * from partprevplan')
    ValidateWithMask = True
    Left = 539
    Top = 50
  end
  object qryaux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MAX(IDTABELA) AS IDATUAL '
      'FROM TBPARTICIP')
    ValidateWithMask = True
    Left = 539
    Top = 96
  end
  object QryPesquisa: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'select idsitplanoprev from'
      'sitplanoprev')
    ValidateWithMask = True
    Left = 538
    Top = 145
  end
  object qrypatrocinadora: TwwQuery
    SQL.Strings = (
      'SELECT ')
    ValidateWithMask = True
    Left = 390
    Top = 180
  end
  object qrydados: TwwQuery
    DatabaseName = 'basedados'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM     TBVALPART'
      'WHERE  IDTABELA =:TAB')
    Params.Data = {010001000354414200030400000000000000}
    ValidateWithMask = True
    Left = 390
    Top = 133
    object qrydadosIDTABELA: TFloatField
      FieldName = 'IDTABELA'
      Origin = 'TBVALPART.IDTABELA'
    end
    object qrydadosV1: TStringField
      FieldName = 'V1'
      Origin = 'TBVALPART.V1'
      Size = 60
    end
    object qrydadosV2: TStringField
      FieldName = 'V2'
      Origin = 'TBVALPART.V2'
      Size = 60
    end
    object qrydadosV3: TStringField
      FieldName = 'V3'
      Origin = 'TBVALPART.V3'
      Size = 60
    end
    object qrydadosV4: TStringField
      FieldName = 'V4'
      Origin = 'TBVALPART.V4'
      Size = 60
    end
    object qrydadosV5: TStringField
      FieldName = 'V5'
      Origin = 'TBVALPART.V5'
      Size = 60
    end
    object qrydadosV6: TStringField
      FieldName = 'V6'
      Origin = 'TBVALPART.V6'
      Size = 60
    end
    object qrydadosV7: TStringField
      FieldName = 'V7'
      Origin = 'TBVALPART.V7'
      Size = 60
    end
    object qrydadosV8: TStringField
      FieldName = 'V8'
      Origin = 'TBVALPART.V8'
      Size = 60
    end
    object qrydadosV9: TStringField
      FieldName = 'V9'
      Origin = 'TBVALPART.V9'
      Size = 60
    end
    object qrydadosV10: TStringField
      FieldName = 'V10'
      Origin = 'TBVALPART.V10'
      Size = 60
    end
    object qrydadosV11: TStringField
      FieldName = 'V11'
      Origin = 'TBVALPART.V11'
      Size = 60
    end
    object qrydadosV12: TStringField
      FieldName = 'V12'
      Origin = 'TBVALPART.V12'
      Size = 60
    end
    object qrydadosV13: TStringField
      FieldName = 'V13'
      Origin = 'TBVALPART.V13'
      Size = 60
    end
    object qrydadosV14: TStringField
      FieldName = 'V14'
      Origin = 'TBVALPART.V14'
      Size = 60
    end
    object qrydadosV15: TStringField
      FieldName = 'V15'
      Origin = 'TBVALPART.V15'
      Size = 60
    end
    object qrydadosV16: TStringField
      FieldName = 'V16'
      Origin = 'TBVALPART.V16'
      Size = 60
    end
    object qrydadosV17: TStringField
      FieldName = 'V17'
      Origin = 'TBVALPART.V17'
      Size = 60
    end
    object qrydadosV18: TStringField
      FieldName = 'V18'
      Origin = 'TBVALPART.V18'
      Size = 60
    end
    object qrydadosV19: TStringField
      FieldName = 'V19'
      Origin = 'TBVALPART.V19'
      Size = 60
    end
    object qrydadosV20: TStringField
      FieldName = 'V20'
      Origin = 'TBVALPART.V20'
      Size = 60
    end
    object qrydadosV21: TStringField
      FieldName = 'V21'
      Origin = 'TBVALPART.V21'
      Size = 60
    end
    object qrydadosV22: TStringField
      FieldName = 'V22'
      Origin = 'TBVALPART.V22'
      Size = 60
    end
    object qrydadosV23: TStringField
      FieldName = 'V23'
      Origin = 'TBVALPART.V23'
      Size = 60
    end
    object qrydadosV24: TStringField
      FieldName = 'V24'
      Origin = 'TBVALPART.V24'
      Size = 60
    end
    object qrydadosV25: TStringField
      FieldName = 'V25'
      Origin = 'TBVALPART.V25'
      Size = 60
    end
    object qrydadosV26: TStringField
      FieldName = 'V26'
      Origin = 'TBVALPART.V26'
      Size = 60
    end
    object qrydadosV27: TStringField
      FieldName = 'V27'
      Origin = 'TBVALPART.V27'
      Size = 60
    end
    object qrydadosV28: TStringField
      FieldName = 'V28'
      Origin = 'TBVALPART.V28'
      Size = 60
    end
    object qrydadosV29: TStringField
      FieldName = 'V29'
      Origin = 'TBVALPART.V29'
      Size = 60
    end
    object qrydadosV30: TStringField
      FieldName = 'V30'
      Origin = 'TBVALPART.V30'
      Size = 60
    end
    object qrydadosV31: TStringField
      FieldName = 'V31'
      Origin = 'TBVALPART.V31'
      Size = 60
    end
    object qrydadosV32: TStringField
      FieldName = 'V32'
      Origin = 'TBVALPART.V32'
      Size = 60
    end
    object qrydadosV33: TStringField
      FieldName = 'V33'
      Origin = 'TBVALPART.V33'
      Size = 60
    end
    object qrydadosV34: TStringField
      FieldName = 'V34'
      Origin = 'TBVALPART.V34'
      Size = 60
    end
    object qrydadosV35: TStringField
      FieldName = 'V35'
      Origin = 'TBVALPART.V35'
      Size = 60
    end
    object qrydadosV36: TStringField
      FieldName = 'V36'
      Origin = 'TBVALPART.V36'
      Size = 60
    end
    object qrydadosV37: TStringField
      FieldName = 'V37'
      Origin = 'TBVALPART.V37'
      Size = 60
    end
    object qrydadosV38: TStringField
      FieldName = 'V38'
      Origin = 'TBVALPART.V38'
      Size = 60
    end
    object qrydadosV39: TStringField
      FieldName = 'V39'
      Origin = 'TBVALPART.V39'
      Size = 60
    end
    object qrydadosV40: TStringField
      FieldName = 'V40'
      Origin = 'TBVALPART.V40'
      Size = 60
    end
    object qrydadosV41: TStringField
      FieldName = 'V41'
      Origin = 'TBVALPART.V41'
      Size = 60
    end
    object qrydadosV42: TStringField
      FieldName = 'V42'
      Origin = 'TBVALPART.V42'
      Size = 60
    end
    object qrydadosV43: TStringField
      FieldName = 'V43'
      Origin = 'TBVALPART.V43'
      Size = 60
    end
    object qrydadosV44: TStringField
      FieldName = 'V44'
      Origin = 'TBVALPART.V44'
      Size = 60
    end
    object qrydadosV45: TStringField
      FieldName = 'V45'
      Origin = 'TBVALPART.V45'
      Size = 60
    end
    object qrydadosV46: TStringField
      FieldName = 'V46'
      Origin = 'TBVALPART.V46'
      Size = 60
    end
    object qrydadosV47: TStringField
      FieldName = 'V47'
      Origin = 'TBVALPART.V47'
      Size = 60
    end
    object qrydadosV48: TStringField
      FieldName = 'V48'
      Origin = 'TBVALPART.V48'
      Size = 60
    end
    object qrydadosV49: TStringField
      FieldName = 'V49'
      Origin = 'TBVALPART.V49'
      Size = 60
    end
    object qrydadosV50: TStringField
      FieldName = 'V50'
      Origin = 'TBVALPART.V50'
      Size = 60
    end
    object qrydadosV51: TStringField
      FieldName = 'V51'
      Origin = 'TBVALPART.V51'
      Size = 60
    end
    object qrydadosV52: TStringField
      FieldName = 'V52'
      Origin = 'TBVALPART.V52'
      Size = 60
    end
    object qrydadosV53: TStringField
      FieldName = 'V53'
      Origin = 'TBVALPART.V53'
      Size = 60
    end
    object qrydadosV54: TStringField
      FieldName = 'V54'
      Origin = 'TBVALPART.V54'
      Size = 60
    end
    object qrydadosV55: TStringField
      FieldName = 'V55'
      Origin = 'TBVALPART.V55'
      Size = 60
    end
    object qrydadosV56: TStringField
      FieldName = 'V56'
      Origin = 'TBVALPART.V56'
      Size = 60
    end
    object qrydadosV57: TStringField
      FieldName = 'V57'
      Origin = 'TBVALPART.V57'
      Size = 60
    end
    object qrydadosV58: TStringField
      FieldName = 'V58'
      Origin = 'TBVALPART.V58'
      Size = 60
    end
    object qrydadosV59: TStringField
      FieldName = 'V59'
      Origin = 'TBVALPART.V59'
      Size = 60
    end
    object qrydadosV60: TStringField
      FieldName = 'V60'
      Origin = 'TBVALPART.V60'
      Size = 60
    end
    object qrydadosTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'TBVALPART.TRGDTINCLUSAO'
    end
    object qrydadosTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'TBVALPART.TRGUSERINCLUSAO'
      Size = 30
    end
  end
end
[
