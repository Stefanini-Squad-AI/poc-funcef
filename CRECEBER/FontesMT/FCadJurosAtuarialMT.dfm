inherited FrmCadJurosAtuarialMT: TFrmCadJurosAtuarialMT
  Left = 355
  Top = 48
  Caption = 'Indicação de Taxa de Juros para Correção'
  ClientHeight = 453
  ClientWidth = 648
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 648
    Height = 414
    object Panel1: TPanel [0]
      Left = 5
      Top = 5
      Width = 638
      Height = 68
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
    end
    inherited CPForCli: TCMProcuraForCli
      Left = 18
      Width = 477
      Mensagens.EmBranco = 'Cliente não pode estar em branco'
      Mensagens.NaoExiste = 'Cliente Fornecedor não existe'
      ForCli = fcCliente
    end
    object bbtnSelecionaDoc: TBitBtn
      Left = 505
      Top = 22
      Width = 120
      Height = 35
      Caption = '&Seleciona'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = bbtnSelecionaDocClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
        777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
        77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
        77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
        077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
        FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
        F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
        7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
        777777787FFF8777777777770000777777777777888877777777}
      NumGlyphs = 2
      Spacing = 5
    end
    object Panel2: TPanel
      Left = 5
      Top = 73
      Width = 638
      Height = 29
      Align = alTop
      BevelInner = bvLowered
      BevelWidth = 2
      Caption = 'Documentos em Aberto'
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 3
    end
    object wwDBGrid1: TwwDBGrid
      Left = 156
      Top = 102
      Width = 487
      Height = 307
      ControlType.Strings = (
        'CALCULAJUROS;CheckBox;1;0')
      Selected.Strings = (
        'CALCULAJUROS'#9'1'#9'Calc'#9'F'
        'NODOCUMENTO'#9'11'#9'Num. Doc.'#9'T'
        'COMPLDOCUMENTO'#9'5'#9'Compl.'#9'T'
        'DATALANCTO'#9'9'#9'Data Lancto'#9'T'
        'DATAPROGRAMADA'#9'9'#9'Data Progr'#9'T'
        'SALDO'#9'14'#9'Saldo'#9'T'
        'PERCJUROSSIMPLES'#9'12'#9'% Juros Simples'#9'F'
        'PERCJUROSATUARIAL'#9'11'#9'% Juros Comp.'#9'F'
        'VLRMULTA'#9'10'#9'Multa'#9'F'
        'MOEDESC'#9'20'#9'Índice'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = DsDocsAberto
      TabOrder = 4
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      OnCalcCellColors = wwDBGrid1CalcCellColors
      IndicatorColor = icBlack
    end
    object Panel3: TPanel
      Left = 5
      Top = 102
      Width = 151
      Height = 307
      Align = alLeft
      BevelInner = bvLowered
      BevelWidth = 2
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 5
      object SpeedButton1: TSpeedButton
        Left = 18
        Top = 22
        Width = 117
        Height = 25
        Caption = '&Todos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888006666600
          88888887788888778F88887666666666088888788888888878F887E668866666
          608887F88FFF888887F887E6FFF8666660888788777FF888878F7E66FFFF8666
          66087F887777FF88887F7E66FFFFF86666087F8877777FF8887F7E66FF8FFF86
          66087F8877F777FF887F7E66FF86FFF866087F8877F8777F887F7E66FF666FF8
          660878F87788877FF87887E6666666FF608887F88888887787F887E666666666
          6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
          8888888778FFFF77888888888777778888888888877777888888}
        Margin = 13
        NumGlyphs = 2
        ParentFont = False
        Spacing = 13
        OnClick = SpeedButton1Click
      end
      object SpeedButton2: TSpeedButton
        Left = 18
        Top = 60
        Width = 117
        Height = 25
        Caption = '&Inverter'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888888888FFFFF8888888888800000888888888FF877777F8888888776666600
          888888F877888887788888766666666608888F878F888888878887666F666666
          60888F78F87888888F788766FF8888666088F87F877FFF8888787E6FFFFFFF66
          6608F7887777777888F77E66FF6666666608F7888778F88888F77E666F66F666
          6608F7888878F78888F77E666666FF666608F788FFFFF77888F77E66FFFFFFF6
          66088788877777778F8787E68888FF6660888F788888F7788F7887E66666F666
          6088887888888788F878887EE666666608888887F88888FF878888877EEEEE00
          8888888877FFFF87788888888777778888888888887777788888}
        Margin = 13
        NumGlyphs = 2
        ParentFont = False
        Spacing = 13
        OnClick = SpeedButton2Click
      end
      object Label1: TLabel
        Left = 9
        Top = 146
        Width = 133
        Height = 16
        Caption = 'Juros Composto a.m.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 9
        Top = 192
        Width = 73
        Height = 16
        Caption = 'Valor Multa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 9
        Top = 104
        Width = 121
        Height = 16
        Caption = 'Juros Simples a.m.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 9
        Top = 235
        Width = 121
        Height = 16
        Caption = 'Índice de Correção'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ReValorJuros: TRealEdit
        Left = 9
        Top = 162
        Width = 132
        Height = 21
        Alignment = taRightJustify
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
        ParentFont = False
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 5
        NumberFormat = fNumber
        Signal = False
      end
      object ReValorMulta: TRealEdit
        Left = 9
        Top = 208
        Width = 132
        Height = 21
        Alignment = taRightJustify
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
        ParentFont = False
        TabOrder = 2
        WordWrap = False
        IntDigits = 10
        DecDigits = 5
        NumberFormat = fNumber
        Signal = False
      end
      object ReValorSimples: TRealEdit
        Left = 9
        Top = 120
        Width = 132
        Height = 21
        Alignment = taRightJustify
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
        ParentFont = False
        TabOrder = 0
        WordWrap = False
        IntDigits = 10
        DecDigits = 5
        NumberFormat = fNumber
        Signal = False
      end
      object CmbIndCorr: TCMDBLookupCombo
        Left = 9
        Top = 256
        Width = 132
        Height = 24
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'MOEDESC'#9'20'#9'Descrição'
          'MOESIGLA'#9'10'#9'Sigla')
        LookupTable = CdsIndiceCorrecao
        LookupField = 'MOECODIGO'
        Options = [loTitles]
        Style = csDropDownList
        DropDownWidth = 360
        ParentFont = False
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
  end
  inherited Dock971: TDock97
    Top = 414
    Width = 648
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        Enabled = False
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 16
    Top = 34
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object DsDocsAberto: TwwDataSource
    DataSet = CdsDocsAberto
    Left = 288
    Top = 221
  end
  object SqlIndiceCorrecao: TCMSqlParams
    SQL.Strings = (
      'SELECT MOECODIGO, MOEDESC, MOESIGLA FROM MOEDA ORDER BY MOEDESC')
    ClientDataSet = CdsIndiceCorrecao
    Left = 264
    Top = 352
  end
  object CdsIndiceCorrecao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 304
  end
  object SqlDocsAberto: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  (0) AS CALCULAJUROS, D.CODDOCUMENTO,'
      '  D.NODOCUMENTO, D.COMPLDOCUMENTO, D.DATAPROGRAMADA,'
      '  D.PERCJUROSATUARIAL, L.DATALANCTO, D.PERCJUROSSIMPLES,'
      '  D.VLRMULTA, M.MOEDESC, (0) AS SALDO'
      'FROM'
      '  DOCUMENTO D, LANCTODOCUM L, MOEDA M'
      'WHERE'
      '  ((RTRIM(D.STATUS) <> '#39'2'#39') OR (D.STATUS IS NULL)) AND'
      '  (D.IDPESSOA = -1)                         AND'
      '  (D.IDFORCLI = -1)                         AND'
      '  (D.RECPAG = '#39'P'#39')                             AND'
      '  (D.INDICECORRECAO =  M.MOECODIGO(+))             AND'
      '  (D.CODDOCUMENTO = L.CODDOCUMENTO)                AND'
      '  (D.OPERACAO = L.OPERACAO)        and'
      
        '  (d.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a' +
        '.RECPAG = '#39'P'#39
      '   and not exists  (select 1 from UsuarioxTpdocto b where'
      '    b.idusuario=0 and RECPAG = '#39'P'#39')'
      '    union'
      '     SELECT CODTIPDOC  FROM TIPODOCRECPAG a'
      '     WHERE a.RECPAG = '#39'P'#39
      '       and exists (select 1 from UsuarioxTpdocto b'
      '       where a.codtipdoc=b.codtipdoc'
      '       and b.idusuario= 0 and RECPAG =  '#39'P'#39')))'
      ''
      'ORDER BY'
      '  D.DATAPROGRAMADA, D.NODOCUMENTO, D.COMPLDOCUMENTO'
      ''
      ' '
      ' ')
    ClientDataSet = CdsDocsAberto
    Left = 288
    Top = 176
  end
  object CdsDocsAberto: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ControlType.Strings = (
      'CALCULAJUROS;CheckBox;1;0')
    ValidateWithMask = True
    Left = 280
    Top = 144
  end
end
