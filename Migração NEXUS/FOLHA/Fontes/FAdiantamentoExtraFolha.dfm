inherited frmAdiantamentoExtraFolha: TfrmAdiantamentoExtraFolha
  Left = 254
  Top = 141
  Caption = 'Insere Adiantamento Extra Folha'
  ClientHeight = 386
  ClientWidth = 657
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 657
    Height = 347
    object Bevel1: TBevel
      Left = 184
      Top = 67
      Width = 252
      Height = 52
      Shape = bsFrame
    end
    object Label1: TLabel
      Left = 191
      Top = 60
      Width = 118
      Height = 13
      Caption = 'Lista de Matrículas: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnAbreArqEnt: TSpeedButton
      Tag = 1
      Left = 405
      Top = 74
      Width = 23
      Height = 22
      Enabled = False
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
    object Bevel2: TBevel
      Left = 4
      Top = 12
      Width = 174
      Height = 50
      Shape = bsFrame
    end
    object Label3: TLabel
      Left = 8
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
      Left = 183
      Top = 12
      Width = 330
      Height = 50
      Shape = bsFrame
    end
    object Label4: TLabel
      Left = 190
      Top = 5
      Width = 30
      Height = 13
      Caption = 'Lote '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel4: TBevel
      Left = 519
      Top = 12
      Width = 136
      Height = 50
      Shape = bsFrame
    end
    object Label2: TLabel
      Left = 526
      Top = 5
      Width = 109
      Height = 13
      Caption = 'Previsão de Pagto '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel6: TBevel
      Left = 4
      Top = 68
      Width = 174
      Height = 50
      Shape = bsFrame
    end
    object Label7: TLabel
      Left = 8
      Top = 61
      Width = 149
      Height = 13
      Caption = 'Mês e Ano de Referencia '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel7: TBevel
      Left = 4
      Top = 124
      Width = 174
      Height = 32
      Shape = bsFrame
    end
    object lblStatus: TLabel
      Left = 190
      Top = 98
      Width = 235
      Height = 13
      AutoSize = False
    end
    object Label5: TLabel
      Left = 12
      Top = 127
      Width = 45
      Height = 26
      Caption = 'Valor Rubrica'
      WordWrap = True
    end
    object Bevel5: TBevel
      Left = 441
      Top = 67
      Width = 214
      Height = 52
      Shape = bsFrame
    end
    object lbl: TLabel
      Left = 448
      Top = 61
      Width = 49
      Height = 13
      Caption = 'Rubrica:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel8: TBevel
      Left = 441
      Top = 124
      Width = 214
      Height = 35
      Shape = bsFrame
    end
    object Label6: TLabel
      Left = 454
      Top = 118
      Width = 91
      Height = 13
      Caption = 'Portador Forma:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object txArqEnt: TEdit
      Left = 192
      Top = 79
      Width = 209
      Height = 15
      BorderStyle = bsNone
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object DbcLote: TDBLookupComboBox
      Left = 192
      Top = 26
      Width = 312
      Height = 21
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      KeyField = 'IDLOTE'
      ListField = 'DESCRICAO'
      ListSource = dtsLote
      ParentFont = False
      TabOrder = 1
      OnClick = DbcLoteClick
    end
    object DbcMes: TDBLookupComboBox
      Left = 11
      Top = 26
      Width = 92
      Height = 21
      KeyField = 'NUMMES'
      ListField = 'MES'
      ListSource = dtsMes
      TabOrder = 2
      OnClick = DbcMesClick
    end
    object SpdAno: TSpinEdit
      Left = 110
      Top = 26
      Width = 60
      Height = 22
      MaxValue = 9999
      MinValue = 2007
      TabOrder = 3
      Value = 2007
      OnChange = SpdAnoChange
    end
    object EdtDataPagamento: TEdit
      Left = 544
      Top = 28
      Width = 90
      Height = 21
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object DbcMesReferencia: TDBLookupComboBox
      Left = 11
      Top = 82
      Width = 92
      Height = 21
      KeyField = 'NUMMES'
      ListField = 'MES'
      ListFieldIndex = 1
      ListSource = dtsMesReferencia
      TabOrder = 5
    end
    object SpdAnoReferencia: TSpinEdit
      Left = 110
      Top = 82
      Width = 60
      Height = 22
      MaxValue = 9999
      MinValue = 2007
      TabOrder = 6
      Value = 2007
    end
    object mmObs: TMemo
      Left = 4
      Top = 182
      Width = 653
      Height = 165
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 7
      WordWrap = False
    end
    object EdtValor: TEdit
      Left = 65
      Top = 129
      Width = 105
      Height = 21
      Enabled = False
      TabOrder = 8
      OnChange = EdtValorChange
    end
    object ChkUsaValorArquivo: TCheckBox
      Left = 184
      Top = 134
      Width = 241
      Height = 15
      Caption = 'Usa Valor Informado no Arquivo de Entrada'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      OnClick = ChkUsaValorArquivoClick
    end
    object pbBarraProg: TProgressBar
      Left = 5
      Top = 160
      Width = 650
      Height = 17
      Min = 0
      Max = 100
      TabOrder = 10
    end
    object dbcboRubrica: TwwDBLookupCombo
      Left = 451
      Top = 83
      Width = 196
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'60'#9'Descrição'#9'F')
      LookupTable = qryRubrica
      LookupField = 'CODPROVDESC'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 11
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object cboPortadorForma: TwwDBLookupCombo
      Left = 451
      Top = 133
      Width = 196
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'60'#9'Descrição'#9'F')
      LookupTable = qryPortadorForma
      LookupField = 'CODPORTFORMA'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 12
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
  end
  inherited Dock971: TDock97
    Top = 347
    Width = 657
    inherited tb97Fundo: TToolbar97
      Left = 485
      DockPos = 542
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 305
      DockPos = 362
      inherited ToolbarSep971: TToolbarSep97
        Left = 92
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 92
        Caption = '&Processar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 95
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 211
    Top = 219
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object dtsMes: TDataSource
    DataSet = qryMes
    Left = 336
    Top = 273
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
    Left = 432
    Top = 240
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
    Left = 352
    Top = 176
  end
  object dtsMesReferencia: TDataSource
    DataSet = qryMesReferencia
    Left = 264
    Top = 177
  end
  object dtsLote: TDataSource
    DataSet = qryLote
    Left = 92
    Top = 274
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
    Left = 40
    Top = 272
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
    Left = 144
    Top = 272
  end
  object qryPrincipal: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select '#39#39' as Matrícula, '#39#39' as Nome, 0 as Valor'
      'from   dual')
    Left = 200
    Top = 272
  end
  object dlgAbreArq: TOpenDialog
    Filter = 
      'Arquivo Texto (*.txt)|*.txt|Arquivos DAT (*.dat)|*.dat|Todos Arq' +
      'uivos (*.*)|*.*'
    Title = 'Arquivo de Entrada'
    Left = 444
    Top = 189
  end
  object qryRubrica: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPROVENTO, CODPROVDESC,'
      '       FLGOBRIGAFAVOREC,'
      
        '       DECODE(FLGDESCONTO,0,'#39'Provento'#39',1,'#39'Desconto'#39','#39'Informativa' +
        #39') AS TIPO,'
      '       CODPROVDESC||'#39' - '#39'||DESCRICAO AS DESCRICAO,'
      '       FLGINSS,'
      '       CODFONTEPAGADORA'
      'FROM PROVDESC'
      'ORDER BY CODPROVDESC'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 528
    Top = 219
  end
  object qryPortadorForma: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODPORTFORMA, DESCRICAO FROM PORTADORFORMA'
      'ORDER BY CODPORTFORMA'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 528
    Top = 283
  end
end
