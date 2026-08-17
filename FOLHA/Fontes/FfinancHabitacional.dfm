inherited FrmFinancHabitacional: TFrmFinancHabitacional
  Left = 266
  Top = 157
  BorderStyle = bsSingle
  Caption = 'Financiamento Habitacional'
  ClientHeight = 428
  ClientWidth = 738
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 738
    Height = 389
    object Bevel1: TBevel
      Left = 5
      Top = 72
      Width = 612
      Height = 45
      Shape = bsFrame
    end
    object Bevel2: TBevel
      Left = 4
      Top = 12
      Width = 174
      Height = 50
      Shape = bsFrame
    end
    object Bevel6: TBevel
      Left = 191
      Top = 12
      Width = 174
      Height = 50
      Shape = bsFrame
    end
    object lblmesreferencia: TLabel
      Left = 203
      Top = 5
      Width = 149
      Height = 13
      Caption = 'Mês e Ano de Referência '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblmescobranca: TLabel
      Left = 19
      Top = 5
      Width = 141
      Height = 13
      Caption = 'Mês e Ano de Cobrança '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel3: TBevel
      Left = 375
      Top = 12
      Width = 348
      Height = 50
      Shape = bsFrame
    end
    object btnAbreArqEnt: TSpeedButton
      Tag = 1
      Left = 572
      Top = 82
      Width = 21
      Height = 21
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
      OnClick = btnAbreArqEntClick
    end
    object lblarqentrada: TLabel
      Left = 12
      Top = 64
      Width = 118
      Height = 13
      Caption = 'Arquivo de Entrada: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbllote: TLabel
      Left = 387
      Top = 5
      Width = 26
      Height = 13
      Caption = 'Lote'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DbcMes: TDBLookupComboBox
      Left = 11
      Top = 26
      Width = 92
      Height = 21
      KeyField = 'NUMMES'
      ListField = 'MES'
      ListSource = dtsMes
      TabOrder = 0
    end
    object SpdAno: TSpinEdit
      Left = 110
      Top = 26
      Width = 60
      Height = 22
      MaxLength = 4
      MaxValue = 9999
      MinValue = 1900
      TabOrder = 1
      Value = 2007
    end
    object DbcMesReferencia: TDBLookupComboBox
      Left = 198
      Top = 26
      Width = 92
      Height = 21
      KeyField = 'NUMMES'
      ListField = 'MES'
      ListFieldIndex = 1
      ListSource = dtsMesReferencia
      TabOrder = 2
      OnClick = DbcMesReferenciaClick
    end
    object SpdAnoReferencia: TSpinEdit
      Left = 297
      Top = 26
      Width = 60
      Height = 22
      MaxLength = 4
      MaxValue = 9999
      MinValue = 1900
      TabOrder = 3
      Value = 2007
    end
    object DbcLote: TDBLookupComboBox
      Left = 384
      Top = 26
      Width = 329
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      KeyField = 'IDLOTE'
      ListField = 'DESCRICAO'
      ListSource = dtsLote
      ParentFont = False
      TabOrder = 4
    end
    object txArqEnt: TEdit
      Left = 13
      Top = 83
      Width = 556
      Height = 21
      ReadOnly = True
      TabOrder = 5
    end
    object mmObs: TMemo
      Left = 5
      Top = 127
      Width = 724
      Height = 248
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 6
      WordWrap = False
    end
  end
  inherited Dock971: TDock97
    Top = 389
    Width = 738
    inherited tb97Fundo: TToolbar97
      Left = 160
      DockPos = 160
      inherited sep1: TToolbarSep97
        Left = 162
      end
      inherited sep3: TToolbarSep97
        Left = 165
      end
      inherited bbtnSair: TBitBtn
        Left = 81
        Visible = False
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 0
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 332
      DockPos = 332
      inherited ToolbarSep971: TToolbarSep97
        Left = 101
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 101
        Caption = '&Processar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 104
        OnClick = bbtnCancelarClick
      end
      object BitBtn1: TBitBtn
        Left = 185
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Sair'
        TabOrder = 2
        OnClick = bbtnSairClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF88888800BBBBB00
          88888887788888778F88887BBBBBBBBB088888788FFF888878F887FB707BBBBB
          B08887F8777F888887F887FB000BBBBBB0888788777F888F878F7FBB000BBB0B
          BB087F88777F887F887F7FBB0007B00BBB087F887777877F887F7FBBB000000B
          BB087F888777777F887F7FBBBB70000BBB087F888877777F887F7FBBBB00000B
          BB0878F88877777F887887FBB000007BB08887F88777777887F887FBBBBBBBBB
          B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
    end
    object bbtnDesfazer: TBitBtn
      Left = 0
      Top = 0
      Width = 101
      Height = 33
      Caption = '&Desfazer'
      Default = True
      ModalResult = 1
      TabOrder = 2
      OnClick = bbtnDesfazerClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        3333333777333777FF33339993707399933333773337F3777FF3399933000339
        9933377333777F3377F3399333707333993337733337333337FF993333333333
        399377F33333F333377F993333303333399377F33337FF333373993333707333
        333377F333777F333333993333101333333377F333777F3FFFFF993333000399
        999377FF33777F77777F3993330003399993373FF3777F37777F399933000333
        99933773FF777F3F777F339993707399999333773F373F77777F333999999999
        3393333777333777337333333999993333333333377777333333}
      NumGlyphs = 2
    end
    object bbtnGeraArqSaida: TBitBtn
      Left = 103
      Top = 0
      Width = 163
      Height = 33
      Caption = '&Gerar Arquivo de Saída'
      Default = True
      ModalResult = 1
      TabOrder = 3
      OnClick = bbtnGeraArqSaidaClick
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
  inherited ivTradutor: TIvExtendedTranslator
    Left = 859
    Top = 27
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object qryLote: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDLOTE, trim(to_char(IDLOTE)) || '#39' - '#39' || DESCRICAO, DATA' +
        'PAGAMENTO'
      'FROM CTRLINTERFACE'
      ' WHERE'
      '(MESREFERENCIA = '#39'0000/00'#39') AND'
      '(TIPO = '#39'B'#39') AND'
      '(IDPESSOA IS NULL) AND'
      '(FLGIDATMP = 1) AND'
      '(FLGVOLTATMP = 0) AND'
      '(FLGTIPOFOLHA = 2)')
    Left = 32
    Top = 296
  end
  object dtsLote: TDataSource
    DataSet = qryLote
    Left = 84
    Top = 298
  end
  object qryAuxiliar: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDLOTE, trim(to_char(IDLOTE)) || '#39' - '#39' || DESCRICAO, DATA' +
        'PAGAMENTO'
      'FROM CTRLINTERFACE'
      ' WHERE'
      '(MESREFERENCIA = '#39'0000/00'#39') AND'
      '(TIPO = '#39'B'#39') AND'
      '(IDPESSOA IS NULL) AND'
      '(FLGIDATMP = 1) AND'
      '(FLGVOLTATMP = 0) AND'
      '(FLGTIPOFOLHA = 2)')
    Left = 136
    Top = 296
  end
  object qryMes: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select '#39'01'#39' as NumMes, '#39'Janeiro'#39' as Mes'
      'from    dual'
      'union'
      'select '#39'02'#39' as NumMes, '#39'Fevereiro'#39' as Mes'
      'from    dual'
      'union'
      'select '#39'03'#39' as NumMes, '#39'Março'#39' as Mes'
      'from    dual'
      'union'
      'select '#39'04'#39' as NumMes, '#39'Abril'#39' as Mes'
      'from    dual'
      'union'
      'select '#39'05'#39' as NumMes, '#39'Maio'#39' as Mes'
      'from    dual'
      'union'
      'select '#39'06'#39' as NumMes, '#39'Junho'#39' as Mes'
      'from    dual'
      'union'
      'select '#39'07'#39' as NumMes, '#39'Julho'#39' as Mes'
      'from    dual'
      'union'
      'select '#39'08'#39' as NumMes, '#39'Agosto'#39' as Mes'
      'from    dual'
      'union'
      'select '#39'09'#39' as NumMes, '#39'Setembro'#39' as Mes'
      'from    dual'
      'union'
      'select '#39'10'#39' as NumMes, '#39'Outubro'#39' as Mes'
      'from    dual'
      'union'
      'select '#39'11'#39' as NumMes, '#39'Novembro'#39' as Mes'
      'from    dual'
      'union'
      'select '#39'12'#39' as NumMes, '#39'Dezembro'#39' as Mes'
      'from    dual')
    Left = 408
    Top = 280
  end
  object dtsMes: TDataSource
    DataSet = qryMes
    Left = 360
    Top = 289
  end
  object dtsMesReferencia: TDataSource
    DataSet = qryMesReferencia
    Left = 592
    Top = 281
  end
  object qryMesReferencia: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select '#39'01'#39' as NumMes, '#39'Janeiro'#39' as Mes'
      'from    dual'
      'union'
      'select '#39'02'#39' as NumMes, '#39'Fevereiro'#39' as Mes'
      'from    dual'
      'union'
      'select '#39'03'#39' as NumMes, '#39'Março'#39' as Mes'
      'from    dual'
      'union'
      'select '#39'04'#39' as NumMes, '#39'Abril'#39' as Mes'
      'from    dual'
      'union'
      'select '#39'05'#39' as NumMes, '#39'Maio'#39' as Mes'
      'from    dual'
      'union'
      'select '#39'06'#39' as NumMes, '#39'Junho'#39' as Mes'
      'from    dual'
      'union'
      'select '#39'07'#39' as NumMes, '#39'Julho'#39' as Mes'
      'from    dual'
      'union'
      'select '#39'08'#39' as NumMes, '#39'Agosto'#39' as Mes'
      'from    dual'
      'union'
      'select '#39'09'#39' as NumMes, '#39'Setembro'#39' as Mes'
      'from    dual'
      'union'
      'select '#39'10'#39' as NumMes, '#39'Outubro'#39' as Mes'
      'from    dual'
      'union'
      'select '#39'11'#39' as NumMes, '#39'Novembro'#39' as Mes'
      'from    dual'
      'union'
      'select '#39'12'#39' as NumMes, '#39'Dezembro'#39' as Mes'
      'from    dual')
    Left = 512
    Top = 288
  end
  object dlgAbreArq: TOpenDialog
    Filter = 'Arquivo Texto (*.txt)|*.txt'
    Title = 'Arquivo de Entrada'
    Left = 676
    Top = 285
  end
  object qryAux: TQuery
    DatabaseName = 'BaseDados'
    Left = 192
    Top = 296
  end
end
