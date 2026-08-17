object frmUpdateTmpdesc: TfrmUpdateTmpdesc
  Left = 195
  Top = 98
  Width = 544
  Height = 211
  Caption = 'Update Tmpdesc - Contrtib. Patro'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 536
    Height = 184
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 77
      Top = 48
      Width = 57
      Height = 16
      Caption = 'Ano/Mês:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblProgresso: TLabel
      Left = 13
      Top = 84
      Width = 72
      Height = 16
      Caption = 'Progresso...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object btnProcessar: TSpeedButton
      Left = 213
      Top = 35
      Width = 92
      Height = 41
      Caption = 'Processar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FF0000000F0
        000033F77777773777773FFF0CCC0FF09990333F73F37337F33733FFF0C0FFF0
        99903333F7373337F337333FFF0FFFF0999033333F73FFF7FFF73333FFF000F0
        0000333333F77737777733333F07B70FFFFF3333337F337F33333333330BBB0F
        FFFF3FFFFF7F337F333300000307B70FFFFF77777F73FF733F330EEE033000FF
        0FFF7F337FF777337FF30EEE00033FF000FF7F33777F333777FF0EEE0E033300
        000F7FFF7F7FFF77777F00000E00000000007777737773777777330EEE0E0330
        00FF337FFF7F7F3777F33300000E033000FF337777737F3777F333330EEE0330
        00FF33337FFF7FF77733333300000000033F3333777777777333}
      NumGlyphs = 2
      ParentFont = False
      OnClick = btnProcessarClick
    end
    object SpeedButton1: TSpeedButton
      Left = 317
      Top = 35
      Width = 92
      Height = 41
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333000003333333333F777773FF333333008877700
        33333337733FFF773F33330887000777033333733F777FFF73F330880F9F9F07
        703337F37733377FF7F33080F00000F07033373733777337F73F087F0091100F
        77037F3737333737FF7F08090919110907037F737F3333737F7F0F0F0999910F
        07037F737F3333737F7F0F090F99190908037F737FF33373737F0F7F00FF900F
        780373F737FFF737F3733080F00000F0803337F73377733737F330F80F9F9F08
        8033373F773337733733330F8700078803333373FF77733F733333300FFF8800
        3333333773FFFF77333333333000003333333333377777333333}
      NumGlyphs = 2
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object lblConexao: TLabel
      Left = 13
      Top = 12
      Width = 85
      Height = 16
      Caption = 'Progresso...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel1: TPanel
      Left = 0
      Top = 143
      Width = 536
      Height = 41
      Align = alBottom
      Color = clBtnShadow
      TabOrder = 0
      object btnSair: TBitBtn
        Left = 432
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Sair'
        TabOrder = 0
        OnClick = btnSairClick
        Kind = bkClose
      end
    end
    object mskAnoMes: TMaskEdit
      Left = 139
      Top = 44
      Width = 59
      Height = 24
      EditMask = '9999/99;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 7
      ParentFont = False
      TabOrder = 1
      Text = '    /  '
    end
    object pbProgresso: TProgressBar
      Left = 0
      Top = 116
      Width = 536
      Height = 27
      Align = alBottom
      Min = 0
      Max = 100
      TabOrder = 2
    end
  end
  object dBase: TDatabase
    AliasName = 'hmg'
    DatabaseName = 'Base'
    KeepConnection = False
    LoginPrompt = False
    Params.Strings = (
      'SERVER NAME= hmg'
      'USER NAME= CARGA_LEONARDO'
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
      'BLOBS TO CACHE=10000'
      'BLOB SIZE=512'
      'OBJECT MODE=TRUE'
      'PASSWORD= ELVIS56')
    SessionName = 'Default'
    Left = 488
    Top = 96
  end
  object qryLoop: TQuery
    DatabaseName = 'Base'
    SQL.Strings = (
      
        'SELECT IDPESSOA , IDDESCONTO, IDPLANOPREV,  FLGATRASODEVOL, IDMO' +
        'TIVO,'
      'MESCOBRANCA , MESREFERENCIA , VALOR , VALORRECEBIDO'
      'FROM TMPDESC'
      'WHERE IDPESSJUR = 91008 AND'
      'MESCOBRANCA = :MES AND'
      'IDMODULO = 32 AND'
      'IDDESCONTO = 1 AND'
      
        'IDPESSOA IN  (388652 ,     390294  ,    406035  ,   406037  ,  4' +
        '35309  , '
      
        '435765 ,     436804 ,     438189 ,     438583 ,     439174 ,    ' +
        ' 439312 ,     '
      
        '439358 ,     386213 ,     387369 ,     392490 ,     482793 ,    ' +
        ' 757939 ,     '
      
        '758174 ,     758542 ,     758570 ,     758980 ,     759270 ,    ' +
        ' 759597 ,     '
      
        '759600 ,     759683 ,     759753 ,     754324 ,     754470 ,    ' +
        ' 754695 ,     '
      
        '754871 ,     755114 ,     755150 ,     755255 ,     755886 ,    ' +
        ' 755988 ,     '
      
        '756221 ,     756705 ,     756728 ,     756812 ,     757038 ,    ' +
        ' 757291 ,     '
      
        '757508 ,     1067590,     1067592,     1067599,     1067605,    ' +
        ' 1067608,     '
      '1067637     )')
    Left = 236
    Top = 110
    ParamData = <
      item
        DataType = ftString
        Name = 'MES'
        ParamType = ptUnknown
        Value = '2003/07'
      end>
  end
  object qryupdate: TQuery
    DatabaseName = 'Base'
    Left = 321
    Top = 96
  end
end
